function appFirstNext(){
	getperiod();
	return false;
}
function getperiod(){
	getweekCounts(new Date());
	
}

app_Begindate = new Date();
app_Enddate = new Date();


function getweekCounts(newdate){
	var begindate = new Date("2014-09-01");
	var days = newdate-begindate;
}