package org.jncc.base.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.jncc.persistence.UtilTool;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionContext;

public class UserService {
	private static List<UserInfo> usList = updateUserList();

	public static List<UserInfo> getUsList() {
		return usList;
	}

	public static void setUsList(List<UserInfo> usList) {
		UserService.usList = usList;
	}

	public static List<UserInfo> updateUserList() {
		return updateUserList(false);
	}

	public static List<UserInfo> updateUserList(boolean isForced) {
		if (usList == null || isForced) {
			try {
				dbSession.init();
				String hql = "from UserInfo";
				usList = dbSession.select(hql);
				dbSession.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return usList;
	}

	public static boolean addUser(UserInfo userInfo) {
		try {
			dbSession.insert(userInfo);
			dbSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public static boolean IsExistUser(Class<UserInfo> clazz, String userName) {
		boolean IsExist = false;
		if (dbSession.load(clazz, userName) != null)
			IsExist = true;
		dbSession.close();
		return IsExist;
	}

	public static UserInfo getUserInfo(Class<UserInfo> clazz, String userName) {
		UserInfo usInfo;
		usInfo = (UserInfo) dbSession.load(clazz, userName);
		dbSession.close();
		return usInfo;
	}

	public static UserInfo getUserInfo(String userName) {
		UserInfo usInfo = null;
		if (usList == null || usList.size() == 0) {
			updateUserList();
		}
		for (int i = 0; i < usList.size(); i++) {
			if (usList.get(i).getUsername().equals(userName)) {
				usInfo = usList.get(i);
				break;
			}
		}
		return usInfo;
	}

	public static boolean isSuperAdmin() {
		Map session = ActionContext.getContext().getSession();
		UserInfo us = (UserInfo) session.get("USERINFO");
		if (us == null || us.getUsername().equals("")) {
			return false;
		} else {
			if (us.getUsername().indexOf("70203902") > -1) {
				return true;
			}
		}
		return false;
	}

	public static Object[] getUserInfoObj(UserInfo usInfo) {
		Object[] obj = new Object[8];
		obj[0] = UtilTool.validStr(usInfo.getUsername());
		obj[1] = UtilTool.validStr(usInfo.getRealname());
		obj[2] = UtilTool.validStr(usInfo.getPassword());
		obj[3] = UtilTool.validStr(usInfo.getPhoneno());
		obj[4] = UtilTool.validStr(usInfo.getEmail());
		obj[5] = UtilTool.validStr(usInfo.getSelfIntroduce());
		obj[6] = "<a class='edit' href='javascript:;'>编辑</a>";
		obj[7] = "<a class='delete' href='javascript:;'>删除</a>";
		return obj;
	}

	public static List<Object[]> getUMInfoList(List<UserInfo> usList) {
		List<Object[]> umInfoList = new ArrayList();
		for (int i = 0; i < usList.size(); i++) {
			umInfoList.add(getUserInfoObj(usList.get(i)));
		}
		return umInfoList;
	}

	public static boolean deleteUser(UserInfo userInfo) {
		dbSession.delete(userInfo);
		updateUserList(true);
		return true;
	}

	public static boolean modUser(UserInfo user) {
		try {
			String hql = "update UserInfo us set us.realname=?,us.password=?,us.phoneno=?,us.email=?,us.selfIntroduce=? where us.username=?";
			Object[] params = new Object[] { user.getRealname(),user.getPassword(),
					user.getPhoneno(), user.getEmail(),
					user.getSelfIntroduce(), user.getUsername() };
			if (user.getPassword() == null || user.getPassword().equals("")) {
				hql = "update UserInfo us set us.realname=?,us.phoneno=?,us.email=?,us.selfIntroduce=?,us.qq=? where us.username=?";
				params = new Object[] { user.getRealname(),
						user.getPhoneno(), user.getEmail(),
						user.getSelfIntroduce(), user.getQq(),user.getUsername() };
			}
			
			dbSession.executeUpdate(hql, params);
			updateUserList(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	public static boolean modPasswd(UserInfo user) {
		try {
			String hql = "update UserInfo us set us.password=? where us.username=?";
			Object[] params = new Object[] { user.getPassword(),
					user.getUsername() };
			dbSession.executeUpdate(hql, params);
			updateUserList(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

}