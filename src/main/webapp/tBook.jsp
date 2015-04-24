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

	<div id="MF_TBOOK" style="margin: 2em 3em 0 3em">
		<div class="portlet box red">
			<div class="portlet-title">
				<div class="caption">
					<b>计算中心教师自助预定</b>
				</div>
			</div>
			<div class="portlet-body">
				<form class="form-inline">
					<div class="radio">
						<label class="control-label">当前可使用实验室：</label> <input
							value="Heaven" disabled="disabled" id="T_CPU_ZONE"></input>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="javascript:void(0)" class="btn btn-primary btn-large"
							onclick="bookSeatTeacher()">使用此区域</a>
					</div>
				</form>
				<div id="COURSEINFO_SELF">教师姓名： 课程名称： 班级信息： 预定区域：</div>
			</div>
			<div>说明：仅允许上课同学机器异常时自助预定。</div>
		</div>
	</div>
	<script>
		$(function() {
			var xhr = $.ajax({
				url : 'res_queryTeacherzone.action?redirectURL=tBook.jsp',
				type : 'post',
				data : null,
				dataType : 'json',
				success : function(data, status) {
					if (status == "success") {
						var refused = xhr.getResponseHeader("refused"); //通过XMLHttpRequest取得响应头，refused，  
						if (refused == "true") {
							alert("尚未登录，请您登录后预定！");
							//如果超时就处理 ，指定要跳转的页面  
							window.location.replace("login.jsp");
						} else {
							$("#COURSEINFO_SELF").html(data.resultDesc);
							$("#T_CPU_ZONE").val(data.resultCode);
						}
					}

				},
				error : function(data, status, e) {
					alert(e);
				},
				complete : function() {
					//$("#circular").hide();
				}
			});

		});
		function bookSeatTeacher() {
			var cpuName = $("#T_CPU_ZONE").val();
			var param = [ {
				name : "cpuName",
				value : cpuName
			} ];
			$.ajax({
				url : 'res_bookTeacherzone.action',
				type : 'post',
				data : param,
				dataType : 'json',
				success : function(data, status) {
					if (status == "success") {
						if (data.resultCode == "200") {
							alert("恭喜你，预定成功！\r\n" + "来自服务器的消息是: "
									+ data.resultDesc);
						} else {
							alert("恭喜你，预定成功！\r\n" + "来自服务器的消息是: "
									+ data.resultDesc);
						}
					}
				},
				error : function(data, status, e) {
					alert(e);
				},
				complete : function() {
					//$("#circular").hide();
				}
			});
		}
	</script>
</body>
</html>