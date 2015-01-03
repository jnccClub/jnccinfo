function genAppInfos() {
	$('#list_data').datagrid({
		title : '课程申请信息',
		iconCls : 'icon-edit',// 图标
		width : '1000',
		height : 'auto',
		nowrap : false,
		striped : true,
		border : true,
		collapsible : false,// 是否可折叠的
		fit : true,// 自动大小
		url : 'res_list.action',
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
		/*
		 * toolbar : [ { text : '添加', iconCls : 'icon-add', handler : function() {
		 * newUser(); } }, '-', { text : '修改', iconCls : 'icon-edit', handler :
		 * function() { editUser(); } }, '-', { text : '删除', iconCls :
		 * 'icon-remove', handler : function() { destroyUser(); } } ],
		 */
		onLoadSuccess : function(data) {
			// $('#list_data').datagrid('selectAll');
		}
	});
	// 设置分页控件
	var p = $('#list_data').datagrid('getPager');
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

	$('#list_data').resize();
}

function newUser() {
	$('#dlg').dialog('open').dialog('setTitle', '新申请');
	$('#fm').form('clear');
	url = 'save_user.php';
}
function editUser() {
	var row = $('#list_data').datagrid('getSelected');
	if (row) {
		$('#dlg').dialog('open').dialog('setTitle', '修改申请');
		$('#fm_audit').form('load', row);
		url = 'update_user.php?id=' + row.id;
	}
}

function audit_App() {
	var rows = $('#list_data').datagrid('getSelections');
	if (rows && (rows.length > 0)) {
		$('#dlg').dialog('open').dialog('setTitle', '审批申请');
	} else {
		alert("请至少选择一条记录！");
	}

}

function approve_application() {
	$('#dlg').dialog('close');
	var ids = "";
	var rows = $('#list_data').datagrid('getSelections');
	var recordsLen = rows.length;
	var createUsers = "";
	for (var i = 0; i < rows.length; i++) {
		ids = ids + rows[i].fld_CNO + "|" + rows[i].fld_CTIME + ",";
		createUsers = createUsers +rows[i].fld_CUSR+"|";
	}
	var param = [ {
		name : "isApproved",
		value : $("select[name='isApproved']").val()
	}, {
		name : "approveComment",
		value : $("textarea[name='approveComment']").val()
	}, {
		name : "eaIDs",
		value : ids
	} ];
	if ($("#circular").is(":hidden")) {
		$("#circular").show();
	}
	$.ajax({
		url : 'app_auditRecord.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				if ($("select[name='isApproved']").val() == 1) {
					alert("成功审批" + recordsLen + "条申请！");
				} else {
					alert("成功驳回" + recordsLen + "条申请！");
				}
				$('#list_data').datagrid('reload');
			}

		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
			$("#circular").hide();
		}
	});
}

function saveUser() {
	$('#fm').form('submit', {
		url : url,
		onSubmit : function() {
			return $(this).form('validate');
		},
		success : function(result) {
			var result = eval('(' + result + ')');
			if (result.errorMsg) {
				$.messager.show({
					title : 'Error',
					msg : result.errorMsg
				});
			} else {
				$('#dlg').dialog('close'); // close the dialog
				$('#dg').datagrid('reload'); // reload the user data
			}
		}
	});
}
function destroyUser() {
	var row = $('#dg').datagrid('getSelected');
	if (row) {
		$.messager.confirm('确认信息', '请确认是否此条记录?', function(r) {
			if (r) {
				$.post('destroy_user.php', {
					id : row.id
				}, function(result) {
					if (result.success) {
						$('#dg').datagrid('reload'); // reload the user data
					} else {
						$.messager.show({ // show error message
							title : 'Error',
							msg : result.errorMsg
						});
					}
				}, 'json');
			}
		});
	}
}

function detailFormat(val, row) {
	return '<a href="#" onclick="queryDetailDate(\'' + row.fld_CTIME + '\',\''
			+ row.fld_CNO + '\')">' + row.fld_CNO + '</a>';
}

function queryDetailDate(createTime, appId) {
	// alert("appId is:" + appId + ";createTime is:" + createTime);
	window.open('detailInfo.jsp?appID="' + appId + '"&createTime="'
			+ createTime + '"');

}