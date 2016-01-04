package org.jncc.base.application;

// default package

import java.sql.Timestamp;

import org.jncc.base.arrangement.EArrangementId;

/**
 * EApplication entity. @author MyEclipse Persistence Tools
 */

public class EApplication implements java.io.Serializable {

	// Fields

	private EApplicationID id;

	private String createUser;
	private String approver;
	private String curentHandler;
	private String courseName;
	private String className;
	private Integer seats;
	private String os;
	private String software;
	private Integer booktype;
	private String status;
	private Timestamp approvedtime;
	private String approveremark;
	private String comment;
	private String contactNo;
	private String email;
	private String dateInfo;
	private String beginTime;
	private String endTime;
	private String floor;
	private String zone;

	// Constructors

	/** default constructor */
	public EApplication() {
	}

	/** minimal constructor */
	public EApplication(EApplicationID id) {
		this.id = id;
	}

	
	/** full constructor */
	public EApplication(EApplicationID id, String createUser,
			String approver, String curentHandler, String courseName,
			String className, Integer seats, String os, String software,
			Integer booktype, Timestamp createdatetime, String status,
			Timestamp approvedtime, String approveremark, String comment,
			String contactNo, String email) {
		this.id = id;
		this.createUser = createUser;
		this.approver = approver;
		this.curentHandler = curentHandler;
		this.courseName = courseName;
		this.className = className;
		this.seats = seats;
		this.os = os;
		this.software = software;
		this.booktype = booktype;
		this.status = status;
		this.approvedtime = approvedtime;
		this.approveremark = approveremark;
		this.comment = comment;
		this.contactNo = contactNo;
		this.email = email;
	}

	// Property accessors
	public EApplicationID getId() {
		return id;
	}

	public void setId(EApplicationID id) {
		this.id = id;
	}

	public String getCreateUser() {
		return this.createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getApprover() {
		return this.approver;
	}

	public void setApprover(String approver) {
		this.approver = approver;
	}

	public String getCurentHandler() {
		return this.curentHandler;
	}

	public void setCurentHandler(String curentHandler) {
		this.curentHandler = curentHandler;
	}

	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Integer getSeats() {
		return this.seats;
	}

	public void setSeats(Integer seats) {
		this.seats = seats;
	}

	public String getOs() {
		return this.os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getSoftware() {
		return this.software;
	}

	public void setSoftware(String software) {
		this.software = software;
	}

	public Integer getBooktype() {
		return this.booktype;
	}

	public void setBooktype(Integer booktype) {
		this.booktype = booktype;
	}


	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getApprovedtime() {
		return this.approvedtime;
	}

	public void setApprovedtime(Timestamp approvedtime) {
		this.approvedtime = approvedtime;
	}

	public String getApproveremark() {
		return this.approveremark;
	}

	public void setApproveremark(String approveremark) {
		this.approveremark = approveremark;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getContactNo() {
		return this.contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDateInfo() {
		return dateInfo;
	}

	public void setDateInfo(String dateInfo) {
		this.dateInfo = dateInfo;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
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

}