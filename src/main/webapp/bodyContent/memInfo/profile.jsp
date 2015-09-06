<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="MF_PROFILE" class="span9">
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
<!-- END PAGE CONTAINER-->
