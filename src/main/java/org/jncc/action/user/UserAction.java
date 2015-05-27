package org.jncc.action.user;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.jncc.base.cause.ResultCause;
import org.jncc.base.statistic.EStatistic;
import org.jncc.base.statistic.EUserstatistic;
import org.jncc.base.user.UserInfo;
import org.jncc.base.user.UserService;
import org.jncc.persistence.SocketClient;
import org.jncc.persistence.UtilTool;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ResultCause resultCause = new ResultCause();
	private UserInfo userInfo;
	private String fomerPasswd;
	   //登录前页面
    private String prePage;

	
	public String getFomerPasswd() {
		return fomerPasswd;
	}

	public void setFomerPasswd(String fomerPasswd) {
		this.fomerPasswd = fomerPasswd;
	}

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

	public String getMemFromSocket(String stuName,String stuPasswd){
		String result= SocketClient.sendSocket("STULOGIN:"+stuName+"|"+stuPasswd);
		return result;

	}
	
	public String loginIn() {
		UserInfo usInfo = UserService.getUserInfo(UserInfo.class,
				userInfo.getUsername());
		Map session = ActionContext.getContext().getSession();

		if (usInfo == null) {
			String result = getMemFromSocket(userInfo.getUsername(),userInfo.getPassword());
			if(result!=null && result.equals("200")){
				userInfo.setRole("student");
				userInfo.setRealname(userInfo.getUsername());
				resultCause.setCause(result, "User login info is correct.");
			}
			else{
				resultCause.setCause(result, "No such user registed!");
			}
		} else if (usInfo.getPassword().equals(userInfo.getPassword())) {
			
	        prePage = (String) session.get("prePage");
	        //清除session中的数据
	        session.remove("prePage");
	        if (prePage == null) {
	        	//不是拦截器跳转到登陆页面的，直接访问的登陆页面
	        	resultCause.setCause("200", "User login info is correct.");
	        }else{
	        	resultCause.setCause("302", prePage);
	        } 
			session.put("USERINFO", usInfo);
			userInfo = usInfo;
			//获取跳转到登陆界面之前的页面地址，由拦截器提供


		} else {
			resultCause.setCause("403", "User passwd is not correct!");
		}
		System.out.println("comehere!!!!! loginIn!");
		
		//用户信息统计
		EUserstatistic eUS = new EUserstatistic();
		Date  curDate = new Date();
		eUS.setTime(curDate);
		eUS.setIp(UtilTool.getIpAddr(ServletActionContext.getRequest()));
		eUS.setUsername(userInfo.getUsername());
		eUS.setStatus(resultCause.getResultCode());
		dbSession.insert(eUS);
		dbSession.close();
		
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
			Map session = ActionContext.getContext().getSession();
			UserInfo us = (UserInfo) session.get("USERINFO");
			if(us !=null &&(us.getUsername() !=null || !us.getUsername().equals(""))){
				userInfo.setUsername(us.getUsername());
				if(userInfo.getPreference()!=null &&userInfo.getPreference().equals("MODPASSWD")){
					if(fomerPasswd.equals(us.getPassword())){
						UserService.modPasswd(userInfo);
						resultCause.setCause("200", "User info process successfully.");
					}else{
						resultCause.setCause("403", "Former passwd is not correct!.");
					}
					
				}else{
					UserService.modUser(userInfo);
					String passwd = us.getPassword();
					userInfo.setPassword(passwd);
					session.put("USERINFO",userInfo);
					resultCause.setCause("200", "User info process successfully.");
				}
				
			}
			System.out.println();
		} else {
			if (userInfo.getPreference().equals("DELETE")) {
				UserService.deleteUser(userInfo);
				System.out.println("删除成功");
			} else {
				UserService.modUser(userInfo);
				System.out.println("修改成功");
			}
			resultCause.setCause("200", "User info process successfully.");
		}
		return "MOD_USER_INFO";
	}
}
