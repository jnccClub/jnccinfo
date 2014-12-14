package org.jncc.action.resource;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class resouceAction extends ActionSupport {
	/**
	 * 
	 */

	private JSONObject result;// 返回的json
	private String rows;// 每页显示的记录数
	private String page;// 当前第几页

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

	/**
	 * 查询应用系统
	 * 
	 * @return
	 */
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

//		List<TblApp> list = appService.findByPageApp(start, number);// 每页的数据，放入list
//		Map<String, Object> jsonMap = new HashMap<String, Object>();// 定义map
//		jsonMap.put("total", appService.getCountApp());// total键 存放总记录数，必须的
//		jsonMap.put("rows", list);// rows键 存放每页记录 list
//		result = JSONObject.fromObject(jsonMap);// 格式化result 一定要是JSONObject

		// result = JSONArray.fromObject(jsonMap);
		return "RES_LIST_SUCCESS";
	}
}
