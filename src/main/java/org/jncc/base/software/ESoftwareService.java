package org.jncc.base.software;

import java.util.List;
import java.util.Vector;

import org.jncc.base.xls.ExcelService;
// default package
import org.jncc.persistence.dbSession;


/**
 * SoftwareList entity. @author MyEclipse Persistence Tools
 */

public class ESoftwareService implements java.io.Serializable {
	public static boolean addSW(Object swl) {
		try {
			dbSession.insert(swl);
			dbSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public static boolean addSWFromXLS(String filename) {
		Vector<ESoftware> eswVec = ExcelService.readExcel2ESWList(filename);
		for(int i =0;i<eswVec.size();i++)
		{
			ESoftwareService.addSW(eswVec.get(i));
		}
		return true;
	}
	


	public static void main(String[] args) {
		ESoftwareService tt = new ESoftwareService();
		ESoftwareId ESID = new ESoftwareId("word","7F");
		ESoftware esw = new ESoftware(ESID);
		tt.addSW(esw);
	}
}