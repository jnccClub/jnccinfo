<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<style>
.inline_div label, .inline_div input {
	display: inline-block;
	*display: inline;
	*zoom: 1
}
</style>
</head>
<body>
	<div class="row" id="MF_SW_CFG" style="display: none">
		<div
			style="border-radius: 50px; TEXT-ALIGN: center; MARGIN-RIGHT: auto; MARGIN-LEFT: auto; background-color: #EEE;">
			<h1>-----------软件清单更新-----------</h1>
			<div>
				<label class="control-label">&nbsp;&nbsp;&nbsp;软件清单(<a
					href="configInfo/template.xls">软件清单模板.xls</a>)：&nbsp; <img
					id="loading" src="loading.gif" style="display: none;"> <input
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
				iconCls="icon-add" plain="false" onclick="add_sw()">添加软件</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true" onclick="edit_sw()">编辑软件</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true" onclick="destroy_sw()">删除软件</a> <input
				class="easyui-searchbox"
				data-options="prompt:'Please Input Value',menu:'#sw_mm',searcher:doSearchSW"
				style="width: 500px"></input>
			<div id="sw_mm">
				<div data-options="name:'SNAME',iconCls:'icon-tip'">软件名称</div>
				<div data-options="name:'SZONE',iconCls:'icon-ok'">区域</div>
				<div data-options="name:'SMANAGER',iconCls:'icon-man'">负责人</div>
				<div data-options="name:'SOS',iconCls:'icon-save'">操作系统</div>
			</div>
		</div>

		<div id="dlg_sw" class="easyui-dialog"
			style="width: 380px; height: 480px; padding: 10px 20px" closed="true"
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
				<div>
					<label sytle="float:left">安装日期:</label>
					<div id="swInTime" class="input-append date" style="z-index: 9999">
						<input name="fld_INTIME" class="easyui-textbox" value="2015-01-01"
							required="true"></input> <span class="add-on"> <i
							data-time-icon="icon-time"></i>
						</span>
					</div>


					<label>操作系统:</label> <input name="fld_INOS" class="easyui-textbox"
						required="true"> <label>维护人:</label> <input
						name="fld_MANAGER" class="easyui-textbox" required="true">
					<label>备注:</label>
					<textarea class="input-xlarge" rows="4" name="fld_SWCOMMENT">十六院申请的工程制图软件</textarea>
				</div>
			</form>
		</div>
		<div id="dlg_sw_buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6"
				iconCls="icon-ok" onclick="save_sw()" style="width: 90px">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-cancel"
				onclick="javascript:$('#dlg_sw').dialog('close')"
				style="width: 90px">取消</a>
		</div>
	</div>
</body>
</html>
