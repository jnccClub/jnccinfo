package org.jncc.action.course;

import org.jncc.base.cause.ResultCause;
import org.jncc.base.course.ECourse;
import org.jncc.base.course.ECourseService;
import org.jncc.base.user.UserService;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionSupport;

public class courseAction extends ActionSupport {
	/**
	 * 
	 */

	public String save() {
		resultCause = new ResultCause();
		if (UserService.isSuperAdmin()) {
			try {
				if (formerEc == null || formerEc.getSerial() == "") {
					dbSession.delete(ec);
				} else {
					dbSession.delete(formerEc);
				}
				dbSession.close();
				dbSession.insert(ec);
				dbSession.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			resultCause.setCause("200", "恭喜您，添加成功！");
			// 更新静态变量
			ECourseService.updateEcList();
		} else {
			resultCause.setCause("403", "您没有权限！");
		}

		return "SAVE_COURSE_SUCCESS";
	}

	public String delete() {
		resultCause = new ResultCause();
		if (UserService.isSuperAdmin()) {
			try {
				dbSession.delete(ec);
				dbSession.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			resultCause.setCause("200", "恭喜您，删除成功！");
			// 更新静态变量
			ECourseService.updateEcList();
		} else {
			resultCause.setCause("403", "您没有权限！");
		}
		return "DELETE_COURSE_SUCCESS";
	}

	private ResultCause resultCause;

	public ResultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(ResultCause resultCause) {
		this.resultCause = resultCause;
	}

	public ECourse getEc() {
		return ec;
	}

	public void setEc(ECourse ec) {
		this.ec = ec;
	}

	public ECourse getFormerEc() {
		return formerEc;
	}

	public void setFormerEc(ECourse formerEc) {
		this.formerEc = formerEc;
	}

	private ECourse ec;
	private ECourse formerEc;

}
