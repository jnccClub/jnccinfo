package org.jncc.base.software;

// default package

import java.util.ArrayList;
import java.util.List;

import org.jncc.persistence.UtilTool;

/**
 * ESoftware entity. @author MyEclipse Persistence Tools
 */

public class ESoftware implements java.io.Serializable {

	// Fields

	private ESoftwareId id;
	private String createdate;

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	private String os;
	private String operator;
	private String comment;
	private static List<ESoftware> eswList;

	// Constructors

	@SuppressWarnings("unchecked")
	public static List<ESoftware> getEswList(String queryfiled,String queryfiledVal) {
		if (eswList == null) {
			eswList = ESoftwareService.getEswList();
		}
		List<ESoftware> eswl = new ArrayList();
		if (UtilTool.IsValid(queryfiled) && UtilTool.IsValid(queryfiledVal)) {
			for (int i = 0; i < eswList.size(); i++) {
				ESoftware esw = eswList.get(i);
				switch (queryfiled) {
				case "SNAME":
					if ((eswList.get(i).getId().getName().indexOf(queryfiledVal)>-1)) {
						eswl.add(esw);
					}
					break;
				case "SZONE":
					if ((eswList.get(i).getId().getZone().indexOf(queryfiledVal)>-1)) {
						eswl.add(esw);
					}
					break;
				case "SMANAGER":
					if ((eswList.get(i).getOperator().indexOf(queryfiledVal)>-1)) {
						eswl.add(esw);
					}
					break;
				case "SOS":
					if (!(eswList.get(i).getOs().indexOf(queryfiledVal)>-1)) {
						eswl.add(esw);
					}
					break;
				default:
					break;
				}
			}
			return eswl;
		}
		return eswList;
	}
	
	public static List<ESoftware> getEswList() {
			eswList = getEswList(null,null);
		return eswList;
	}

	public static void setEswList(List<ESoftware> eswList) {
		ESoftware.eswList = eswList;
	}

	/** default constructor */
	public ESoftware() {
	}

	/** minimal constructor */
	public ESoftware(ESoftwareId id) {
		this.id = id;
	}

	/** full constructor */
	public ESoftware(ESoftwareId id, String createdate, String os,
			String operator, String comment) {
		this.id = id;
		this.createdate = createdate;
		this.os = os;
		this.operator = operator;
		this.comment = comment;
	}

	// Property accessors

	public ESoftwareId getId() {
		return this.id;
	}

	public void setId(ESoftwareId id) {
		this.id = id;
	}

	public String getOs() {
		return this.os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}