<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<link href="media/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="media/css/select2_metro.css" />
<link rel="stylesheet" href="media/css/DT_bootstrap.css" />


<div id="MF_WEEKINFO" style="display: none">
	<div class="portlet box red">
		<div class="portlet-title">
			<div class="caption">
				<b id="week_name_tbl">当前周详细情况</b>
			</div>
		</div>
		<div class="portlet-body">
			<form class="form-inline">
				<div class="radio">
					<label class="control-label">校历学期：</label> <select id="termSelect">
						<option value='2014-09-01'>2014~2015秋学期</option>
						<option selected='selected' value='2015-03-02'>2014~2015春学期</option>
						<option value='2015-08-31'>2015~2016秋学期</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
						class="control-label">请选择学期周</label> <select
						name="applicationInfo.beginDate" id="courseInfo_week"></select> <a
						href="javascript:void(0)" class="btn btn-primary btn-large"
						onclick="reloadTable4Week()">查看课表</a>
				</div>
			</form>

		</div>
	</div>
	<div style="height:800px">
	<table id="tbl_query_week" class="easyui-datagrid" style="overflow:hidden">
		<thead>
			<tr>
				<th data-options="field:'fld_WEEK',width:45">星 期</th>
				<th data-options="field:'fld_C1',width:130,formatter:detailCInfo">08:00-10:00</th>
				<th data-options="field:'fld_C2',width:130,formatter:detailCInfo">10:00-12:00</th>
				<th data-options="field:'fld_C3',width:90,formatter:detailCInfo">12:00-14:00</th>
				<th data-options="field:'fld_C4',width:180,formatter:detailCInfo">14:00-16:00</th>
				<th data-options="field:'fld_C5',width:180,formatter:detailCInfo">16:00-18:00</th>
				<th data-options="field:'fld_C6',width:200,formatter:detailCInfo">18:00-20:00</th>
				<th data-options="field:'fld_C7',width:190,formatter:detailCInfo">20:00-22:00</th>
			</tr>
		</thead>
	</table>
	</div>

</div>
