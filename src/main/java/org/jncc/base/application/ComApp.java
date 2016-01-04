package org.jncc.base.application;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jncc.base.arrangement.EArrangement;
import org.jncc.persistence.dbSession;



/**
 * SoftwareList entity. @author MyEclipse Persistence Tools
 */

public class ComApp implements java.io.Serializable {
	private String tt01; 
	private String tt02; 
	private String tt03; 
	private String tt04; 
	private String tt05; 
	private String tt06; 
	private String tt07; 
	private String tt08; 
	private String tt09; 
	private String tt10; 
	private String tt11; 
	private String tt12; 
	public  Map<String,String> toMap(){
		Map<String,String> usrMap = new HashMap<String,String>();  
		usrMap.put("fld_CNO", tt01);  
		usrMap.put("创建人", "name2");  
		usrMap.put("课程名称", "1234");  
		usrMap.put("班级名称", "281446888@qq.com");  
		return usrMap;
	}
	
	
	public ComApp(){
		tt01="SS01"; 
		tt02="SS02"; 
		tt03="SS03"; 
		tt04="SS04"; 
		tt05="SS05"; 
		tt06="SS06"; 
		tt07="SS07"; 
		tt08="SS08"; 
		tt09="SS09"; 
		tt10="SS10"; 
		tt11="SS11"; 
		tt12="SS12";
	}
}