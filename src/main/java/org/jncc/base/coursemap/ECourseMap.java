package org.jncc.base.coursemap;
// default package



/**
 * ECourseMap entity. @author MyEclipse Persistence Tools
 */

public class ECourseMap  implements java.io.Serializable {


    // Fields    

     private Integer course;
     private String beginTime;
     private String endTime;
     private String commnet;


    // Constructors

    /** default constructor */
    public ECourseMap() {
    }

	/** minimal constructor */
    public ECourseMap(Integer course, String beginTime, String endTime) {
        this.course = course;
        this.beginTime = beginTime;
        this.endTime = endTime;
    }
    
    /** full constructor */
    public ECourseMap(Integer course, String beginTime, String endTime, String commnet) {
        this.course = course;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.commnet = commnet;
    }

   
    // Property accessors

    public Integer getCourse() {
        return this.course;
    }
    
    public void setCourse(Integer course) {
        this.course = course;
    }

    public String getBeginTime() {
        return this.beginTime;
    }
    
    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return this.endTime;
    }
    
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getCommnet() {
        return this.commnet;
    }
    
    public void setCommnet(String commnet) {
        this.commnet = commnet;
    }
   








}