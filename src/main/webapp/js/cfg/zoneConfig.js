function displayZone(zoneList) {
	var tbodyContent = "";
	$(zoneList).each(
			function(i, zoneCfg) {
				tbodyContent = tbodyContent
						+ "<tr><td >" + zoneCfg.zone
						+ "</td><td>"
						+ zoneCfg.floor
						+ "</td><td>"
						+ zoneCfg.seats
						+ "</td><td>" + zoneCfg.mic
						+ "</td><td>"
						+ zoneCfg.projector
						+ "</td><td>"
						+ zoneCfg.teachermanage + "</td><td>"
						+ zoneCfg.comment+ "</td><td><button class='btn' onclick='btnDeleteZone(this)'>删除</button>"
						+ "&nbsp;&nbsp;<button class='btn' onclick='btnAddZone(this)' disabled='disabled'>保存</button>"+"</td></tr>";
			});
	$("#zone_table tbody").html(tbodyContent);
}

function btnAddZone(t){
	
}

function btnDeleteZone(t){
	deleteZone(getRowZone(t.parentElement.parentElement.rowIndex));
}

function getRowZone(rowIndex) {
	var tbody = document.getElementById('zone_table');
	/*
	 * for(var i = 0;i<tbody.rows.length;i++){ for(var j= 0;j<tbody.rows[i].cells.length;j++)
	 * alert(tbody.rows[i].cells[j].innerHTML) //每一行 每个单元格的内容 }
	 */
	var param = [{name:"zoneCfg.zone",value:tbody.rows[rowIndex].cells[0].innerHTML},
	             {name:"zoneCfg.floor" ,value:tbody.rows[rowIndex].cells[1].innerHTML},
	             {name:"zoneCfg.seats",value:tbody.rows[rowIndex].cells[2].innerHTML},
	             {name:"zoneCfg.mic" ,value: tbody.rows[rowIndex].cells[3].innerHTML},
	             {name:"zoneCfg.projector" ,value: tbody.rows[rowIndex].cells[4].innerHTML},
	             {name:"zoneCfg.teachermanage" ,value: tbody.rows[rowIndex].cells[5].innerHTML},
	             {name:"zoneCfg.comment" ,value: tbody.rows[rowIndex].cells[6].innerHTML}];
	return param;
}

function addZone(param) {
	if($("#circular").is(":hidden")){
		$("#circular").show();
	}
	$.ajax({
		url : 'zone_addRecord.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				$("#btnZoneRefresh").trigger("click");
				alert("区域信息增加成功");
			}
		},
		error : function(data, status, e) {
			alert(e);
		},complete: function(){
			$("#circular").hide();
		}
	});
}

function deleteZone(param) {
	if($("#circular").is(":hidden")){
		$("#circular").show();
	}
	$.ajax({
		url : 'zone_deleteRecord.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				$("#btnZoneRefresh").trigger("click");
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
	$("#btnZoneRefresh").click(function() {
		if($("#circular").is(":hidden")){
			$("#circular").show();
		}
		$.ajax({
			url : 'zone_refresh.action',
			type : 'post',
			data : '',
			dataType : 'json',
			success : function(data, status) {
				if (status == "success") {
					displayZone(data);
				}
			},
			error : function(data, status, e) {
				alert(e);
			},complete: function(){
				$("#circular").hide();
			}
		});
	});

	$("#btnZoneAdd").click(function() {
		var param = $("#zoneaddForm").serializeArray();
		addZone(param);
		return false;
	});

	// 初始化表单内容！
	$("#btnZoneRefresh").trigger("click");
});