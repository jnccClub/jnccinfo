package org.jncc.Interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.jncc.base.cause.ResultCause;
import org.jncc.base.user.UserInfo;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AuthorityInterceptor implements Interceptor {

	private ResultCause resultCause = new ResultCause();
	public ResultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(ResultCause resultCause) {
		this.resultCause = resultCause;
	}

	public AuthorityInterceptor() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		//取得请求相关的ActionContext实例 
		ActionContext ctx = invocation.getInvocationContext(); 
		Map session = ctx.getSession(); 
		//取出名为user的Session属性 
		UserInfo usInfo = (UserInfo) session.get("USERINFO");
		//如果没有登陆，或者登陆所用的用户名不是scott，都返回重新登陆 
//		if (user != null && user.equals("scott") ) 
//		{ 
//			return "AUTHORITY_LOGIN";
//		} 
//		//没有登陆，将服务器提示设置成一个HttpServletRequest属性 
//		ctx.put("tip" , "您还没有登陆，请先登陆系统"); 
//		//直接返回login的逻辑视图 
		
		 if (usInfo == null) {
	            // 获取HttpServletRequest对象
	            HttpServletRequest req = ServletActionContext.getRequest();
	            // 获取此请求的地址，请求地址包含application name，进行subString操作，去除application name
	            String reqUri = req.getRequestURI();
	            int uriPos = reqUri.lastIndexOf("/");
	            String path = "";
	            if(uriPos>0){
	            	path = reqUri.substring(0,uriPos);
	            }
	            // 获得请求中的参数
	            String queryString = req.getQueryString();
	            // 预防空指针
	            if (queryString == null) {
	                queryString = "";
	            }else{
	            	int redirectPos = queryString.indexOf("redirectURL=");
	            	if(redirectPos>=0){
	            		queryString = queryString.substring(redirectPos+"redirectURL=".length());
	            	}else{
	            		queryString = "";
	            	}
	            }
	            if(queryString == null ||queryString.equals("")){
	            	return invocation.invoke(); 
	            }
	            // 拼凑得到登陆之前的地址
	            String realPath = path + "/" + queryString;
	            // 存入session，方便调用
	            session.put("prePage", realPath);
	            HttpServletResponse response =  ServletActionContext.getResponse();
	            response.setHeader("refused", "true");
	            return "login";
	        }
		//用户已经登录，放行
		return invocation.invoke(); 
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
