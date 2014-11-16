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

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.jncc.base.cause.resultCause;
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



	public String getSw_option() {
		return sw_option;
	}


	public void setSw_option(String sw_option) {
		this.sw_option = sw_option;
	}

	private resultCause resultcasue;
	


	public String uploadSWList() {
		String path = ServletActionContext.getServletContext().getRealPath(
				"/uploadSWList");
		File file = new File(path); // 判断文件夹是否存在,如果不存在则创建文件夹
		if (!file.exists()) {
			file.mkdir();
		}
		try {
			if (this.fileupload != null) {

				// String fileName = java.util.UUID.randomUUID().toString(); //
				// 采用时间+UUID的方式随即命名
				java.text.DateFormat formatStr = new java.text.SimpleDateFormat("yyMMddhhmmss");
				String fileName = formatStr.format(new Date());
				File saveFile = new File(path, fileName	+ this.getFileFileName());
				
				// upload.renameTo(saveFile);
				if (saveFile.exists()) {
					saveFile.setWritable(true, false);
					saveFile.delete();
				}
				FileUtils.moveFile(fileupload, saveFile);
				if(sw_option.startsWith("9"))
				{
					ESoftwareService.addSWFromXLS(saveFile.getAbsolutePath());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		resultcasue = new resultCause();
		resultcasue.setCause("200", "upload successfully!");
		return "UPLOAD_SUCCESS";
	}
	
	
	public static boolean refreshSWList() {
		
		return true;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public resultCause getResultcasue() {
		return resultcasue;
	}

	public void setResultcasue(resultCause resultcasue) {
		this.resultcasue = resultcasue;
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
