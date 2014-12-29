function queryMFDetailInof (){
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
		url : 'res_queryCourseArr.action',
		//queryParams: {queryDate:"2014-12-27"},
		//sortName : 'fld_CTIME',
		//sortOrder : 'asc',
		remoteSort : false,
		// idField : 'fld_CNO',
		singleSelect : true,// 是否单选
		pagination : true,// 分页控件
		rownumbers : true,// 行号
		/*frozenColumns : [ [ {
			field : '',
			checkbox : false
		} ] ],
		/*
		 * toolbar : [ { text : '添加', iconCls : 'icon-add', handler : function() {
		 * newUser(); } }, '-', { text : '修改', iconCls : 'icon-edit', handler :
		 * function() { editUser(); } }, '-', { text : '删除', iconCls :
		 * 'icon-remove', handler : function() { destroyUser(); } } ],
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


$(function(){
	$('input[name="query_floor"]').combobox({
		//data : drows,
		url:'res_getallfloor.action',
		valueField : 'id',
		textField : 'text',
		onLoadSuccess : function() { //加载完成后,设置选中第一项
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
	return '<a href="#" onclick="queryDetailDate(\'' + row.fld_C3 + '\',\''
			+ row.fld_C1 + '\')">' + val + '</a>';
}

function queryDetailDate(createTime, appId) {
	// alert("appId is:" + appId + ";createTime is:" + createTime);
	window.open('detailInfo.jsp?appID="' + appId + '"&createTime="'
			+ createTime + '"');

}
function menuHandler(item){
	alert('<p>Click Item: '+item.name+'</p>');
}

function doSearch(value,name){
	//alert('You input: ' + value+'('+name+')');
	var queryParams = $('#tbl_query_data').datagrid('options').queryParams;  
    queryParams.queryfloor = $("input[name='query_floor']").val();
    queryParams.queryDate = $("input[name='queryDatepick']").val();
    queryParams.queryfiled = name;
    queryParams.queryfiledVal = value;
    $('#tbl_query_data').datagrid('options').queryParams=queryParams;        
    $("#tbl_query_data").datagrid('reload');
	
}