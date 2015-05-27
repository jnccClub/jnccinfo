<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="jncc booking" />
<meta name="keywords" content="jncc,booking,huangpengfei" />
<meta name="author" content="huangpengfei" />
<link rel="shortcut icon" href="../favicon.ico">

<link
	href="<s:url value='/css/main.css' encode='false' includeParams='none'/>"
	rel="stylesheet" type="text/css" media="all" />

<script src="js/common/jquery.min.js"></script>
<script src="js/common/bootstrap.min.js"></script>
<script src="js/common/site.js"></script>
<script type="text/javascript" src="js/Calendar4.js"></script>
<script type="text/javascript" src='js/common/jquery.js'></script>
<script type="text/javascript" src='js/datepick/datepick.js'></script>
<script type="text/javascript"
	src='js/common/bootstrap-datetimepicker.min.js'></script>
<script type="text/javascript" src='js/file/ajaxfileupload.js'></script>

<script type="text/javascript" src='js/table/EdTable.js'></script>
<script type="text/javascript" src='js/common/jquery.contextmenu.r2.js'></script>
<script type="text/javascript" src='js/table/softwareOperate.js'></script>
<script type="text/javascript" src='js/application/application.js'></script>
<script type="text/javascript" src='js/application/audit_app.js'></script>
<script type="text/javascript" src='js/query/queryinfo.js'></script>
<script type="text/javascript" src='js/bbs/bbs.js'></script>
<script type="text/javascript" src='js/stuBooking/stuBooking.js'></script>
<script type="text/javascript" src='js/gloableDefine.js'></script>
<script type="text/javascript" src='js/cfg/zoneConfig.js'></script>
<script type="text/javascript" src='js/cfg/course.js'></script>
<script type="text/javascript" src='js/common/jquery.easyui.min.js'></script>
<script type="text/javascript" src="js/common/jquery.seat-charts.min.js"></script>
<link href="media/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="media/css/select2_metro.css" />
<link rel="stylesheet" href="media/css/DT_bootstrap.css" />
<title>自助预定机器</title>
</head>
<body>
	<div>
		<div style="text-align: center">
			<h2>计算中心机器使用情况一览</h2>
			<p>包含计算中心当前实验室所有位置信息</p>
		</div>
		<form id="MF_SEATDETAIL span6" >
			<div class="div_all_inline" style="text-align: center;">
				预定日期：<span ><input
					type="text" class="span3"
					onclick="MyCalendar.SetDate(this)" name="stuBooking.date"
					required="true" missingMessage="日期必须选择" validType="date"
					id="bookingDate"></input></span> &nbsp;&nbsp;&nbsp;&nbsp;楼层区域：<span><select
					class="span3" name="stuBooking.zone">
				</select></span>
			</div>
			<div class="div_all_inline" style="text-align: center">
				开始时间：<span><select
					class="span3" name="stuBooking.beginTime"></select></span>
				结束时间：<span><select class="span3"
					name="stuBooking.endTime">
				</select></span> <br> <input type="button" class="loginBtn" value="约"
					id="btnBookNext" onclick="bookNext()" /> 
			</div>
		</form>
		<div class="stu_demo" id="DIV_SEATDETAIL">
			<div id="seat-map">
				<div class="front">教师机或讲台</div>
				<div id="seat-info"></div>
			</div>
			<div class="booking-details">

				<h3>机房机位信息：</h3>
				<p>座位：</p>
				<ul id="selected-seats">
					<li id="cart-item-02_F"><br>待选机位<br> <br></li>
				</ul>
				<div id="legend"></div>
				<br><br>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var firstSeatLabel = 1;
		$(function() {
			var $cart = $('#selected-seats'), bookZone = $("select[name='stuBooking.zone']");
			sc = $('#seat-map')
					.seatCharts(
							{
								map : [ //座位图
								'fff_ff', 'fff_ff', '______', 'eee_ee',
										'eee_ee', 'eee_ee', 'eee_ee', 'eee_ee',
										'eee_ee', 'eee_ee', 'eee_ee', 'eee_ee' ],
								seats : { //定义座位属性
									f : {
										classes : 'first-class',
										category : '教师机'
									},
									e : {
										classes : 'economy-class',
										category : '学生机'
									}
								},
								naming : { //定义行列等信息
									top : false,
									//columns : [ 1, 2, 3, '', 4, 5 ],
									//rows : [ 1, 2, '', 3, 4, 5, 6, 7, 8, 9, 10],
									getLabel : function(character) {
										return firstSeatLabel++;
									}
								},
								legend : { //定义图例
									node : $('#legend'),
									items : [ [ 'f', 'available', '已预订' ],
											[ 'e', 'available', '空闲' ],
											[ 'f', 'unavailable', '使用中' ] ]
								},
								click : function() {
									if (this.status() == 'available') {//可选座
										$cart
												.html($(
														'<li><br/>'
																+ bookZone
																		.val()
																+ "区-"
																+ this.settings.label
																+ '机位<br/><br/>'
																+ '</li>')
														.attr(
																'id',
																'cart-item-'
																		+ this.settings.id)
														.data(
																'seatId',
																this.settings.id));
										var curID = this.settings.id;
										//删除已选择
										resetOtherSelected(sc, curID);
										return 'selected';
									} else if (this.status() == 'selected') {//已选中
										//删除已预订座位
										$('#cart-item-' + this.settings.id)
												.remove();
										$cart.html("<li><br>待选机位<br><br></li>");
										return 'available';
									} else if (this.status() == 'unavailable') {//已售出
										//已售出
										return 'unavailable';
									} else {
										return this.style();
									}
								}
							});
		});

		function resetOtherSelected(sc, curID) {
			sc.find('selected').each(function() {
				if (this.settings.id != curID) {
					sc.status(this.settings.id, 'available');
				}
			});
		}
		//计算总金额
		function recalculateTotal(sc) {
			var total = 0;
			sc.find('selected').each(function() {
				total += this.data().price;
			});
			setInterval(function() {
				$.ajax({
					type : 'get',
					url : 'book.php',
					dataType : 'json',
					success : function(response) {
						//遍历所有座位  
						$.each(response.bookings, function(index, booking) {
							//将已售出的座位状态设置为已售出 
							sc.status(booking.seat_id, 'unavailable');
						});
					}
				});
			}, 10000);

			return total;
		}
	</script>
</body>
</html>


<style type="text/css">
.stu_demo {
	width: 620px;
	margin: 40px auto 0 auto;
	min-height: 450px;
}

@media screen and (max-width: 360px) {
	.demo {
		width: 340px
	}
}

.front {
	width: 160px;
	margin: 5px 32px 20px 32px;
	background-color: #f0f0f0;
	color: #666;
	text-align: center;
	padding: 3px;
	border-radius: 5px;
}

.booking-details {
	position: relative;
	top: 60px;
	width: 300px;
	height: 370px;
}

.booking-details h3 {
	margin: 5px 5px 0 0;
	font-size: 16px;
}

.booking-details p {
	line-height: 26px;
	font-size: 16px;
	color: #999
}

.booking-details p span {
	color: #666
}

div.seatCharts-cell {
	color: #182C4E;
	height: 25px;
	width: 25px;
	line-height: 25px;
	margin: 3px;
	float: left;
	text-align: center;
	outline: none;
	font-size: 13px;
}

div.seatCharts-seat {
	color: #fff;
	cursor: pointer;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	/*text-indent: -999em*/
}

div.seatCharts-row {
	height: 35px;
}

div.seatCharts-seat.available {
	background-color: #B9DEA0;
}

div.seatCharts-seat.focused {
	background-color: #76B474;
	border: none;
}

div.seatCharts-seat.selected {
	background-color: #E6CAC4;
}

div.seatCharts-seat.unavailable {
	background-color: #472B34;
	cursor: not-allowed;
}

div.seatCharts-container {
	border-right: 1px dotted #adadad;
	width: 240px;
	padding: 20px;
	float: left;
	background: url(seat_bg.gif) no-repeat 6px 8px;
}

div.seatCharts-seat.available.first-class {
	background-color: #3a78c3;
}

#seat-info {
	position: absolute;
	padding: 4px 8px;
	background: #ffc;
	border-radius: 5px;
	display: none
}

div.seatCharts-legend {
	padding-left: 0px;

}

ul.seatCharts-legendList {
	padding-left: 0px;
}

.seatCharts-legendItem {
	float: left;
	width: 90px;
	margin-top: 10px;
	line-height: 2;
}

span.seatCharts-legendDescription {
	margin-left: 5px;
	line-height: 30px;
}

.checkout-button {
	display: block;
	width: 80px;
	height: 24px;
	line-height: 20px;
	margin: 10px auto;
	border: 1px solid #999;
	font-size: 14px;
	cursor: pointer
}

#selected-seats {
	max-height: 220px;
	overflow-y: auto;
	overflow-x: none;
	width: 260px;
}

#selected-seats li {
	float: left;
	width: 100px;
	border: 1px solid #d3d3d3;
	background: #f7f7f7;
	margin: 6px;
	font-size: 14px;
	font-weight: bold;
	text-align: center
}

.div_all_inline * {
	display: inline-block;
	*display: inline;
	*zoom: 18;
}
</style>