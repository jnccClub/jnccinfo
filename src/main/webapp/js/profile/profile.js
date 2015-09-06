function showAllProfile() {
	var columns = [ {
		"sTitle" : "工号"
	}, {
		"sTitle" : "姓名"
	}, {
		"sTitle" : "密码"
	}, {
		"sTitle" : "联系电话"
	}, {
		"sTitle" : "邮箱"
	}, {
		"sTitle" : "备注"
	}, {
		"sTitle" : "编辑"
	}, {
		"sTitle" : "删除"
	} ];

	$.ajax({
		url : 'comAction/user_listUserInfo.action',
		type : 'post',
		data : null,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				if (data == null || data.length == 0) {
					TableEditable.init("sample_editable_1", data, columns);
					alert("Sorry,你的权限太low啦或者还没有登录？！");
				} else {
					TableEditable.init("sample_editable_1", data, columns);
				}
			}
		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
		}
	});
}
