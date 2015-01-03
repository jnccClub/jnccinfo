package org.jncc.base.user;
import java.util.List;
import org.jncc.persistence.dbSession;

public class UserService {
	private static List<UserInfo> usList = updateUserList();
	
	public static List<UserInfo> getUsList() {
		return usList;
	}

	public static void setUsList(List<UserInfo> usList) {
		UserService.usList = usList;
	}
	
	public static List<UserInfo> updateUserList(){
		if(usList == null){
			try{
				dbSession.init();
				String hql = "from UserInfo";
				usList = dbSession.select(hql);
				dbSession.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return usList;
	}


	public static boolean addUser(UserInfo userInfo) {
		try {
			dbSession.insert(userInfo);
			dbSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public static boolean IsExistUser(Class<UserInfo> clazz, String userName) {
		boolean IsExist = false;
		if (dbSession.load(clazz, userName) != null)
			IsExist = true;
		dbSession.close();
		return IsExist;
	}

	public static UserInfo getUserInfo(Class<UserInfo> clazz, String userName) {
		UserInfo usInfo;
		usInfo = (UserInfo) dbSession.load(clazz, userName);
		dbSession.close();
		return usInfo;
	}
	
	public static UserInfo getUserInfo(String userName) {
		UserInfo usInfo = null;
		if(usList ==null || usList.size()==0){
			updateUserList();
		}
		for(int i=0;i<usList.size();i++){
			if(usList.get(i).getUsername().equals(userName)){
				usInfo = usList.get(i);
				break;
			}
		}
		return usInfo;
	}
}