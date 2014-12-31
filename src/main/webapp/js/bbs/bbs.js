function bbsShow (){
	renewMainId('#MF_BBS');
	getbbsList();
}

function getbbsList(){
	if ($("#circular").is(":hidden")) {
		$("#circular").show();
	}
	var param = [];
	$.ajax({
		url : 'comAction/comBbs_getAllbbs.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				genBbsContent(data);
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
function genBbsContent(data){
	var bbsHtml = "";
	$(data).each(function(key,obj){
		bbsHtml = bbsHtml+ "<label>江湖人称：<a href='#'>";
		bbsHtml = bbsHtml+ obj.name;
		bbsHtml = bbsHtml+ "</a></label>";
		bbsHtml = bbsHtml+ "<label>&nbsp;&nbsp;&nbsp;&nbsp;曾几何时：<a href='#'>";
		bbsHtml = bbsHtml+ obj.ctime;
		bbsHtml = bbsHtml+ "</a></label>";
		bbsHtml = bbsHtml+ "<label>&nbsp;&nbsp;&nbsp;&nbsp;闭关圣所：<a href='#'>";
		bbsHtml = bbsHtml+ obj.ip;
		bbsHtml = bbsHtml+ "</a></label>";
		bbsHtml = bbsHtml+ "<br>";
		bbsHtml = bbsHtml+ "<label>快人快语：<a href='#'>";
		bbsHtml = bbsHtml+ obj.remark;
		bbsHtml = bbsHtml+ "</a></label>";
		bbsHtml = bbsHtml+ "<div class='menu-sep'></div>";
	});
	$("#bbsContent").html(bbsHtml);
	
}


$(function(){
	$("#bbsSubmit").click(function(){
		
		if ($("#circular").is(":hidden")) {
			$("#circular").show();
		}
		var param = $("#bbsForm").serializeArray();
		$.ajax({
			url : 'comAction/comBbs_addBBS.action',
			type : 'post',
			data : param,
			dataType : 'json',
			success : function(data, status) {
				if (status == "success") {
					getbbsList();
				}
			},
			error : function(data, status, e) {
				alert(e);
			},
			complete : function() {
				$("#circular").hide();
			}
		});
		
	});
	
});
