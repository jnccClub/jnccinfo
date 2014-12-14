function displaySW(eswList) {
	var tbodyContent = "";
	swList = new Array();
	var swOptions = "";
	$(eswList).each(
			function(i, esw) {
				tbodyContent = tbodyContent
						+ "<tr><td class='editable simpleInput'>" + esw.id.name
						+ "</td><td class='editable simpleInput'>"
						+ esw.id.zone
						+ "</td><td class='editable simpleInput'>"
						+ esw.createdate
						+ "</td><td class='editable simpleInput'>" + esw.os
						+ "</td><td class='editable simpleInput'>"
						+ esw.operator
						+ "</td><td class='editable simpleInput'>"
						+ esw.comment + "</td><td><button class='btn' onclick='btnDeleteSW(this)'>删除</button>"
						+ "&nbsp;&nbsp;<button class='btn' onclick='btnAddSW(this)' disabled='disabled'>保存</button>"+"</td></tr>";
						var existSW = 0;
						$(swList).each(function(key,value){
							if(value == esw.id.name){
								existSW = 1;
							}else{
								existSW = 0;
							}
								
						});
						// 如果不存在则增加到全局变量中
						if(existSW ==0){
							//swList.push(esw.id.name.toUpperCase());
							swList.push(esw);
				            swOptions = swOptions +"<option value='"+esw.id.name+"'>"+esw.id.name+"</option>" ;
						}
			});
	//$("select [name='applicationInfo.SW']").html(swOptions);

	
	$("#swList_table tbody").html(tbodyContent);
	EdTable.initBindGridEvent();
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
	$.ajaxFileUpload({
		url : 'file_uploadSWList.action',
		secureuri : false,
		fileElementId : 'fileupload',
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
});