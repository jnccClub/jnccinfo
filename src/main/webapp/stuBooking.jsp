<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="MF_STUBOOKING">
	<div style="text-align: center">
		<h2>欢迎预定！</h2>
		<p>每人仅允许预定一个座位！预定时间的5分钟以内必须刷卡上机，否则记违约一次！</p>
	</div>
	<div class="div_all_inline" style="text-align: center">
		预定日期：<span style="width:200px;text-align:left"><input
			type="text" style="width:160px;height:29.5px;"
			onclick="MyCalendar.SetDate(this)" name="stuBooking.date"
			required="true" missingMessage="日期必须选择" validType="date" id="bookingDate"></input></span>
		楼层区域：<span><select style="width:160px;height:29.5px;"
			name="stuBooking.zone">
		</select></span>
	</div>
	<div class="div_all_inline" style="text-align: center">
		开始时间：<span style="width:200px;text-align:left"><select
			style="width:160px;height:29.5px;" name="stuBooking.beginTime"></select></span>
		结束时间：<span><select style="width:160px;height:29.5px;"
			name="stuBooking.endTime">
		</select></span>
	</div>
</div>

<div class="stu_demo">
	<div id="seat-map">
		<div class="front">教师机或讲台</div>
		<div id="seat-info"></div>
	</div>
	<div class="booking-details">

		<h3>机房机位信息：</h3>
		<p>座位：</p>
		<ul id="selected-seats">
			<li id="cart-item-02_F"><br>待选机位<br><br></li>
		</ul>
		<br>
		<br>
		<br>
		<input type="button" class="loginBtn" type="submit" value="那就这样吧"
				id="btnCheckout" onclick="stuSbumit()"/> 
		<div id="legend"></div>
	</div>
</div>
<br />
<script type="text/javascript">
	var firstSeatLabel = 1;
	$(function() {
		var $cart = $('#selected-seats'), bookZone=$("select[name='stuBooking.zone']"),sc = $('#seat-map').seatCharts(
				{
					map : [ //座位图
					'ff__ff', 'ff__ff', '______', 'eee_ee', 'eee_ee', 'eee_ee',
							'eee_ee', 'eee_ee', 'eee_ee' ],
					seats : { //定义座位属性
						f : {
							classes : 'first-class',
							category : '一等座'
						},
						e : {
							classes : 'economy-class',
							category : '二等座'
						}
					},
					naming : { //定义行列等信息
						top : true,
						columns : [ 1, 2, 3, '', 4, 5 ],
						rows : [ 1, 2, '', 3, 4, 5, 6, 7,
								8, 9 ],
						getLabel : function(character, row, column) {
							return firstSeatLabel++;
						}
					},
					legend : { //定义图例
						node : $('#legend'),
						items : [ [ 'f', 'available', '教师机' ],
								[ 'e', 'available', '学生机' ],
								[ 'f', 'unavailable', '使用中' ] ]
					},
					click : function() {
						if (this.status() == 'available') {//可选座
							$cart.html($(
									'<li><br/>' +bookZone.val()+"区-"+ this.settings.label + '机位<br/><br/>'
											+ '</li>').attr('id',
									'cart-item-' + this.settings.id).data(
									'seatId', this.settings.id));
							var curID = this.settings.id;
							//删除已选择
							resetOtherSelected(sc, curID);
							return 'selected';
						} else if (this.status() == 'selected') {//已选中
							//删除已预订座位
							$('#cart-item-' + this.settings.id).remove();
							$cart.html("<li><br>待选机位<br><br></li>");
							return 'available';
						} else if (this.status() == 'unavailable') {//已售出
							//已售出
							return 'unavailable';
						} else {
							return this.style();
						}
					}/*,
					focus : function() {
						if (this.status() == 'available') {
							$("#seat-info").show().html(this.settings.label);
							var cd = getMousePoint(event);
							$("#seat-info").css({
								"left" : (cd.x + 10) + 'px',
								"top" : (cd.y - 30) + "px"
							});
							return 'focused';
						} else {
							return this.style();
						}
					}*/
				});

		//已售出不可选座
		sc.get([ '1_1', '4_1', '7_2', '7_5' ]).status('unavailable');
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

	//获取鼠标坐标位置
	/*
	function getMousePoint(ev) {
		// 定义鼠标在视窗中的位置  
		var point = {
			x : 0,
			y : 0
		};

		// 如果浏览器支持 pageYOffset, 通过 pageXOffset 和 pageYOffset 获取页面和视窗之间的距离  
		if (typeof window.pageYOffset != 'undefined') {
			point.x = window.pageXOffset;
			point.y = window.pageYOffset;
		}
		// 如果浏览器支持 compatMode, 并且指定了 DOCTYPE, 通过 documentElement 获取滚动距离作为页面和视窗间的距离  
		// IE 中, 当页面指定 DOCTYPE, compatMode 的值是 CSS1Compat, 否则 compatMode 的值是 BackCompat  
		else if (typeof document.compatMode != 'undefined'
				&& document.compatMode != 'BackCompat') {
			point.x = document.documentElement.scrollLeft;
			point.y = document.documentElement.scrollTop;
		}
		// 如果浏览器支持 document.body, 可以通过 document.body 来获取滚动高度  
		else if (typeof document.body != 'undefined') {
			point.x = document.body.scrollLeft;
			point.y = document.body.scrollTop;
		}

		// 加上鼠标在视窗中的位置  
		point.x += ev.clientX;
		point.y += ev.clientY;

		// 返回鼠标在视窗中的位置  
		return point;
	}*/
</script>

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
	float: right;
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
	position: absolute;
	bottom: 16px;
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
	*zoom: 18
}
</style>
