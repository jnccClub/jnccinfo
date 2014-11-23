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
package org.jncc.action.zone;

import java.util.List;

import org.jncc.base.cause.resultCause;
import org.jncc.base.software.ESoftware;
import org.jncc.base.software.ESoftwareService;
import org.jncc.base.zone.EZone;
import org.jncc.base.zone.EZoneService;
import org.jncc.persistence.dbSession;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Show case File Upload example's action. <code>FileUploadAction</code>
 */
public class ZoneAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private resultCause resultCause;
	private List<EZone> zoneList;
	private EZone zoneCfg;


	public String refresh() {
		this.setZoneList(EZoneService.getEZoneList());
		resultCause = new resultCause();
		resultCause.setCause("200", "upload successfully!");
		return "REFRESH_ZONE_SUCCESS";
	}

	public String addRecord() {
		try {
			dbSession.delete(zoneCfg);
			dbSession.close(false);
			dbSession.insert(zoneCfg);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultCause = new resultCause();
		resultCause.setCause("200", "恭喜您，添加成功！");
		return "ADD_ZONE_SUCCESS";
	}
	
	
	public String deleteRecord() {
		try {
			dbSession.delete(zoneCfg);
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultCause = new resultCause();
		resultCause.setCause("200", "恭喜您，删除成功！");
		return "DELETE_ZONE_SUCCESS";
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

	public List<EZone> getZoneList() {
		return zoneList;
	}

	public void setZoneList(List<EZone> zoneList) {
		this.zoneList = zoneList;
	}

	public EZone getZoneCfg() {
		return zoneCfg;
	}

	public void setZoneCfg(EZone zoneCfg) {
		this.zoneCfg = zoneCfg;
	}


}
