package org.jncc.persistence;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
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
			String path = ServletActionContext.getServletContext().getRealPath(
					"/WEB-INF/classes/cfg/");
			path = path + "/mail.properties";
			InputStream is;
			p = new Properties();
			try {
				is = new BufferedInputStream(
						new FileInputStream(new File(path)));
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
		if (obj != null) {
			val = obj.toString();
		}
		return val;
	}
	
	public static String getProperty(String key,Properties p) {
		String val = "";
		Object obj = p.get(key);
		if (obj != null) {
			val = obj.toString();
		}
		return val;
	}

	public static String getNextDay(String date) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date myDate = formatter.parse(date);
			Calendar c = Calendar.getInstance();
			c.setTime(myDate);
			c.add(Calendar.DATE, 1);
			myDate = c.getTime();
			System.out.println(formatter.format(myDate));
			return formatter.format(myDate);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return null;
	}

	public static String getNowDate() {
		String temp_str = "";
		Date dt = new Date();
		// 最后的aa表示“上午”或“下午” HH表示24小时制 如果换成hh表示12小时制
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		temp_str = sdf.format(dt);
		return temp_str;
	}
	
	public static String getNowHour() {
		String temp_str = "";
		Date dt = new Date();
		// 最后的aa表示“上午”或“下午” HH表示24小时制 如果换成hh表示12小时制
		SimpleDateFormat sdf = new SimpleDateFormat("HH");
		temp_str = sdf.format(dt);
		return temp_str;
	}
	
	public static String list2Str(List<String> strList) {
		String temp_str = "";
		for(int i=0;i<strList.size();i++){
			temp_str = temp_str+strList.get(i);
			temp_str = temp_str+"|";
		}
		return temp_str;
	}

	public static void main(String[] args) {
		// Properties p = UtilTool.getProperties();
		// String qq = UtilTool.getProperty("QQ_SEND");
		//
		// String qqpwd = UtilTool.getProperty("QQPWD_SEND");
		getNextDay("2015-03-31");

	}

}
