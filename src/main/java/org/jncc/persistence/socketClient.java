package org.jncc.persistence;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class socketClient {
	
	public static String sendSocket(String socketStr){
		Socket socket = null;
		DataInputStream in=null;
        DataOutputStream out=null;
        String sResult=null;
		try {
			// 客户端socket指定服务器的地址和端口号
			String SERVERIP = UtilTool.getProperty("SERVERIP");
			int SERVERPORT = Integer.valueOf(UtilTool.getProperty("SERVERPORT"));
			socket = new Socket(SERVERIP, SERVERPORT);
			System.out.println("Socket=" + socket);
			// 同服务器原理一样
			in = new DataInputStream(socket.getInputStream());
			out = new DataOutputStream(socket.getOutputStream());
//			for (int k = 1; k < 100; k = k + 2) {
//				out.writeUTF("" + k);
			    out.writeUTF(socketStr);
			    sResult = in.readUTF();
				System.out.println("客户收到" + sResult);
//				Thread.sleep(500);
//			}
		} catch (Exception e) {
			System.out.println("服务器已断开" + e);

		} finally {
			try {
				System.out.println("close......");
				in.close();
				out.close();
				socket.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return sResult;
	}

	public static void main(String[] args) {
		socketClient.sendSocket("test nothing!");
	}

}
