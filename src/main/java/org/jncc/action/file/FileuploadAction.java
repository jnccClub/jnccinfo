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
package org.jncc.action.file;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.jncc.base.cause.resultCause;
import org.jncc.base.course.ECourseService;
import org.jncc.base.file.Fileupload;
import org.jncc.base.software.ESoftware;
import org.jncc.base.software.ESoftwareService;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Show case File Upload example's action. <code>FileUploadAction</code>
 */
public class FileuploadAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File fileupload; // 文件
	private String fileFileName; // 文件名
	private String filePath; // 文件路径
	private String sw_option;
	private File coursefileUp;

	public File getCoursefileUp() {
		return coursefileUp;
	}

	public void setCoursefileUp(File coursefileUp) {
		this.coursefileUp = coursefileUp;
	}

	private List<ESoftware> eswList;

	public List<ESoftware> getEswList() {
		return eswList;
	}

	public void setEswList(List<ESoftware> eswList) {
		this.eswList = eswList;
	}

	public String getSw_option() {
		return sw_option;
	}

	public void setSw_option(String sw_option) {
		this.sw_option = sw_option;
	}

	private resultCause resultCause;

	public String uploadSWList() {
		File saveFile = Fileupload.file_Upload("/uploadSWList",
				this.getFileupload(), this.getFileFileName());
		if (saveFile != null) {
			if (sw_option.startsWith("9")) {
				ESoftwareService.addSWFromXLS(saveFile.getAbsolutePath());
				this.setEswList(ESoftware.getEswList());
			}
		}
		resultCause = new resultCause();
		resultCause.setCause("200", "upload successfully!");
		return "UPLOAD_SW_SUCCESS";
	}

	public String uploadCourse() {
		File saveFile = Fileupload.file_Upload("/uploadCourse",
				this.getCoursefileUp(), this.getFileFileName());
		if (saveFile != null) {
			ECourseService.addCourseFromXLS(saveFile.getAbsolutePath());
		}
		resultCause = new resultCause();
		resultCause.setCause("200", "upload successfully!");
		return "UPLOAD_COURSE_SUCCESS";

	}

	public static boolean refreshSWList() {

		return true;
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

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public File getFileupload() {
		return fileupload;
	}

	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}

	public String getPath() {
		String filePath = "";
		String absolutePath = ServletActionContext.getServletContext()
				.getRealPath(""); //
		filePath = absolutePath;
		return filePath;
	}

}
