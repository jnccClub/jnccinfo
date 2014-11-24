package org.jncc.base.application;

import org.jncc.base.arrangement.EArrangement;
import org.jncc.persistence.dbSession;



/**
 * SoftwareList entity. @author MyEclipse Persistence Tools
 */

public class EApplicationService implements java.io.Serializable {
	
	public static boolean addApplication(EApplication ea){
		try {
			dbSession.delete(ea);
			dbSession.close(false);
			dbSession.insert(ea);
			dbSession.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static void main(String[] args) {
		
	}
}