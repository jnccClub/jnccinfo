package org.nuaa.mapp.servlet;

import java.util.Date;
import java.util.Map;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.jncc.base.statistic.EStatistic;
import org.jncc.persistence.UtilTool;
import org.jncc.persistence.dbSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionContext;

/**
 * Created by YeahO_O on 1/27/2015.
 */
public class MySessionListener implements HttpSessionListener,
		ServletRequestListener {
	private static Logger logger = LoggerFactory
			.getLogger(ApplicationCtxListener.class);
	private HttpServletRequest hsReq = null;

	@Override
	public void sessionCreated(HttpSessionEvent hsEvent) {
		// TODO Auto-generated method stub
		System.out.println("Session created!");

		EStatistic es = new EStatistic();
		Date curDate = new Date();
		String ip = "invalid";
		if (hsReq != null) {
			ip = hsReq.getRemoteAddr();
		}
		es.setAccessIp(ip);
		es.setAccessTime(curDate);
		dbSession.insert(es);
		dbSession.close();
		System.out.println("Session created!");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent hsEvent) {
		// TODO Auto-generated method stub
		hsReq = null;
	}

	@Override
	public void requestDestroyed(ServletRequestEvent sReq) {
		// TODO Auto-generated method stub
		hsReq = null;
	}

	@Override
	public void requestInitialized(ServletRequestEvent sReq) {
		// TODO Auto-generated method stub
		hsReq = (HttpServletRequest) sReq.getServletRequest();
	}

}
