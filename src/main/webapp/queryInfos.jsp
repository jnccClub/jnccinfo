<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="MF_Query" class="row" style="display:none" >
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
			<div data-options="name:'TNAME',iconCls:'icon-signal'">教师姓名</div>
			<div data-options="name:'CNAME',iconCls:'icon-star'">课程名称</div>
			<div data-options="name:'CLASS',iconCls:'icon-eye-open'">班 级</div>
			<div data-options="name:'SNO',iconCls:'icon-film'">学 号</div>
		</div>
	</div>

</div>