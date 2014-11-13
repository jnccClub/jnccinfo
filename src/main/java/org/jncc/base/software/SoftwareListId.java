package org.jncc.base.software;
// default package



/**
 * SoftwareListId entity. @author MyEclipse Persistence Tools
 */

public class SoftwareListId  implements java.io.Serializable {


    // Fields    

     private String name;
     private String version;


    // Constructors

    /** default constructor */
    public SoftwareListId() {
    }

    
    /** full constructor */
    public SoftwareListId(String name, String version) {
        this.name = name;
        this.version = version;
    }

   
    // Property accessors

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getVersion() {
        return this.version;
    }
    
    public void setVersion(String version) {
        this.version = version;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof SoftwareListId) ) return false;
		 SoftwareListId castOther = ( SoftwareListId ) other; 
         
		 return ( (this.getName()==castOther.getName()) || ( this.getName()!=null && castOther.getName()!=null && this.getName().equals(castOther.getName()) ) )
 && ( (this.getVersion()==castOther.getVersion()) || ( this.getVersion()!=null && castOther.getVersion()!=null && this.getVersion().equals(castOther.getVersion()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getName() == null ? 0 : this.getName().hashCode() );
         result = 37 * result + ( getVersion() == null ? 0 : this.getVersion().hashCode() );
         return result;
   }   

}