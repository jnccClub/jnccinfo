package org.jncc.persistence;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class socketSever {

	public static void recvSocket(String resultStr) {
		ServerSocket s = null;
		Socket socket = null;
		int SOCKETPORT = Integer.valueOf(UtilTool.getProperty("SERVERPORT"));
		try {
			s = new ServerSocket(SOCKETPORT);
			// 等待新请求、否则一直阻塞
			while (true) {
				socket = s.accept();
				System.out.println("socket:" + socket);
				new serverSocketThread(socket,resultStr);
			}
		} catch (Exception e) {
			try {
				socket.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				s.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public static void main(String[] args) {
		socketSever.recvSocket("什么玩意！");
	}

}
