package org.jncc.action.seat;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.jncc.base.cause.ResultCause;
import org.jncc.base.seat.ESeat;
import org.jncc.base.seat.ESeatId;
import org.jncc.base.user.UserInfo;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SeatAction extends ActionSupport {
	/**
	 * 
	 */

	private static final long serialVersionUID = 1L;
	private ResultCause resultCause = new ResultCause();

	private ESeat eseat;
	private List<ESeat> esList;

	public ESeat getEseat() {
		return eseat;
	}

	public void setEseat(ESeat eseat) {
		this.eseat = eseat;
	}

	public String getSeatStatus() {
		try {
			dbSession.init();
			String hql = "from ESeat es where es.id.zone=? and es.id.date=? and es.id.begintime<? and es.id.endtime>?";
			Object[] params = new Object[] {eseat.getId().getZone(), eseat.getId().getDate(),eseat.getId().getEndtime(),eseat.getId().getBegintime()};
			esList = dbSession.getQuery(hql, params);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (esList.size() > 0) {
			String unSeatIds = "";
			for (int i = 0; i < esList.size(); i++) {
				unSeatIds = unSeatIds + esList.get(i).getId().getSeatid() + "|";
			}
			resultCause.setCause("400", unSeatIds);
		} else {
			resultCause.setCause("200", "恭喜，预定成功");
		}
		return "SEAT_GETSTATUS_SUCCESS";
	}

	public String bookSeat() {
		Map session = ActionContext.getContext().getSession();
		UserInfo us = (UserInfo) session.get("USERINFO");
		if(us == null || us.getUsername().equals("")){
			resultCause.setCause("503", "存在异常");
		}else{
			int beginHour = eseat.getId().getBegintime();
			int endHour = eseat.getId().getEndtime();
			ESeat es = new ESeat();
			ESeatId esID = new ESeatId();
			String bookDate = eseat.getId().getDate();
			Date dt = new Date();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			if (bookDate == null || bookDate.equals("")) {
				bookDate = fmt.format(dt);
			}
			//获取当前时间作为创建时间
			Timestamp d = new Timestamp(System.currentTimeMillis());
			es.setCreattime(d);
			esID.setDate(bookDate);
			esID.setZone(eseat.getId().getZone());
			esID.setSeatid(eseat.getId().getSeatid());
			es.setSeat(eseat.getSeat());
			es.setUser(us.getUsername());
			try {
				dbSession.init();
				if(beginHour<endHour){
					esID.setBegintime(beginHour);
					esID.setEndtime(endHour);
					es.setId(esID);
					dbSession.replaceInsert(es);
					dbSession.flush();
					dbSession.close();
				}else{
					resultCause.setCause("503", "存在异常");
				}

			} catch (Exception e) {
				e.printStackTrace();
				resultCause.setCause("503", "存在异常");
			}
			resultCause.setCause("200", "恭喜，预定成功");
		}
		return "SEAT_BOOKING_SUCCESS";
	}

	public List<ESeat> getEsList() {
		return esList;
	}

	public void setEsList(List<ESeat> esList) {
		this.esList = esList;
	}

	public ResultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(ResultCause resultCause) {
		this.resultCause = resultCause;
	}

}
