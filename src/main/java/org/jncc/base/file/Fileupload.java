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
package org.jncc.base.file;

import java.io.File;
import java.util.Date;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.jncc.base.software.ESoftware;
import org.jncc.base.software.ESoftwareService;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Show case File Upload example's action. <code>FileUploadAction</code>
 */
public class Fileupload{

	private File upload;
	private String fileName;
	private String savepath;

	public boolean file_Upload() throws Exception {

		if (null != upload) {
			File saveFile = new File(getPath(), fileName.substring(fileName
					.indexOf("/") + 1));
			// upload.renameTo(saveFile);
			if (saveFile.exists()) {
				saveFile.setWritable(true, false);
				saveFile.delete();
			}
			 FileUtils.moveFile(upload, saveFile);
			// m_filecontent.put("Product1",fileread.readFileByLines(getPath()+"\\"+fileName));
		}
		return true;
	}
	
	public static File file_Upload(String contextPath,File fileupload,String origFilename){
		String path = ServletActionContext.getServletContext().getRealPath(contextPath);
		File file = new File(path); // 判断文件夹是否存在,如果不存在则创建文件夹
		if (!file.exists()) {
			file.mkdir();
		}
		try {
			if (fileupload != null) {
				// String fileName = java.util.UUID.randomUUID().toString(); //
				// 采用时间+UUID的方式随即命名
				java.text.DateFormat formatStr = new java.text.SimpleDateFormat("yyMMddhhmmss");
				String fileName = formatStr.format(new Date());
				fileName = fileName	+ origFilename;
				File saveFile = new File(path, fileName);
				
				// upload.renameTo(saveFile);
				if (saveFile.exists()) {
					saveFile.setWritable(true, false);
					saveFile.delete();
				}
				FileUtils.moveFile(fileupload, saveFile);
				return saveFile;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	// since we are using <s:file name="upload" ... /> the content type will be
	// obtained through getter/setter of <file-tag-name>ContentType

	// since we are using <s:file name="upload" ... /> the File itself will be
	// obtained through getter/setter of <file-tag-name>
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getSavepath() {
		return savepath;
	}

	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}

	public String getPath() {
		String filePath = "";
		String absolutePath = ServletActionContext.getServletContext()
				.getRealPath(""); //
		filePath = absolutePath;
		return filePath;
	}

}
