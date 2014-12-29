package org.jncc.persistence;

public class UtilTool {
	public static boolean IsValid(String str){
		if(str==null ||str.equals("")){
			return false;
		}
		return true;
	}
	
	public static String validStr(String str){
		if(str==null){
			return "";
		}
		return str;
	}
}
