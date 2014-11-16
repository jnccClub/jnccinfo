package org.jncc.base.software;
// default package



/**
 * ESoftwareId entity. @author MyEclipse Persistence Tools
 */

public class ESoftwareId  implements java.io.Serializable {


    // Fields    

     private String name;
     private String zone;


    // Constructors

    /** default constructor */
    public ESoftwareId() {
    }

    
    /** full constructor */
    public ESoftwareId(String name, String zone) {
        this.name = name;
        this.zone = zone;
    }

   
    // Property accessors

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getZone() {
        return this.zone;
    }
    
    public void setZone(String zone) {
        this.zone = zone;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ESoftwareId) ) return false;
		 ESoftwareId castOther = ( ESoftwareId ) other; 
         
		 return ( (this.getName()==castOther.getName()) || ( this.getName()!=null && castOther.getName()!=null && this.getName().equals(castOther.getName()) ) )
 && ( (this.getZone()==castOther.getZone()) || ( this.getZone()!=null && castOther.getZone()!=null && this.getZone().equals(castOther.getZone()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getName() == null ? 0 : this.getName().hashCode() );
         result = 37 * result + ( getZone() == null ? 0 : this.getZone().hashCode() );
         return result;
   }   





}