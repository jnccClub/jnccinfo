<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div style="clear:both;height:5px;">&nbsp;</div>

<div class="navbar" align="center">
	<!-- navbar-fixed-top -->
	<div class="logo">
		<IMG alt="" id=img1 src="image/background/logo.jpg"
			style=" float: center;">
	</div>
	<div class="ctt">
		Tel / Fax: 0086 25 8666 8888<br> Phone: 0086 139 9999 9999<br>
		Skype: jnccClub &nbsp;&nbsp;&nbsp;&nbsp; <a
			class="btn btn-inverse btn-mini" href="mailto:34638768@qq.com"> <i
			class="icon-envelope-alt"></i> <font color="yellow">&nbsp;&nbsp;SEND
				ME MESSAGE</font>
		</a>
	</div>

<style type="text/css">
#gongao {
	height: 20px;
	overflow: hidden;
	line-height: 20px;
	font-size: 13px;
	font-family: '宋体';
	color: #0C77CF;
	font-weight: bold;
	margin-left: 0px;
	float:left;
	width:40%;
}

#scroll_div{
	width: 200px;
	height: 20px;
	margin-left: 15px;
	white-space: nowrap;
	overflow: hidden;
	text-align: left;
	float: left;
}

#gongao #scroll_begin,#gongao #scroll_end {
	display: inline;
	text-align: left;
}
</style>
<script type="text/javascript">
		function ScrollImgLeft() {
			var speed = 50;
			var scroll_begin = document.getElementById("scroll_begin");
			var scroll_end = document.getElementById("scroll_end");
			var scroll_div = document.getElementById("scroll_div");
			scroll_end.innerHTML = scroll_begin.innerHTML;
			function Marquee() {
				if (scroll_end.offsetWidth - scroll_div.scrollLeft <= 0)
					scroll_div.scrollLeft -= scroll_begin.offsetWidth;
				else
					scroll_div.scrollLeft++;
			}
			var MyMar = setInterval(Marquee, speed);
			scroll_div.onmouseover = function() {
				clearInterval(MyMar);
			}
			scroll_div.onmouseout = function() {
				MyMar = setInterval(Marquee, speed);
			}
		}
	</script>
	
	

	<div id="gongao">
		<div id="scroll_div" class="scroll_div">
			<div id="scroll_begin">welcome to jnccClub, teachers!</div>
			<div id="scroll_end"></div>
		</div>
		<script type="text/javascript">
			ScrollImgLeft();
		</script>
	</div>
	
	<div id="loginEntry">
		<a href="javarscript:(0)" >登录/注册</a>
	</div>
	<div id="logOutEntry">
		<a href='javarscript:(0)'>退出</a>
	</div>

	<!-- <div style="clear:both;height:20px;text-align: left;margin-left: 35px;width:700px">welcome to jnccClub</div> -->


	<ul class="nav"
		style="background-color: #ff6600; height: 45px;clear:both;">
		<li class="navbarFont"><a href="javascript:void(0)"> <i
				class="icon-home"></i> Home</a></li>

		<li class="navbarFont"><a href="javascript:void(0)">Club</a></li>
		<li class="navbarFont"><a href="javascript:void(0)">Application</a></li>
		<li class="navbarFont"><a href="javascript:void(0)">Commnet</a></li>
		<li class="navbarFont"><a href="javascript:void(0)">Faq</a></li>
		<li class="navbarFont"><a href="javascript:void(0)">Contact</a></li>
	</ul>
</div>
