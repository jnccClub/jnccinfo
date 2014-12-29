function disCourse() {
	renewMainId('#MF_COURSE_CFG');
	tbl_course_load();
}

function tbl_course_load(){
	$('#tbl_course').datagrid({
		title : '计算中心课程信息',
		iconCls : 'icon-man',// 图标
		width : '1000',
		height : 'auto',
		nowrap : false,
		striped : true,
		border : true,
		collapsible : false,// 是否可折叠的
		fit : true,// 自动大小
		url : 'res_getallCourse.action',
		//queryParams: {queryDate:"2014-12-27"},
		//sortName : 'fld_CTIME',
		//sortOrder : 'asc',
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

function doSearchC(value,name){
	//alert('You input: ' + value+'('+name+')');
	var queryParams = $('#tbl_course').datagrid('options').queryParams;  
    queryParams.queryfiled = name;
    queryParams.queryfiledVal = value;
    $('#tbl_course').datagrid('options').queryParams=queryParams;        
    $("#tbl_course").datagrid('reload');
}

function courseUpload(param) {
	if($("#circular").is(":hidden")){
		$("#circular").show();
	}
	var fileId = $("input[name='coursefileUp']").attr('id');
	
	$.ajaxFileUpload({
		url : 'file_uploadCourse.action',
		secureuri : false,
		fileElementId : fileId,
		beforeSend: function(){},
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				alert("课程信息上传成功！");
				$("#tbl_course").datagrid('reload');
			}
		},
		error : function(data, status, e) {
			alert(e);
		},complete: function(){
			// Handle the complete event
			$("#circular").hide();
		}
	});
	return false;
}

$(function() {
	$("#btnCourseUpload").click(function() {
		var filename = $("#courseFile").val();
		filename = filename.substring(filename.lastIndexOf('\\') + 1);
		var param = {
			"fileFileName" : filename,
		};
		return courseUpload(param);
	});

	$('#courseFile').filebox({ 
		 buttonText: '课程学生名单', 
		 buttonAlign: 'left',
		});
});


