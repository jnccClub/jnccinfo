package org.jncc.base.zone;
// default package



/**
 * EZone entity. @author MyEclipse Persistence Tools
 */

public class EZone  implements java.io.Serializable {
    // Fields    

     private String zone;
     private String floor;
     private Integer seats;
     private Boolean mic;
     private Boolean projector;
     private Boolean teachermanage;
     private String comment;


    // Constructors
	/** default constructor */
    public EZone() {
    }

	/** minimal constructor */
    public EZone(String zone) {
        this.zone = zone;
    }
    
    /** full constructor */
    public EZone(String zone, String floor, Integer seats, Boolean mic, Boolean projector, Boolean teachermanage, String comment) {
        this.zone = zone;
        this.floor = floor;
        this.seats = seats;
        this.mic = mic;
        this.projector = projector;
        this.teachermanage = teachermanage;
        this.comment = comment;
    }

   
    // Property accessors

    public String getZone() {
        return this.zone;
    }
    
    public void setZone(String zone) {
        this.zone = zone;
    }

    public String getFloor() {
        return this.floor;
    }
    
    public void setFloor(String floor) {
        this.floor = floor;
    }

    public Integer getSeats() {
        return this.seats;
    }
    
    public void setSeats(Integer seats) {
        this.seats = seats;
    }

    public Boolean getMic() {
        return this.mic;
    }
    
    public void setMic(Boolean mic) {
        this.mic = mic;
    }

    public Boolean getProjector() {
        return this.projector;
    }
    
    public void setProjector(Boolean projector) {
        this.projector = projector;
    }

    public Boolean getTeachermanage() {
        return this.teachermanage;
    }
    
    public void setTeachermanage(Boolean teachermanage) {
        this.teachermanage = teachermanage;
    }
    public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	//注意这里重写了equals方法  
    @Override  
    public boolean equals(Object obj){  
        if(obj == null){  
            return false;  
        }else {           
                if(this.getClass() == obj.getClass()){  
                    EZone u = (EZone) obj;  
                    if(this.getZone().equals(u.getZone())){  
                        return true;  
                    }else{  
                        return false;  
                    }  
                  
            }else{  
                return false;  
            }  
        }             
    }  

}