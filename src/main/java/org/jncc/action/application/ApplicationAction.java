package org.jncc.action.application;

import java.util.ArrayList;
import java.util.List;

import org.jncc.base.application.EApplication;
import org.jncc.base.application.EApplicationService;
import org.jncc.base.arrangement.EArrangement;
import org.jncc.base.arrangement.EArrangementId;
import org.jncc.base.arrangement.EArrangementService;
import org.jncc.base.cause.resultCause;
import org.jncc.base.coursemap.ECourseMapService;
import org.jncc.base.zone.EZone;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionSupport;

public class ApplicationAction extends ActionSupport {
	/**
	 * 
	 */

	private static final long serialVersionUID = 1L;
	private resultCause resultCause = new resultCause();
	private EApplication ea;
	private List<EZone> zList;

	public String findConfDate() {
		String dInfo = ea.getDateInfo();
		String[] dInfos = dInfo.split("\\s+");
		resultCause = new resultCause();
		int beginCourse = ECourseMapService.getBeginCourse(ea.getBeginTime());
		int endCourse = ECourseMapService.getEndCourse(ea.getEndTime());
		String conflictedDate = "";
		int dateCounts = 0;
		for (String bookDate : dInfos) {
			System.out.println(bookDate);
			List<EZone> freeZoneList = EArrangementService.queryFreezone(
					bookDate, beginCourse, endCourse);
			dateCounts++;
			if (freeZoneList.size() <= 0) {
				conflictedDate = conflictedDate + dateCounts + " ";
			}
		}
		if (conflictedDate.length() > 0) {
			resultCause.setCause("480", conflictedDate);
		} else {
			resultCause.setCause("200", "恭喜，有可用区域");
		}
		
		return "FINDCONFDATE_APP_SUCCESS";

	}

	public String findzone() {
		String dInfo = ea.getDateInfo();
		String[] dInfos = dInfo.split("\\s+");
		int beginCourse = ECourseMapService.getBeginCourse(ea.getBeginTime());
		int endCourse = ECourseMapService.getEndCourse(ea.getEndTime());
		zList = new ArrayList<EZone>();
		for (String bookDate : dInfos) {
			List<EZone> freeZoneList = EArrangementService.queryFreezone(
					bookDate, beginCourse, endCourse);
			if (zList.size() > 0) {
				freeZoneList.retainAll(zList);
			}else{
				zList = freeZoneList;
			}
		}
		return "FIND_APP_SUCCESS";
	}

	public String addRecord() {
		String dInfo = ea.getDateInfo();
		String[] dInfos = dInfo.split("\\s+");
		resultCause = new resultCause();
		int beginCourse = ECourseMapService.getBeginCourse(ea.getBeginTime());
		int endCourse = ECourseMapService.getEndCourse(ea.getEndTime());
		EArrangement eArr = new EArrangement();
		EArrangementId eArrId = new EArrangementId();
		String conflictedDate = "";

		eArr.setAppId(ea.getId().getApplicationId());
		for (String bookDate : dInfos) {
			System.out.println(bookDate);
			List<EZone> freeZoneList = EArrangementService.queryFreezone(
					bookDate, beginCourse, endCourse);
			if (freeZoneList.size() > 0) {
				eArrId.setDate(bookDate);
				for (int i = beginCourse; i <= endCourse; i++) {
					eArrId.setCourse(i);
					eArr.setId(eArrId);
					EArrangementService.addArrangement(eArr);
				}
			} else {
				conflictedDate = conflictedDate + bookDate + " ";
			}
		}
		if (EApplicationService.addApplication(ea)) {
			resultCause.setCause("200", "恭喜，添加成功");
		} else {
			resultCause.setCause("503", "添加失败");
		}

		if (conflictedDate.length() > 0) {
			resultCause.setCause("493", conflictedDate);
		} else {
			resultCause.setCause("200", "恭喜，有可用区域");
		}

		return "ADD_APP_SUCCESS";
	}

	public String deleteRecord() {
		try {
			dbSession.delete(ea);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultCause = new resultCause();
		resultCause.setCause("200", "恭喜您，删除成功！");
		return "DELETE_APP_SUCCESS";
	}

	public resultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(resultCause resultCause) {
		this.resultCause = resultCause;
	}

	public EApplication getEa() {
		return ea;
	}

	public void setEa(EApplication ea) {
		this.ea = ea;
	}

	public List<EZone> getZList() {
		return zList;
	}

	public void setZList(List<EZone> zList) {
		this.zList = zList;
	}
}
