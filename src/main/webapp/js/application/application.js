function appFirstNext(){
	var curTime = new Date().FormatHPF("yyyyMMddhhmmssS");
	var generatedAppID =  "CC"+curTime;
	$("#generatedAppID").html(generatedAppID);
	$("#generatedCourse").html($("#courseNameInput").val());
	
	var tt = $("#beginDatepick input").val() ;
	var dd = $("#endDatepick input").val() ;
	var t1 = new Date(tt);
	var t2 = new Date(dd);
	var t3 = new Date(t1 +90);
	var t4 = t2.getDay();
	t2.setDate(t2.getDate()+50);
	var t5 = t2.getDay();
	
	
	
	
	var cc = getperiod(new Date(tt),new Date(dd));
	return false;
}
function getperiod(beginDate,endDate){
	var daysGap = (endDate - beginDate)/86400000;
	var weeksGap = Math.floor(daysGap/7)+1;
	return weeksGap;
}

function getSchoolWeek(curDate){
	var schoolBeginDate = new Date("2014-09-01");
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

$(function(){
	var today = new Date().FormatHPF("yyyy-MM-dd");
	$("#beginDatepick input").val(today);
	$("#endDatepick input").val(today);
});


Date.prototype.FormatHPF = function (fmt) { //author: meizz 
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
