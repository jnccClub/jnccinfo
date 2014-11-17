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

import java.io.File;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.jncc.base.cause.resultCause;
import org.jncc.base.software.ESoftware;
import org.jncc.base.software.ESoftwareService;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Show case File Upload example's action. <code>FileUploadAction</code>
 */
public class SoftwareAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private resultCause resultCause;
	private List<ESoftware> eswList;


	public String refresh() {
		ESoftwareService.updateEswList(ESoftwareService.getEswList());
		this.setEswList(ESoftware.getEswList());
		resultCause = new resultCause();
		resultCause.setCause("200", "upload successfully!");
		return "REFRESH_SW_SUCCESS";
	}
	
	

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public resultCause getResultCause() {
		return resultCause;
	}

	public void setResultCause(resultCause resultCause) {
		this.resultCause = resultCause;
	}
	
	
	public List<ESoftware> getEswList() {
		return eswList;
	}


	public void setEswList(List<ESoftware> eswList) {
		this.eswList = eswList;
	}


}
