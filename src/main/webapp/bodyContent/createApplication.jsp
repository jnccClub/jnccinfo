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
	<div class="hero-unit">
		<h1>欢迎!</h1>
		<p>如果不清楚如何创建申请，请选择帮助</p>
		<ul>
		<li>填写基本信息</li>
		<li>选择必备软件资源或实验室资源</li>
		<li>选择符合条件的区域</li>
		</ul>
		<p>
			<a href="javascript:(0)" class="btn btn-primary btn-large">创建申请</a> <a
				class="btn btn-large">帮助</a>
		</p>
	</div>

	<div class="span9" id="APP_FIRSTSTEP">
		<h1 id="create_application_title">创建申请</h1>
		<form id="elementry_form" class="form-inline">
		<jsp:include page="apply_steps/elementryInfo.jsp"></jsp:include>
		<jsp:include page="apply_steps/detailInfo.jsp"></jsp:include>
		</form>
	</div>
</div>
<div  id="APP_SECONDSTEP">
	<h1 id="create_application_title">确认申请</h1>
	<form id="elementry_form" class="form-inline">
		<jsp:include page="apply_steps/confirmInfo.jsp"></jsp:include>
	</form>
</div>