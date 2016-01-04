<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

	<h2>
		您期望选择座位数是：<a id="a_chooseSeats"></a><br> 已选择资源：<a href="#"
			id="choosenSeats"></a><br> <a href="#" id="choosenRes">&nbsp;</a>
	</h2>
	
	<div class="easyui-panel" title="计算中心预约时段可用资源：" style="width:600px">
		<div style="padding:10px 60px 20px 60px">
			<form id="Form_finalInfo" method="post">
				<label class="control-label">可用楼层:</label> <select class="span3"
					name="ea.floor">
				</select> <label class="control-label">可用区域:</label>
				<div id="div_chooseZone"></div>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="submitFinalForm()" id="submitFinalForm" >提交申请</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="appZoneBack()">上一步</a>	
			</div>
		</div>
	</div>
	<div style="text-align:center;">
		<br>
		<p>楼层区域示意图(提示：A区与F区相邻)</p>
		<img src="image/zoneDis/zoneDis.png" style="width:550px">
	</div>




