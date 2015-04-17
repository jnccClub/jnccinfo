package org.jncc.base.curriculum;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jncc.base.arrangement.EArrangement;
import org.jncc.base.arrangement.EArrangementService;
import org.jncc.base.arrangement.ZoneArrangement;
import org.jncc.base.course.ECourse;
import org.jncc.base.course.ECourseService;
import org.jncc.persistence.UtilTool;

// default package

/**
 * ECurriculum entity. @author MyEclipse Persistence Tools
 */

public class WeekCurriculum implements java.io.Serializable {

	// Fields
	private List<String> courseInfos;
	private List<List<String>> dayInfosMap;
	private Map<String, String> courseMap;

	public static String getKeyCourseInfo(String serial) {
		String keyInfo = "";
		ECourse ec = ECourseService.getCourse(serial);
		if(ec.getComment()==null || ec.getComment().equals("") || ec.getComment().equals(null)){
			keyInfo = ec.getName() + "(" + ec.getTeacher() + ")";
		}else{
		keyInfo = ec.getName() + "(" + ec.getTeacher() + "|" + ec.getComment()+ ")";}
		return keyInfo;
	}

	public static String getCourseKey(EArrangement ea) {
		return String.valueOf(ea.getId().getCourse()) + ";" + ea.getAppId();

	}
	public static String catCourse(String course1,String course2){
		if(course1.equals("")){
			course1 = course2;
		}else{
			course1 = course1 + "<br>"+course2;
		}
		return course1;
	}
	
	public static Map<String, String> getDailyDetail(String date,String weekDay) {
		Map<String, String> dayInfosMap = new HashMap<String, String>();
//		List<String> c1List = new ArrayList();
//		List<String> c2List = new ArrayList();
//		List<String> c3List = new ArrayList();
//		List<String> c4List = new ArrayList();
//		List<String> c5List = new ArrayList();
//		List<String> c6List = new ArrayList();
//		List<String> c7List = new ArrayList();
		String c1Str = "";
		String c2Str = "";
		String c3Str = "";
		String c4Str = "";
		String c5Str = "";
		String c6Str = "";
		String c7Str = "";
		Map<String, String> courseMap = getDailyMap(date);
		Iterator<Map.Entry<String, String>> it = courseMap.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, String> entry = it.next();
			String[] keys = entry.getKey().split(";");
			switch(keys[0]){
				case "1":c1Str = catCourse(c1Str,entry.getValue());break;
				case "2":c2Str = catCourse(c2Str,entry.getValue());break;
				case "3":c3Str = catCourse(c3Str,entry.getValue());break;
				case "4":c4Str = catCourse(c4Str,entry.getValue());break;
				case "5":c5Str = catCourse(c5Str,entry.getValue());break;
				case "6":c6Str = catCourse(c6Str,entry.getValue());break;
				default:c7Str = catCourse(c7Str,entry.getValue());break;
			}
		}
		dayInfosMap.put("fld_WEEK", weekDay);
		dayInfosMap.put("fld_C1", c1Str);
		dayInfosMap.put("fld_C2", c2Str);
		dayInfosMap.put("fld_C3", c3Str);
		dayInfosMap.put("fld_C4", c4Str);
		dayInfosMap.put("fld_C5", c5Str);
		dayInfosMap.put("fld_C6", c6Str);
		dayInfosMap.put("fld_C7", c7Str);
		
		return dayInfosMap;
	}
	
	public static List<Map<String, String>> getWeekCourseInfos(String beginDate){
		String procDate = beginDate;
		String[] weekDays = {"星期一", "星期二", "星期三", "星期四", "星期五", "星期六","星期日"};
		List<Map<String, String>> resList = new ArrayList();
		for(int i=0;i<7;i++){
			resList.add(getDailyDetail(procDate,weekDays[i]));
			procDate = UtilTool.getNextDay(procDate);
		}
		return resList;
	}
	
	
	public static Map<String, String> getDailyMap(String date) {
		Map<String, String> courseMap = new HashMap<String, String>();
		List<EArrangement> earrList = EArrangementService
				.queryDailyCourse(date);
		for (EArrangement ea : earrList) {
			String key = getCourseKey(ea);
			String val = "";
			if (courseMap.containsKey(key)) {
				val = courseMap.get(key);
				val = val + ea.getId().getZone();
				courseMap.put(key, val);
			} else {
				val = getKeyCourseInfo(ea.getAppId()) + ea.getId().getZone();
				courseMap.put(key, val);
			}
		}
		return courseMap;
	}

	public List<String> getCourseInfos() {
		return courseInfos;
	}

	public void setCourseInfos(List<String> courseInfos) {
		this.courseInfos = courseInfos;
	}

	
	
	// Constructors

	/** default constructor */
	public WeekCurriculum() {

	}
	
	public static void main(String[] args) {
		WeekCurriculum wc = new WeekCurriculum();
		
	}

}