package org.jncc.base.curriculum;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
// default package

import org.jncc.persistence.dbSession;

/**
 * ECurriculumId entity. @author MyEclipse Persistence Tools
 */

public class ECurriculumService{

	private String test;
	// Fields
	public static List<String> getSerials(String stuNo) {
		List<String> serialList = null;
		try {
			dbSession.init();
			String sql = "from ECurriculum ecur where ecur.stuNo='" + stuNo
					+ "'";
			serialList = dbSession.select(sql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return serialList;
	}
}