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
<link rel="shortcut icon" href="ico/favicon.ico">

<link
	href="<s:url value='/css/main.css' encode='false' includeParams='none'/>"
	rel="stylesheet" type="text/css" media="all" />
<script src="js/common/jquery.min.js"></script>
<script src="js/common/bootstrap.min.js"></script>
<script src="js/common/site.js"></script>
<script type="text/javascript" src="js/Calendar4.js"></script>
<script type="text/javascript" src='js/common/jquery.blockUI.js'></script>
<script type="text/javascript" src='js/datepick/datepick.js'></script>
<script type="text/javascript"
	src='js/common/bootstrap-datetimepicker.min.js'></script>
<script type="text/javascript" src='js/file/ajaxfileupload.js'></script>
<script type="text/javascript" src='js/gloableDefine.js'></script>
<title>JNCC booking</title>
</head>
<body>
	<jsp:include page="chat/chat.jsp"></jsp:include>
	<div class="container">
		<jsp:include page="navBar/navigationBar.jsp"></jsp:include>
		<jsp:include page="configInfo/MF_STATISTIC.jsp"></jsp:include>
		<jsp:include page="login/mainFrame_Login.jsp"></jsp:include>
		<jsp:include page="bbs.jsp"></jsp:include>
		<jsp:include page="home.jsp"></jsp:include>
		<jsp:include page="login/mainFrame_SignUp.jsp"></jsp:include>
		<jsp:include page="configInfo/MF_SW_CFG.jsp"></jsp:include>
		<jsp:include page="configInfo/MF_ZONE_CFG.jsp"></jsp:include>
		<jsp:include page="configInfo/MF_COURSE_CFG.jsp"></jsp:include>
		<jsp:include page="queryInfos.jsp"></jsp:include>
		<jsp:include page="weekInfos.jsp"></jsp:include>
		<jsp:include page="bodyContent/MF_Body.jsp"></jsp:include>
		<jsp:include page="stuBooking.jsp"></jsp:include>

		<div class="clearfix"></div>
	</div>

	<div id="circular">
		<div id="circular_1" class="circular"></div>
		<div id="circular_2" class="circular"></div>
		<div id="circular_3" class="circular"></div>
		<div id="circular_4" class="circular"></div>
		<div id="circular_5" class="circular"></div>
		<div id="circular_6" class="circular"></div>
		<div id="circular_7" class="circular"></div>
		<div id="circular_8" class="circular"></div>
		<div class="clearfix"></div>
	</div>

</body>

<script type="text/javascript" src='js/mainFrame.js'></script>

<script type="text/javascript" src='js/table/EdTable.js'></script>
<script type="text/javascript" src='js/common/jquery.contextmenu.r2.js'></script>
<script type="text/javascript" src='js/table/softwareOperate.js'></script>
<script type="text/javascript" src='js/application/application.js'></script>
<script type="text/javascript" src='js/application/tSelfBook.js'></script>
<script type="text/javascript" src='js/application/adjustArrangement.js'></script>
<script type="text/javascript" src='js/application/appProgress.js'></script>
<script type="text/javascript" src='js/application/audit_app.js'></script>
<script type="text/javascript" src='js/query/queryinfo.js'></script>
<script type="text/javascript" src='js/bbs/bbs.js'></script>
<script type="text/javascript" src='js/stuBooking/stuBooking.js'></script>
<script type="text/javascript" src='js/profile/profile.js'></script>


<script type="text/javascript" src='js/cfg/zoneConfig.js'></script>
<script type="text/javascript" src='js/cfg/course.js'></script>
<script type="text/javascript" src='js/common/jquery.easyui.min.js'></script>
<script type="text/javascript" src="js/common/jquery.seat-charts.min.js"></script>
<script type="text/javascript" src="media/js/table-editable.js"></script>
<script type="text/javascript" src="media/js/jquery.dataTables.js"></script>


</html>