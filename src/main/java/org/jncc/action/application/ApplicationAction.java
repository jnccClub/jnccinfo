package org.jncc.action.application;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.jncc.base.application.EApplication;
import org.jncc.base.application.EApplicationID;
import org.jncc.base.application.EApplicationService;
import org.jncc.base.arrangement.EArrangement;
import org.jncc.base.arrangement.EArrangementId;
import org.jncc.base.arrangement.EArrangementService;
import org.jncc.base.cause.ResultCause;
import org.jncc.base.course.ECourse;
import org.jncc.base.course.ECourseService;
import org.jncc.base.coursemap.ECourseMapService;
import org.jncc.base.qq.QQSend;
import org.jncc.base.user.UserInfo;
import org.jncc.base.user.UserService;
import org.jncc.base.zone.EZone;
import org.jncc.persistence.Mail;
import org.jncc.persistence.MsgSendThread;
import org.jncc.persistence.UtilTool;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ApplicationAction extends ActionSupport {
	/**
	 * 
	 */

	private static final long serialVersionUID = 1L;
	private ResultCause resultCause = new ResultCause();
	private EApplication ea;
	private List<EZone> zList;

	private String isApproved;
	private String approveComment;
	private String eaIDs;
	private String createUsers;

	public String auditRecord() {
		List<EApplicationID> eaIdList = null;
		String mSubject = "";
		String qqcontent = "";
		String mContent = "";
		if (isApproved.equals("1")) {
			EApplicationService.approveApplications(eaIDs, approveComment,
					eaIdList);
			mSubject = UtilTool.getProperty("SUBJECT_AUDIT_SUC");
			mContent = UtilTool.getProperty("MAIL_CONTENT");
			String oldStr = UtilTool.getProperty("MAIL_APPLY");
			String newStr = UtilTool.getProperty("SUBJECT_AUDIT_SUC");
			mContent = mContent.replace(oldStr, newStr);
			qqcontent = "欢迎使用计算中心预约系统，您的申请已审批通过！";
		} else {
			EApplicationService.rejectApplications(eaIDs, approveComment,
					eaIdList);
			mSubject = UtilTool.getProperty("SUBJECT_AUDIT_FAIL");
			mContent = UtilTool.getProperty("MAIL_CONTENT");
			String oldStr = UtilTool.getProperty("MAIL_APPLY");
			String newStr = UtilTool.getProperty("SUBJECT_AUDIT_FAIL");
			mContent = mContent.replace(oldStr, newStr);
			qqcontent = "欢迎使用计算中心预约系统，您的申请已被驳回！";
		}
		String[] userList = null;
		if (createUsers != null && !createUsers.equals("")) {
			userList = createUsers.split("\\|");
		}
		String mEmail = "";
		if (userList != null && userList.length > 0) {
			for (String userName : userList) {
				UserInfo usInfo = UserService.getUserInfo(userName);
				if (usInfo != null) {
					QQSend.sendQQ(usInfo.getQq(),qqcontent);
					mEmail = usInfo.getEmail();
					Mail.sendMail(mEmail, mSubject, mContent);
				}
			}
		}
		return "AUDIT_APP_SUCCESS";
	}

	public String findConfDate() {
		String dInfo = ea.getDateInfo();
		String[] dInfos = dInfo.split("\\s+");
		resultCause = new ResultCause();
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
				boolean t = zList.retainAll(freeZoneList);
				int c = 3;
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
		Map session = ActionContext.getContext().getSession();
		UserInfo us = (UserInfo) session.get("USERINFO");
		if (us == null) {
			ea.setCreateUser("admin");
		} else {
			ea.setCreateUser(us.getRealname());
		}
		ECourse ec = ECourseService.getCourse(ea.getId().getApplicationId());
		if (ec == null) {
			ea.setSeats(55);
		} else {
			ea.setSeats(ec.getSeats());
		}
		String dInfo = ea.getDateInfo();
		String[] dInfos = dInfo.split("\\s+");
		String zInfo = ea.getZone();
		String[] zInfos = zInfo.split("\\s+");
		resultCause = new ResultCause();
		int beginCourse = ECourseMapService.getBeginCourse(ea.getBeginTime());
		int endCourse = ECourseMapService.getEndCourse(ea.getEndTime());
		EArrangement eArr = new EArrangement();
		EArrangementId eArrId = new EArrangementId();
		eArr.setAppId(ea.getId().getApplicationId());
		eArr.setCreatetime(ea.getId().getCreatedatetime());
		try {
			dbSession.init();
			int txCount = 0;
			for (String bookDate : dInfos) {
				System.out.println(bookDate);
				eArrId.setDate(bookDate);
				for (String zBookinfo : zInfos) {
					eArrId.setZone(zBookinfo);
					eArr.setFloor(ea.getFloor());
					for (int i = beginCourse; i <= endCourse; i++) {
						eArrId.setCourse(i);
						eArr.setId(eArrId);
						dbSession.replaceInsert(eArr);
						txCount++;
						dbSession.flush();
					}
				}
			}
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (EApplicationService.addApplication(ea)) {
			resultCause.setCause("200", "恭喜，添加成功");
			new MsgSendThread(ea,us); //发送邮件与QQ消息;异步发送，减少延迟。
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
		resultCause = new ResultCause();
		resultCause.setCause("200", "恭喜您，删除成功！");
		return "DELETE_APP_SUCCESS";
	}

	public ResultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(ResultCause resultCause) {
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

	public String getCreateUsers() {
		return createUsers;
	}

	public void setCreateUsers(String createUsers) {
		this.createUsers = createUsers;
	}

}
