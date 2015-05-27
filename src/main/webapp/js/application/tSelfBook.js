function tSelfBook() {
	renewBodyId('#MF_TBOOK', '#tSelf_Book_li');
	
	var xhr = $.ajax({
		url : 'res_queryTeacherzone.action?redirectURL=tBook.jsp',
		type : 'post',
		data : null,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				var refused = xhr.getResponseHeader("refused"); // 通过XMLHttpRequest取得响应头，refused，
				if (refused == "true") {
					alert("尚未登录，请您登录后预定！");
					// 如果超时就处理 ，指定要跳转的页面
					window.location.replace("login.jsp");
				} else {
					$("#COURSEINFO_SELF").html(data.resultDesc);
					$("#T_CPU_ZONE").val(data.resultCode);
				}
			}

		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
			// $("#circular").hide();
		}
	});

}

function bookSeatTeacher() {
	var cpuName = $("#T_CPU_ZONE").val();
	var param = [ {
		name : "cpuName",
		value : cpuName
	} ];
	$.ajax({
		url : 'res_bookTeacherzone.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				if (data.resultCode == "200") {
					alert("恭喜你，预定成功！\r\n" + "来自服务器的消息是: " + data.resultDesc);
				} else {
					alert("恭喜你，预定成功！\r\n" + "来自服务器的消息是: " + data.resultDesc);
				}
			}
		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
			// $("#circular").hide();
		}
	});
}