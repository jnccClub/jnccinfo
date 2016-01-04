/*
 * $Id: FileUploadAction.java 1400220 2012-10-19 18:49:39Z jogep $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.jncc.action.software;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.jncc.base.cause.ResultCause;
import org.jncc.base.software.ESoftware;
import org.jncc.base.software.ESoftwareService;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Show case File Upload example's action. <code>FileUploadAction</code>
 */
public class SoftwareAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ResultCause resultCause;
	private List<ESoftware> eswList;
	private ESoftware esw;
	private JSONArray swJsonArray;
	private JSONObject swResult;// 返回的json
	private String queryfiled;
	private String queryfiledVal;
	private ESoftware formerEsw;
	
	public ESoftware getFormerEsw() {
		return formerEsw;
	}

	public void setFormerEsw(ESoftware formerEsw) {
		this.formerEsw = formerEsw;
	}

	public JSONArray getSwJsonArray() {
		return swJsonArray;
	}

	public void setSwJsonArray(JSONArray swJsonArray) {
		this.swJsonArray = swJsonArray;
	}

	public ESoftware getEsw() {
		return esw;
	}

	public void setEsw(ESoftware esw) {
		this.esw = esw;
	}

	public String getSW() {
		if (ESoftware.getEswList() == null
				|| ESoftware.getEswList().size() != 0) {
			ESoftwareService.updateEswList(ESoftwareService.getEswList());
		}
		Set<String> swSet = new HashSet<String>();
		for (int i = 0; i < ESoftware.getEswList().size(); i++) {
			swSet.add(ESoftware.getEswList().get(i).getId().getName());
		}
		swJsonArray = new JSONArray();
		for (String swStr : swSet) {
			JSONObject obj = new JSONObject();
			obj.put("id", swStr);
			obj.put("text", swStr);
			swJsonArray.add(obj);
		}
		return "GET_SWJSON_SUCCESS";
	}

	public String loaddata()
	{
		swResult = JSONObject.fromObject(ESoftwareService.toMapObject(queryfiled,queryfiledVal));
		return "LOAD_SW_SUCCESS";
	}
	
//	public String refresh() {
//		ESoftwareService.updateEswList(ESoftwareService.getEswList());
//		this.setEswList(ESoftware.getEswList());
//		resultCause = new resultCause();
//		resultCause.setCause("200", "upload successfully!");
//		return "REFRESH_SW_SUCCESS";
//	}

	public String addRecord() {
		try {
			if(formerEsw == null || formerEsw.getId().getName()==""){
				dbSession.delete(esw);
			}else{
				dbSession.delete(formerEsw);
			}
			dbSession.close();
			dbSession.insert(esw);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultCause = new ResultCause();
		resultCause.setCause("200", "恭喜您，添加成功！");
		
		//更新静态变量
		ESoftwareService.updateEswList(ESoftwareService.getEswList());
		return "ADD_SW_SUCCESS";
	}

	public String deleteRecord() {
		try {
			dbSession.delete(esw);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultCause = new ResultCause();
		resultCause.setCause("200", "恭喜您，删除成功！");
		
		//更新静态变量
		ESoftwareService.updateEswList(ESoftwareService.getEswList());
		return "DELETE_SW_SUCCESS";
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public ResultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(ResultCause resultCause) {
		this.resultCause = resultCause;
	}

	public List<ESoftware> getEswList() {
		return eswList;
	}

	public void setEswList(List<ESoftware> eswList) {
		this.eswList = eswList;
	}
	public JSONObject getSwResult() {
		return swResult;
	}

	public void setSwResult(JSONObject swResult) {
		this.swResult = swResult;
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
}
