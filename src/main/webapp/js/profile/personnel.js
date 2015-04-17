$(function() {
	App.init();
	profileInit();
});

function saveProfile() {
	var params = $("#user_profile_mod").serialize();
	$.ajax({
		url : 'comAction/user_modUserInfo.action',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				alert("恭喜,修改/删除 成功!")
			}
		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
		}
	});

}
function modProfilePasswd() {
	if ($("#mod_newPasswd").val() != $("#mod_comPasswd").val()) {
		alert("两次新密码不一致，请重新输入！");
		return;
	}

	var params = [ {
		name : "userInfo.password",
		value : $("#mod_newPasswd").val()
	}, {
		name : "fomerPasswd",
		value : $("#mod_curPasswd").val()
	}, {
		name : "userInfo.preference",
		value : "MODPASSWD"
	} ];
	$.ajax({
		url : 'comAction/user_modUserInfo.action',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				if(data.resultCode==403){
					alert("原始密码错误，请重新输入！");
				}else{
					alert("恭喜,修改/删除 成功!")
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

function profileInit() {
	$.ajax({
		url : 'comAction/user_isLogin.action',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			if (data.resultCause.resultCode.toString() == "200") {
				// alert("恭喜，登录成功！");
				var userInfo = data.userInfo;
				initInfoById(userInfo);
			} else if (data.resultCause.resultCode.toString() == "404") {
				return;
			} else {
				return;
			}
		}
	});
}

function initInfoById(userInfo) {
	var modHtml = "";
	modHtml = modHtml
			+ '<label class="control-label">工号</label> <input type="text" value="';
	modHtml = modHtml
			+ userInfo.username
			+ '" placeholder="70206317" class="m-wrap span8" disabled="disabled" />';
	modHtml = modHtml
			+ ' <label	class="control-label">姓名</label> <input type="text"	placeholder="计算zhognxin" class="m-wrap span8" '
	modHtml = modHtml + 'value="' + userInfo.realname
			+ '" name="userInfo.realname"/>';
	modHtml = modHtml
			+ ' <label	class="control-label">联系方式</label> <input type="text"	placeholder="" class="m-wrap span8" '
	modHtml = modHtml + 'value="' + userInfo.phoneno
			+ '" name="userInfo.phoneno"/>';
	modHtml = modHtml
			+ ' <label	class="control-label">电子邮箱</label> <input type="text"	placeholder="" class="m-wrap span8" '
	modHtml = modHtml + 'value="' + userInfo.email
			+ '" name="userInfo.email"/>';
	modHtml = modHtml
			+ ' <label	class="control-label">QQ</label> <input type="text"	placeholder="" class="m-wrap span8" '
	modHtml = modHtml + 'value="' + userInfo.qq + '" name="userInfo.qq"/>';
	modHtml = modHtml
			+ ' <label	class="control-label">说明</label> <textarea class="span8 m-wrap" rows="3" name="userInfo.selfIntroduce">'
	modHtml = modHtml + userInfo.selfIntroduce + '</textarea>';
	$("#user_profile_mod > div:first").html(modHtml);

	var profileDisHtml = "";
	profileDisHtml = profileDisHtml + "<li><span>工号:</span>"
			+ userInfo.username + "</li>";
	profileDisHtml = profileDisHtml + "<li><span>姓名:</span>"
			+ userInfo.realname + "</li>";
	profileDisHtml = profileDisHtml + "<li><span>联系方式:</span>"
			+ userInfo.phoneno + "</li>";
	profileDisHtml = profileDisHtml + "<li><span>电子邮箱:</span>" + userInfo.email
			+ "</li>";
	profileDisHtml = profileDisHtml + "<li><span>QQ:</span>" + userInfo.qq
			+ "</li>";
	profileDisHtml = profileDisHtml + "<li><span>说明介绍:</span>"
			+ userInfo.selfIntroduce + "</li>";
	$("#user_profile_dis").html(profileDisHtml);

}