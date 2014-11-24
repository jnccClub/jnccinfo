package org.jncc.action.application;

import org.jncc.base.application.EApplication;
import org.jncc.base.application.EApplicationService;
import org.jncc.base.arrangement.EArrangement;
import org.jncc.base.arrangement.EArrangementId;
import org.jncc.base.arrangement.EArrangementService;
import org.jncc.base.cause.resultCause;
import org.jncc.base.coursemap.ECourseMapService;
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
		String dInfo = ea.getDateInfo();
		String[] dInfos = dInfo.split("\\s+");
		resultCause = new resultCause();
		int beginCourse = ECourseMapService.getBeginCourse(ea.getBeginTime());
		int endCourse = ECourseMapService.getEndCourse(ea.getEndTime());
		EArrangement eArr = new EArrangement();
		EArrangementId eArrId = new EArrangementId();
		eArrId.setZone("7F");
		eArr.setComment("test");
		eArr.setAppId(ea.getApplicationId());
		for(String bookDate : dInfos){  
		    System.out.println(bookDate);
		    eArrId.setDate(bookDate);
		    EArrangementService.queryFreezone(bookDate, beginCourse, endCourse);
		    for(int i = beginCourse;i<=endCourse;i++){
		    	eArrId.setCourse(i);
		    	eArr.setId(eArrId);
		    	EArrangementService.addArrangement(eArr);
		    }
		}
		if(EApplicationService.addApplication(ea)){
			resultCause.setCause("200", "恭喜，添加成功");
		}else{
			resultCause.setCause("503", "添加失败");
		}
		
		return "ADD_APP_SUCCESS";
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
		return "DELETE_APP_SUCCESS";
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
