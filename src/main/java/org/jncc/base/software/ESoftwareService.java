package org.jncc.base.software;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.jncc.base.xls.ExcelService;
import org.jncc.persistence.UtilTool;
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
			for (int i = 0; i < eswVec.size(); i++) {
				String tt = eswVec.get(i).getId().getZone();
				int j = tt.length();
				System.out.println("Len of " + tt + " is: " + j);
				dbSession.delete(eswVec.get(i));
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
		List<ESoftware> l = null;
		try {
			dbSession.init();
			String sql = "from ESoftware";
			l = dbSession.select(sql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return l;

	}

	public static Map<String, Object> toMapObject(String queryfiled,
			String queryfiledVal) {
		List<ESoftware> eswList = ESoftware.getEswList(queryfiled,
				queryfiledVal);
		List<Map<String, String>> mapList = new ArrayList();
		if (eswList != null) {
			for (int i = 0; i < eswList.size(); i++) {
				mapList.add(toMap(eswList.get(i)));
			}
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("total", mapList.size());
			jsonMap.put("rows", mapList);
			return jsonMap;
		} else {
			return null;
		}
	}

	public static Map<String, String> toMap(ESoftware esw) {
		Map<String, String> swMap = new HashMap<String, String>();
		swMap.put("fld_SWNAME", esw.getId().getName());
		swMap.put("fld_SWZONE", esw.getId().getZone());
		swMap.put("fld_INTIME", esw.getCreatedate());
		swMap.put("fld_INOS", esw.getOs());
		swMap.put("fld_MANAGER", esw.getOperator());
		swMap.put("fld_SWCOMMENT", esw.getComment());
		return swMap;
	}

	public static boolean updateEswList(List l) {
		ESoftware.setEswList(l);
		return true;
	}

	public static void main(String[] args) {
		ESoftwareService tt = new ESoftwareService();
	}
}