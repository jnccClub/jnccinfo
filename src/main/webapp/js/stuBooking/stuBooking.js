function stuBookingShow() {
	renewMainId('#MF_STUBOOKING');

}

function stuSbumit() {
	var seatInfo = $("#selected-seats li").text();
	var seatPos = seatInfo.indexOf("-");
	var seat = "";
	if (seatPos < 0) {
		alert("位置信息异常，请联系管理员");
		return;
	} else {
		seat = seatInfo.substr(seatPos + 1).replace("机位", "");
	}
	var seatid = $("#selected-seats li").attr("id").replace("cart-item-", "");
	if (seat == "") {
		alert("请选择作为或位置信息异常，请联系管理员");
		return;
	} else {
		var param=[{name:"eseat.id.zone",value:$("select[name='stuBooking.zone']").val()},{
					name:"eseat.begintime",value:$("select[name='stuBooking.beginTime']").val()},{
					name:"eseat.endtime",value:$("select[name='stuBooking.endTime']").val()},{
					name:"eseat.id.date",value:$("input[name='stuBooking.date']").val()},{
					name:"eseat.seat",value:seat},{
					name:"eseat.id.seatid",value:seatid}];
		bookingSeat(param);
	}
}
function bookingSeat(param) {
	$.ajax({
		type : 'post',
		url : 'comAction/seat_bookSeat.action',
		data : param,
		dataType : 'json',
		success : function(data) {
			if(data.resultCode=="200"){
				alert("预定成功，请准时赴约！");
			}else{
				alert("预定失败，可能是后台有人在搞鬼，请向管理员举报！");
			}
			
		}
	});
}

function getSeatstatus(){
	var param=[{name:"eseat.id.zone",value:$("select[name='stuBooking.zone']").val()},{
		name:"eseat.begintime",value:$("select[name='stuBooking.beginTime']").val()},{
		name:"eseat.endtime",value:$("select[name='stuBooking.endTime']").val()},{
		name:"eseat.id.date",value:$("input[name='stuBooking.date']").val()}];
	$.ajax({
		type : 'post',
		url : 'comAction/seat_getSeatStatus.action',
		data : param,
		dataType : 'json',
		success : function(data) {
			if(data.resultCode=="200"){
				alert("所有机器均可预约");
			}else if(data.resultCode=="400"){
				alert("部分不可以预约！");
				
			}
			
		}
	});
	
}

function genTimeOption() {
	var timeOptions = "";
	for (var i = 9; i < 21; i++) {
		if (i < 10) {
			timeOptions = timeOptions + "<option value='" + i + "'>0" + i
					+ ":00</option>";
		} else {
			timeOptions = timeOptions + "<option value='" + i + "'>" + i
					+ ":00</option>";
		}
	}
	var beginOptions = "<option value='8'>08:00</option>";
	var endOptions = "<option value='21'>21:00</option>";
	beginOptions = beginOptions + timeOptions;
	endOptions = timeOptions + endOptions;
	$("select[name='stuBooking.beginTime']").html(beginOptions);
	$("select[name='stuBooking.endTime']").html(endOptions);
	$("select[name='stuBooking.beginTime']").change(function() {
		var selectIndex = this.selectedIndex;
		$("select[name='stuBooking.endTime'] option").each(function(i) {
			if (i == selectIndex) {
				$(this).attr("selected", true);
			}
			if (i < selectIndex) {
				$(this).attr("disabled", true);
			} else if (i > selectIndex + 3) {
				$(this).attr("disabled", true);
			} else {
				$(this).attr("disabled", false);
			}
		});
		
		
		getSeatstatus();
	});

}
function genFloorOption() {
	var floorOptions = "";
	floorOptions = floorOptions + "<option value='" + "7B" + "'>" + "7B"
			+ "</option>";
	floorOptions = floorOptions + "<option value='" + "7C" + "'>" + "7C"
			+ "</option>";
	floorOptions = floorOptions + "<option value='" + "7E" + "'>" + "7E"
			+ "</option>";
	floorOptions = floorOptions + "<option value='" + "7F" + "'>" + "7F"
			+ "</option>";
	floorOptions = floorOptions + "<option value='" + "8B" + "'>" + "8B"
			+ "</option>";
	floorOptions = floorOptions + "<option value='" + "8C" + "'>" + "8C"
			+ "</option>";
	floorOptions = floorOptions + "<option value='" + "8E" + "'>" + "8E"
			+ "</option>";
	floorOptions = floorOptions + "<option value='" + "8F" + "'>" + "8F"
			+ "</option>";
	$("select[name='stuBooking.zone']").html(floorOptions);
}

$(function() {
	genTimeOption();
	genFloorOption();
	$("input[name='stuBooking.date']").validatebox();

});