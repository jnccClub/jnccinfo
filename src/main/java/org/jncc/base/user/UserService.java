package org.jncc.base.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.jncc.action.Db;
import org.jncc.persistence.dbSession;

public class UserService {

	public List<UserInfo> getUser() {

		List<UserInfo> users = new ArrayList<UserInfo>();
		return users;
	}

	public boolean addUser(UserInfo userInfo) {
		try {
			dbSession.insert(userInfo);
			dbSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean IsExistUser(Class<UserInfo> clazz, String userName) {
		boolean IsExist = false;
		if (dbSession.load(clazz, userName) != null)
			IsExist = true;
		dbSession.close();
		return IsExist;
	}

	public UserInfo getUserInfo(Class<UserInfo> clazz, String userName) {
		UserInfo usInfo;
		usInfo = (UserInfo) dbSession.load(clazz, userName);
		dbSession.close();
		return usInfo;
	}
}