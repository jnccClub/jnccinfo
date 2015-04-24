function createApplication() {
	loadSWData();
	$('#CApp_CName').combogrid(
			{
				panelWidth : 490,
				// value:'006',
				idField : 'fld_C_SERIAL',
				textField : 'fld_C_NAME',
				url : 'comAction/comRes_getallCourse.action',
				columns : [ [ {
					field : 'fld_C_NAME',
					width : 120,
					title : '课程名称'
				}, {
					field : 'fld_C_SERIAL',
					width : 180,
					title : '课程序号'
				}, {
					field : 'fld_C_TEACHER',
					width : 60,
					title : '教师姓名'
				}, {
					field : 'fld_C_TNO',
					width : 60,
					title : '教师工号'
				}, {
					field : 'fld_C_CNUM',
					width : 60,
					title : '学生人数'
				}, {
					field : 'fld_C_CNO',
					width : 60,
					title : '班级'
				}, ] ],
				/*
				 * keyHandler: { up: function () { //【向上键】押下处理 //取得选中行 var
				 * selected =
				 * $('#CApp_CName').combogrid('grid').datagrid('getSelected');
				 * if (selected) { //取得选中行的rowIndex var index =
				 * $('#CApp_CName').combogrid('grid').datagrid('getRowIndex',
				 * selected); //向上移动到第一行为止 if (index > 0) {
				 * $('#CApp_CName').combogrid('grid').datagrid('selectRow',
				 * index - 1); } } else { var rows =
				 * $('#CApp_CName').combogrid('grid').datagrid('getRows');
				 * $('#CApp_CName').combogrid('grid').datagrid('selectRow',
				 * rows.length - 1); } }, down: function () { //【向下键】押下处理
				 * //取得选中行 var selected =
				 * $('#CApp_CName').combogrid('grid').datagrid('getSelected');
				 * if (selected) { //取得选中行的rowIndex var index =
				 * $('#CApp_CName').combogrid('grid').datagrid('getRowIndex',
				 * selected); //向下移动到当页最后一行为止 if (index <
				 * $('#CApp_CName').combogrid('grid').datagrid('getData').rows.length -
				 * 1) { $('#CApp_CName').combogrid('grid').datagrid('selectRow',
				 * index + 1); } } else {
				 * $('#CApp_CName').combogrid('grid').datagrid('selectRow', 0); } },
				 * enter: function () { //【回车键】押下处理 //设置【性别】文本框的内容为选中行的的性别字段内容
				 * $('#txtGender').val($('#CApp_CName').combogrid('grid').datagrid('getSelected').Gender);
				 * //选中后让下拉表格消失 $('#CApp_CName').combogrid('hidePanel'); },
				 * query: function (keyword) { //【动态搜索】处理 //设置查询参数 var
				 * queryParams =
				 * $('#CApp_CName').combogrid("grid").datagrid('options').queryParams;
				 * queryParams.keyword = keyword;
				 * $('#CApp_CName').combogrid("grid").datagrid('options').queryParams =
				 * queryParams; //重新加载
				 * $('#CApp_CName').combogrid("grid").datagrid("reload");
				 * $('#CApp_CName').combogrid("setValue", keyword); //将查询条件存入隐藏域
				 * $('#hdKeyword').val(keyword); } },
				 */
				onSelect : function() { // 选中处理
					$("input[name='applicationInfo.class']").val(
							$('#CApp_CName').combogrid('grid').datagrid(
									'getSelected').fld_C_CNO);
					$("input[name='applicationInfo.seats']").val(
							$('#CApp_CName').combogrid('grid').datagrid(
									'getSelected').fld_C_CNUM);
					$("input[name='applicationInfo.applicationId']").val(
							$('#CApp_CName').combogrid('grid').datagrid(
									'getSelected').fld_C_SERIAL);
					$("#CApp_CName").val(
							$('#CApp_CName').combogrid('grid').datagrid(
									'getSelected').fld_C_NAME);
				}
			});
}

$(function() {
	// var today = new Date().FormatHPF("yyyy-MM-dd");
	// $("#beginDatepick input").val(today);
	// $("#endDatepick input").val(today);

	initWeeksSelect();
	// 根据起始时间决定结束时间范围
	$("select[name='applicationInfo.beginTime'] option:disabled").css('color',
			'#CCC');
	$("select[name='applicationInfo.endTime'] option:disabled").css('color',
			'#CCC');
	$("select[name='applicationInfo.beginTime']").change(function() {
		var selectIndex = this.selectedIndex;
		$("select[name='applicationInfo.endTime'] option").each(function(i) {
			if (i == selectIndex) {
				$(this).attr("selected", true);
			}
			if (i < selectIndex) {
				$(this).attr("disabled", true);
			} else {
				$(this).attr("disabled", false);
			}
		});
	});
	$("select[name='applicationInfo.beginDate'] option:disabled").css('color',
			'#CCC');
	$("select[name='applicationInfo.endDate'] option:disabled").css('color',
			'#CCC');
	$("select[name='applicationInfo.beginDate']").change(function() {
		var selectIndex = this.selectedIndex;
		$("select[name='applicationInfo.endDate'] option").each(function(i) {
			if (i == selectIndex) {
				$(this).attr("selected", true);
			}
			if (i < selectIndex) {
				$(this).attr("disabled", true);
			} else {
				$(this).attr("disabled", false);
			}
		});
	});
	$("#termSelect").change(function() {
		var curSelTerm = $("#termSelect").val();
		var schoolBeginDate = new Date(curSelTerm);
		updateFirstBeginMon(schoolBeginDate);
	});
	$("select[name='ea.floor']").change(function() {
		// alert($(this).children('option:selected').val()); // 弹出select的值
		showSpecifyZone($(this).children('option:selected').val());
	});

});
function initWeeksSelect() {
	var optionHtml = "";
	optionHtml = optionHtml + "<option  selected='selected' value='" + 1
			+ "'>第" + 1 + "周</option>";
	for (var i = 2; i <= 20; i++) {
		optionHtml = optionHtml + "<option value='" + i + "'>第" + i
				+ "周</option>";
	}
	$("select[name='applicationInfo.beginDate']").html(optionHtml);
	$("select[name='applicationInfo.endDate']").html(optionHtml);
}

function findzone() {
	var dateinfo = "";
	$("#confirm_table tbody tr").each(function(trindex, tritem) {
		dateinfo = dateinfo + $(this).children().eq(0).text() + " ";
	});
	if (dateinfo == "") {
		alert("至少需要有一个日期申请，请确认！");
		return false;
	}
	var param = [ {
		name : "ea.applicationId",
		value : $("#generatedAppID").text()
	}, {
		name : "ea.courseName",
		value : $("#generatedCourse").text()
	}, {
		name : "ea.className",
		value : $("#generatedClass").text()
	}, {
		name : "ea.seats",
		value : $("#generatedCourseSeats").text()
	}, {
		name : "ea.os",
		value : $("#generatedOS").text()
	}, {
		name : "ea.software",
		value : $("#generatedSW").text()
	}, {
		name : "ea.booktype",
		value : getBookingType($("#generatedCourseType").text())
	}, {
		name : "ea.comment",
		value : $("#generatedCommnet").text()
	}, {
		name : "ea.contactNo",
		value : $("#generatedContact").text()
	}, {
		name : "ea.email",
		value : $("#generatedEmail").text()
	}, {
		name : "ea.beginTime",
		value : $("select[name='applicationInfo.beginTime']").val()
	}, {
		name : "ea.endTime",
		value : $("select[name='applicationInfo.endTime']").val()
	}, {
		name : "ea.dateInfo",
		value : dateinfo
	} ];
	if ($("#circular").is(":hidden")) {
		$("#circular").show();
	}
	$.ajax({
		url : 'app_findzone.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				showFreeZoneDiv(data);
			}
			$("#APP_SECONDSTEP").hide();
			$("#DIV_ZONE_CHOOSE").show();
		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
			$("#circular").hide();
		}
	});
}
function showFreeZoneDiv(zoneList) {
	freezoneList = zoneList;
	var floorList = new Array();
	$(freezoneList).each(function(key, zone) {
		if (floorList.indexOf(zone.floor) == -1) {
			floorList.push(zone.floor);
		}
	});
	floorList.sort(function(a, b) {
		return a > b ? 1 : -1;
	});
	var sel_options = "";
	var isFirstFloor = true;
	$(floorList).each(
			function(key, floor) {
				if (isFirstFloor) {
					sel_options = sel_options + "<option value='" + floor
							+ "' selected='selected'>" + floor + "楼</option>";
					isFirstFloor = false;
				} else {
					sel_options = sel_options + "<option value='" + floor
							+ "'>" + floor + "楼</option>";
				}
			});
	$("select[name='ea.floor']").html(sel_options);
	var cur_floor = $("select[name='ea.floor']").val();
	showSpecifyZone(cur_floor);
}
function showSpecifyZone(floor) {
	totalSeats = 0;
	choosenZones = new Array();
	cur_zoneList = new Array();
	$(freezoneList).each(function(key, zone) {
		if (zone.floor == floor) {
			cur_zoneList.push(zone);
		}
	});
	var cur_showzone = "";
	$(cur_zoneList).each(
			function(i, zone) {
				cur_showzone = cur_showzone
						+ "<input type='checkbox' name='ea.zone' value='";
				cur_showzone = cur_showzone + zone.zone
						+ "' onclick='changeCheck(this)'/>" + zone.zone + "("
						+ zone.seats + "座)&nbsp;&nbsp;&nbsp;&nbsp;";
			});
	$("#a_chooseSeats").html($("#generatedCourseSeats").text());
	$("#div_chooseZone").html(cur_showzone);
}
function changeCheck(zone) {
	var cur_seats = 0;
	var cur_floor = 0;
	$(cur_zoneList).each(function(i, val) {
		if (zone.value == val.zone) {
			cur_seats = val.seats;
			cur_floor = val.floor;
		}
	});
	Array.prototype.remove = function(val) {
		var index = this.indexOf(val);
		if (index > -1) {
			this.splice(index, 1);
		}
	};
	if (zone.checked) {
		choosenZones.push(zone.value);
		totalSeats = totalSeats + cur_seats;
	} else {
		totalSeats = totalSeats - cur_seats;
		choosenZones.remove(zone.value);
	}
	var curZonesStr = "";
	$(choosenZones).each(function(i, value) {
		curZonesStr = curZonesStr + value + "区&nbsp;&nbsp;";
	});
	var curShowSeats = "";
	curShowSeats = "共计座位数是" + totalSeats;
	$("#choosenSeats").html(curShowSeats);
	var curShowRes = "";
	curShowRes = "您选择的是" + cur_floor + "楼 " + curZonesStr;
	$("#choosenRes").html(curShowRes);
}
function findConfDate() {
	var dateinfo = "";
	$("#confirm_table tbody tr").each(function(trindex, tritem) {
		dateinfo = dateinfo + $(this).children().eq(0).text() + " ";
	});
	if (dateinfo == "") {
		alert("至少需要有一个日期申请，请确认！");
		return false;
	}
	var param = [ {
		name : "ea.applicationId",
		value : $("#generatedAppID").text()
	}, {
		name : "ea.courseName",
		value : $("#generatedCourse").text()
	}, {
		name : "ea.className",
		value : $("#generatedClass").text()
	}, {
		name : "ea.seats",
		value : $("#generatedCourseSeats").text()
	}, {
		name : "ea.os",
		value : $("#generatedOS").text()
	}, {
		name : "ea.software",
		value : $("#generatedSW").text()
	}, {
		name : "ea.booktype",
		value : getBookingType($("#generatedCourseType").text())
	}, {
		name : "ea.comment",
		value : $("#generatedCommnet").text()
	}, {
		name : "ea.contactNo",
		value : $("#generatedContact").text()
	}, {
		name : "ea.email",
		value : $("#generatedEmail").text()
	}, {
		name : "ea.beginTime",
		value : $("select[name='applicationInfo.beginTime']").val()
	}, {
		name : "ea.endTime",
		value : $("select[name='applicationInfo.endTime']").val()
	}, {
		name : "ea.dateInfo",
		value : dateinfo
	} ];
	if ($("#circular").is(":hidden")) {
		$("#circular").show();
	}
	var haveConflictDates = false;
	$.ajax({
		url : 'app_findConfDate.action',
		type : 'post',
		data : param,
		async : false,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				if (data.resultCode == "480") {
					var trRows = data.resultDesc.split(" ");
					var iConflictCount = 0;
					$.each(trRows, function(key, row) {
						if (row != "") {
							$("#confirm_table tr:eq(" + row + ")").css(
									"background-color", "red");
							iConflictCount = iConflictCount + 1;
						}
					});
					if (iConflictCount > 0) {
						$.messager.confirm('确认删除信息', '标红为冲突日期，请确认删除提交！',
								function(r) {
									if (r) {
										$.each(trRows, function(key, row) {
											if (row != "") {
												$(
														"#confirm_table tr:eq("
																+ row + ")")
														.remove();
											}
										});
									} 
								});
						haveConflictDates = true;
					} else {
						haveConflictDates = false;
					}
				} else {
					haveConflictDates = false;
				}
			}
		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
			 $("#circular").hide();
		}
	});
	return haveConflictDates;
}

function confirmApplication(exceptionRows) {
	if (findConfDate()) {
		return false;
	}else{
		findzone();
	}
	return false;
}

function getBookingType(courseType) {
	switch (courseType) {
	case "上机":
		return 1;
		break;
	case "上课":
		return 2;
		break;
	case "考试":
		return 3;
		break;
	}
	return 1;
}

function appSecondBack() {
	$("#APP_SECONDSTEP").hide();
	$("#APP_FIRSTSTEP").show();
}

function appZoneBack() {
	$("#DIV_ZONE_CHOOSE").hide();
	$("#APP_SECONDSTEP").show();
}

function IsValidCourse(courseName, CourseID) {
	if (courseName == "" || CourseID == "") {
		var userRole = getUserRole();
		if (userRole == "admin") {
			var curTime = new Date().FormatHPF("yyyyMMddhhmmssS");
			$("input[name='applicationInfo.applicationId']").val(curTime);
			return true;
		} else {
			return false;
		}
	} else {
		return true;
	}
}

function getUserRole() {
	var role = "";
	$.ajax({
		url : 'comAction/user_isLogin.action',
		async : false,
		type : 'post',
		dataType : 'json',
		success : function(data) {
			if (data.resultCause.resultCode.toString() == "200") {
				role = data.userInfo.role.toString();
			} else if (data.resultCause.resultCode.toString() == "404") {
				role = "Not found";
			} else {
				role = "inValid";
			}
		},
		final : function() {
		}
	});
	return role;

}

function uploadNewCourse() {
	$.messager.confirm('新课程与班级信息', '是否新上传课程信息！', function(r) {
		if (r) {
			disCourse();
		}
	});
}

function appFirstNext() {
	var courseName = $("#CApp_CName").val();
	var CourseID = $("input[name='applicationInfo.applicationId']").val();
	if (!IsValidCourse(courseName, CourseID)) {
		$.messager.confirm('课程名称或编号错误', '是否新上传课程信息！', function(r) {
			if (r) {
				disCourse();
			}
		});
		return;
	}
	CourseID = $("input[name='applicationInfo.applicationId']").val();
	// var curTime = new Date().FormatHPF("yyyyMMddhhmmssS");
	$("#generatedAppID").html(CourseID);
	$("#generatedCourse").html(courseName);
	$("#generatedContact").html(
			$("input[name='applicationInfo.contact']").val());
	$("#generatedCourseSeats").html(
			$("input[name='applicationInfo.seats']").val());
	$("#generatedCourseType").html(
			$("input[name='applicationInfo.courseType'][type='radio']:checked")
					.val());
	$("#generatedOS").html($("select[name='applicationInfo.OS']").val());

	var swList = "";
	$("input[name='applicationInfo.SW']").each(function() {
		if (!($(this).val() == ""))
			swList = swList + $(this).val() + "|";
	});
	$("#generatedSW").html(swList);
	$("#generatedClass").html($("input[name='applicationInfo.class']").val());
	$("#generatedCommnet").html(
			"<br>" + $("textarea[name='applicationInfo.OtherComment']").val());

	var beginWeek = parseInt($("select[name='applicationInfo.beginDate']")
			.val());
	var endWeek = parseInt($("select[name='applicationInfo.endDate']").val());
	var beginCourseTime = $("select[name='applicationInfo.beginTime']").val();
	var endCourseTime = $("select[name='applicationInfo.endTime']").val();

	var weekDay = $(
			"input[name='applicationInfo.weekChoosen'][type='radio']:checked")
			.val();

	// var beginWeek = getSchoolWeek(new Date(beginCourseDate));
	// var endWeek = getSchoolWeek(new Date(endCourseDate));
	var tbodyContent = "";
	for (var i = beginWeek; i <= endWeek; i++) {
		var weekDate = new Date(schoolBeginMon);
		var daysGap = weekDay - 1 + 7 * (i - 1);
		weekDate.setDate(weekDate.getDate() + daysGap);
		tbodyContent = tbodyContent
				+ "<tr><td >"
				+ weekDate.FormatHPF("yyyy-MM-dd")
				+ "</td><td class='editable simpleInput'>第 "
				+ i
				+ " 周</td><td class='editable simpleInput'>"
				+ transWeekDay(weekDay)
				+ "</td><td class='editable simpleInput'>"
				+ beginCourseTime
				+ "</td><td class='editable simpleInput'>"
				+ endCourseTime
				+ "</td><td><button class='btn' onclick='btnDeleteApp(this)'>删除</button>"
				+ "&nbsp;&nbsp;<button class='btn' onclick='btnAddApp(this)' disabled='disabled'>保存</button>"
				+ "</td></tr>";
	}
	$("#confirm_table tbody").html(tbodyContent);

	$("#APP_FIRSTSTEP").hide();
	$("#APP_SECONDSTEP").show();
	return false;
}

function btnDeleteApp(t) {
	// t.parentElement.parentElement.remove();
	// t.closest("tr").remove();
	if (isIEExplorer()) {
		t.parentNode.parentNode.removeNode(true);
	} else {
		t.parentNode.parentNode.remove();
	}
}

function isIEExplorer() {
	var explorer = window.navigator.userAgent;
	// ie
	if ((explorer.indexOf("MSIE") >= 0) || (explorer.indexOf(".NET") >= 0)) {
		return true;
	} else {
		return false;
	}
}

// function getperiod(beginDate, endDate) {
// var daysGap = (endDate - beginDate) / 86400000;
// var weeksGap = Math.floor(daysGap / 7) + 1;
// return weeksGap;
// }
//
// function getSchoolWeek(curDate) {
//
// return getperiod(schoolBeginDate, curDate);
// }

function daysBetween(DateOne, DateTwo) {
	var OneMonth = DateOne.substring(5, DateOne.lastIndexOf('-'));
	var OneDay = DateOne
			.substring(DateOne.length, DateOne.lastIndexOf('-') + 1);
	var OneYear = DateOne.substring(0, DateOne.indexOf('-'));
	var TwoMonth = DateTwo.substring(5, DateTwo.lastIndexOf('-'));
	var TwoDay = DateTwo
			.substring(DateTwo.length, DateTwo.lastIndexOf('-') + 1);
	var TwoYear = DateTwo.substring(0, DateTwo.indexOf('-'));
	var cha = ((Date.parse(OneMonth + '/' + OneDay + '/' + OneYear) - Date
			.parse(TwoMonth + '/' + TwoDay + '/' + TwoYear)) / 86400000);
	return Math.abs(cha);
}

Date.prototype.FormatHPF = function(fmt) { // author: hpf
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}

function submitFinalForm() {
	if (totalSeats == 0) {
		alert("您当前未选择机房资源，请至少选择一个可用区域！");
		return;
	}

	var dateinfo = "";
	$("#confirm_table tbody tr").each(function(trindex, tritem) {
		dateinfo = dateinfo + $(this).children().eq(0).text() + " ";
	});
	var zInfos = "";
	$("input[name='ea.zone']:checked").each(function() {
		zInfos = zInfos + $(this).val() + " ";
	});
	var param = [ {
		name : "ea.id.applicationId",
		value : $("#generatedAppID").text()
	}, {
		name : "ea.courseName",
		value : $("#generatedCourse").text()
	}, {
		name : "ea.className",
		value : $("#generatedClass").text()
	}, {
		name : "ea.seats",
		value : $("#generatedCourseSeats").text()
	}, {
		name : "ea.os",
		value : $("#generatedOS").text()
	}, {
		name : "ea.software",
		value : $("#generatedSW").text()
	}, {
		name : "ea.booktype",
		value : getBookingType($("#generatedCourseType").text())
	}, {
		name : "ea.comment",
		value : $("#generatedCommnet").text()
	}, {
		name : "ea.contactNo",
		value : $("#generatedContact").text()
	}, {
		name : "ea.email",
		value : $("#generatedEmail").text()
	}, {
		name : "ea.beginTime",
		value : $("select[name='applicationInfo.beginTime']").val()
	}, {
		name : "ea.endTime",
		value : $("select[name='applicationInfo.endTime']").val()
	}, {
		name : "ea.dateInfo",
		value : dateinfo
	}, {
		name : "ea.floor",
		value : $("select[name='ea.floor']").val()
	}, {
		name : "ea.zone",
		value : zInfos
	} ];
	if ($("#circular").is(":hidden")) {
		$("#circular").show();
	}
	$.ajax({
		url : 'app_addRecord.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				if (data.resultCode == "480") {
					var trRows = data.resultDesc.split(" ");
					$.each(trRows, function(key, row) {
						if (row != "") {
							$("#confirm_table tr:eq(" + row + ")").css(
									"background-color", "#bbf");
						}
					});
				}
				alert("预约申请提交成功");
				$("#DIV_ZONE_CHOOSE").hide();
				$("#APP_FIRSTSTEP").show();
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

function loadSWData() {
	var swComboxData;
	$('#input_sw1').combobox({
		// data : drows,
		url : 'comAction/comSw_getSW.action',
		valueField : 'id',
		textField : 'text',
		onLoadSuccess : function() { // 加载完成后,设置选中第一项
			/*
			 * var val = $(this).combobox("getData"); for ( var item in val[0]) {
			 * if (item == "id") { $(this).combobox("select", val[0][item]); } }
			 */
			swComboxData = $(this).combobox("getData");
			$('#input_sw2').combobox({
				data : swComboxData,
				valueField : 'id',
				textField : 'text',
			});
			$('#input_sw3').combobox({
				data : swComboxData,
				valueField : 'id',
				textField : 'text',
			});
		}
	});

}