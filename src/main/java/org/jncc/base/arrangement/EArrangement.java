package org.jncc.base.arrangement;

import java.sql.Timestamp;

// default package



/**
 * EArrangement entity. @author MyEclipse Persistence Tools
 */

public class EArrangement  implements java.io.Serializable {


    // Fields    

     private EArrangementId id;
     private String floor;
     private String appId;
     private String comment;
     private Timestamp createtime;


    // Constructors




	/** default constructor */
    public EArrangement() {
    }

	/** minimal constructor */
    public EArrangement(EArrangementId id) {
        this.id = id;
    }
    public EArrangement(EArrangement ear) {
        this.id = ear.getId();
        this.floor = ear.getFloor();
        this.appId = ear.getAppId();
        this.createtime = ear.getCreatetime();
        this.comment = ear.getComment();
    }
    
    /** full constructor */
    public EArrangement(EArrangementId id, String floor, String appId, Timestamp createtime,String comment) {
        this.id = id;
        this.floor = floor;
        this.appId = appId;
        this.createtime = createtime;
        this.comment = comment;
    }

   
    // Property accessors

    public EArrangementId getId() {
        return this.id;
    }
    
    public void setId(EArrangementId id) {
        this.id = id;
    }

    public String getFloor() {
        return this.floor;
    }
    
    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getAppId() {
        return this.appId;
    }
    
    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getComment() {
        return this.comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
   

    public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}






}