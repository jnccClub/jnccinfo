<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="MF_PROGRESS" style="display: none" class="span9">
	<div class="portlet box red">
		<div class="portlet-title">
			<div class="caption">
				<b>我的申请</b>
			</div>
		</div>
		<div class="portlet-body">
			<table id="person_app_progress_tab" cellspacing="0" cellpadding="0"
				class="easyui-datagrid" toolbar="#PERSON_APP_TOOL_DIV">
				<thead>
					<tr>
						<th
							data-options="field:'fld_CNO',width:180,formatter:detailFormat">课程编号</th>
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
		</div>
		<div>说明：有疑问请及时咨询管理员</div>
	</div>
</div>
<div id="PERSON_APP_TOOL_DIV">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="nuaa-icon-edit" plain="false" onclick="cancelApp()">取消申请</a>
</div>
