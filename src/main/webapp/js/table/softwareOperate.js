function displaySW(eswList) {
	var tbodyContent = "";
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
						+ esw.comment + "</td></tr>";
			});
	$("#swList_table tbody").html(tbodyContent);
	EdTable.initBindGridEvent();
}

function ajaxFileUpload(param) {
	// starting setting some animation when the ajax starts and completes

	$("#loading").ajaxStart(function() {
		$(this).show();
	}).ajaxComplete(function() {
		$(this).hide();
	});
	/*
	 * prepareing ajax file upload url: the url of script file handling the
	 * uploaded files fileElementId: the file type of input element id and it
	 * will be the index of $_FILES Array() dataType: it support json, xml
	 * secureuri:use secure protocol success: call back function when the ajax
	 * complete error: callback function when the ajax failed
	 * 
	 */
	$.ajaxFileUpload({
		url : 'file_uploadSWList.action',
		secureuri : false,
		fileElementId : 'fileupload',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				displaySW(data);
			}

		},
		error : function(data, status, e) {
			alert(e);
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
		}
	});
}

function deleteSW(param) {
	var tt = param;
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