<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>


	<fieldset id="elementry_field">
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
					class="control-label">&nbsp;&nbsp;&nbsp;预定类型：&nbsp;</label> <label> <input
					type="radio" name="courseType" id="optionsRadios1" value="1"
					checked> 上机&nbsp;&nbsp;&nbsp;
				</label> <label> <input type="radio" name="courseType" value="2">上课&nbsp;&nbsp;&nbsp;
				</label>
				 <label> <input type="radio" name="courseType" value="3">考试
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

			<label class="control-label">&nbsp;&nbsp;&nbsp;开始时间：</label>
			<div id="datetimepicker" class="input-append date">
				<input type="text" style="width:50px;height:28px;"></input> <span class="add-on"> <i
					data-time-icon="icon-time"></i>
				</span>
			</div>

			<script type="text/javascript">
				$('#datetimepicker').datetimepicker({
					format : 'hh:mm',
					language : 'ch',
					pickDate : false,
					pickTime : true,
					hourStep : 1,
					minuteStep : 15,
					secondStep : 30,
					inputMask : true
				});
			</script>


			<label class="control-label">&nbsp;&nbsp;&nbsp;课时：</label>
			<select
				class="span1">
				<option value='1'>1学时</option>
				<option selected='selected' value='2'>2学时</option>
				<option value='3'>3学时</option>
				<option value='4'>4学时</option>
			</select>
		</div>
		<div class="control-group bordline">
			<label class="control-label">星期：</label> <label
				class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox1" value="1"> 星期一&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox2" value="2"> 星期二&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox3" value="3"> 星期三&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox3" value="4"> 星期四&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox3" value="5"> 星期五&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox3" value="6"> 星期六&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox3" value="7"> 星期日&nbsp;&nbsp;&nbsp;&nbsp;
			</label>
		</div>
		<div class="form-actions">
		</div>
	</fieldset>
</form>
