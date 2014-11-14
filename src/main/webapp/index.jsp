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
<script type="text/javascript" src='js/common/ajaxfileupload.js'></script>
<script type="text/javascript" src='js/datepick/datepick.js'></script>
<script type="text/javascript" src='js/common/bootstrap-datetimepicker.min.js'></script>
<script type="text/javascript" src='js/file/ajaxfileupload.js'></script>



<title>JNCC booking</title>

</head>
<body>
<script>
	$(function(){
		$("#testdiv_test").removeClass();
		$("#testdiv_test label").removeClass();
		$("#testdiv_test label input").removeClass().addClass("option-input-radio radioround");
		
	});
</script>
	<div class="container">
		<jsp:include page="navBar/navigationBar.jsp"></jsp:include>
		
		<jsp:include page="configInfo/MF_SW_CFG.jsp"></jsp:include>
	</div>
</body>
</html>