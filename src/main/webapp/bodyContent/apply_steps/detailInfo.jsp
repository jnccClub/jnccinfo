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
			<label class="control-label">操作系统:</label>
			<select
				class="span3">
				<option selected='selected' value='1'>Windows XP</option>
				<option  value='2'>Windows 7</option>
				<option value='3'>Linux Ubuntu</option>
				<option value='3'>Linux NOIP</option>
				<option value='4'>Windows 2003</option>
			</select>
		</div>
		<div class="control-group">
			<label class="control-label">联系方式：</label> <input type="text"
				name="applicationInfo.contactNo" placeholder="02552112897" />
		</div>

		<div class="control-group">
			<label class="control-label">必备软件：</label>
			<div class="controls">
				<input type="text" placeholder="软件名称" />与 <input type="text"
					placeholder="软件名称" />与<input type="text" placeholder="软件名称" />
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="input01">电子邮箱：</label>
			<div class="controls">
				<input type="text" class="input-xlarge" id="input01"
					placeholder="john.smith@example.org" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="fileInput">附加文件：</label>
			<div class="controls">
				<input class="input-file" id="fileInput" type="file" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="textarea">其他说明：</label>
			<div class="controls">
				<textarea class="input-xlarge" id="textarea" rows="4"
					placeholder="计算中心的8楼E区键盘不好用！"></textarea>
			</div>
		</div>
		
		<div class="control-group">
			<div class="controls">
				<input type="checkbox" id="optionsCheckbox" value="option1"
					checked="checked" />&nbsp;&nbsp;&nbsp;同意南京航空航天大学将军路校区计算中心所有服务条款
			</div>
		</div>
		<div class="form-actions">
			<button class="btn btn-primary">下一步</button>
			<button class="btn">上一步</button>
		</div>
	</fieldset>
