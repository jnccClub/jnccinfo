package org.jncc.base.software;
// default package

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * ESoftware entity. @author MyEclipse Persistence Tools
 */

public class ESoftware  implements java.io.Serializable {


    // Fields    

     private ESoftwareId id;
     private String createdate;
     public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	private String os;
     private String operator;
     private String comment;
     
     private static List<ESoftware> eswList;


    // Constructors

	
	

	public static List<ESoftware> getEswList() {
		return eswList;
	}

	public static void setEswList(List<ESoftware> eswList) {
		ESoftware.eswList = eswList;
	}

	/** default constructor */
    public ESoftware() {
    }

	/** minimal constructor */
    public ESoftware(ESoftwareId id) {
        this.id = id;
    }
    
    /** full constructor */
    public ESoftware(ESoftwareId id, String createdate, String os, String operator, String comment) {
        this.id = id;
        this.createdate = createdate;
        this.os = os;
        this.operator = operator;
        this.comment = comment;
    }

   
    // Property accessors

    public ESoftwareId getId() {
        return this.id;
    }
    
    public void setId(ESoftwareId id) {
        this.id = id;
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