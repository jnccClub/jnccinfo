package org.jncc.action.user;

import java.util.Map;

import org.jncc.base.cause.resultCause;
import org.jncc.base.user.UserInfo;
import org.jncc.base.user.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private resultCause resultCause = new resultCause();
	private UserInfo userInfo;

	// private HttpServletRequest req;

	public resultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(resultCause resultCause) {
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
		UserInfo usInfo = UserService
				.getUserInfo(UserInfo.class, userInfo.getUsername());
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
}
