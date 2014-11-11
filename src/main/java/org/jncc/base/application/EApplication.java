package org.jncc.base.application;

import java.sql.Date;
import java.sql.Time;

public class EApplication {
	public String getApplicationID() {
		return applicationID;
	}

	public void setApplicationID(String applicationID) {
		this.applicationID = applicationID;
	}

	public String getApprover() {
		return approver;
	}

	public void setApprover(String approver) {
		this.approver = approver;
	}

	public String getCurentHandler() {
		return curentHandler;
	}

	public void setCurentHandler(String curentHandler) {
		this.curentHandler = curentHandler;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getSeats() {
		return seats;
	}

	public void setSeats(String seats) {
		this.seats = seats;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getBegintime() {
		return begintime;
	}

	public void setBegintime(Time begintime) {
		this.begintime = begintime;
	}

	public Time getEndtime() {
		return endtime;
	}

	public void setEndtime(Time endtime) {
		this.endtime = endtime;
	}

	public String getWeekday() {
		return weekday;
	}

	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}

	public String getCreatedatetime() {
		return createdatetime;
	}

	public void setCreatedatetime(String createdatetime) {
		this.createdatetime = createdatetime;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApproveremark() {
		return approveremark;
	}

	public void setApproveremark(String approveremark) {
		this.approveremark = approveremark;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getHours() {
		return hours;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

	private String applicationID;
	private String approver;
	private String curentHandler;
	private String courseName;
	private String seats;
	private Date date;
	private Date beginDate;
	private Date endDate;
	private int hours;
	private Time begintime;
	private Time endtime;
	private String weekday;
	private String createdatetime;
	private String floor;
	private String zone;
	private String status;
	private String approveremark;
	private String comment;
}
