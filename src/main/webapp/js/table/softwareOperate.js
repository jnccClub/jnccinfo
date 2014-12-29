function displaySW() {
	renewMainId('#MF_SW_CFG');
	$('#swInTime').datetimepicker({
		format : 'yyyy-MM-dd',
		language : 'en',
		pickDate : true,
		pickTime : false,
		inputMask : true
	});
	tbl_sw_load();
	$('#input_zoneID').combobox({
		//data : drows,
		url:'res_getallzone.action',
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
}

function add_sw(){
	isAddSW = true;
	$('#dlg_sw').dialog('open').dialog('setTitle', '新增软件信息');
	$('#fm_sw').form('clear');
}

function edit_sw(){
	isAddSW = false;
	var row = $('#tbl_sw').datagrid('getSelected');
	if (row) {
		$('#dlg_sw').dialog('open').dialog('setTitle', '修改软件信息');
		$('#fm_sw').form('load', row);
		
	}else{
		alert("请选择一条记录进行编辑！");
	}
	
	
}

function save_sw(){
	$("#circular").show();
	var param = [{name:"esw.id.name",value:$("input[name='fld_SWNAME']").val()},{
		name:"esw.id.zone",value:$("input[name='fld_SWZONE']").val()},{
		name:"esw.createdate",value:$("input[name='fld_INTIME']").val()},{
		name:"esw.os",value:$("input[name='fld_INTIME']").val()},{
		name:"esw.operator",value:$("input[name='fld_MANAGER']").val()},{
		name:"esw.comment",value:$("input[name='fld_SWZONE']").val()}];
	if(!isAddSW){
		var row = $('#tbl_sw').datagrid('getSelected');
		if (row) {
			param.push({name:"formerEsw.id.name",value:row.fld_SWNAME});
			param.push({name:"formerEsw.id.zone",value:row.fld_SWZONE});
		}
	}
	$.ajax({
		url : 'sw_addRecord.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				//$("#btnSWRefresh").trigger("click");
				alert("软件信息增加成功");
			}
		},
		error : function(data, status, e) {
			alert(e);
		},complete: function(){
			$("#circular").hide();
		}
	});
}


function tbl_sw_load(){
	$('#tbl_sw').datagrid({
		title : '计算中心软件信息',
		iconCls : 'icon-man',// 图标
		width : '1000',
		height : 'auto',
		nowrap : false,
		striped : true,
		border : true,
		collapsible : false,// 是否可折叠的
		fit : true,// 自动大小
		url : 'sw_loaddata.action',
		queryParams: {queryDate:"2014-12-27"},
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
	var p = $('#tbl_sw').datagrid('getPager');
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
	$('#tbl_sw').resize();
}


function btnAddSW(t){
	
}

function btnDeleteSW(t){
	deleteSW(getRowSW(t.parentElement.parentElement.rowIndex));
}

function ajaxFileUpload(param) {
	// starting setting some animation when the ajax starts and completes

	/*
	 * prepareing ajax file upload url: the url of script file handling the
	 * uploaded files fileElementId: the file type of input element id and it
	 * will be the index of $_FILES Array() dataType: it support json, xml
	 * secureuri:use secure protocol success: call back function when the ajax
	 * complete error: callback function when the ajax failed
	 * 
	 */
	if($("#circular").is(":hidden")){
		$("#circular").show();
	}
	var fileId = $("input[name='fileupload']").attr('id');
	
	$.ajaxFileUpload({
		url : 'file_uploadSWList.action',
		secureuri : false,
		fileElementId : fileId,
		beforeSend: function(){},
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				displaySW(data);
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

function getRowSW(rowIndex) {
	var tbody = document.getElementById('swList_table');
	/*
	 * for(var i = 0;i<tbody.rows.length;i++){ for(var j= 0;j<tbody.rows[i].cells.length;j++)
	 * alert(tbody.rows[i].cells[j].innerHTML) //每一行 每个单元格的内容 }
	 */
	var param = [{name:"esw.id.name",value:tbody.rows[rowIndex].cells[0].innerHTML},
	             {name:"esw.id.zone" ,value:tbody.rows[rowIndex].cells[1].innerHTML},
	             {name:"esw.createdate",value:""},
	             {name:"esw.os" ,value: tbody.rows[rowIndex].cells[3].innerHTML},
	             {name:"esw.operator" ,value: tbody.rows[rowIndex].cells[4].innerHTML},
	             {name:"esw.comment" ,value: tbody.rows[rowIndex].cells[5].innerHTML}];
	return param;
}

function addSW(param) {
	if($("#circular").is(":hidden")){
		$("#circular").show();
	}
	$.ajax({
		url : 'sw_addRecord.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				$("#btnSWRefresh").trigger("click");
				alert("软件信息增加成功");
			}
		},
		error : function(data, status, e) {
			alert(e);
		},complete: function(){
			$("#circular").hide();
		}
	});
}

function deleteSW(param) {
	if($("#circular").is(":hidden")){
		$("#circular").show();
	}
	$.ajax({
		url : 'sw_deleteRecord.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				$("#btnSWRefresh").trigger("click");
				alert("软件信息删除成功");
			}
		},
		error : function(data, status, e) {
			alert(e);
		},complete: function(){
			$("#circular").hide();
		}
	});
}

$(function() {
	isAddSW = true;
	$("#buttonUpload").click(function() {
		var filename = $("#fileupload").val();
		filename = filename.substring(filename.lastIndexOf('\\') + 1);
		var sw_option = $("input[name='sw_option']").val();
		var param = {
			"fileFileName" : filename,
			"sw_option" : sw_option
		};
		return ajaxFileUpload(param);
	});

	$("#btnSWRefresh").click(function() {
		if($("#circular").is(":hidden")){
			$("#circular").show();
		}
		$.ajax({
			url : 'sw_refresh.action',
			type : 'post',
			data : '',
			dataType : 'json',
			success : function(data, status) {
				if (status == "success") {
					displaySW(data);
				}
			},
			error : function(data, status, e) {
				alert(e);
			},complete: function(){
				$("#circular").hide();
			}
		});
	});

	$("#btnSWAdd").click(function() {
		var param = $("#swaddForm").serializeArray();
		addSW(param);
		return false;
	});

	// 初始化表单内容！
	$("#btnSWRefresh").trigger("click");
	EdTable.initBindGridEvent();
	
	
	$('#fileupload').filebox({ 
		 buttonText: 'Choose File', 
		 buttonAlign: 'left',
		});
});