package org.jncc.base.seat;
// default package



/**
 * ESeatId entity. @author MyEclipse Persistence Tools
 */

public class ESeatId  implements java.io.Serializable {


    // Fields    

     private String zone;
     private String date;
     private Integer hour;
     private String seatid;


    // Constructors

    /** default constructor */
    public ESeatId() {
    }

    
    /** full constructor */
    public ESeatId(String zone, String date, Integer hour, String seatid) {
        this.zone = zone;
        this.date = date;
        this.hour = hour;
        this.seatid = seatid;
    }

   
    // Property accessors

    public String getZone() {
        return this.zone;
    }
    
    public void setZone(String zone) {
        this.zone = zone;
    }

    public String getDate() {
        return this.date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }

    public Integer getHour() {
        return this.hour;
    }
    
    public void setHour(Integer hour) {
        this.hour = hour;
    }

    public String getSeatid() {
        return this.seatid;
    }
    
    public void setSeatid(String seatid) {
        this.seatid = seatid;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ESeatId) ) return false;
		 ESeatId castOther = ( ESeatId ) other; 
         
		 return ( (this.getZone()==castOther.getZone()) || ( this.getZone()!=null && castOther.getZone()!=null && this.getZone().equals(castOther.getZone()) ) )
 && ( (this.getDate()==castOther.getDate()) || ( this.getDate()!=null && castOther.getDate()!=null && this.getDate().equals(castOther.getDate()) ) )
 && ( (this.getHour()==castOther.getHour()) || ( this.getHour()!=null && castOther.getHour()!=null && this.getHour().equals(castOther.getHour()) ) )
 && ( (this.getSeatid()==castOther.getSeatid()) || ( this.getSeatid()!=null && castOther.getSeatid()!=null && this.getSeatid().equals(castOther.getSeatid()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getZone() == null ? 0 : this.getZone().hashCode() );
         result = 37 * result + ( getDate() == null ? 0 : this.getDate().hashCode() );
         result = 37 * result + ( getHour() == null ? 0 : this.getHour().hashCode() );
         result = 37 * result + ( getSeatid() == null ? 0 : this.getSeatid().hashCode() );
         return result;
   }   





}