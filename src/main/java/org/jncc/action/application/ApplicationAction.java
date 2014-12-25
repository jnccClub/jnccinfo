package org.jncc.action.application;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.jncc.base.application.EApplication;
import org.jncc.base.application.EApplicationID;
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

	private String isApproved;
	private String approveComment;
	private String eaIDs;

		

	public String auditRecord() {
		
		if (isApproved.equals("1")) {
			EApplicationService.approveApplications(eaIDs, approveComment);
		} else {
			EApplicationService.rejectApplications(eaIDs, approveComment);
		}
		return "AUDIT_APP_SUCCESS";
	}

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
			} else {
				zList = freeZoneList;
			}
		}
		return "FIND_APP_SUCCESS";
	}

	public String addRecord() {
		// 设置为未审核状态
		ea.setStatus("0");
		Timestamp curTime = new Timestamp(System.currentTimeMillis());
		EApplicationID eaID = ea.getId();
		eaID.setCreatedatetime(curTime);
		ea.setId(eaID);
		ea.setCreateUser("hpf");
		ea.setSeats(55);

		String dInfo = ea.getDateInfo();
		String[] dInfos = dInfo.split("\\s+");
		String zInfo = ea.getZone();
		String[] zInfos = zInfo.split("\\s+");
		resultCause = new resultCause();
		int beginCourse = ECourseMapService.getBeginCourse(ea.getBeginTime());
		int endCourse = ECourseMapService.getEndCourse(ea.getEndTime());
		EArrangement eArr = new EArrangement();
		EArrangementId eArrId = new EArrangementId();
		eArr.setAppId(ea.getId().getApplicationId());
		eArr.setCreatetime(ea.getId().getCreatedatetime());
		for (String bookDate : dInfos) {
			System.out.println(bookDate);
			eArrId.setDate(bookDate);
			for (String zBookinfo : zInfos) {
				eArrId.setZone(zBookinfo);
				eArr.setFloor(ea.getFloor());
				for (int i = beginCourse; i <= endCourse; i++) {
					eArrId.setCourse(i);
					eArr.setId(eArrId);
					EArrangementService.addArrangement(eArr);
				}
			}

		}
		if (EApplicationService.addApplication(ea)) {
			resultCause.setCause("200", "恭喜，添加成功");
		} else {
			resultCause.setCause("503", "添加失败");
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

	public String getApproveComment() {
		return approveComment;
	}

	public void setApproveComment(String approveComment) {
		this.approveComment = approveComment;
	}

	public String getIsApproved() {
		return isApproved;
	}

	public void setIsApproved(String isApproved) {
		this.isApproved = isApproved;
	}
	public void setEaIDs(String eaIDs) {
		this.eaIDs = eaIDs;
	}


	public String getEaIDs() {
		return eaIDs;
	}

}
