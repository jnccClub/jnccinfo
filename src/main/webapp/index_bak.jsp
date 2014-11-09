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
<title>旺旺网</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/Calendar4.js"></script>
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
		});
		function renewMainId(newId) {
			$(currentShowID).hide();
			currentShowID = newId;
			$(currentShowID).show();
		}
	</script>
	<jsp:include page="navBar/navigationBar.jsp"></jsp:include>
	<jsp:include page="login/mainFrame_Login.jsp"></jsp:include>
	<jsp:include page="login/mainFrame_SignUp.jsp"></jsp:include>
	<jsp:include page="bodyContent/mainFrame_Body.jsp"></jsp:include>


</body>
</html>