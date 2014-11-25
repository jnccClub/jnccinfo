package org.jncc.base.arrangement;
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


    // Constructors

    /** default constructor */
    public EArrangement() {
    }

	/** minimal constructor */
    public EArrangement(EArrangementId id) {
        this.id = id;
    }
    
    /** full constructor */
    public EArrangement(EArrangementId id, String floor, String appId, String comment) {
        this.id = id;
        this.floor = floor;
        this.appId = appId;
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
   








}