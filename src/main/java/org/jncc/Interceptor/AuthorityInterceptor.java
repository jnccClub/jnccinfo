package org.jncc.Interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AuthorityInterceptor implements Interceptor {

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
		String user = (String)session.get("user");
		//如果没有登陆，或者登陆所用的用户名不是scott，都返回重新登陆 
		if (user != null && user.equals("scott") ) 
		{ 
			return "AUTHORITY_LOGIN";
		} 
		//没有登陆，将服务器提示设置成一个HttpServletRequest属性 
		ctx.put("tip" , "您还没有登陆，请输入scott,tiger登陆系统"); 
		//直接返回login的逻辑视图 
		
		
		return invocation.invoke(); 
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
