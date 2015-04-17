package org.jncc.action.user;

import java.util.List;
import java.util.Map;

import org.jncc.base.cause.ResultCause;
import org.jncc.base.user.UserInfo;
import org.jncc.base.user.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ResultCause resultCause = new ResultCause();
	private UserInfo userInfo;

	List<Object[]> userInfoList = null;

	// private HttpServletRequest req;

	public List<Object[]> getUserInfoList() {
		return userInfoList;
	}

	public void setUserInfoList(List<Object[]> userInfoList) {
		this.userInfoList = userInfoList;
	}

	public String isLogin() {
		Map session = ActionContext.getContext().getSession();
		UserInfo us = (UserInfo) session.get("USERINFO");
		if (us == null || us.getUsername().equals("")) {
			resultCause.setCause("404", "Not login in");
		} else {
			userInfo = us;
			resultCause.setCause("200", "User is already login in.");
		}
		return "LOGIN_IN";
	}

	public ResultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(ResultCause resultCause) {
		this.resultCause = resultCause;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public String add() {
		// 如果是异步提交json格式，必须先在js中对提交的表单form进行序列化
		// var params = $("subUserForm").serialize();
		if (UserService.addUser(userInfo)) {
			System.out.println("add user succcessfully");
			resultCause.setCause("200", "add successfully!");
			UserService.updateUserList();
			// req = ServletActionContext.getRequest();
			// req.getSession().setAttribute("user", userInfo);

		} else {
			System.out.println("add user failed");
			resultCause.setCause("408", "add failed!");
		}
		return "ADD_SUCCESS";
	}

	public String checkUsername() {
		if (UserService.IsExistUser(UserInfo.class, userInfo.getUsername())) {
			resultCause.setCause("302", "The new user is alread existed.");
		} else {
			resultCause.setCause("200", "The new user is available.");
		}
		System.out.println("comehere!!!!! checkUsername");
		return "CHECK_NAME";
	}

	public String loginIn() {
		UserInfo usInfo = UserService.getUserInfo(UserInfo.class,
				userInfo.getUsername());
		if (usInfo == null) {
			resultCause.setCause("404", "No such user registed!");
		} else if (usInfo.getPassword().equals(userInfo.getPassword())) {
			resultCause.setCause("200", "User login info is correct.");
			Map session = ActionContext.getContext().getSession();
			session.put("USERINFO", usInfo);
			userInfo = usInfo;
		} else {
			resultCause.setCause("403", "User passwd is not correct!");
		}
		System.out.println("comehere!!!!! loginIn!");
		return "LOGIN_IN";
	}

	public String listUserInfo() {
		Map session = ActionContext.getContext().getSession();
		UserInfo us = (UserInfo) session.get("USERINFO");
		if (us == null || us.getUsername().equals("")) {
			resultCause.setCause("404", "Not login in");
		} else {
			if (!us.getRole().equals("admin")) {
				resultCause.setCause("403", "User info process successfully.");
			} else {
				userInfoList = UserService.getUMInfoList(UserService
						.getUsList());
			}
		}
		return "LIST_USER_INFO";
	}

	public String modUserInfo() {
		if (userInfo.getUsername() == null || userInfo.getUsername().equals("")) {
			resultCause.setCause("403", "User passwd is not correct!");
			System.out.println();
		} else {
			if (userInfo.getPreference().equals("DELETE")) {
				UserService.deleteUser(userInfo);
				System.out.println("删除成功");
			} else {
				UserService.modUser(userInfo);
				System.out.println("修改成功");
			}
		}
		resultCause.setCause("200", "User info process successfully.");
		return "MOD_USER_INFO";
	}
}
