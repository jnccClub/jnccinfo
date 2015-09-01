function adjustArrangement() {
	renewBodyId('#MF_ADARRANGE', '#ADJUST_ARRANGEMENT_li');
	initCoursesForAdjust();
	initTimeField();
	initAdjustFloor();
	bindSelectEvent();
}

function initTimeField() {
	// 根据起始时间决定结束时间范围
	$("select[name='adjust.beginTime'] option:disabled").css('color', '#CCC');
	$("select[name='adjust.endTime'] option:disabled").css('color', '#CCC');
	$("select[name='adjust.beginTime']").change(function() {
		var selectIndex = this.selectedIndex;
		$("select[name='adjust.endTime'] option").each(function(i) {
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
}

function initAdjustFloor() {
	$.ajax({
		url : 'zone_refresh.action',
		type : 'post',
		data : '',
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				renewFloorZoneFld(data);
			}
		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
		}
	});
}

function renewFloorZoneFld(zoneList) {
	var tFloorOption = "<option selected='selected' value='0'>&lt;請選擇樓層&gt;</option>";
	var tZoneOption = "<option selected='selected' value='0'>&lt;請選擇區域&gt;</option>";
	var floorArr = new Array();
	$(zoneList).each(
			function(i, zoneCfg) {
				tZoneOption = tZoneOption + "<option value='" + zoneCfg.zone
						+ "' parentid='" + zoneCfg.floor + "'>" + zoneCfg.zone
						+ "</option>";
				floorArr.push(zoneCfg.floor);
			});
	$("select[name='adjust.zone']").html(tZoneOption);
	var uniqFloorArr = uniqueArray(floorArr);
	$(uniqFloorArr).each(
			function(i, floor) {
				tFloorOption = tFloorOption + "<option value='" + floor + "'>"
						+ floor + "楼</option>";
			});

	$("select[name='adjust.floor']").html(tFloorOption);
}

function uniqueArray(data) {
	data = data || [];
	var a = {};
	for (var i = 0; i < data.length; i++) {
		var v = data[i];
		if (typeof (a[v]) == 'undefined') {
			a[v] = 1;
		}
	}
	data.length = 0;
	for ( var i in a) {
		data[data.length] = i;
	}
	return data;
}

function bindSelectEvent() {
	// Bind the change event
	// $("select[name='adjust.floor']").unbind("change", eDropFloorChange).bind(
	// "change", eDropFloorChange);
	// $("select[name='adjust.zone']").unbind("change", eDropZoneChange).bind(
	// "change", eDropZoneChange);

	$("select[name='adjust.floor']").change(
			function() {
				// The selected value of the language dropdown-list.
				var selectedValue = $(this).val();
				// show all options.
				$("select[name='adjust.zone']").children("span").each(
						function() {
							$(this).children().clone().replaceAll($(this)); // use
							// the
							// content
							// of the <span>
							// replace the
							// <span>
						});
				// Filter the data through selected value of language
				// dropdown-list
				// except <Please Select>.
				// If the option is <Please Select>, it only needs to show all
				// and hide
				// nothing.
				if (parseInt(selectedValue) != 0) {
					// hide the option whose parentid is not equal with selected
					// value
					// of language dropdown-list.
					// The <Please Select> option should not be hidden.
					$("select[name='adjust.zone']").children(
							"option[parentid!='" + selectedValue
									+ "'][value!='0']").each(function() {
						$(this).wrap("<span style='display:none'></span>");
					});
				}
			});

	// The change event of language dropdown-list
	$("select[name='adjust.zone']").change(
			function() {
				$("select[name='adjust.floor']").val(
						$(this).children("option:selected").attr("parentid"));
			});
	// The change event of frame dropdown-list.
	// var eDropZoneChange = function() {
	// // Find the selected option of frame dropdown-list. set the value of
	// // language dropdown-list by selected parentid.
	// $("select[name='adjust.floor']")
	// .val($(this).children("option:selected").attr("parentid"));
	// };
}

function queryCurrentCourse() {
	var params = [ {
		name : "queryDate",
		value : $("input[name='adjust.DatePick']").val()
	}, {
		name : "queryfloor",
		value : $("select[name='adjust.zone']").val()
	}, {
		name : "queryfiledVal",
		value : $("select[name='adjust.beginTime']").val()
	} ];

	$.ajax({
		url : 'comAction/comRes_querySpecifiedZone.action',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				$("#ADJUSTCOURSEINFO_DIV").html(data.resultCause.resultDesc);
				if (data.ec != null) {
					$("input[name='adjust.courseName']").val(data.ec.name);
					$("input[name='adjust.courseSerial']").val(data.ec.serial);
					$("input[name='adjust.teacherName']").val(data.ec.teacher);
					$("input[name='adjust.teacherNo']").val(data.ec.teacherNo);
					$("input[name='adjust.stuNum']").val(data.ec.seats);
					$("input[name='adjust.classNo']").val(data.ec.classNo);
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

function adjustZoneArrange() {
	var params = [ {
		name : "ea.id.date",
		value : $("input[name='adjust.DatePick']").val()
	}, {
		name : "ea.id.zone",
		value : $("select[name='adjust.zone']").val()
	}, {
		name : "ea.floor",
		value : $("select[name='adjust.floor']").val()
	}, {
		name : "queryfiled",
		value : $("select[name='adjust.beginTime']").val()
	}, {
		name : "queryfiledVal",
		value : $("select[name='adjust.endTime']").val()
	}, {
		name : "ea.appId",
		value : $("input[name='adjust.courseSerial']").val()
	} ];
	$.ajax({
		url : 'comAction/comRes_adjustZoneArrange.action',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				alert(data.resultDesc);
			}
		},
		error : function(data, status, e) {
			alert(e);
		},
		complete : function() {
		}
	});
}

function clearCourseInfo(){
	$("input[name='adjust.courseName']").val("");
	$("input[name='adjust.courseSerial']").val("");
	$("input[name='adjust.teacherName']").val("");
	$("input[name='adjust.teacherNo']").val("");
	$("input[name='adjust.stuNum']").val("");
	$("input[name='adjust.classNo']").val("");
}

function initCoursesForAdjust() {
	$('#adjust_appid').combogrid(
			{
				panelWidth : '600',
				// value:'006',
				height : '30',
				idField : 'fld_C_SERIAL',
				striped : true,
				textField : 'fld_C_NAME',
				url : 'comAction/comRes_getallCourse.action?queryfiled=ALL',
				columns : [ [ {
					field : 'fld_C_NAME',
					width : 160,
					title : '课程名称'
				}, {
					field : 'fld_C_SERIAL',
					width : 80,
					title : '课程序号'
				}, {
					field : 'fld_C_TEACHER',
					width : 100,
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
					width : 120,
					title : '班级'
				}, ] ],
				onSelect : function() { // 选中处理
					$("input[name='adjust.courseName']").val(
							$('#adjust_appid').combogrid('grid').datagrid(
									'getSelected').fld_C_NAME);
					$("input[name='adjust.teacherName']").val(
							$('#adjust_appid').combogrid('grid').datagrid(
									'getSelected').fld_C_TEACHER);

					$("input[name='adjust.teacherNo']").val(
							$('#adjust_appid').combogrid('grid').datagrid(
									'getSelected').fld_C_TNO);
					$("input[name='adjust.classNo']").val(
							$('#adjust_appid').combogrid('grid').datagrid(
									'getSelected').fld_C_CNO);
					$("input[name='adjust.stuNum']").val(
							$('#adjust_appid').combogrid('grid').datagrid(
									'getSelected').fld_C_CNUM);
					$("input[name='adjust.courseSerial']").val(
							$('#adjust_appid').combogrid('grid').datagrid(
									'getSelected').fld_C_SERIAL);
				}
			});
}
