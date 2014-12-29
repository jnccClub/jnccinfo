package org.jncc.base.course;
// default package



/**
 * ECourse entity. @author MyEclipse Persistence Tools
 */

public class ECourse  implements java.io.Serializable {


    // Fields    

     private String serial;
     private String name;
     private String teacher;
     private String teacherNo;
     private String classNo;
     private Integer seats;
     private String comment;


    // Constructors

    /** default constructor */
    public ECourse() {
    }

	/** minimal constructor */
    public ECourse(String serial) {
        this.serial = serial;
    }
    
    /** full constructor */
    public ECourse(String serial, String name, String teacher, String teacherNo, String classNo, Integer seats, String comment) {
        this.serial = serial;
        this.name = name;
        this.teacher = teacher;
        this.teacherNo = teacherNo;
        this.classNo = classNo;
        this.seats = seats;
        this.comment = comment;
    }

   
    // Property accessors

    public String getSerial() {
        return this.serial;
    }
    
    public void setSerial(String serial) {
        this.serial = serial;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getTeacher() {
        return this.teacher;
    }
    
    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getTeacherNo() {
        return this.teacherNo;
    }
    
    public void setTeacherNo(String teacherNo) {
        this.teacherNo = teacherNo;
    }

    public String getClassNo() {
        return this.classNo;
    }
    
    public void setClassNo(String classNo) {
        this.classNo = classNo;
    }

    public Integer getSeats() {
        return this.seats;
    }
    
    public void setSeats(Integer seats) {
        this.seats = seats;
    }

    public String getComment() {
        return this.comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
   








}