<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="MF_Query">
	<h2>待审批申请</h2>
	<p>请认真查看申请，点击课程编号可查看具体日期、机房及课程</p>

	<table id="tbl_query_data" cellspacing="0" cellpadding="0"
		class="easyui-datagrid" toolbar="#tbl_query_toolbar">
		<thead>
			<tr>
				<th data-options="field:'fld_ZONE',width:80">区域</th>
				<th data-options="field:'fld_C1',width:120,formatter:detailCInfo">08:00-10:00</th>
				<th data-options="field:'fld_C2',width:120,formatter:detailCInfo">10:00-12:00</th>
				<th data-options="field:'fld_C3',width:120,formatter:detailCInfo">12:00-14:00</th>
				<th data-options="field:'fld_C4',width:120,formatter:detailCInfo">14:00-16:00</th>
				<th data-options="field:'fld_C5',width:120,formatter:detailCInfo">16:00-18:00</th>
				<th data-options="field:'fld_C6',width:120,formatter:detailCInfo">18:00-20:00</th>
				<th data-options="field:'fld_C7',width:120,formatter:detailCInfo">20:00-22:00</th>
			</tr>
		</thead>
	</table>
	<div id="tbl_query_toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="query_info()">审批申请</a>
	</div>
	<div id="query_dlg" class="easyui-dialog"
		style="width:350px;height:380px;padding:10px 20px" closed="true"
		buttons="#dlg_query_buttons">
		<form id="fm_audit">
			<div class="fitem">
				<label>审批意见:</label><select name="isApproved"><option
						value="0">驳回</option>
					<option value="1" selected="selected">批准</option>
				</select>
			</div>
			<div class="fitem">
				<label>详细描述:</label>
				<textarea class="input-xlarge" rows="4"
					placeholder="符合使用规则，各项必备条件充分！" name="approveComment">符合使用规则，各项必备条件充分！</textarea>
			</div>
		</form>
	</div>
	<div id="dlg_query_buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="confirm_query()" style="width:90px">确认</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#query_dlg').dialog('close')"
			style="width:90px">取消</a>
	</div>
</div>