<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<form id="detailInfo_form" class="form-inline">
	<fieldset>
		<legend>请认真选择必备软件或实验资源！</legend>
		<div class="control-group">
				<div class="input-group-btn btn-group">
					<button class="btn btn-mini dropdown-toggle" data-toggle="dropdown">
						软件列表 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul>
				</div>
				<input type="text">
				<!-- /btn-group -->
		</div>
		<div class="control-group">
			<label class="control-label">联系方式</label> <input type="text"
				name="applicationInfo.contactNo" placeholder="02552112897" />
		</div>

		<div class="control-group">
			<label class="control-label" for="input01">电子邮箱</label>
			<div class="controls">
				<input type="text" class="input-xlarge" id="input01"
					placeholder="john.smith@example.org" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="fileInput">照片</label>
			<div class="controls">
				<input class="input-file" id="fileInput" type="file" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="textarea">Biography</label>
			<div class="controls">
				<textarea class="input-xlarge" id="textarea" rows="4">Web technology junkie who writes innovative and bestselling technical books. Also enjoys Sunday bicycle rides and all "good" comedy.</textarea>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="optionsCheckbox">Public
				Profile</label>
			<div class="controls">
				<input type="checkbox" id="optionsCheckbox" value="option1"
					checked="checked" />
			</div>
		</div>
		<div class="form-actions">
			<button class="btn btn-primary">下一步</button>
			<button class="btn">上一步</button>
		</div>
	</fieldset>
</form>
