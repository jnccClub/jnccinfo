package org.jncc.base.arrangement;
// default package

import java.sql.Timestamp;


/**
 * EArrangementId entity. @author MyEclipse Persistence Tools
 */

public class EArrangementId  implements java.io.Serializable {


    // Fields    

     private String zone;
     private Timestamp date;
     private Integer course;


    // Constructors

    /** default constructor */
    public EArrangementId() {
    }

    
    /** full constructor */
    public EArrangementId(String zone, Timestamp date, Integer course) {
        this.zone = zone;
        this.date = date;
        this.course = course;
    }

   
    // Property accessors

    public String getZone() {
        return this.zone;
    }
    
    public void setZone(String zone) {
        this.zone = zone;
    }

    public Timestamp getDate() {
        return this.date;
    }
    
    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Integer getCourse() {
        return this.course;
    }
    
    public void setCourse(Integer course) {
        this.course = course;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof EArrangementId) ) return false;
		 EArrangementId castOther = ( EArrangementId ) other; 
         
		 return ( (this.getZone()==castOther.getZone()) || ( this.getZone()!=null && castOther.getZone()!=null && this.getZone().equals(castOther.getZone()) ) )
 && ( (this.getDate()==castOther.getDate()) || ( this.getDate()!=null && castOther.getDate()!=null && this.getDate().equals(castOther.getDate()) ) )
 && ( (this.getCourse()==castOther.getCourse()) || ( this.getCourse()!=null && castOther.getCourse()!=null && this.getCourse().equals(castOther.getCourse()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getZone() == null ? 0 : this.getZone().hashCode() );
         result = 37 * result + ( getDate() == null ? 0 : this.getDate().hashCode() );
         result = 37 * result + ( getCourse() == null ? 0 : this.getCourse().hashCode() );
         return result;
   }   





}