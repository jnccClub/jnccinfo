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
<link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
<link href="media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="media/css/style-metro.css" rel="stylesheet" type="text/css"/>
<link href="media/css/style.css" rel="stylesheet" type="text/css"/>
<link href="media/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="media/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="media/css/select2_metro.css" />
<link rel="stylesheet" href="media/css/DT_bootstrap.css" />
<!-- END PAGE LEVEL STYLES -->


<script src="js/common/jquery.min.js"></script>
<script src="js/common/bootstrap.min.js"></script>
<script src="js/common/site.js"></script>
<script src="media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>  
	<!-- BEGIN PAGE LEVEL PLUGINS -->	
<script type="text/javascript" src="media/js/select2.min.js"></script>
<script type="text/javascript" src="media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="media/js/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
<script src="media/js/table-editable.js"></script> 
<script src="media/js/app.js"></script>
<script src="js/profile/profile.js"></script>
<title>JNCC booking</title>
</head>
<body>
<div id="MF_PROFILE" class="container">
	<h2>基本信息维护</h2>
	<!-- BEGIN PAGE CONTENT-->

	<div class="row-fluid">
		<div class="span12">
			<!-- BEGIN EXAMPLE TABLE PORTLET-->
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-edit"></i>帐户信息维护
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse"></a> <a
							href="#portlet-config" data-toggle="modal" class="config"></a> <a
							href="javascript:;" class="reload"></a> <a href="javascript:;"
							class="remove"></a>
					</div>
				</div>

				<div class="portlet-body">

					<div class="clearfix">

						<div class="btn-group">

							<button id="sample_editable_1_new" class="btn green">

								添加新人物<i class="icon-plus"></i>

							</button>

						</div>

						<div class="btn-group pull-right">

							<button class="btn dropdown-toggle" data-toggle="dropdown">
								工具 <i class="icon-angle-down"></i>

							</button>

							<ul class="dropdown-menu pull-right">

								<li><a href="#">打印</a></li>

								<li><a href="#">存为PDF</a></li>

								<li><a href="#">导出到Excel</a></li>

							</ul>

						</div>

					</div>

					<table class="table table-striped table-hover table-bordered"
						id="sample_editable_1">
					</table>

				</div>

			</div>

			<!-- END EXAMPLE TABLE PORTLET-->

		</div>

	</div>

	<!-- END PAGE CONTENT -->

</div>
</body>
</html>
<!-- END PAGE CONTAINER-->
