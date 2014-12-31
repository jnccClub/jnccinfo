package org.jncc.action.bbs;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.jncc.base.bbs.EBbs;
import org.jncc.base.cause.resultCause;
import org.jncc.persistence.UtilTool;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionSupport;

public class bbsAction extends ActionSupport {
	/**
	 * 
	 */
	private EBbs ebs;
	private resultCause result;
	private List<EBbs> bbsList;

	public String getAllbbs() {
		try {
			String hql = "from EBbs ebs order by ebs.ctime desc";
			int maxRow = 20;
			dbSession.init();
			bbsList = dbSession.getAllbbs(hql,maxRow);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "GET_BBS_SUCCESS";
	}

	public String addBBS() {
		Timestamp d = new Timestamp(System.currentTimeMillis());
		HttpServletRequest request = ServletActionContext.getRequest();
		String ipAddr = UtilTool.getIpAddr(request );
		ebs.setCtime(d);
		ebs.setIp(ipAddr);
		try {
			dbSession.insert(ebs);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ADD_BBS_SUCCESS";
	}

	public EBbs getEbs() {
		return ebs;
	}

	public void setEbs(EBbs ebs) {
		this.ebs = ebs;
	}

	public resultCause getResult() {
		return result;
	}

	public void setResult(resultCause result) {
		this.result = result;
	}

	public List<EBbs> getBbsList() {
		return bbsList;
	}

	public void setBbsList(List<EBbs> bbsList) {
		this.bbsList = bbsList;
	}
	public static void main(String[] args) {
		bbsAction bs = new bbsAction();
//		EBbs ebs = new EBbs();
//		ebs.setRemark("11111");
//		bs.setEbs(ebs);
//		bs.addBBS();
		String a  = bs.getAllbbs();
		
	}
}
