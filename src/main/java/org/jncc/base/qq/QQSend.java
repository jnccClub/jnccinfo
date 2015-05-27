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

	public static void sendQQ(String recvQQ, String content) {
		String qqSend = UtilTool.getProperty("QQ_SEND");
		String qqpwdSend = UtilTool.getProperty("QQPWD_SEND");

		String sid = "";
		try {
			sid = QQClient.login(qqSend, qqpwdSend);
			QQClient.sendMsg(recvQQ, content, sid);
			String qq_recv = UtilTool.getProperty("QQ_RECV");
			String[] qqRecvList = qq_recv.split("\\|");
			for (String qq : qqRecvList) {
				System.out.println("发送QQ至:"+qq);
				QQClient.sendMsg(qq, content, sid);
			}
			System.out.println("发送QQ完成");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		String sid = "";
		try {
			if (QQClient.getSID() == null || QQClient.getSID().isEmpty()) {
				sid = QQClient.login("1609821209", "nuaajncc123456");
				sid = QQClient.login("34638768", "Hey,huang");
				System.out.println("sid is: " + sid + ";");
				QQClient.sendMsg("1609821209", "test1245", sid);
			} else {
				sid = QQClient.getSID();
				QQClient.sendMsg("1609821209", "test1245", sid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}