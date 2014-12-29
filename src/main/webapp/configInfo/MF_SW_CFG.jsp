<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.inline_div label,.inline_div input {
	display: inline-block;
	*display: inline;
	*zoom: 1
}
</style>


<div class="row" id="MF_SW_CFG" style="display:none">
	<div
		style="border-radius: 50px;TEXT-ALIGN: center;MARGIN-RIGHT: auto; MARGIN-LEFT: auto; background-color:#EEE;">
		<h1>-----------软件清单更新-----------</h1>
		<div>
			<label class="control-label">&nbsp;&nbsp;&nbsp;软件清单(<a
				href="configInfo/template.xls">软件清单模板.xls</a>)：&nbsp; <img
				id="loading" src="loading.gif" style="display:none;"> <input
				id="fileupload" type="text" size="45" name="fileupload">
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
	<br> <br>


	<table id="tbl_sw" cellspacing="0" cellpadding="0"
		class="easyui-datagrid" toolbar="#tbl_sw_toolbar">
		<thead>
			<tr>
				<th data-options="field:'fld_SWNAME',width:250">软件名称</th>
				<th data-options="field:'fld_SWZONE',width:150">区域</th>
				<th data-options="field:'fld_INTIME',width:150">安装日期</th>
				<th data-options="field:'fld_INOS',width:150">操作系统</th>
				<th data-options="field:'fld_MANAGER',width:150">维护人</th>
				<th data-options="field:'fld_SWCOMMENT',width:250">备注</th>
			</tr>
		</thead>
	</table>

	<div id="tbl_sw_toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="add_sw()">添加软件</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="edit_sw()">编辑软件</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroy_sw()">删除软件</a>
	</div>

	<div id="dlg_sw" class="easyui-dialog"
		style="width:380px;height:480px;padding:10px 20px" closed="true"
		buttons="#dlg_sw_buttons">
		<form id="fm_sw" method="post" novalidate>
			<div class="fitem">
				<label>软件信息:</label> <input name="fld_SWNAME"
					class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>区域:</label> <input name="fld_SWZONE" class="easyui-textbox"
					required="true" id="input_zoneID">
			</div>
			<div >
				<label sytle="float:left">安装日期:</label>
					<div id="swInTime" class="input-append date" style="z-index:9999">
			<input name="fld_INTIME"
					class="easyui-textbox" value="2015-01-01" required="true"></input> <span class="add-on">
				<i data-time-icon="icon-time"></i>
			</span>
		</div>
					
					
				<label>操作系统:</label>
				<input name="fld_INOS" class="easyui-textbox" required="true">
				<label>维护人:</label>
				<input name="fld_MANAGER" class="easyui-textbox" required="true">
				<label>备注:</label>
				<textarea class="input-xlarge"  rows="4" name="fld_SWCOMMENT">十六院申请的工程制图软件</textarea>
			</div>
		</form>
	</div>
	<div id="dlg_sw_buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="save_sw()" style="width:90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#dlg_sw').dialog('close')" style="width:90px">取消</a>
	</div>






	<h2>
		软件列表:&nbsp;&nbsp;
		<button class="btn btn-success" id="btnSWRefresh">刷 新</button>
		&nbsp;&nbsp;
		<button class="btn btn-success" id="btnSWSave">保 存</button>
	</h2>
	<form id="swaddForm"
		style="border: dashed 1px yellow;border-radius: 50px;MARGIN-RIGHT: auto; MARGIN-LEFT: auto; background-color:#EEE;">
		<br>
		<div class="inline_div">
			&nbsp;&nbsp;&nbsp;&nbsp; <label>软件名称：</label> <input type="text"
				placeholder="软件名称" name="esw.id.name" /> <label
				class="control-label">区域：</label> <input type="text"
				placeholder="区域" name="esw.id.zone" /> <label class="control-label">安装时间：</label>
			<input type="text" placeholder="安装时间" name="esw.createdate" /> <label
				class="control-label">负责人：</label> <input type="text"
				placeholder="负责人" name="esw.operator" />
		</div>
		<div class="inline_div">
			&nbsp;&nbsp;&nbsp;&nbsp; <label class="control-label">操作系统：</label> <input
				type="text" placeholder="操作系统" name="esw.os" /> <label
				class="control-label">备注：</label> <input type="text"
				placeholder="备注" name="esw.comment" />
		</div>
		<div style="TEXT-ALIGN: center;">
			<button class="btn " id="btnSWAdd">增加</button>
		</div>

	</form>

	<table id='swList_table' cellspacing="0" cellpadding="0"
		class="table table-bordered table-striped">
		<thead>
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
				<th><font class="resizeDivClass" id='dragBlock7'>&nbsp;</font>
					操作</th>
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
		var dragBlock6 = document.getElementById('dragBlock7');
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
					if (obj.id == 'dragBlock6')
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
		changeWidth(dragBlock7);
	</script>
</div>


<div class="contextMenu" id="myMenu1">
	<ul>
		<li id="save"><img src="image/contextMenu/disk.png" /> 保存</li>
		<li id="delete"><img src="image/contextMenu/cross.png" /> 删除</li>
	</ul>

</div>


