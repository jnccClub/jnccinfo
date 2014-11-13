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
                try {
                String sid=QQClient.login("249465011", "Hey,huang");
                QQClient.sendMsg("34638768", "congratulations you've done your jobs!",sid);
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