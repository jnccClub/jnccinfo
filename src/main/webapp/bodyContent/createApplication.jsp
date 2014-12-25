<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="span9" id="Body_CreateApp" style="display:none">
	<div class="span9" id="APP_FIRSTSTEP">
		<div class="hero-unit">
			<h3>Welcome</h3>
			<p>如果不清楚如何创建申请，请选择帮助</p>
			<ul>
				<li>填写基本信息</li>
				<li>选择必备软件资源或实验室资源</li>
				<li>选择符合条件的区域</li>
			</ul>
			<a class="btn btn-large">帮助</a>
		</div>
		<h1 id="create_application_title">创建申请</h1>
		<form id="elementry_form" class="form-inline">
			<jsp:include page="apply_steps/elementryInfo.jsp"></jsp:include>
			<jsp:include page="apply_steps/detailInfo.jsp"></jsp:include>
		</form>
	</div>
	<div id="APP_SECONDSTEP" style="display:none">
		<h2 id="create_application_title">基础信息确认</h2>
		<form id="elementry_form" class="form-inline">
			<jsp:include page="apply_steps/confirmInfo.jsp"></jsp:include>
		</form>
	</div>
	<div class="span9" style="display:none" id="DIV_ZONE_CHOOSE">
		<jsp:include page="apply_steps/zoneChoosen.jsp"></jsp:include>
	</div>
</div>
