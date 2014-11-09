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

<script src="js/nav/modernizr.custom.js"></script>
<script src="js/nav/classie.js"></script>
<script src="js/nav/gnmenu.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/Calendar4.js"></script>

<title>旺旺网</title>
<link
	href="<s:url value='/css/main.css' encode='false' includeParams='none'/>"
	rel="stylesheet" type="text/css" media="all" />
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
			new gnMenu(document.getElementById('gn-menu'));
		});
		function renewMainId(newId) {
			$(currentShowID).hide();
			currentShowID = newId;
			$(currentShowID).show();
		}
	</script>
	<jsp:include page="navBar/navigationBar.jsp"></jsp:include>


</body>
</html>