package org.jncc.base.seat;
// default package



/**
 * ESeat entity. @author MyEclipse Persistence Tools
 */

public class ESeat  implements java.io.Serializable {


    // Fields    

     private ESeatId id;
     private Integer seat;
     private String commnet;
     public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	private String begintime;
     private String endtime;


    // Constructors

    /** default constructor */
    public ESeat() {
    }

	/** minimal constructor */
    public ESeat(ESeatId id) {
        this.id = id;
    }
    
    /** full constructor */
    public ESeat(ESeatId id, Integer seat, String commnet) {
        this.id = id;
        this.seat = seat;
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

    public String getCommnet() {
        return this.commnet;
    }
    
    public void setCommnet(String commnet) {
        this.commnet = commnet;
    }
   








}