<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

	<div id="MF_TBOOK" style="display:none" class="span9">
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
			
		});

	</script>
