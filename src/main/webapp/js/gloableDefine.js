﻿
$(function(){
	schoolBeginMon = getFirstBeginMon();
});


function getFirstBeginMon() {
	var day = schoolBeginDate.getDay();
	var beginMon = new Date();

	switch (day) {
	case 0:
		beginMon.setDate(schoolBeginDate.getDate()+1);
		break;
	case 1:
		beginMon = schoolBeginDate;
		break;
	case 2:
		beginMon.setDate(schoolBeginDate.getDate()-1);
		break;
	case 3:
		beginMon.setDate(schoolBeginDate.getDate()-2);
		break;
	case 4:
		beginMon.setDate(schoolBeginDate.getDate()-3);
		break;
	case 5:
		beginMon.setDate(schoolBeginDate.getDate()-4);
		break;
	case 6:
		beginMon.setDate(schoolBeginDate.getDate()-5);
		break;
	}
	return beginMon;
}

function transWeekDay(weekday){
	switch (weekday) {
	case "0":
		return "日";
		break;
	case "1":
		return "一";
		break;
	case "2":
		return "二";
		break;
	case "3":
		return "三";
		break;
	case "4":
		return "四";
		break;
	case "5":
		return "五";
		break;
	case "6":
		return "六";
		break;
	case "7":
		return "日";
		break;
	}
	return "一";
}