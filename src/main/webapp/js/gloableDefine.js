$(function(){
	schoolBeginDate = new Date("2015-08-31");
	updateFirstBeginMon(schoolBeginDate);
});

function getCurWeek(schoolBeginDate,today){
	var iDays = parseInt(Math.abs(today -  schoolBeginDate) / 1000 / 60 / 60 /24);
	var weekCount = parseInt(iDays/7);
	return weekCount;
}

function getCurDate(semester,curWeek){
	var weekMonDate = new Date(semester.replace(/-/g,   "/"));
	var daysGap =  7 * (curWeek - 1);
	weekMonDate.setDate(weekMonDate.getDate() + daysGap);
	return weekMonDate;
}

function updateFirstBeginMon(schoolBeginDate) {
	var day = schoolBeginDate.getDay();
	schoolBeginMon = new Date();
	switch (day) {
	case 0:
		schoolBeginMon.setDate(schoolBeginDate.getDate()+1);
		break;
	case 1:
		schoolBeginMon = schoolBeginDate;
		break;
	case 2:
		schoolBeginMon.setDate(schoolBeginDate.getDate()-1);
		break;
	case 3:
		schoolBeginMon.setDate(schoolBeginDate.getDate()-2);
		break;
	case 4:
		schoolBeginMon.setDate(schoolBeginDate.getDate()-3);
		break;
	case 5:
		schoolBeginMon.setDate(schoolBeginDate.getDate()-4);
		break;
	case 6:
		schoolBeginMon.setDate(schoolBeginDate.getDate()-5);
		break;
	default:
		break;
	}
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