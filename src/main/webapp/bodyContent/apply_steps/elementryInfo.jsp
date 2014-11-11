<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<form id="elementry_form" class="form-inline">
	<fieldset>
		<legend>请认真填写申请基本事项！</legend>
		<div class="control-group">
			<label class="control-label">课程名称：</label> <input type="text"
				name="applicationInfo.course" placeholder="课程名称" />&nbsp;&nbsp;&nbsp;
			<label class="control-label">课程人数：</label> <input type="text"
				name="applicationInfo.seats" placeholder="50" />
		</div>

		<div class="control-group">
			<div class="radio">
				<label class="control-label">联系方式：</label> <input type="text"
					name="applicationInfo.contactNo" placeholder="02552112897" /> <label
					class="control-label">&nbsp;&nbsp;&nbsp;预定类型：</label> <label> <input
					type="radio" name="courseType" id="optionsRadios1" value="1"
					checked> 上机
				</label> <label> <input type="radio" name="courseType" value="2">上课
				</label>

			</div>
		</div>
		<!-- 
		<div class="control-group">
			<label class="control-label">开始日期&nbsp;</label><input type="text"
				name="userInfo.birth" id="timeBirth"
				onclick="MyCalendar.SetDate(this)" value="1990-01-01" />
		</div>
 -->
		<div class="control-group" style="position:relative">
			<label class="control-label">课程周期：</label> <select
				class='custom-date' name='select'>
				<option value='7'>7 Days</option>
				<option selected='selected' value='30'>30 Days</option>
				<option value='90'>90 Days</option>
				<option value='180'>180 Days</option>
				<option value='365'>365 Days</option>
				<option value='custom'>Custom</option>
			</select>
			<script src="js/datepick/datepick.js"></script>

			<label class="control-label">&nbsp;&nbsp;&nbsp;课程时间：</label> <select
				class="span2">
				<option value='1'>1小时</option>
				<option selected='selected' value='2'>2小时</option>
				<option value='3'>3小时</option>
				<option value='4'>4小时</option>
			</select>
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
			<button class="btn">取消</button>
		</div>
	</fieldset>
</form>
