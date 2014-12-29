package org.jncc.action.resource;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.jncc.base.application.EApplicationService;
import org.jncc.base.arrangement.EArrangementService;
import org.jncc.base.arrangement.ZoneArrangement;
import org.jncc.base.zone.EZone;
import org.jncc.base.zone.EZoneService;

import com.opensymphony.xwork2.ActionSupport;

public class resouceAction extends ActionSupport {
	/**
	 * 
	 */
	private JSONObject result;// 返回的json

	private String rows;// 每页显示的记录数
	private String page;// 当前第几页
	private String appID; // 课程编号
	private String createTime; // 创建时间
	private String queryDate;
	private String queryfloor;
	private String queryfiled;
	private String queryfiledVal;
	private JSONArray resJsonArray;


	public JSONArray getResJsonArray() {
		return resJsonArray;
	}

	public void setResJsonArray(JSONArray resJsonArray) {
		this.resJsonArray = resJsonArray;
	}

	/**
	 * 查询应用系统
	 * 
	 * @return
	 */
	public String getallzone(){
		List<EZone> ezList = EZoneService.getEZoneList();
		resJsonArray = new JSONArray();
		for (int i = 0; i < ezList.size(); i++) {
			JSONObject obj = new JSONObject();
			String ezone = ezList.get(i).getZone();
			obj.put("id", ezone);
			obj.put("text", ezone);
			resJsonArray.add(obj);
		}
		return "RES_GETZONE_SUCCESS";
	}
	
	public String getallfloor() {

		List<EZone> ezList = EZoneService.getEZoneList();
		Set<String> floorSet = new HashSet<String>();
		for (int i = 0; i < ezList.size(); i++) {
			floorSet.add(ezList.get(i).getFloor());
		}
		resJsonArray = new JSONArray();
		JSONObject tmpobj = new JSONObject();
		tmpobj.put("id", "0");
		tmpobj.put("text", "全部");
		resJsonArray.add(tmpobj);
		for (String floorStr : floorSet) {
			JSONObject obj = new JSONObject();
			obj.put("id", floorStr);
			obj.put("text", floorStr + "楼");
			resJsonArray.add(obj);
		}
		return "RES_GETFLOOR_SUCCESS";
	}

	public String list() {
		System.out.println("---------------");
		// 当前页
		int intPage = Integer.parseInt((page == null || page == "0") ? "1"
				: page);
		// 每页显示条数
		int number = Integer.parseInt((rows == null || rows == "0") ? "10"
				: rows);
		// 每页的开始记录 第一页为1 第二页为number +1
		int start = (intPage - 1) * number;
		result = JSONObject.fromObject(EApplicationService.toMapObject());
		return "RES_LIST_SUCCESS";
	}

	public String queryDates() {
		result = JSONObject.fromObject(EArrangementService.toMapObject(appID,
				createTime));
		return "RES_QUEYRDATES_SUCCESS";
	}

	public String queryCourseArr() {
		result = JSONObject.fromObject(ZoneArrangement.toMapObject(queryDate,queryfloor,queryfiled,queryfiledVal));
		return "RES_QUERYCOURSEARR_SUCCESS";
	}

	public JSONObject getResult() {
		return result;
	}

	public void setResult(JSONObject result) {
		this.result = result;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getAppID() {
		return appID;
	}

	public void setAppID(String appID) {
		this.appID = trimQuotation(appID);
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = trimQuotation(createTime);
	}

	public String trimQuotation(String str) {
		String tmpStr = str;
		if (tmpStr.indexOf("\"") == 0) {
			tmpStr = tmpStr.substring(1);
		}
		if (tmpStr.indexOf("\"") == (tmpStr.length() - 1)) {
			tmpStr = tmpStr.substring(0, tmpStr.length() - 1);
		}
		return tmpStr;
	}	public String getQueryDate() {
		return queryDate;
	}

	public void setQueryDate(String queryDate) {
		this.queryDate = queryDate;
	}

	public String getQueryfiled() {
		return queryfiled;
	}

	public void setQueryfiled(String queryfiled) {
		this.queryfiled = queryfiled;
	}

	public String getQueryfiledVal() {
		return queryfiledVal;
	}

	public void setQueryfiledVal(String queryfiledVal) {
		this.queryfiledVal = queryfiledVal;
	}

	
	
	public String getQueryfloor() {
		return queryfloor;
	}

	public void setQueryfloor(String queryfloor) {
		this.queryfloor = queryfloor;
	}

}
