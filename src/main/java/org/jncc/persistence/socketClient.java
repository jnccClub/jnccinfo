package org.jncc.persistence;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.LinkedList;
import java.util.List;

public class SocketClient {
	// private Socket socket = null;
	// private DataInputStream is;
	// private DataOutputStream os;
	//
	// public SocketClient() {
	// lazyInit();
	// }
	//
	// private String sendMessage(String message) {
	// try {
	// os.write(message.getBytes());
	// os.flush();
	// } catch (IOException e) {
	// System.out.println("报文写入异常");
	// e.printStackTrace();
	// }
	// String msg = "";
	// // msg = is.readUTF();
	// msg = readsocketUTF(is);
	// close();
	// return msg;
	// }
	//
	// public void close() {
	// try {
	// is.close();
	// os.close();
	// socket.close();
	// System.out.println("Socket已关闭");
	// } catch (Exception e) {
	// System.out.println("关闭异常");
	// e.printStackTrace();
	// }
	// }
	//
	// static String readsocketUTF(DataInputStream is) {
	// String msg = "";
	// try {
	// BufferedInputStream in = new BufferedInputStream(is);
	// byte[] buff = new byte[1024];
	// int len = in.read(buff);
	// msg = new String(buff);
	// } catch (IOException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// System.out.println(msg);
	// return msg;
	//
	// }
	//
	// private void lazyInit() {
	// // String SERVERIP = UtilTool.getProperty("SERVERIP");
	// // int SERVERPORT = Integer
	// // .valueOf(UtilTool.getProperty("SERVERPORT"));
	//
	// String SERVERIP = "172.18.239.168";
	// int SERVERPORT = 53088;
	// try {
	// socket = new Socket(SERVERIP, SERVERPORT);
	// } catch (UnknownHostException e) {
	// System.out.println("主机未找到");
	// e.printStackTrace();
	// } catch (IOException e) {
	// System.out.println("建立连接异常");
	// e.printStackTrace();
	// }
	// try {
	// os = new DataOutputStream(socket.getOutputStream());
	// } catch (IOException e) {
	// System.out.println("DataOutputStream打开异常");
	// e.printStackTrace();
	// }
	// try {
	// is = new DataInputStream(socket.getInputStream());
	// } catch (IOException e) {
	// System.out.println("DataInputStream打开异常");
	// e.printStackTrace();
	// }
	// }

	public static String sendSocket(String socketStr) {
		Socket socket = null;
		DataInputStream in = null;
		DataOutputStream out = null;
		String recvMsg = "";
		try {
			// 客户端socket指定服务器的地址和端口号
			String SERVERIP = UtilTool.getProperty("SERVERIP");
			int SERVERPORT = Integer
					.valueOf(UtilTool.getProperty("SERVERPORT"));
			socket = new Socket(SERVERIP, SERVERPORT);
			System.out.println("Socket=" + socket);
			// 同服务器原理一样
			in = new DataInputStream(socket.getInputStream());
			out = new DataOutputStream(socket.getOutputStream());
			// for (int k = 1; k < 100; k = k + 2) {
			// out.writeUTF("" + k);
			out.writeUTF(socketStr);
			BufferedInputStream ins = new BufferedInputStream(in);
			byte[] buff = new byte[1024];
			int len = ins.read(buff);
			recvMsg = new String(buff).substring(0,len);
			System.out.println("客户收到" + recvMsg);
			// Thread.sleep(500);
			// }
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
		return recvMsg;
	}

	public static void main(String[] args) {
		// SocketClient.sendSocket("test nothing!");
//		SocketClient sc = new SocketClient();
//		String test = sc.sendMessage("china is good!");
//		System.out.println(test);
	}

}
