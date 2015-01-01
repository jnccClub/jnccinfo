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
		List<EZone> l = null;
		try {
			dbSession.init();
			String sql = "from EZone";
			l = dbSession.select(sql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
