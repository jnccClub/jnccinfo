package org.jncc.base.curriculum;
// default package



/**
 * ECurriculum entity. @author MyEclipse Persistence Tools
 */

public class ECurriculum  implements java.io.Serializable {


    // Fields    

     private ECurriculumId id;
     private String stuName;
     private String classNo;
     public String getClassNo() {
		return classNo;
	}

	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}

	private String comment;
     

    // Constructors

    /** default constructor */
    public ECurriculum() {
    }

	/** minimal constructor */
    public ECurriculum(ECurriculumId id) {
        this.id = id;
    }
    
    /** full constructor */
    public ECurriculum(ECurriculumId id, String stuName, String classNo,String comment) {
        this.id = id;
        this.stuName = stuName;
        this.comment = comment;
        this.classNo = classNo;
    }

   
    // Property accessors

    public ECurriculumId getId() {
        return this.id;
    }
    
    public void setId(ECurriculumId id) {
        this.id = id;
    }

    public String getStuName() {
        return this.stuName;
    }
    
    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getComment() {
        return this.comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
   








}