package org.jncc.base.arrangement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jncc.base.application.EApplication;
import org.jncc.persistence.dbSession;

// default package

/**
 * EArrangement entity. @author MyEclipse Persistence Tools
 */

public class ZoneArrangement implements java.io.Serializable {

	// Fields
	private String zone;
	private String C1Course;
	private String C2Course;
	private String C3Course;
	private String C4Course;
	private String C5Course;
	private String C6Course;
	private String C7Course;

	public static String getCourseInfo(String courseNo) {
		String courseInfo = "";
		if(courseNo == null || courseNo.equals("")){
			return courseInfo;
		}
		List<EApplication> eaList = null;
		try {
			String sql = "from EApplication ea where ea.id.applicationId='"
					+ courseNo + "'";
			eaList = dbSession.select(sql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (eaList != null && eaList.size() > 0) {
			courseInfo = eaList.get(0).getCourseName() + "<br/>("
					+ eaList.get(0).getCreateUser() + ")";
		}
		return courseInfo;
	}

	public static Map<String, String> toMap(ZoneArrangement za) {
		Map<String, String> zaMap = new HashMap<String, String>();
		zaMap.put("fld_ZONE", za.getZone());
		zaMap.put("fld_C1", getCourseInfo(za.getC1Course()));
		zaMap.put("fld_C2", getCourseInfo(za.getC2Course()));
		zaMap.put("fld_C3", getCourseInfo(za.getC3Course()));
		zaMap.put("fld_C4", getCourseInfo(za.getC4Course()));
		zaMap.put("fld_C5", getCourseInfo(za.getC5Course()));
		zaMap.put("fld_C6", getCourseInfo(za.getC6Course()));
		zaMap.put("fld_C7", getCourseInfo(za.getC7Course()));
		return zaMap;
	}

	public static Map<String, Object> toMapObject(String date,String floor,String queryFld,String queryVal) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		List<Map<String, String>> mapList = new ArrayList();
		Map<String, ZoneArrangement> map = genZArrList(EArrangementService
				.queryCurCourse(date,floor),queryFld,queryVal);
		for (String key : map.keySet()) {
			mapList.add(toMap(map.get(key)));
		}
		jsonMap.put("total", mapList.size());
		jsonMap.put("rows", mapList);
		return jsonMap;
	}

	public static Map<String, ZoneArrangement> genZArrList(List<EArrangement> earrList,String queryFld,String queryVal) {
		Map<String, ZoneArrangement> map = new HashMap<String, ZoneArrangement>();
		for (int i = 0; i < earrList.size(); i++) {
			String zone = earrList.get(i).getId().getZone();
			ZoneArrangement za = map.get(zone);
			if (za == null) {
				za = new ZoneArrangement();
				za.setZone(zone);
			}
			int cTimeNum = earrList.get(i).getId().getCourse();
			String courseNo = earrList.get(i).getAppId();
			
			if (courseNo == null || !isFitQuery(queryFld,queryVal,courseNo)) {
				continue;
			}
			switch (cTimeNum) {
			case 1:
				za.setC1Course(courseNo);
				break;
			case 2:
				za.setC2Course(courseNo);
				break;
			case 3:
				za.setC3Course(courseNo);
				break;
			case 4:
				za.setC4Course(courseNo);
				break;
			case 5:
				za.setC5Course(courseNo);
				break;
			case 6:
				za.setC6Course(courseNo);
				break;
			case 7:
				za.setC7Course(courseNo);
				break;
			default:
				break;
			}
			map.put(zone, za);
		}
		return map;
	}

	public static boolean isFitQuery(String queryFld,String queryVal,String courseNo){
		if(queryVal == null ||queryFld == null || queryVal.equals("") || queryFld.equals("")){
			return true;
		}
		List<EApplication> eaList = null;
		try {
			String sql = "from EApplication ea where ea.id.applicationId='"
					+ courseNo + "'";
			eaList = dbSession.select(sql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (eaList != null && eaList.size() > 0) {
			switch(queryFld){
			case "TNAME":
				if(eaList.get(0).getCreateUser().equals(queryVal)){
					return true;
				}
				break;
			case "CNAME":
				if (eaList.get(0).getCourseName().equals(queryVal)) {
					return true;
				}
				break;
			case "CLASS":
//				if (eaList.get(0).getCourseName().equals(queryVal)) {
//					return true;
//				}
				break;
			case "SNO":
//				if (eaList.get(0).getCourseName().equals(queryVal)) {
//					return true;
//				}
				break;
			default:
				break;
			}
		}
		return false;
	}
	
	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getC1Course() {
		return C1Course;
	}

	public void setC1Course(String c1Course) {
		C1Course = c1Course;
	}

	public String getC2Course() {
		return C2Course;
	}

	public void setC2Course(String c2Course) {
		C2Course = c2Course;
	}

	public String getC3Course() {
		return C3Course;
	}

	public void setC3Course(String c3Course) {
		C3Course = c3Course;
	}

	public String getC4Course() {
		return C4Course;
	}

	public void setC4Course(String c4Course) {
		C4Course = c4Course;
	}

	public String getC5Course() {
		return C5Course;
	}

	public void setC5Course(String c5Course) {
		C5Course = c5Course;
	}

	public String getC6Course() {
		return C6Course;
	}

	public void setC6Course(String c6Course) {
		C6Course = c6Course;
	}

	public String getC7Course() {
		return C7Course;
	}

	public void setC7Course(String c7Course) {
		C7Course = c7Course;
	}

}