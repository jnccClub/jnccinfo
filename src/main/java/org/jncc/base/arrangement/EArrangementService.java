package org.jncc.base.arrangement;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;
import org.jncc.base.application.EApplication;
import org.jncc.base.course.ECourseService;
import org.jncc.base.coursemap.ECourseMapService;
import org.jncc.base.zone.EZone;
import org.jncc.base.zone.EZoneService;
import org.jncc.persistence.dbSession;

// default package

/**
 * EArrangement entity. @author MyEclipse Persistence Tools
 */

public class EArrangementService implements java.io.Serializable {

	private List<EArrangement> earrList;

	public static boolean queryIsCourseFree(String zone, String date,
			String beginTime, String endTime) {
		int beginCourse = ECourseMapService.getBeginCourse(beginTime);
		int endCourse = ECourseMapService.getBeginCourse(endTime);
		Criteria crit = dbSession.getCriteria(EArrangement.class);
		List l = crit
				.add(Expression.between("id.course", beginCourse, endCourse))
				.add(Expression.eq("id.zone", zone))
				.add(Expression.eq("id.date", date)).list();
		if (l.size() > 0) {
			return false;
		}
		return true;
	}

	public static List<EZone> queryFreezone(String date, int beginCourse,
			int endCourse) {
//		Criteria crit = dbSession.getCriteria(EArrangement.class);
//		List<EArrangement> lEArr = crit
//				.add(Expression.between("id.course", beginCourse, endCourse))
//				.add(Expression.eq("id.date", date)).list();
		List<EArrangement> lEArr = null;
		try {
			dbSession.init();
			String sql="from EArrangement ear where ear.id.date='"+date+"' and ear.id.course between "+beginCourse+" and "+endCourse;
			lEArr = dbSession.select(sql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<EZone> lEZone = EZoneService.getEZoneList();
		if(lEArr == null){
			return lEZone;
		}
		for (int i = 0; i < lEArr.size(); i++) {
			for (int j = 0; j < lEZone.size(); j++) {
				if (lEArr.get(i).getId().getZone()
						.equals(lEZone.get(j).getZone())) {
					lEZone.remove(j);
				}
			}
		}
		return lEZone;
	}

	public static Map<String, String> toMap(EArrangement earr) {
		Map<String, String> appMap = new HashMap<String, String>();
		appMap.put("fld_CNO", earr.getAppId());

		String tmpTime = earr.getCreatetime().toString();
		if (null != tmpTime && tmpTime.length() > 19) {
			tmpTime = tmpTime.substring(0, 19);
		}
		appMap.put("fld_CTIME", tmpTime);
		appMap.put("fld_ZONE", earr.getId().getZone());
		appMap.put("fld_FLOOR", earr.getFloor()+"楼");
		appMap.put("fld_COUREDATE", earr.getId().getDate());
		appMap.put("fld_COURSE", ECourseMapService.getPeriod(earr.getId().getCourse()));
		
		return appMap;
	}

	public static String getEArrKey(EArrangement ear){
		if(ear.equals(null)){
			return "";
		}
		return String.valueOf(ear.getId().getCourse())+";"+ear.getId().getDate();
	}

	public static Map<String, Object> toMapObject(String appId,
			String createTime,String courseName,String teacherName) {
		if(appId.equals("")||appId.equals(null) || appId.equals("null")){
			if(ECourseService.getCourse(courseName, teacherName).equals(null)){
				return null;
			}else{
				appId = ECourseService.getCourse(courseName, teacherName).getSerial();
				createTime = "";
			}
		}
		List<EArrangement> earrList = queryAppDates(appId, createTime);
		List<Map<String, String>> mapList = new ArrayList();
		Map<String,EArrangement> eaMap = new HashMap<String,EArrangement>();
		
		if (earrList != null) {
			for (int i = 0; i < earrList.size(); i++) {
				EArrangement tmpEar = earrList.get(i);
				String earKey = getEArrKey(earrList.get(i));
				if(eaMap.containsKey(earKey)){
					EArrangement orgEar = eaMap.get(earKey);
					String multiZone = orgEar.getId().getZone() +"、"+ tmpEar.getId().getZone();
					orgEar.getId().setZone(multiZone);
					eaMap.put(earKey, orgEar);
				}else{
					eaMap.put(earKey, tmpEar);
				}
			}
			Iterator<Map.Entry<String, EArrangement>> it = eaMap.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry<String, EArrangement> entry = it.next();
					mapList.add(toMap(entry.getValue()));
				}
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("total", mapList.size());
			jsonMap.put("rows", mapList);
			return jsonMap;
		} else {
			
			return null;
		}
	}

	
	
	public static List<EArrangement> queryAppDates(String appId,
			String createTime) {
		List<EArrangement> earrList;
		try {
			dbSession.init();
			String sql = "";
			if(createTime.equals("")){
				sql = "from EArrangement earr where earr.appId='" + appId + "'";
			}else{
				try{
					Timestamp ts = Timestamp.valueOf(createTime);
					sql = "from EArrangement earr where earr.appId='" + appId
							+ "' and earr.createtime='" + ts + "'";
				}catch(IllegalArgumentException e){
					e.printStackTrace();
					sql = "from EArrangement earr where earr.appId='" + appId + "'";
				}
			}
			earrList = dbSession.select(sql);
			dbSession.close();
			return earrList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static List<EArrangement> queryDailyCourse(String date){
		return queryCurCourse(date,"");
	}
	
	public static List<EArrangement> queryCurCourse(String date,String floor) {
		List<EArrangement> earrList;
		String conditionSql = "";
		if(date == null ||date.equals("") || date.indexOf("-")<0){
			conditionSql = "1=1";
		}else{
			conditionSql = "earr.id.date='" + date	+ "'";
		}
		if(floor != null && !floor.equals("") && floor.compareTo("1")>0){
			
			conditionSql = conditionSql + " and earr.floor='"+floor+"'";
		}
		
		try {
			dbSession.init();
			String sql = "from EArrangement earr where "+ conditionSql;
			earrList = dbSession.select(sql);
			dbSession.close();
			return earrList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getCurSerial(String date,String hour,String zone){
		List<EArrangement> earrList = null;
		String serial = "";
		String conditionSql = "1=1";
		conditionSql = conditionSql + "and earr.id.date='"+date	+ "'";
		conditionSql = conditionSql + "and earr.id.zone='"+zone	+ "'";
		int course = ECourseMapService.getCourse(hour);
		conditionSql = conditionSql + "and earr.id.course="+course;
		try {
			dbSession.init();
			String sql = "from EArrangement earr where "+ conditionSql;
			earrList = dbSession.select(sql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(earrList!=null &&earrList.size()>0){
			serial = earrList.get(0).getAppId();
		}
		return serial;
	}
	
	// Fields
	public static void main(String[] args) {
		// Map<String, Object> jsonMap =
		// EArrangementService.toMapObject("102030_70206097_1","2014-12-24 08:47:18");
		//
		//
		// EArrangementService.queryIsCourseFree("7F", "2014-12-04", "08:00",
		// "12:00");
		// EArrangementService.queryFreezone("2014-12-04", 1, 2);
		//
		
		String date=null;
		String floor = "";
		List<EArrangement> earrList = EArrangementService
				.queryCurCourse(date,floor);
		int i = 33;

	}
}