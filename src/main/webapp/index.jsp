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
<meta name="keywords"   content="jncc,booking,huangpengfei" />
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



<title>JNCC booking</title>

</head>
<body>
	<script>
		var currentShowID = "#mainFrame_Body";
		var userName = "test";
		$(document).ready(function() {
			$("#loginEntry").click(function() {
				renewMainId("#mainFrame_Login");
			});

			$("#logOutEntry").click(function() {
				alert("come to relogin");
				username = "";
				$("#loginEntry").html('<a href="javarscript:(0)" >登录/注册</a>');
				$("#logOutEntry").hide();
			});
		});
		function renewMainId(newId) {
			$(currentShowID).hide();
			currentShowID = newId;
			$(currentShowID).show();
		}
	</script>

	<div id='wrapper'>
		<form>
			<select class='custom-date' name='select'>
				<option value='7'>7 Days</option>
				<option value='30'>30 Days</option>
				<option selected='selected' value='90'>90 Days</option>
				<option value='180'>180 Days</option>
				<option value='365'>365 Days</option>
				<option value='custom'>Custom</option>
			</select>
		</form>
	</div>

	<div class="container">



		<jsp:include page="navBar/navigationBar.jsp"></jsp:include>
		<jsp:include page="bodyContent/mainFrame_Body.jsp"></jsp:include>
	</div>

</body>
</html>