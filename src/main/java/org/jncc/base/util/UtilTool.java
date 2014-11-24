package org.jncc.base.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
// default package


/**
 * SoftwareList entity. @author MyEclipse Persistence Tools
 */

public class UtilTool implements java.io.Serializable {
	public static Timestamp convertStr2T(String dateStr){
		Timestamp ts = new Timestamp(System.currentTimeMillis());  
		String tsStr ="";
		if(dateStr.length() == 10){
			tsStr = dateStr +" 08:00:00";
		}else{
			tsStr = dateStr;
		}
        try {  
            ts = Timestamp.valueOf(tsStr);  
            System.out.println(ts);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
		return ts;
	}
	
	public static String convertTime2Str(Timestamp ts){
        String tsStr = "";  
        DateFormat sdf = new SimpleDateFormat("yyy-MM-dd");  
        try {  
            //方法一  
            tsStr = sdf.format(ts);  
//            System.out.println(tsStr);  
            //方法二  
//            tsStr = ts.toString();  
//            System.out.println(tsStr);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
		
		return tsStr;
	}
	
	public static void main(String[] args) {
		UtilTool.convertStr2T("2012-01-01");
		UtilTool.convertTime2Str(null);
		
		
	}
}