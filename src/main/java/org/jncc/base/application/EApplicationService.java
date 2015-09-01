package org.jncc.base.application;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jncc.base.arrangement.EArrangement;
import org.jncc.base.course.ECourse;
import org.jncc.base.course.ECourseService;
import org.jncc.base.user.UserInfo;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionContext;

/**
 * SoftwareList entity. @author MyEclipse Persistence Tools
 */

public class EApplicationService implements java.io.Serializable {

	private EApplication ea;
	private List<EArrangement> earList;

	public static Map<String, String> toMap(EApplication ea) {
		Map<String, String> appMap = new HashMap<String, String>();
		appMap.put("fld_CNO", ea.getId().getApplicationId());
		appMap.put("fld_CUSR", ea.getCreateUser());
		appMap.put("fld_COURSENAME", ea.getCourseName());
		appMap.put("fld_CLASSNAME", ea.getClassName());
		String tmpType = ea.getBooktype().toString();
		if (tmpType.equals("1")) {
			tmpType = "上机";
		} else if (tmpType.equals("2")) {
			tmpType = "上课";
		} else {
			tmpType = "考试";
		}
		appMap.put("fld_BTYPE", tmpType);
		appMap.put("fld_SEATS", ea.getSeats().toString());

		String tmpTime = ea.getId().getCreatedatetime().toString();
		if (null != tmpTime && tmpTime.length() > 19) {
			tmpTime = tmpTime.substring(0, 19);
		}

		appMap.put("fld_CTIME", tmpTime);
		appMap.put("fld_OSYSTEM", ea.getOs());
		appMap.put("fld_SWARE", ea.getSoftware());
		appMap.put("fld_PHONE", ea.getContactNo());
		appMap.put("fld_EMAIL", ea.getEmail());

		String tmpStatus = "";
		if (ea.getStatus().equals("0")) {
			tmpStatus = "待审批";
		} else if (ea.getStatus().equals("1")) {
			tmpStatus = "已审批";
		} else {
			tmpStatus = "已驳回";
		}

		appMap.put("fld_STATUS", tmpStatus);
		return appMap;
	}

	public static Map<String, Object> toMapObject(int auditedType) {
		List<EApplication> eaList = queryAuditApp(auditedType);
		List<Map<String, String>> mapList = new ArrayList();
		if (eaList != null) {
			for (int i = 0; i < eaList.size(); i++) {
				if (auditedType == 1001) {
					if (eaList.get(i).getStatus().equals("99")) {
						continue;
					}
				}
				mapList.add(toMap(eaList.get(i)));
			}
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("total", mapList.size());
			jsonMap.put("rows", mapList);
			return jsonMap;
		} else {
			return null;
		}
	}

	public static List<EApplication> queryAuditApp(int auditedType) {
		List<EApplication> eaList = new ArrayList();
		String sql = "from EApplication ea";
		if (auditedType == 1) {
			sql = sql + " where ea.status='1'";
		} else if (auditedType == 99) {
			sql = sql + " where ea.status='99'";
		} else if (auditedType == 1001) { // 用户申请清单
			List<ECourse> ecList = ECourseService.getPertainCourses();
			if (ecList.size() > 0) {
				sql = sql + " where ea.id.applicationId='"
						+ ecList.get(0).getSerial() + "' ";
				for (int i = 1; i < ecList.size(); i++) {
					sql = sql + " or ea.id.applicationId='"
							+ ecList.get(i).getSerial() + "' ";
				}
			} else {
				return null;
			}
		} else {
			sql = sql + " where ea.status='0'";
		}
		try {
			dbSession.init();
			eaList = dbSession.select(sql);
			dbSession.close();
			return eaList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static boolean addApplication(EApplication ea) {
		try {
			dbSession.init();
			dbSession.replaceInsert(ea);
			dbSession.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public static List<EApplicationID> getEaIdList(String ids) {
		List<EApplicationID> eaIdList = new ArrayList();
		String[] idList = ids.split(",");
		for (String id : idList) {
			EApplicationID eaID = new EApplicationID();
			int len = id.indexOf("|");
			if (len > 0) {
				eaID.setApplicationId(id.substring(0, len));
				eaID.setCreatedatetime(Timestamp.valueOf(id.substring(len + 1)));
			}
			eaIdList.add(eaID);
		}
		return eaIdList;
	}

	public static boolean approveApplications(String ids, String comments,
			List<EApplicationID> eaIdList) {
		eaIdList = getEaIdList(ids);
		try {
			String hql = "update EApplication ea set ea.status=?,ea.comment=? where ea.id.applicationId=? and ea.id.createdatetime=?";
			for (int i = 0; i < eaIdList.size(); i++) {
				Object[] params = new Object[] { "1", comments,
						eaIdList.get(i).getApplicationId(),
						eaIdList.get(i).getCreatedatetime() };
				dbSession.executeUpdate(hql, params);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public static boolean rejectApplications(String ids, String comments,
			List<EApplicationID> eaIdList) {
		eaIdList = getEaIdList(ids);
		try {
			String hql = "update EApplication ea set ea.status=?,ea.comment=? where ea.id.applicationId=? and ea.id.createdatetime=?";
			for (int i = 0; i < eaIdList.size(); i++) {
				Object[] params = new Object[] { "99", comments,
						eaIdList.get(i).getApplicationId(),
						eaIdList.get(i).getCreatedatetime() };
				dbSession.executeUpdate(hql, params);

				// 删除区域占用
				String err_hql = "delete EArrangement err where err.appId=? and err.createtime=?";
				Object[] err_params = new Object[] {
						eaIdList.get(i).getApplicationId(),
						eaIdList.get(i).getCreatedatetime() };
				dbSession.executeUpdate(err_hql, err_params);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public static void main(String[] args) {

		// EApplication ea = new EApplication();
		// EApplicationID id = new EApplicationID();
		// id.setApplicationId("tssfsf");
		// Timestamp createdatetime = new Timestamp(System.currentTimeMillis());
		// id.setCreatedatetime(createdatetime);
		// ea.setId(id);
		// EApplicationService.addApplication(ea);
		try {
			dbSession.init();
			String sql = "from EArrangement ear where ear.appId='102030_70206097_1' and ear.createtime='2014-12-24 08:47:18'";
			List<EArrangement> earL = dbSession.select(sql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}