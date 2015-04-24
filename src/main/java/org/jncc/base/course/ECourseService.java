package org.jncc.base.course;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import jxl.Cell;
import jxl.Sheet;
import net.sf.json.JSONObject;

import org.jncc.base.application.EApplication;
import org.jncc.base.curriculum.ECurriculum;
import org.jncc.base.curriculum.ECurriculumId;
import org.jncc.base.software.ESoftware;
import org.jncc.base.software.ESoftwareId;
import org.jncc.base.xls.ExcelService;
import org.jncc.base.zone.EZone;
import org.jncc.persistence.UtilTool;
import org.jncc.persistence.dbSession;

// default package

/**
 * ECourse entity. @author MyEclipse Persistence Tools
 */

public class ECourseService implements java.io.Serializable {

	private static List<ECourse> ecList;

	// Fields
	public static boolean addCourseFromXLS(String filename) {
		ECourse ec = new ECourse();
		Vector<ECurriculum> ecurVec = ExcelService.readExcel2ECourse(filename,
				ec);
		if(ecurVec==null ||ecurVec.size() == 0){
			return false;
		}
		else{
			try {
				dbSession.init();
				for (int i = 0; i < ecurVec.size(); i++) {
					dbSession.replaceInsert(ecurVec.get(i));
					if (i % 30 == 29) {
						dbSession.flush();
					}
				}
				dbSession.replaceInsert(ec);
				dbSession.close(true);
			} catch (Exception e) {
				return false;
			}
			updateEcList();
			return true;
		}
	}

	public static Map<String, Object> toMapObject(String queryfiled,
			String queryfiledVal) {

		List<Map<String, String>> mapList = new ArrayList();
		if (ecList == null) {
			updateEcList();
		}

		for (int i = 0; i < ecList.size(); i++) {
			ECourse ec = ecList.get(i);
			if (ifFitCourse(ec, queryfiled, queryfiledVal)) {
				mapList.add(toMap(ecList.get(i)));
			}
		}
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", mapList.size());
		jsonMap.put("rows", mapList);
		return jsonMap;
	}

	public static boolean ifFitCourse(ECourse ec, String queryFld,
			String queryfiledVal) {
		ec.getSerial();
		
		if (ec != null && queryFld != null && queryfiledVal != null
				&& !queryfiledVal.equals("")) {
			switch (queryFld) {
			case "TEACHERNAME":
				if (ec.getTeacher().indexOf(queryfiledVal) > -1) {
					return true;
				}
				break;
			case "COURSENAME":
				if (ec.getName().indexOf(queryfiledVal) > -1) {
					return true;
				}
				break;
			case "CLASSNO":
				if (ec.getClassNo().indexOf(queryfiledVal) > -1) {
					return true;
				}
				break;
			default:
				break;
			}
			return false;
		}
		return true;
	}

	public static Map<String, String> toMap(ECourse ec) {
		Map<String, String> courseMap = new HashMap<String, String>();
		courseMap.put("fld_C_NAME", UtilTool.validStr(ec.getName()));
		courseMap.put("fld_C_SERIAL", UtilTool.validStr(ec.getSerial()));
		courseMap.put("fld_C_TEACHER", UtilTool.validStr(ec.getTeacher()));
		courseMap.put("fld_C_TNO", UtilTool.validStr(ec.getTeacherNo()));
		courseMap.put("fld_C_CNO", UtilTool.validStr(ec.getClassNo()));
		courseMap.put("fld_C_CNUM", String.valueOf(ec.getSeats()));
		courseMap.put("fld_C_COMMENT", UtilTool.validStr(ec.getComment()));
		return courseMap;
	}

	public static Vector<ECurriculum> genCourse(Sheet sheet, ECourse ec) {
		Vector<ECurriculum> ecVec = new Vector();

		int row = sheet.getRows();
		int col = sheet.getColumns();
		int seats = 0;

		Cell[] cells;
		// 课程名称
		cells = sheet.getRow(2);
		String courseName = cells[2].getContents();
		// 课程编号
		cells = sheet.getRow(4);
		String courseSerial = cells[2].getContents();
		// 教师姓名
		cells = sheet.getRow(8);
		String teacher = cells[2].getContents();
		cells = sheet.getRow(9);
		String teacherNo = cells[2].getContents();
		Set<String> classNOset = new HashSet<String>();
		for (int i = 12; i < row; i++) {
			cells = sheet.getRow(i);
			if (cells.length >= 6) {
				String stuNo = cells[2].getContents();
				if (stuNo == null || stuNo.trim().equals("")) {
					break;
				}
				ECurriculumId id = new ECurriculumId(courseSerial, stuNo);
				String classNo = cells[1].getContents();
				classNo = classNo.trim();
				if (UtilTool.IsValid(classNo)) {
					classNOset.add(classNo);
				}
				ECurriculum ecur = new ECurriculum(id, cells[3].getContents(),
						classNo, "");
				ecVec.add(ecur);
				seats++;
			}
		}
		ec.setName(courseName);
		ec.setSerial(courseSerial);
		ec.setSeats(seats);
		ec.setTeacher(teacher);
		ec.setTeacherNo(teacherNo);
		String classNosStr = "";
		for (String classStr : classNOset) {
			classNosStr = classNosStr + classStr + "|";
		}
		ec.setClassNo(classNosStr);
		return ecVec;
	}

	public static List<ECourse> getEcList() {
		if (ecList == null || ecList.size() == 0) {
			try {
				dbSession.init();
				String sql = "from ECourse";
				ecList = dbSession.select(sql);
				dbSession.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ecList;
	}

	public static boolean updateEcList() {
		try {
			dbSession.init();
			String sql = "from ECourse";
			ecList = dbSession.select(sql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;
	}

	public static void setEcList(List<ECourse> ecList) {
		ECourseService.ecList = ecList;
	}

	public static ECourse getCourse(String serial) {
		ECourse ec = null;
		List<ECourse> ecList = getEcList();
		for (int i = 0; i < ecList.size(); i++) {
			if (ecList.get(i).getSerial().equals(serial)) {
				return ecList.get(i);
			}
		}
		return ec;
	}
	
	public static ECourse getCourse(String courseName,String teacherName) {
		ECourse ec = null;
		List<ECourse> ecList = getEcList();
		for (int i = 0; i < ecList.size(); i++) {
//			if (ecList.get(i).getName().equals("EDA技术")){
//				ECourse eccc= ecList.get(i);
//				System.out.println("come");
//			}
			if(courseName==null || courseName.equals("")){
				if(ecList.get(i).getTeacher().equals(teacherName) ||ecList.get(i).getTeacherNo().equals(teacherName)){
					return ecList.get(i);
				}
			}
			if(teacherName==null || teacherName.equals("")){
				if(ecList.get(i).getName().equals(courseName)){
					return ecList.get(i);
				}
			}
			if (ecList.get(i).getName().equals(courseName) && ecList.get(i).getTeacher().equals(teacherName)) {
				return ecList.get(i);
			}
		}
		return ec;
	}
	
	
}