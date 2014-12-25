package org.jncc.base.application;

// default package

import java.sql.Timestamp;

import org.jncc.base.arrangement.EArrangementId;

/**
 * EApplication entity. @author MyEclipse Persistence Tools
 */

public class EApplicationID implements java.io.Serializable {

	// Fields

	   private String applicationId;
		private Timestamp createdatetime;
		
		
	     public String getApplicationId() {
		return applicationId;
	}


	public void setApplicationId(String applicationId) {
		this.applicationId = applicationId;
	}


	public Timestamp getCreatedatetime() {
		return createdatetime;
	}


	public void setCreatedatetime(Timestamp createdatetime) {
		this.createdatetime = createdatetime;
	}

	


	    // Constructors

	    /** default constructor */
	    public EApplicationID() {
	    }

	    
	    /** full constructor */
	    public EApplicationID(String applicationId, Timestamp createdatetime) {
	        this.applicationId = applicationId;
	        this.createdatetime = createdatetime;
	    }

	   
	    // Property accessors




	   public boolean equals(Object other) {
	         if ( (this == other ) ) return true;
			 if ( (other == null ) ) return false;
			 if ( !(other instanceof EArrangementId) ) return false;
			 EArrangementId castOther = ( EArrangementId ) other; 
	         
			 return true;
	   }
	   
	   public int hashCode() {
	         int result = 17;
	         
	         result = 37 * result + ( getApplicationId() == null ? 0 : this.getApplicationId().hashCode() );
	         result = 37 * result + ( getCreatedatetime() == null ? 0 : this.getCreatedatetime().hashCode() );
	         return result;
	   }   

}