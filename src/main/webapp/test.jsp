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


<title>JNCC booking</title>

</head>
<body>
	test
	<div>
		<script>
			function ajaxFileUpload() {
				//starting setting some animation when the ajax starts and completes
				$("#loading").ajaxStart(function() {
					$(this).show();
				}).ajaxComplete(function() {
					$(this).hide();
				});
				/*
				    prepareing ajax file upload
				    url: the url of script file handling the uploaded files
				                fileElementId: the file type of input element id and it will be the index of  $_FILES Array()
				    dataType: it support json, xml
				    secureuri:use secure protocol
				    success: call back function when the ajax complete
				    error: callback function when the ajax failed
				    
				 */
				$.ajaxFileUpload({
					url : 'file_upload.action',
					secureuri : false,
					fileElementId : 'fileToUpload',
					dataType : 'json',
					success : function(data, status) {
						if (typeof (data.error) != 'undefined') {
							if (data.error != '') {
								alert(data.error);
							} else {
								alert(data.msg);
							}
						}
					},
					error : function(data, status, e) {
						alert(e);
					}
				});
				return false;
			}
		</script>

		<div id="wrapper">
			<div id="content">
				<h1>Ajax File Upload Demo</h1>
				<p>Jquery File Upload Plugin - upload your files with only one
					input field</p>
				<p>
					need any Web-based Information System?<br> Please <a
						href="http://www.phpletter.com/">Contact Us</a><br> We are
					specialized in <br>
				<ul>
					<li>Website Design</li>
					<li>Survey System Creation</li>
					<li>E-commerce Site Development</li>
				</ul>
				<img id="loading" src="loading.gif" style="display:none;">
				<form name="form" action="" method="POST"
					enctype="multipart/form-data">
					<table cellpadding="0" cellspacing="0" class="tableForm">

						<thead>
							<tr>
								<th>Please select a file and click Upload button</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input id="fileToUpload" type="file" size="45"
									name="fileToUpload" class="input"></td>
							</tr>

						</tbody>
						<tfoot>
							<tr>
								<td><button class="button" id="buttonUpload"
										onclick="return ajaxFileUpload();">Upload</button></td>
							</tr>
						</tfoot>

					</table>
				</form>
			</div>
		</div>
</body>
</html>