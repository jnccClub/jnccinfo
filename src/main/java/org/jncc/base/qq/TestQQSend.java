package org.jncc.base.qq;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.util.List;

/**
 * @author Shine_MuShi
 */
public class TestQQSend {
        static HttpURLConnection conn=null;
        static String rsp=null;
        static OutputStream out = null;

        public static void main(String[] args) {
        		String sid = "";
                try {
				if (QQClient.getSID() == null || QQClient.getSID().isEmpty()) {
					sid = QQClient.login("34638768", "Hey,huang");
					System.out.println("sid is: " + sid + ";");
				} else {
					sid = QQClient.getSID();
				}
				
                QQClient.sendMsg("249465011", "测试范式例句",sid);
//                List<Group> groupInfoList=QQClient.getFrendGroup(sid);
//                List<String> firendList=QQClient.getFriendsFromGroup(groupInfoList);
//                for(String qq:firendList){
//                        System.out.println(qq);
//                }
//              if(firendList!=null&&firendList.size()!=0){
//                      while(true){
//                              
//                      }
//              }
//                      while(true){
//                              QQClient.getMsg("",sid);
//                      }
//              while(true){
//                      QQClient.getRandomQQ();
//              }
                //QQClient.say("AaOA1KXemnXYtzTiHrqBzTLP", "test");
//              while(true){
//                      QQClient.goOtherHome(sid);
//              }
//              while(true){
//                      QQClient.deleteByIdS();
//              }
                
                
                
                } catch (Exception e) {
                        e.printStackTrace();
                } 
        }
        
}