function disCourse() {
	renewMainId('#MF_COURSE_CFG');
	tbl_course_load();
}

function tbl_course_load() {
	$('#tbl_course').datagrid({
		title : '计算中心课程信息',
		iconCls : 'icon-man',// 图标
		width : '1000',
		height : '800',
		nowrap : false,
		striped : true,
		border : true,
		collapsible : false,// 是否可折叠的
		//fit : true,// 自动大小
		url : 'comAction/comRes_getCourseModPnl.action',
		queryParams: {queryfiled:"ALL"},
		// sortName : 'fld_CTIME',
		// sortOrder : 'asc',
		remoteSort : false,
		// idField : 'fld_CNO',
		singleSelect : true,// 是否单选
		pagination : true,// 分页控件
		rownumbers : true,// 行号
		frozenColumns : [ [ {
			field : '',
			checkbox : true
		} ] ],
		onLoadSuccess : function(data) {
			// $('#tbl_query_data').datagrid('selectAll');
		}
	});
	// 设置分页控件
	var p = $('#tbl_course').datagrid('getPager');
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
	$('#tbl_course').resize();
}

function doSearchCourse(value, name) {
	// alert('You input: ' + value+'('+name+')');
	var queryParams = $('#tbl_course').datagrid('options').queryParams;
	queryParams.queryfiled = name;
	queryParams.queryfiledVal = value;
	$('#tbl_course').datagrid('options').queryParams = queryParams;
	$("#tbl_course").datagrid('reload');
}

function courseUpload(param) {
	if ($("#circular").is(":hidden")) {
		$("#circular").show();
	}
	var fileId = $("input[name='coursefileUp']").attr('id');

	$.ajaxFileUpload({
		url : 'file_uploadCourse.action',
		secureuri : false,
		fileElementId : fileId,
		beforeSend : function() {
		},
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				alert("课程信息上传成功！");
				$("#tbl_course").datagrid('reload');
				$('#CApp_CName').combogrid("grid").datagrid("reload");
			}
		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
			// Handle the complete event
			$("#circular").hide();
		}
	});
	return false;
}

function add_course() {
	isAddcourse = true;
	$('#dlg_course').dialog('open').dialog('setTitle', '新增课程信息');
	$('#fm_course').form('clear');
}

function edit_course() {
	isAddcourse = false;
	var row = $('#tbl_course').datagrid('getSelected');
	if (row) {
		$('#dlg_course').dialog('open').dialog('setTitle', '修改课程信息');
		$('#fm_course').form('load', row);

	} else {
		alert("请选择一条记录进行编辑！");
	}

}

function save_course() {
	$("#circular").show();
	var param = [ {
		name : "ec.serial",
		value : $("input[name='fld_C_SERIAL']").val()
	}, {
		name : "ec.name",
		value : $("input[name='fld_C_NAME']").val()
	}, {
		name : "ec.teacher",
		value : $("input[name='fld_C_TEACHER']").val()
	}, {
		name : "ec.teacherNo",
		value : $("input[name='fld_C_TNO']").val()
	}, {
		name : "ec.classNo",
		value : $("input[name='fld_C_CNO']").val()
	}, {
		name : "ec.seats",
		value : $("input[name='fld_C_CNUM']").val()
	}, {
		name : "ec.comment",
		value : $("input[name='fld_C_COMMENT']").val()
	} ];
	if (!isAddcourse) {
		var row = $('#tbl_course').datagrid('getSelected');
		if (row) {
			param.push({
				name : "formerEc.serial",
				value : row.fld_C_SERIAL
			});
		}
	}
	$.ajax({
		url : 'course_save.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				// $("#btncourseRefresh").trigger("click");
				if (data.resultCode == "200") {
					alert("课程信息保存成功");
					$("#tbl_course").datagrid('reload');
					$('#dlg_course').dialog('close');
				} else {
					alert("对不起，您没有权限！");
				}
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

function destroy_course(param) {
	var row = $('#tbl_course').datagrid('getSelected');
	var param = [];
	if (row) {
		param.push({
			name : "ec.serial",
			value : row.fld_C_SERIAL
		});
	} else {
		alert("请选择一条有效记录！");
		return;
	}
	$.messager.confirm('确认信息', '请确认是否此条记录?', function(r) {
		if (r) {
			if ($("#circular").is(":hidden")) {
				$("#circular").show();
			}
			$.ajax({
				url : 'course_delete.action',
				type : 'post',
				data : param,
				dataType : 'json',
				success : function(data, status) {

					if (status == "success") {
						if (data.resultCode == "200") {
							alert("课程信息删除成功");
							$("#tbl_course").datagrid('reload');
						} else {
							alert("对不起，您没有权限！");
						}
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
	});
}

$(function() {
	isAddcourse = true;
	$("#btnCourseUpload").click(function() {
		var filename = $("#courseFile").val();
		filename = filename.substring(filename.lastIndexOf('\\') + 1);
		var param = {
			"fileFileName" : filename,
		};
		return courseUpload(param);
	});

	$('#courseFile').filebox({
		buttonText : '课程学生名单',
		buttonAlign : 'left',
	});
});
