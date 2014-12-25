<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="DIV_BODY_AUDIT" style="display:none">
	<h2>待审批申请</h2>
	<p>请认真查看申请，点击课程编号可查看具体日期、机房及课程</p>

	<table id="list_data" cellspacing="0" cellpadding="0"
		class="easyui-datagrid" toolbar="#toolbar">
		<thead>
			<tr>
				<th data-options="field:'fld_CNO',width:180,formatter:detailFormat">课程编号</th>
				<th field="fld_CUSR" width="55">创建人</th>
				<th field="fld_COURSENAME" width="55">课程名称</th>
				<th field="fld_CLASSNAME" width="55">班级名称</th>
				<th field="fld_BTYPE" width="55">预定类型</th>
				<th field="fld_SEATS" width="55">座位</th>
				<th field="fld_CTIME" width="180">创建时间</th>
				<th field="fld_OSYSTEM" width="100">操作系统</th>
				<th field="fld_SWARE" width="100">软件信息</th>
				<th field="fld_PHONE" width="55">联系电话</th>
				<th field="fld_EMAIL" width="55">电子邮箱</th>
				<th field="fld_STATUS" width="55">当前状态</th>
				<th data-options="field:'fld_DETAIL',width:55">具体信息</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="audit_App()">审批申请</a>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width:350px;height:380px;padding:10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm_audit">
			<div class="fitem">
				<label>审批意见:</label><select name="isApproved"><option
					value="0">驳回</option>
				<option value="1" selected="selected">批准</option>
			</select>
			</div>
			<div class="fitem">
				<label>详细描述:</label>
			<textarea class="input-xlarge"  rows="4"
				placeholder="符合使用规则，各项必备条件充分！" name="approveComment">符合使用规则，各项必备条件充分！</textarea>
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="approve_application()" style="width:90px">确认</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')"
			style="width:90px">取消</a>
	</div>

</div>