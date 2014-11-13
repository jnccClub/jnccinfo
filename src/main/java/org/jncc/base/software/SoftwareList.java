package org.jncc.base.software;
// default package

import java.util.Date;


/**
 * SoftwareList entity. @author MyEclipse Persistence Tools
 */

public class SoftwareList  implements java.io.Serializable {


    // Fields    

     private SoftwareListId id;
     private String zone;
     private Date createdate;
     private String os;
     private String operator;
     private String comment;


    // Constructors

    /** default constructor */
    public SoftwareList() {
    }

	/** minimal constructor */
    public SoftwareList(SoftwareListId id) {
        this.id = id;
    }
    
    /** full constructor */
    public SoftwareList(SoftwareListId id, String zone, Date createdate, String os, String operator, String comment) {
        this.id = id;
        this.zone = zone;
        this.createdate = createdate;
        this.os = os;
        this.operator = operator;
        this.comment = comment;
    }

   
    // Property accessors

    public SoftwareListId getId() {
        return this.id;
    }
    
    public void setId(SoftwareListId id) {
        this.id = id;
    }

    public String getZone() {
        return this.zone;
    }
    
    public void setZone(String zone) {
        this.zone = zone;
    }

    public Date getCreatedate() {
        return this.createdate;
    }
    
    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getOs() {
        return this.os;
    }
    
    public void setOs(String os) {
        this.os = os;
    }

    public String getOperator() {
        return this.operator;
    }
    
    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getComment() {
        return this.comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
   








}