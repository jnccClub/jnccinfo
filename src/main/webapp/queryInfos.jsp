<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="MF_Query" class="row">
	<h2>计算中心实验资源预约明细</h2>
	<p>通过点击课程名可以查看详细信息</p>
	<table id="tbl_query_data" cellspacing="0" cellpadding="0"
		class="easyui-datagrid" toolbar="#tbl_query_toolbar">
		<thead>
			<tr>
				<th data-options="field:'fld_ZONE',width:50">区域</th>
				<th data-options="field:'fld_C1',width:160,formatter:detailCInfo">08:00-10:00</th>
				<th data-options="field:'fld_C2',width:160,formatter:detailCInfo">10:00-12:00</th>
				<th data-options="field:'fld_C3',width:160,formatter:detailCInfo">12:00-14:00</th>
				<th data-options="field:'fld_C4',width:160,formatter:detailCInfo">14:00-16:00</th>
				<th data-options="field:'fld_C5',width:160,formatter:detailCInfo">16:00-18:00</th>
				<th data-options="field:'fld_C6',width:160,formatter:detailCInfo">18:00-20:00</th>
				<th data-options="field:'fld_C7',width:160,formatter:detailCInfo">20:00-22:00</th>
			</tr>
		</thead>
	</table>
	<div id="tbl_query_toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-lock" plain="true">日期</a> <input name="queryDatepick"
			onclick="MyCalendar.SetDate(this)" value="全部" /> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">楼层</a><input name="query_floor"></input>

		<input class="easyui-searchbox"
			data-options="prompt:'Please Input Value',menu:'#mm',searcher:doSearch"
			style="width:500px"></input>
		<div id="mm">
			<div data-options="name:'TNAME',iconCls:'icon-tip'">教师姓名</div>
			<div data-options="name:'CNAME',iconCls:'icon-ok'">课程名称</div>
			<div data-options="name:'CLASS',iconCls:'icon-reload'">班 级</div>
			<div data-options="name:'SNO',iconCls:'icon-save'">学 号</div>
		</div>
	</div>


	<div id="query_dlg" class="easyui-dialog"
		style="width:350px;height:380px;padding:10px 20px" closed="true"
		buttons="#dlg_query_buttons">
		<form id="fm_audit">
			<div class="fitem">
				<label>审批意见:</label><select name="testApprove"><option
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
	<br> <br> <br>
</div>