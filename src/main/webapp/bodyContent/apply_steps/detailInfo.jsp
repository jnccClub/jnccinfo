<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<fieldset id="detailInfo_field">
	<legend>请认真选择必备软件或实验资源！</legend>
	<div class="control-group">
		<label class="control-label">操作系统:</label> <select class="span3"
			name="applicationInfo.OS">
			<option selected='selected' value='Windows XP'>Windows XP</option>
			<option value='Windows 7'>Windows 7</option>
			<option value='Linux Ubuntu'>Linux Ubuntu</option>
			<option value='Linux NOIP'>Linux NOIP</option>
			<option value='Windows 2003'>Windows 2003</option>
		</select>
	</div>

	<div class="control-group">
		<label class="control-label">必备软件：</label>
		<div class="controls">
			<input name="applicationInfo.SW" id="input_sw1"/>&
			<input name="applicationInfo.SW" id="input_sw2"/>&
			<input name="applicationInfo.SW" id="input_sw3"/>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="textarea">其他说明：</label>
		<div class="controls">
			<textarea class="input-xlarge" id="textarea" rows="4"
				placeholder="计算中心的8楼E区键盘不好用！" name="applicationInfo.OtherComment" style="width:33em"></textarea>
		</div>
	</div>

	<div class="control-group">
		<div class="controls">
			<input type="checkbox" id="optionsCheckbox" value="option1"
				checked="checked" />&nbsp;&nbsp;&nbsp;同意南京航空航天大学将军路校区计算中心所有服务条款
		</div>
	</div>
	<div class="form-actions">
		<button class="btn btn-primary" onclick="appFirstNext()">下一步</button>
	</div>
</fieldset>
