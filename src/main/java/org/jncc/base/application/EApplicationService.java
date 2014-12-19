package org.jncc.base.application;

import java.sql.Timestamp;
import java.util.Date;

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
		
		EApplication ea = new EApplication();
		EApplicationID  id = new EApplicationID();
		id.setApplicationId("tssfsf");
		Timestamp createdatetime = new Timestamp(System.currentTimeMillis());
		id.setCreatedatetime(createdatetime);
		ea.setId(id);
		EApplicationService.addApplication(ea);
		
	}
}