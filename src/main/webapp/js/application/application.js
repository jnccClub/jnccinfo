$(function(){
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


function appFirstNext(){
	var curTime = new Date().FormatHPF("yyyyMMddhhmmssS");
	var generatedAppID =  "CC"+curTime;
	$("#generatedAppID").html(generatedAppID);
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
	$("#generatedEmail").html($("input[name='applicationInfo.Email']").val());
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
	var rowIndex = t.parentElement.parentElement.rowIndex;
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
