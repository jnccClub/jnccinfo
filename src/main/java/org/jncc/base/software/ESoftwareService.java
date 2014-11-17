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
		try {
			for(int i=0;i<eswVec.size();i++){
				String tt = eswVec.get(i).getId().getZone();
				int j = tt.length();
				System.out.println("Len of "+tt+" is: "+j);
				dbSession.insert(eswVec.get(i));
				dbSession.close(false);
			}
			dbSession.close(true);
			
		} catch (Exception e) {
			return false;
		}
		updateEswList(getEswList());
		return true;
	}
	
	public static List getEswList() {
		String sql = "from ESoftware";
		List l = dbSession.select(sql);
		return l;
	}

	public static boolean updateEswList(List l) {
		ESoftware.setEswList(l);
		return true;
	}

	public static void main(String[] args) {
		ESoftwareService tt = new ESoftwareService();
	}
}