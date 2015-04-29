package org.jncc.persistence;

import java.util.Properties;

import org.jncc.base.application.EApplication;
import org.jncc.base.qq.QQSend;
import org.jncc.base.user.UserInfo;

public class MsgSendThread extends Thread {
	private EApplication ea;
	private UserInfo us;
	private Properties p;
	private boolean isAudit = false;

	private String qq;
	private String qqContent;
	private String mEmail;
	private String mSubject;
	private String mContent;

	public MsgSendThread(EApplication ea, UserInfo us) {
		this.ea = ea;
		this.us = us;
		this.p = UtilTool.getProperties();
		this.isAudit = false;
		start();
	}

	public MsgSendThread(String qq, String qqContent, String mEmail,
			String mSubject, String mContent) {
		this.qq = qq;
		this.qqContent = qqContent;
		this.mEmail = mEmail;
		this.mSubject = mSubject;
		this.mContent = mContent;

		this.isAudit = true;
		start();
	}

	@Override
	public void run() {
		if (isAudit) {
			sendAuditMsg(qq, qqContent, mEmail, mSubject, mContent);
		} else {
			sendMsg(ea, us, p);
		}
	}

	public boolean sendMsg(EApplication ea, UserInfo us, Properties p) {
		String content = "欢迎使用计算中心预约系统，您的申请已成功提交！";
		content = content + "课程名称: " + ea.getCourseName() + ";";
		content = content + "创建人: " + ea.getCreateUser();
		String mEmail = UtilTool.getProperty("ADMIN_EMAIL", p);
		if (us != null && UtilTool.IsValid(us.getEmail())) {
			mEmail = us.getEmail();
			QQSend.sendQQ(us.getQq(), content);
		}
		String mContent = UtilTool.getProperty("MAIL_CONTENT", p);
		mContent = mContent + "课程信息如下：<br>";
		mContent = mContent + "课程名称: " + ea.getCourseName() + ";";
		mContent = mContent + "创建人: " + ea.getCreateUser();
		String mSubject = UtilTool.getProperty("SUBJECT_APPLY");
		Mail.sendMail(mEmail, mSubject, mContent);
		return true;
	}

	public boolean sendAuditMsg(String qq, String qqContent, String mEmail,
			String mSubject, String mContent) {
		QQSend.sendQQ(qq, qqContent);
		Mail.sendMail(mEmail, mSubject, mContent);
		return true;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
