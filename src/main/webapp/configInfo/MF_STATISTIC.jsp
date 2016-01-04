<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<div class="row" id="MF_STATISTIC" style="display:none">
	<div class="row-fluid">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-reorder"></i>预约系统访问情况统计
				</div>
			</div>
		</div>
		<div id="stat_charts"></div>
		<!-- BEGIN EXAMPLE TABLE PORTLETââ This is mine,zhp-->

		<div class="portlet box red">
			<div class="portlet-title">
				<div class="caption">预约系统访问情况具体信息</div>
			</div>

			<div class="portlet-body">
				<table
					class="table table-striped table-bordered table-hover table-full-width"
					id="stat_tab">
				</table>
			</div>
		</div>
	</div>
</div>

