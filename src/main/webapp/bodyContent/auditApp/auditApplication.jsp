<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="MF_AUDIT" style="display: none" class="span9">
	<h2>待审批申请</h2>
	<p>请认真查看申请，点击课程编号可查看具体日期、机房及课程</p>
	<table id="list_data" cellspacing="0" cellpadding="0"
		class="easyui-datagrid" toolbar="#toolbar">
		<thead>
			<tr>
				<th data-options="field:'fld_CNO',width:180,formatter:detailFormat">课程编号</th>
				<th field="fld_CUSR" width="55">创建人</th>
				<th field="fld_COURSENAME" width="180">课程名称</th>
				<th field="fld_CLASSNAME" width="40">班级名称</th>
				<th field="fld_BTYPE" width="55">预定类型</th>
				<th field="fld_SEATS" width="55">座位</th>
				<th field="fld_CTIME" width="80">创建时间</th>
				<th field="fld_OSYSTEM" width="50">操作系统</th>
				<th field="fld_SWARE" width="50">软件信息</th>
				<th field="fld_PHONE" width="100">联系电话</th>
				<th field="fld_EMAIL" width="55">电子邮箱</th>
				<th field="fld_STATUS" width="55">当前状态</th>
				<th data-options="field:'fld_DETAIL',width:55">具体信息</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="nuaa-icon-edit" plain="false" onclick="audit_App()">申请处理</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="nuaa-icon-add" plain="false" onclick="audit_List(0)">未审批申请</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="nuaa-icon-save" plain="false" onclick="audit_List(1)">已审批申请</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="nuaa-icon-remove" plain="false" onclick="audit_List(99)">已驳回申请</a>
		<input class="easyui-searchbox"
			data-options="prompt:'请输入',menu:'#mm_application',searcher:doApplicationSearch"
			style="width:300px"></input>
		<div id="mm_application">
			<div data-options="name:'TEACHERNAME',iconCls:'icon-book'">教师姓名</div>
			<div data-options="name:'COURSENAME',iconCls:'icon-signal'">课程名称</div>
			<div data-options="name:'CREATETIME',iconCls:'icon-star'">创建时间</div>
		</div>	
			
			
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 350px; height: 380px; padding: 10px 20px" closed="true"
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
				<textarea class="input-xlarge" rows="4"
					placeholder="符合使用规则，各项必备条件充分！" name="approveComment">符合使用规则，各项必备条件充分！</textarea>
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="nuaa-icon-ok" onclick="approve_application()"
			style="width: 90px">确认</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" iconCls="nuaa-icon-cancel"
			onclick="javascript:$('#dlg').dialog('close')" style="width: 90px">取消</a>
	</div>
</div>