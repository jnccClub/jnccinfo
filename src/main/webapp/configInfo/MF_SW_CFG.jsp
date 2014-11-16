<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	function ajaxFileUpload(param) {
		//starting setting some animation when the ajax starts and completes

		$("#loading").ajaxStart(function() {
			$(this).show();
		}).ajaxComplete(function() {
			$(this).hide();
		});
		/*
		    prepareing ajax file upload
		    url: the url of script file handling the uploaded files
		                fileElementId: the file type of input element id and it will be the index of  $_FILES Array()
		    dataType: it support json, xml
		    secureuri:use secure protocol
		    success: call back function when the ajax complete
		    error: callback function when the ajax failed
		    
		 */
		$.ajaxFileUpload({
			url : 'file_uploadSWList.action',
			secureuri : false,
			fileElementId : 'fileupload',
			data : param,
			dataType : 'json',
			success : function(data, status) {
				if (typeof (data.error) != 'undefined') {
					if (data.error != '') {
						alert(data.error);
					} else {
						alert(data.msg);
					}
				}
			},
			error : function(data, status, e) {
				alert(e);
			}
		});
		return false;
	}

	$(function() {
		$("#buttonUpload").click(
				function() {
					var filename = $("#fileupload").val();
					filename = filename.substring(filename.lastIndexOf('\\') + 1);
					var sw_option = $("input[name='sw_option']").val();
					var param = {"fileFileName":filename,"sw_option":sw_option};
					return ajaxFileUpload(param);
				});
	});
</script>



<div class="row" id="MF_SW_CFG">
	<div
		style="border: dashed 1px blue;border-radius: 50px;TEXT-ALIGN: center;MARGIN-RIGHT: auto; MARGIN-LEFT: auto; background-color:#EEE;">
		<h1>-----------软件清单更新-----------</h1>
		<div>
			<label class="control-label">&nbsp;&nbsp;&nbsp;软件清单(<a
				href="configInfo/template.xls">软件清单模板.xls</a>)：&nbsp; <img
				id="loading" src="loading.gif" style="display:none;"> <input
				id="fileupload" type="file" size="45" name="fileupload">
				<button class="btn btn-success" id="buttonUpload">上 传</button>
			</label>

		</div>

		<div class="option-inline-radio">
			<label class="control-label">&nbsp;&nbsp;&nbsp;软件配置类型：&nbsp;</label>
			<label> <input type="radio" name="SW_option"
				id="optionsRadios1" value="901" checked> 更新&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio" name="sw_option" value="902">增加&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio" name="sw_option" value="903">覆盖&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio" name="sw_option" value="904">删除
			</label>
		</div>
	</div>

	<h2>软件列表</h2>
	<table class="table table-bordered table-striped">
		<thead>
			<tr class="sortTableHead">
				<th>课程名1称<i class="icon-folder-open"></i></th>
				<th>人数</th>
				<th>状态</th>
				<th>申请时间</th>
				<th>查看</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Nike.com Redesign</td>
				<td>Monsters Inc</td>
				<td>New Task</td>
				<td>4 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Nike.com Redesign</td>
				<td>Monsters Inc</td>
				<td>New Message</td>
				<td>5 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Nike.com Redesign</td>
				<td>Monsters Inc</td>
				<td>New Project</td>
				<td>5 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Twitter Server Consulting</td>
				<td>Bad Robot</td>
				<td>New Task</td>
				<td>6 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Childrens Book Illustration</td>
				<td>Evil Genius</td>
				<td>New Message</td>
				<td>9 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Twitter Server Consulting</td>
				<td>Bad Robot</td>
				<td>New Task</td>
				<td>16 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Twitter Server Consulting</td>
				<td>Bad Robot</td>
				<td>New Project</td>
				<td>16 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Twitter Server Proposal</td>
				<td>Bad Robot</td>
				<td>Completed Project</td>
				<td>20 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
		</tbody>
	</table>
</div>