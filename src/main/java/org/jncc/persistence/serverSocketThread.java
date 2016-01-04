package org.jncc.persistence;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class serverSocketThread extends Thread {

	private Socket socket = null;
	private DataOutputStream out = null;
	private DataInputStream in = null;
	private String resultStr = null;

	public serverSocketThread(Socket s,String resultStr) {
		socket = s;
		try {
			out = new DataOutputStream(socket.getOutputStream());
			in = new DataInputStream(socket.getInputStream());
			this.resultStr = resultStr;
			start();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		String str;
		try {
			str = in.readUTF();
			out.writeUTF("你好,我是服务器:"+resultStr);
			System.out.println("Client Socket Message:" + str);
	        in.close();
	        out.close();
	        socket.close();
		} catch (Exception e) {
			try {
				in.close();
				out.close();
				socket.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
