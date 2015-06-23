package org.jncc.base.zone;

import java.util.ArrayList;
import java.util.List;

import org.jncc.persistence.dbSession;

public class EZoneService {
	static List<EZone> zoneList = null ;
	
	public static boolean addZone(Object zoneCfg) {
		try {
			dbSession.insert(zoneCfg);
			dbSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public static List<EZone> getEZoneListCopy() {
		List<EZone> zCpyList = new ArrayList();
		List<EZone> zOrigList = getEZoneList();
		for(int i=0;i<zOrigList.size();i++){
			zCpyList.add(zOrigList.get(i));
		}
		return zCpyList;
	}
	
	public static List<EZone> getEZoneList() {
		if(zoneList == null || zoneList.size()==0){
			try {
				dbSession.init();
				String sql = "from EZone";
				zoneList= dbSession.select(sql);
				dbSession.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return zoneList;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
