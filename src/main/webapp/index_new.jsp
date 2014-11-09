<%@ page contentType="text/html;charset=UTF-8" language="java"%>



<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="jncc booking" />
<meta name="keywords"   content="jncc,booking,huangpengfei" />
<meta name="author" content="huangpengfei" />
<link rel="shortcut icon" href="../favicon.ico">
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/main.css" />

<script src="js/nav/modernizr.custom.js"></script>
<script src="js/nav/classie.js"></script>
<script src="js/nav/gnmenu.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/Calendar4.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="navBar/navigationBar.jsp"></jsp:include>
		<jsp:include page="login/mainFrame_Login.jsp"></jsp:include>
		<jsp:include page="login/mainFrame_SignUp.jsp"></jsp:include>
		<jsp:include page="bodyContent/mainFrame_Body.jsp"></jsp:include>
	</div>


	<script>
		var currentShowID = "#mainFrame_Body";
		var userName = "test";
		$(document).ready(function() {
			$("#loginEntry").click(function() {
				alert("login begin!");
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
</body>
</html>
