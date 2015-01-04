package org.jncc.action.seat;


import java.util.List;

import org.jncc.base.cause.resultCause;
import org.jncc.base.seat.ESeat;
import org.jncc.base.seat.ESeatId;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionSupport;

public class SeatAction extends ActionSupport {
	/**
	 * 
	 */

	private static final long serialVersionUID = 1L;
	private resultCause resultCause = new resultCause();
	

	private ESeat eseat;
	private List<ESeat> esList;
	

	public ESeat getEseat() {
		return eseat;
	}

	public void setEseat(ESeat eseat) {
		this.eseat = eseat;
	}

	public String getSeatStatus(){
		try {
			dbSession.init();
			String hql="select ESeat es where es.id.zone='"+eseat.getId().getZone();
			hql = hql +"' and es.id.date='" + eseat.getId().getDate();
			hql = hql +"' and es.id.hour>="+Integer.parseInt(eseat.getBegintime());
			hql = hql +" and es.id.hour<="+Integer.parseInt(eseat.getEndtime());
			esList = dbSession.select(hql);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (esList.size() > 0) {
			String unSeatIds = "";
			for(int i=0;i<esList.size();i++){
				unSeatIds = unSeatIds+esList.get(i).getId().getSeatid()+"|";
			}
			resultCause.setCause("400",unSeatIds);
		} else {
			resultCause.setCause("200", "恭喜，预定成功");
		}
		return "SEAT_GETSTATUS_SUCCESS";
	}
	
	public String bookSeat(){
		int beginHour= Integer.parseInt(eseat.getBegintime());
		int endHour = Integer.parseInt(eseat.getEndtime());
		ESeat es = new ESeat();
		ESeatId esID = new ESeatId();
		esID.setDate(eseat.getId().getDate());
		esID.setZone(eseat.getId().getZone());
		esID.setSeatid(eseat.getId().getSeatid());
		es.setSeat(eseat.getSeat());
		try {
			dbSession.init();
			for(int i=beginHour;i<endHour;i++){
				esID.setHour(i);
				es.setId(esID);
				dbSession.replaceInsert(es);
				dbSession.flush();
			}
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
			resultCause.setCause("503","存在异常");
		}
		resultCause.setCause("200", "恭喜，预定成功");
		return "SEAT_BOOKING_SUCCESS";
	}
	
	public List<ESeat> getEsList() {
		return esList;
	}

	public void setEsList(List<ESeat> esList) {
		this.esList = esList;
	}
	public resultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(resultCause resultCause) {
		this.resultCause = resultCause;
	}

}
