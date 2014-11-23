package org.jncc.action.application;

import java.util.List;

import org.jncc.base.application.EApplication;
import org.jncc.base.arrangement.EArrangement;
import org.jncc.base.arrangement.EArrangementService;
import org.jncc.base.cause.resultCause;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionSupport;

public class ApplicationAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private resultCause resultCause = new resultCause();
	
	private EApplication ea;


	public String addRecord() {
		try {
			dbSession.delete(ea);
			dbSession.close(false);
			dbSession.insert(ea);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultCause = new resultCause();
		resultCause.setCause("200", "恭喜您，添加成功！");
		return "ADD_ZONE_SUCCESS";
	}
	
	
	public String deleteRecord() {
		try {
			dbSession.delete(ea);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultCause = new resultCause();
		resultCause.setCause("200", "恭喜您，删除成功！");
		return "DELETE_ZONE_SUCCESS";
	}
	
	
	public resultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(resultCause resultCause) {
		this.resultCause = resultCause;
	}
	public EApplication getEa() {
		return ea;
	}


	public void setEa(EApplication ea) {
		this.ea = ea;
	}
}
