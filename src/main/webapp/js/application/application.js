function appFirstNext(){
	getperiod();
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