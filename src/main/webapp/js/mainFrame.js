// 软件列表
var currentShowID = "#MF_Query";
function logOut() {
	alert("欢迎重新登录！");
	username = "";
	$("#loginInfo").hide();
	$("#logOutEntry").hide();
	$("#loginEntry").show();
	renewMainId("#mainFrame_Login");
}

$(function() {
	guestItemHide();
	renewMainId('#mainFrame_Login');
});

function guestItemHide() {
	$("#personCenter").hide();
	$("#maintainCenter").hide();
	$("#stuBookingEntry").hide();
}
function userItemShow(role) {
	if (role == "teacher") {
		$("#maintainCenter").hide();
		$("#audit_Application").hide();
		$("#ADJUST_ARRANGEMENT_li").hide();
		$("#personCenter").show();
		renewMainId("#MF_Body");
	} else if (role == "admin") {
		$("#personCenter").show();
		$("#maintainCenter").show();
		$("#audit_Application").show();
		$("#stuBookingEntry").show();
		$("#ADJUST_ARRANGEMENT_li").show();
		renewMainId("#MF_Body");
	} else {
		$("#maintainCenter").hide();
		$("#audit_Application").hide();
		$("#ADJUST_ARRANGEMENT_li").hide();
		$("#personCenter").hide();
		$("#stuBookingEntry").show();
		renewMainId("#MF_STUBOOKING");
	}

}
function renewMainId(newId) {
	$(currentShowID).hide();
	currentShowID = newId;
	$(currentShowID).show();
	if (typeof (statusInterval) == "undefined") {
		return;
	} else {
		clearInterval(statusInterval);
	}
}
