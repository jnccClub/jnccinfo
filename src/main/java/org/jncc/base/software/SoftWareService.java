package org.jncc.base.software;
// default package

import java.util.Date;

import org.jncc.base.user.UserInfo;
import org.jncc.persistence.dbSession;


/**
 * SoftwareList entity. @author MyEclipse Persistence Tools
 */

public class SoftWareService  implements java.io.Serializable {

	public boolean addswl(SoftwareList swl) {
		try {
			dbSession.insert(swl);
			dbSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public static void main(String[] args) {
		SoftwareListId swlId = new SoftwareListId();
		swlId.setName("auto Cad");
		swlId.setVersion("7.5");
		
		SoftwareList swl = new SoftwareList();
		swl.setId(swlId);
		SoftWareService ss = new SoftWareService();
		ss.addswl(swl);
	}
}