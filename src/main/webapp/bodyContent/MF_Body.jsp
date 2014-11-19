<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>




<div class="row" id="MF_Body">
	<jsp:include page="personalNav.jsp"></jsp:include>
	<jsp:include page="welcomeContent.jsp"></jsp:include>
	<jsp:include page="createApplication.jsp"></jsp:include>
</div>


<script>
	var currentBodyID = "#Body_Welcome";
	var currentBodyNavActive = "#welcome_body";

	$(document).ready(function() {
		$("#welcome_body").click(function() {
			renewBodyId("#Body_Welcome", $(this));
		});

		$("#create_Application").click(function() {
			renewBodyId("#Body_CreateApp", $(this));
		});

	});
	function renewBodyId(newBodyId, newActiveId) {
		$(currentBodyNavActive).removeClass("active");
		currentBodyNavActive = newActiveId;
		$(currentBodyNavActive).addClass("active");

		$(currentBodyID).hide();
		currentBodyID = newBodyId;
		$(currentBodyID).show();
	}

	
</script>