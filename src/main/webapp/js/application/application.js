﻿$(function(){
	var today = new Date().FormatHPF("yyyy-MM-dd");
	$("#beginDatepick input").val(today);
	$("#endDatepick input").val(today);
	//根据起始时间决定结束时间范围
	$("select[name='applicationInfo.beginTime'] option:disabled").css('color', '#CCC'); 
	$("select[name='applicationInfo.endTime'] option:disabled").css('color', '#CCC');
	$("select[name='applicationInfo.beginTime']").change(function(){
		var selectIndex = this.selectedIndex;
		$("select[name='applicationInfo.endTime'] option").each(function(i){
			if(i==selectIndex){
				$(this).attr("selected", true);
			}
			if(i<selectIndex){
				$(this).attr("disabled", true);
			}else{
				$(this).attr("disabled", false);
			}
		});
	});
});

function findzone(){
	var dateinfo = "";
	$("#confirm_table tbody tr").each(function(trindex,tritem){
		dateinfo = dateinfo+$(this).children().eq(0).text()+" ";
	});
	
	var param = [{name:"ea.applicationId",value:$("#generatedAppID").text()},
	             {name:"ea.courseName" ,value:$("#generatedCourse").text()},
	             {name:"ea.className",value:$("#generatedClass").text()},
	             {name:"ea.seats" ,value: $("#generatedCourseSeats").text()},
	             {name:"ea.os" ,value:$("#generatedOS").text()},
	             {name:"ea.software",value:$("#generatedSW").text()},
	             {name:"ea.booktype",value:getBookingType($("#generatedCourseType").text())},
	             {name:"ea.comment" ,value: $("#generatedCommnet").text()},
	             {name:"ea.contactNo" ,value:$("#generatedContact").text()},
	             {name:"ea.email" ,value: $("#generatedEmail").text()},
	             {name:"ea.beginTime" ,value:$("select[name='applicationInfo.beginTime']").val()},
	             {name:"ea.endTime" ,value:$("select[name='applicationInfo.endTime']").val()},
	             {name:"ea.dateInfo" ,value: dateinfo}];
	if($("#circular").is(":hidden")){
		$("#circular").show();
	}
	$.ajax({
		url : 'app_findzone.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				alert("预约申请提交成功");
			}
		},
		error : function(data, status, e) {
			alert(e);
		},complete: function(){
			$("#circular").hide();
		}
	});
}

function findConfDate(){
	var dateinfo = "";
	$("#confirm_table tbody tr").each(function(trindex,tritem){
		dateinfo = dateinfo+$(this).children().eq(0).text()+" ";
	});
	
	var param = [{name:"ea.applicationId",value:$("#generatedAppID").text()},
	             {name:"ea.courseName" ,value:$("#generatedCourse").text()},
	             {name:"ea.className",value:$("#generatedClass").text()},
	             {name:"ea.seats" ,value: $("#generatedCourseSeats").text()},
	             {name:"ea.os" ,value:$("#generatedOS").text()},
	             {name:"ea.software",value:$("#generatedSW").text()},
	             {name:"ea.booktype",value:getBookingType($("#generatedCourseType").text())},
	             {name:"ea.comment" ,value: $("#generatedCommnet").text()},
	             {name:"ea.contactNo" ,value:$("#generatedContact").text()},
	             {name:"ea.email" ,value: $("#generatedEmail").text()},
	             {name:"ea.beginTime" ,value:$("select[name='applicationInfo.beginTime']").val()},
	             {name:"ea.endTime" ,value:$("select[name='applicationInfo.endTime']").val()},
	             {name:"ea.dateInfo" ,value: dateinfo}];
	if($("#circular").is(":hidden")){
		$("#circular").show();
	}
	$.ajax({
		url : 'app_findConfDate.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				if(data.resultCode == "480"){
					var trRows = data.resultDesc.split(" ");
					$.each(trRows,function(key, row){
						if(row!=""){
							$("#confirm_table tr:eq("+row+")").css("background-color", "#bbf");
						}
					});
				}
				alert("预约申请提交成功");
			}
		},
		error : function(data, status, e) {
			alert(e);
		},complete: function(){
			$("#circular").hide();
		}
	});
}


function confirmApplication(exceptionRows){
	findConfDate();
/*	findzone();
	var dateinfo = "";
	var exceptionRowList = new Array();
	if(exceptionRows!=null || exceptionRows!="" ){
//		exceptionRowList = exceptionRows.split(" ");
	}
	$("#confirm_table tbody tr").each(function(trindex,tritem){
		dateinfo = dateinfo+$(this).children().eq(0).text()+" ";
	});
	
	var param = [{name:"ea.applicationId",value:$("#generatedAppID").text()},
	             {name:"ea.courseName" ,value:$("#generatedCourse").text()},
	             {name:"ea.className",value:$("#generatedClass").text()},
	             {name:"ea.seats" ,value: $("#generatedCourseSeats").text()},
	             {name:"ea.os" ,value:$("#generatedOS").text()},
	             {name:"ea.software",value:$("#generatedSW").text()},
	             {name:"ea.booktype",value:getBookingType($("#generatedCourseType").text())},
	             {name:"ea.comment" ,value: $("#generatedCommnet").text()},
	             {name:"ea.contactNo" ,value:$("#generatedContact").text()},
	             {name:"ea.email" ,value: $("#generatedEmail").text()},
	             {name:"ea.beginTime" ,value:$("select[name='applicationInfo.beginTime']").val()},
	             {name:"ea.endTime" ,value:$("select[name='applicationInfo.endTime']").val()},
	             {name:"ea.dateInfo" ,value: dateinfo}];
	if($("#circular").is(":hidden")){
		$("#circular").show();
	}
	$.ajax({
		url : 'app_addRecord.action',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data, status) {
			if (status == "success") {
				alert("预约申请提交成功");
			}
		},
		error : function(data, status, e) {
			alert(e);
		},complete: function(){
			$("#circular").hide();
		}
	});
	*/
	return false;
}

function getBookingType(courseType){
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

function appFirstNext(){
	var appid = $("input[name='applicationInfo.applicationId']").val();
	if(appid == ""){
		var curTime = new Date().FormatHPF("yyyyMMddhhmmssS");
		var generatedAppID =  "CC"+curTime;
		$("#generatedAppID").html(generatedAppID);
	}else{
		$("#generatedAppID").html(appid);
	}
	$("#generatedAppID").html($("input[name='applicationInfo.applicationId']").val());
	$("#generatedCourse").html($("input[name='applicationInfo.course']").val());
	$("#generatedContact").html($("input[name='applicationInfo.contact']").val());
	$("#generatedCourseSeats").html($("input[name='applicationInfo.seats']").val());
	$("#generatedCourseType").html($("input[name='applicationInfo.courseType'][type='radio']:checked").val());
	$("#generatedOS").html($("select[name='applicationInfo.OS']").val());
	
	var swList = "";
	$("input[name='applicationInfo.SW']").each(function(){
		if(!($(this).val() == ""))
		swList = swList +$(this).val()+",";
	});
	$("#generatedSW").html(swList);
	$("#generatedClass").html($("input[name='applicationInfo.class']").val());
	$("#generatedCommnet").html($("textarea[name='applicationInfo.OtherComment']").val());
	
	
	var beginCourseDate = $("input[name='applicationInfo.beginDate']").val();
	var endCourseDate 	= $("input[name='applicationInfo.endDate']").val();
	var beginCourseTime = $("select[name='applicationInfo.beginTime']").val();
	var endCourseTime = $("select[name='applicationInfo.endTime']").val();
	
	var weekDay = $("input[name='applicationInfo.weekChoosen'][type='radio']:checked").val();
	
	var beginWeek = getSchoolWeek(new Date(beginCourseDate));
	var endWeek = getSchoolWeek(new Date(endCourseDate));
	var tbodyContent = "";
	for(var i=beginWeek;i<=endWeek;i++){
		var weekDate = new Date(schoolBeginMon);
		var daysGap = weekDay-1+7*(i-1);
		weekDate.setDate(weekDate.getDate()+daysGap);
		
		tbodyContent = tbodyContent
		+ "<tr><td >" + weekDate.FormatHPF("yyyy-MM-dd")
		+ "</td><td class='editable simpleInput'>第 "
		+ i
		+ " 周</td><td class='editable simpleInput'>"
		+ transWeekDay(weekDay)
		+ "</td><td class='editable simpleInput'>" + beginCourseTime
		+ "</td><td class='editable simpleInput'>"
		+ endCourseTime
		+  "</td><td><button class='btn' onclick='btnDeleteApp(this)'>删除</button>"
		+ "&nbsp;&nbsp;<button class='btn' onclick='btnAddApp(this)' disabled='disabled'>保存</button>"+"</td></tr>";
	}
	$("#confirm_table tbody").html(tbodyContent);
	return false;
}



function btnDeleteApp(t){
	t.parentElement.parentElement.remove();
}

function getperiod(beginDate,endDate){
	var daysGap = (endDate - beginDate)/86400000;
	var weeksGap = Math.floor(daysGap/7)+1;
	return weeksGap;
}

function getSchoolWeek(curDate){
	
	return getperiod(schoolBeginDate,curDate);
}


function daysBetween(DateOne,DateTwo)  
{   
    var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('-'));  
    var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('-')+1);  
    var OneYear = DateOne.substring(0,DateOne.indexOf ('-'));  
    var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));  
    var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);  
    var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));  
    var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000);   
    return Math.abs(cha);  
}


Date.prototype.FormatHPF = function (fmt) { //author: hpf 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
