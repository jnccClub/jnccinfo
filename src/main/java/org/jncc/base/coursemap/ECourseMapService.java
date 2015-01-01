package org.jncc.base.coursemap;

import java.util.List;
import java.util.Vector;

import org.jncc.base.xls.ExcelService;
// default package
import org.jncc.persistence.dbSession;

/**
 * SoftwareList entity. @author MyEclipse Persistence Tools
 */

public class ECourseMapService implements java.io.Serializable {
	private static List<ECourseMap> ecml = setECourseMapList();

	@SuppressWarnings("unchecked")
	public static List<ECourseMap> setECourseMapList() {
		// TODO Auto-generated method stub
		try {
			dbSession.init();
			String sql = "from ECourseMap";
			ecml = dbSession.select(sql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ecml;
	}

	public static List<ECourseMap> getEcml() {
		return ecml;
	}

	public static int getBeginCourse(String beginTime) {
		for (int i = 0; i < ecml.size(); i++) {
			if (ecml.get(i).getBeginTime().equals(beginTime)) {
				return ecml.get(i).getCourse();
			}
		}
		return 0;
	}

	public static int getEndCourse(String endTime) {
		for (int i = 0; i < ecml.size(); i++) {
			if (ecml.get(i).getEndTime().equals(endTime)) {
				return ecml.get(i).getCourse();
			}
		}
		return 0;
	}

	public static ECourseMap getCourse(Integer course) {
		for (int i = 0; i < ecml.size(); i++) {
			if (course == ecml.get(i).getCourse()) {
				return ecml.get(i);
			}
		}
		return null;
	}

	public static void setEcml(List<ECourseMap> ecml) {
		ECourseMapService.ecml = ecml;
	}

	public static void main(String[] args) {
	}
}