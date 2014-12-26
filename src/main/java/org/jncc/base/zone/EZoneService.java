package org.jncc.base.zone;

import java.util.List;

import org.jncc.persistence.dbSession;

public class EZoneService {

	public static boolean addZone(Object zoneCfg) {
		try {
			dbSession.insert(zoneCfg);
			dbSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public static List<EZone> getEZoneList() {
		String sql = "from EZone";
		List<EZone> l = dbSession.select(sql);
		return l;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
			
	}

}
