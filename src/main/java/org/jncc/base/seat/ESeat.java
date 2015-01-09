
package org.jncc.base.seat;

import java.sql.Timestamp;
// default package



/**
 * ESeat entity. @author MyEclipse Persistence Tools
 */

public class ESeat  implements java.io.Serializable {


    // Fields    

     private ESeatId id;
     private Timestamp creattime;
	private Integer seat;
     private String user;
     private String commnet;


    // Constructors

    /** default constructor */
    public ESeat() {
    }

    /** full constructor */
    public ESeat(ESeatId id, Timestamp creattime, Integer seat, String user, String commnet) {
        this.id = id;
        this.creattime = creattime;
        this.seat = seat;
        this.user = user;
        this.commnet = commnet;
    }

   
    // Property accessors

    public ESeatId getId() {
        return this.id;
    }
    
    public void setId(ESeatId id) {
        this.id = id;
    }


    public Integer getSeat() {
        return this.seat;
    }
    
    public void setSeat(Integer seat) {
        this.seat = seat;
    }

    public String getUser() {
        return this.user;
    }
    
    public void setUser(String user) {
        this.user = user;
    }

    public String getCommnet() {
        return this.commnet;
    }
    
    public void setCommnet(String commnet) {
        this.commnet = commnet;
    }
    
    public Timestamp getCreattime() {
		return creattime;
	}

	public void setCreattime(Timestamp creattime) {
		this.creattime = creattime;
	}
}