package org.jncc.base.bbs;
// default package

import java.sql.Timestamp;


/**
 * EBbs entity. @author MyEclipse Persistence Tools
 */

public class EBbs  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String name;
     private String remark;
     private String ip;
     private Timestamp ctime;
     private String commnet;


    // Constructors

    /** default constructor */
    public EBbs() {
    }

    
    /** full constructor */
    public EBbs(String name, String remark, String ip, Timestamp ctime, String commnet) {
        this.name = name;
        this.remark = remark;
        this.ip = ip;
        this.ctime = ctime;
        this.commnet = commnet;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getIp() {
        return this.ip;
    }
    
    public void setIp(String ip) {
        this.ip = ip;
    }

    public Timestamp getCtime() {
        return this.ctime;
    }
    
    public void setCtime(Timestamp ctime) {
        this.ctime = ctime;
    }

    public String getCommnet() {
        return this.commnet;
    }
    
    public void setCommnet(String commnet) {
        this.commnet = commnet;
    }
   








}