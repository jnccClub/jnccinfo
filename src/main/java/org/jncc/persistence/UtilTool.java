package org.jncc.persistence;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class UtilTool {
	private static Properties p = null;

	public static boolean IsValid(String str) {
		if (str == null || str.equals("")) {
			return false;
		}
		return true;
	}

	public static String validStr(String str) {
		if (str == null) {
			return "";
		}
		return str;
	}

	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	public static Properties getProperties() {
		if (p == null) {
			String path = ServletActionContext.getServletContext().getRealPath("/WEB-INF/classes/cfg/");
			path = path+"\\mail.properties";
			InputStream is;
			p = new Properties();
			try {
				is = new BufferedInputStream(new FileInputStream(new File(
						path)));
				p.load(is);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return p;
	}

	public static String getProperty(String key) {
		String val = "";
		Object obj = getProperties().get(key);
		if(obj !=null){
			val = obj.toString();
		}
		return val;
	}

	public static void main(String[] args) {
		Properties p = UtilTool.getProperties();
		String qq = UtilTool.getProperty("QQ_SEND");
		
		String qqpwd = UtilTool.getProperty("QQPWD_SEND");
	}

}
