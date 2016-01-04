package org.jncc.base.curriculum;
// default package



/**
 * ECurriculumId entity. @author MyEclipse Persistence Tools
 */

public class ECurriculumId  implements java.io.Serializable {


    // Fields    

     private String serial;
     private String stuNo;


    // Constructors

    /** default constructor */
    public ECurriculumId() {
    }

    
    /** full constructor */
    public ECurriculumId(String serial, String stuNo) {
        this.serial = serial;
        this.stuNo = stuNo;
    }

   
    // Property accessors

    public String getSerial() {
        return this.serial;
    }
    
    public void setSerial(String serial) {
        this.serial = serial;
    }

    public String getStuNo() {
        return this.stuNo;
    }
    
    public void setStuNo(String stuNo) {
        this.stuNo = stuNo;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ECurriculumId) ) return false;
		 ECurriculumId castOther = ( ECurriculumId ) other; 
         
		 return ( (this.getSerial()==castOther.getSerial()) || ( this.getSerial()!=null && castOther.getSerial()!=null && this.getSerial().equals(castOther.getSerial()) ) )
 && ( (this.getStuNo()==castOther.getStuNo()) || ( this.getStuNo()!=null && castOther.getStuNo()!=null && this.getStuNo().equals(castOther.getStuNo()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getSerial() == null ? 0 : this.getSerial().hashCode() );
         result = 37 * result + ( getStuNo() == null ? 0 : this.getStuNo().hashCode() );
         return result;
   }   





}