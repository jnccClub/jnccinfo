function queryMFWeekInfo() {

	renewMainId('#MF_WEEKINFO');
	var today = new Date();
	var semester = $("#termSelect").val();
	var shoolBeginDate = new Date(semester.replace(/-/g,   "/"));
	
	var curWeekCount = getCurWeek(shoolBeginDate,today);
	
	var optionHtml = "";
	optionHtml = optionHtml+"<option  selected='selected' value='"+1+"'>第"+1+"周</option>";
	for (var i=2;i<=20;i++)	{
		optionHtml = optionHtml+"<option value='"+i+"'>第"+i+"周</option>";
	}
	$("#courseInfo_week").html(optionHtml);
	
	$("#courseInfo_week option").each(function(i) {
		if (i == curWeekCount) {
			$(this).attr("selected", true);
		}
	});
	initTable4Week();
}

function getCourseSelectedDate() {
	var semester = $("#termSelect").val();
	var curWeek = $('#courseInfo_week').val();
	var beginWeekDate = getCurDate(semester, curWeek);
	return beginWeekDate.FormatHPF("yyyy-MM-dd");
}

function reloadTable4Week() {
	var beginWeekDate = getCourseSelectedDate();
	var queryParams = $('#tbl_query_week').datagrid('options').queryParams;
	queryParams.beginWeekDate = beginWeekDate;
	$('#tbl_query_week').datagrid('options').queryParams = queryParams;
	$("#tbl_query_week").datagrid('reload');
}

function initTable4Week() {
	var beginWeekDate = getCourseSelectedDate();
	$('#tbl_query_week').datagrid({
		title : '每周课程表',
		iconCls : 'icon-book',// 图标
//		height : '2500',
		width : 'auto',
		nowrap : false,
		striped : true,
		border : true,
		collapsible : true,// 是否可折叠的
		fit : true,// 自动大小
		url : 'comAction/comRes_queryWeekArr.action',
		queryParams : {
			"beginWeekDate" : beginWeekDate
		},
//		sortName : 'fld_WEEK',
//		sortOrder : 'asc',
		remoteSort : false,
//		singleSelect : true,// 是否单选
		pagination : true,// 分页控件
		rownumbers : true,// 行号
//		allowCellWrap:false,
//		nowrap:true,
		onLoadSuccess : function(data) {
		}
			,
//		rowStyler : function(index, row) {
//			return 'font:33';
//		}
	});
	// 设置分页控件
	var p = $('#tbl_query_week').datagrid('getPager');
	$(p).pagination({
		pageSize : 10,// 每页显示的记录条数，默认为10
		pageList : [ 5, 10, 15 ],// 可以设置每页记录条数的列表
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
	});
	 $('#tbl_query_week').resize();
}

function queryMFDetailInfo() {
	renewMainId('#MF_Query');
	$('#tbl_query_data').datagrid({
		title : '课程信息',
		iconCls : 'icon-edit',// 图标
		width : '1000',
		height : 'auto',
		nowrap : false,
		striped : true,
		border : true,
		collapsible : false,// 是否可折叠的
		fit : true,// 自动大小
		url : 'comAction/comRes_queryCourseArr.action',
		// queryParams: {queryDate:"2014-12-27"},
		sortName : 'fld_ZONE',
		sortOrder : 'asc',
		remoteSort : false,
		// idField : 'fld_CNO',
		singleSelect : true,// 是否单选
		pagination : true,// 分页控件
		rownumbers : true,// 行号
		/*
		 * frozenColumns : [ [ { field : '', checkbox : false } ] ], /* toolbar : [ {
		 * text : '添加', iconCls : 'icon-add', handler : function() { newUser(); } },
		 * '-', { text : '修改', iconCls : 'icon-edit', handler : function() {
		 * editUser(); } }, '-', { text : '删除', iconCls : 'icon-remove', handler :
		 * function() { destroyUser(); } } ],
		 */
		onLoadSuccess : function(data) {
			// $('#tbl_query_data').datagrid('selectAll');
		}
	});
	// 设置分页控件
	var p = $('#tbl_query_data').datagrid('getPager');
	$(p).pagination({
		pageSize : 10,// 每页显示的记录条数，默认为10
		pageList : [ 5, 10, 15 ],// 可以设置每页记录条数的列表
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
	/*
	 * onBeforeRefresh:function(){ $(this).pagination('loading'); alert('before
	 * refresh'); $(this).pagination('loaded'); }
	 */
	});
	$('#tbl_query_data').resize();
}

$(function() {
	$('input[name="query_floor"]').combobox({
		// data : drows,
		url : 'comAction/comRes_getallfloor.action',
		valueField : 'id',
		textField : 'text',
		onLoadSuccess : function() { // 加载完成后,设置选中第一项
			var val = $(this).combobox("getData");
			for ( var item in val[0]) {
				if (item == "id") {
					$(this).combobox("select", val[0][item]);
				}
			}
		}
	});
});

function query_info() {
	var rows = $('#tbl_query_data').datagrid('getSelections');
	$('#query_dlg').dialog('open').dialog('setTitle', '审批申请');
	if (rows && (rows.length > 0)) {
		$('#query_dlg').dialog('open').dialog('setTitle', '审批申请');
	} else {
		alert("请至少选择一条记录！");
	}

}

function detailCInfo(val, row) {
	var cInfos = val.split("(");
	var courseName = "";
	var teacherName = "";
	if (cInfos.length >= 2) {
		courseName = cInfos[0];
		teacherName = cInfos[1];
		if (teacherName.length >= 2) {
			teacherName = teacherName.substr(0, teacherName.length - 1);
		}
	}
	return '<a href="#" onclick="queryDetailCInfo(\'' + courseName + '\',\''
			+ teacherName + '\')">' + val + '</a>';
}

function queryDetailCInfo(courseName, teacherName) {
	// alert("appId is:" + appId + ";createTime is:" + createTime);
	window.open('detailInfo.jsp?courseName="' + courseName + '"&teacherName="'
			+ teacherName + '"');
}
function menuHandler(item) {
	alert('<p>Click Item: ' + item.name + '</p>');
}

function doSearch(value, name) {
	// alert('You input: ' + value+'('+name+')');
	var queryParams = $('#tbl_query_data').datagrid('options').queryParams;
	queryParams.queryfloor = $("input[name='query_floor']").val();
	queryParams.queryDate = $("input[name='queryDatepick']").val();
	queryParams.queryfiled = name;
	queryParams.queryfiledVal = value;
	$('#tbl_query_data').datagrid('options').queryParams = queryParams;
	$("#tbl_query_data").datagrid('reload');

}