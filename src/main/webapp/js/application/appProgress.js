function showAppProgress() {
	$('#person_app_progress_tab').datagrid({
		title : '我的申请',
		iconCls : 'icon-flag',// 图标
		width : '800',
		height : 'auto',
		nowrap : false,
		striped : true,
		border : true,
		collapsible : false,// 是否可折叠的
		fit : true,// 自动大小
		url : 'res_list.action?auditedType=1001',
		sortName : 'fld_CTIME',
		sortOrder : 'desc',
		remoteSort : false,
		// idField : 'fld_CNO',
		singleSelect : false,// 是否单选
		pagination : true,// 分页控件
		rownumbers : true,// 行号
		frozenColumns : [ [ {
			field : '',
			checkbox : true
		} ] ],
		onLoadSuccess : function(data) {
		}
	});
	// 设置分页控件
	var p = $('#person_app_progress_tab').datagrid('getPager');
	$(p).pagination({
		pageSize : 10,// 每页显示的记录条数，默认为10
		pageList : [ 5, 10, 15 ],// 可以设置每页记录条数的列表
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
	});

	$('#person_app_progress_tab').resize();
}

function cancelApp() {
	var ids = "";
	var createUsers = "";
	var rows = $('#person_app_progress_tab').datagrid('getSelections');
	if (!rows || (rows.length <= 0)) {
		alert("请至少选择一条记录！");
		return;
	}
	for (var i = 0; i < rows.length; i++) {
		ids = ids + rows[i].fld_CNO + "|" + rows[i].fld_CTIME + ",";
		createUsers = createUsers + rows[i].fld_CUSR + "|";
	}
	var param = [ {
		name : "isApproved",
		value : "0" //驳回
	}, {
		name : "approveComment",
		value : "用户自行取消"
	}, {
		name : "eaIDs",
		value : ids
	}, {
		name : "createUsers",
		value : createUsers
	} ];
	$.ajax({
		url : 'app_auditRecord.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				alert("成功取消" + rows.length + "条申请！");
				$('#person_app_progress_tab').datagrid('reload');
			}

		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
		}
	});

}
