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
	function displaySW(eswList) {
		var tbodyContent = "";
		$(eswList).each(
				function(i, esw) {
					tbodyContent = tbodyContent+"<tr><td>" + esw.id.name + "<td></td>"
									+ esw.id.zone + "<td></td>" + esw.createdate
									+ "<td></td>" + esw.os + "<td></td>"
									+ esw.operator + "<td></td>" + esw.comment
									+ "</td></tr>";
				});
				$("#swList_table tbody").html(tbodyContent);
	}

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
				if (status == "success") {
					displaySW(data);
				}

			},
			error : function(data, status, e) {
				alert(e);
			}
		});
		return false;
	}

	$(function() {
		$("#buttonUpload").click(function() {
			var filename = $("#fileupload").val();
			filename = filename.substring(filename.lastIndexOf('\\') + 1);
			var sw_option = $("input[name='sw_option']").val();
			var param = {
				"fileFileName" : filename,
				"sw_option" : sw_option
			};
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
				id="optionsRadios1" value="901" checked>
				更新&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio" name="sw_option" value="902">增加&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio" name="sw_option" value="903">覆盖&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio" name="sw_option" value="904">删除
			</label>
		</div>
	</div>

	<h2>软件列表</h2>

	<table id='swList_table' cellspacing="0" cellpadding="0"
		class="table table-bordered table-striped">
			<tr>
				<th><font class="resizeDivClass" id='dragBlock1'>&nbsp;</font>
					软件名称</th>
				<th><font class="resizeDivClass" id='dragBlock2'>&nbsp;</font>
					区域</th>
				<th><font class="resizeDivClass" id='dragBlock3'>&nbsp;</font>
					安装日期</th>
				<th><font class="resizeDivClass" id='dragBlock4'>&nbsp;</font>
					操作系统</th>
				<th><font class="resizeDivClass" id='dragBlock5'>&nbsp;</font>
					维护人</th>
				<th><font class="resizeDivClass" id='dragBlock6'>&nbsp;</font>
					备注</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>

	<script>
		//获取所有拖动块引用
		var dragBlock1 = document.getElementById('dragBlock1');
		var dragBlock2 = document.getElementById('dragBlock2');
		var dragBlock3 = document.getElementById('dragBlock3');
		var dragBlock4 = document.getElementById('dragBlock4');
		var dragBlock5 = document.getElementById('dragBlock5');
		var dragBlock6 = document.getElementById('dragBlock6');
		var swListtable = document.getElementById('swList_table');

		//设置表格拖动点
		function changeWidth(obj) {
			//在拖动点按下鼠标时，记录拖动点的横坐标
			obj.onmousedown = function(e) {
				e = e || event;
				//this指向obj对象。获取鼠标当前的X轴坐标
				this.mouseDownX = e.clientX;
				//获取font的父元素td的宽度
				this.pareneTdW = this.parentNode.offsetWidth;
				//表格初始宽度
				this.pareneTableW = swListtable.offsetWidth;
				//IE下设置鼠标点捕获，防止鼠标焦点被打断。FF下无须捕获
				if (this.setCapture)
					this.setCapture();

				//鼠标移动时触发的事件，计算拖动了多少偏移量
				document.onmousemove = function(e) {
					e = e || event;
					if (!obj.mouseDownX)
						return;
					//newWidth的值为td宽度加鼠标当前的X轴坐标再减去mouseDownX
					//表示现在比原先移动了多少偏移量
					var newWidth = obj.pareneTdW + e.clientX - obj.mouseDownX;

					//最小宽度为60象素，不可在移动TD
					if (newWidth < 60)
						return;
					//改变td的宽度
					obj.parentNode.style.width = newWidth + 'px';

					swListtable.style.width = obj.pareneTableW + e.clientX
							- obj.mouseDownX;

					//更新隐藏样式
					if (obj.id == 'dragBlock5')
						(document.styleSheets[0].rules || document.styleSheets[0].cssRules)[0].style.width = newWidth
								+ 'px';
				}
				//在拖动点松开鼠标时，还原拖动点的横坐标
				document.onmouseup = function(e) {
					e = e || event;
					//释放焦点捕获
					if (obj.releaseCapture)
						obj.releaseCapture();
					//设置拖动点X轴坐标为0，表示拖动停止中
					obj.mouseDownX = 0;
				}
			}
		}

		//调用拖动设置函数
		changeWidth(dragBlock1);
		changeWidth(dragBlock2);
		changeWidth(dragBlock3);
		changeWidth(dragBlock4);
		changeWidth(dragBlock5);
		changeWidth(dragBlock6);
	</script>



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