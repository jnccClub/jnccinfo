package org.jncc.base.arrangement;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;
import org.jncc.base.coursemap.ECourseMapService;
import org.jncc.base.zone.EZone;
import org.jncc.base.zone.EZoneService;
import org.jncc.persistence.dbSession;

// default package

/**
 * EArrangement entity. @author MyEclipse Persistence Tools
 */

public class EArrangementService implements java.io.Serializable {

	public static boolean addArrangement(EArrangement eArr) {
		try {
			dbSession.delete(eArr);
			dbSession.close(false);
			dbSession.insert(eArr);
			dbSession.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public static boolean queryIsCourseFree(String zone, String date,String beginTime, String endTime
			) {
		int beginCourse = ECourseMapService.getBeginCourse(beginTime);
		int endCourse = ECourseMapService.getBeginCourse(endTime);
		Criteria crit = dbSession.getCriteria(EArrangement.class);
		List l = crit
				.add(Expression.between("id.course", beginCourse, endCourse))
				.add(Expression.eq("id.zone", zone))
				.add(Expression.eq("id.date", date))
				.list();
		if (l.size() > 0) {
			return false;
		}
		return true;
	}
	
	public static List queryFreezone(String date,int beginCourse,int endCourse) {
		Criteria crit = dbSession.getCriteria(EArrangement.class);
		List<EArrangement> lEArr = crit
				.add(Expression.between("id.course", beginCourse, endCourse))
				.add(Expression.eq("id.date", date))
				.list();
		
		List<EZone> lEZone = EZoneService.getEZoneList();
		for(int i=0;i<lEArr.size();i++){
			for(int j=0;j<lEZone.size();j++){
				if(lEArr.get(i).getId().getZone().equals(lEZone.get(j).getZone())){
					lEZone.remove(j);
				}
			}
		}
		return lEZone;
	}
	

	// Fields
	public static void main(String[] args) {
		EArrangementService.queryIsCourseFree("7F", "2014-12-04", "08:00", "12:00");
		EArrangementService.queryFreezone("2014-12-04", 1, 2);
	}
}