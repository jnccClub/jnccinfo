package org.jncc.base.qq;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.util.List;

import org.jncc.persistence.UtilTool;

/**
 * @author Shine_MuShi
 */
public class QQSend {
	static HttpURLConnection conn = null;
	static String rsp = null;
	static OutputStream out = null;

	public static void sendQQ(String recvQQ,String content) {
		String qqSend = UtilTool.getProperty("QQ_SEND");
		String qqpwdSend = UtilTool.getProperty("QQPWD_SEND");
		
		String sid = "";
		try {
			if (QQClient.getSID() == null || QQClient.getSID().isEmpty()) {
				sid = QQClient.login(qqSend,qqpwdSend);
			} else {
				sid = QQClient.getSID();
			}
			QQClient.sendMsg(recvQQ,content, sid);
			String qq_recv = UtilTool.getProperty("QQ_RECV");
			String[] qqRecvList = qq_recv.split("\\|");
			for(String qq:qqRecvList){
				QQClient.sendMsg(qq,content, sid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		

	public static void main(String[] args) {
		String sid = "";
		try {
			if (QQClient.getSID() == null || QQClient.getSID().isEmpty()) {
				sid = QQClient.login("34638768", "Hey,huang");
				System.out.println("sid is: " + sid + ";");
			} else {
				sid = QQClient.getSID();
			}

			QQClient.sendMsg("249465011", "测试范式例句", sid);
			// List<Group> groupInfoList=QQClient.getFrendGroup(sid);
			// List<String>
			// firendList=QQClient.getFriendsFromGroup(groupInfoList);
			// for(String qq:firendList){
			// System.out.println(qq);
			// }
			// if(firendList!=null&&firendList.size()!=0){
			// while(true){
			//
			// }
			// }
			// while(true){
			// QQClient.getMsg("",sid);
			// }
			// while(true){
			// QQClient.getRandomQQ();
			// }
			// QQClient.say("AaOA1KXemnXYtzTiHrqBzTLP", "test");
			// while(true){
			// QQClient.goOtherHome(sid);
			// }
			// while(true){
			// QQClient.deleteByIdS();
			// }

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}