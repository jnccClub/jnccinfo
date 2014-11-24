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
				name="applicationInfo.course" placeholder="课程名称"/>&nbsp;&nbsp;&nbsp;
			<label class="control-label">课程人数：</label> <input type="text"
				name="applicationInfo.seats" placeholder="50" />
		</div>

		<div class="control-group">
			<div class="radio">
				<label class="control-label">学生班级：</label> <input type="text"
					name="applicationInfo.class" placeholder="1612101~104" /> <label
					class="control-label">&nbsp;&nbsp;&nbsp;预定类型：&nbsp;</label> <label> <input
					type="radio" name="applicationInfo.courseType" id="optionsRadios1" value="上机"
					checked> 上机&nbsp;&nbsp;&nbsp;
				</label> <label> <input type="radio" name="applicationInfo.courseType" value="上课">上课&nbsp;&nbsp;&nbsp;
				</label>
				 <label> <input type="radio" name="applicationInfo.courseType" value="考试">考试
				</label>
			</div>
		</div>

		<div class="control-group">
			<div class="radio">
				<label class="control-label">联系电话：</label> <input type="text"
					name="applicationInfo.contact" placeholder="02552112897" /> 
				<label class="control-label">&nbsp;&nbsp;&nbsp;电子邮箱：</label> <input type="text"
					name="applicationInfo.Email" placeholder="jncc@nuaa.edu.cn" /> 
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
		<label class="control-label">起始日期：</label>
			<div id="beginDatepick" class="input-append date">
				<input type="text" style="width:180px;height:29.5px;"  name="applicationInfo.beginDate"></input> <span
					class="add-on"> <i data-time-icon="icon-time"></i>
				</span>
			</div>

			<script type="text/javascript">
				$('#beginDatepick').datetimepicker({
					format : 'yyyy-MM-dd',
					language : 'en',
					pickDate : true,
					pickTime : false,
					inputMask : true
				});
			</script>
			
					<label class="control-label">&nbsp;&nbsp;&nbsp;截止日期：</label>
			<div id="endDatepick" class="input-append date">
				<input type="text" style="width:180px;height:29.5px;" name="applicationInfo.endDate"></input> <span
					class="add-on"> <i data-time-icon="icon-time"></i>
				</span>
			</div>

			<script type="text/javascript">
				$('#endDatepick').datetimepicker({
					format : 'yyyy-MM-dd',
					language : 'en',
					pickDate : true,
					pickTime : false,
					inputMask : true
				});
			</script>
			<!-- <select
				class='custom-date' name='select'>
				<option value='7'>7 Days</option>
				<option selected='selected' value='30'>30 Days</option>
				<option value='90'>90 Days</option>
				<option value='180'>180 Days</option>
				<option value='365'>365 Days</option>
				<option value='custom'>Custom</option>
			</select>
			<script src="js/datepick/datepick.js"></script> -->

	</div>




	<div  class="control-group">
		<label class="control-label">开始时间：</label>
		<select
			class="span1" style="width:206px;height:29.5px;" name="applicationInfo.beginTime">
			<option selected='selected'  value='08:00'>08:00</option>
			<option value='10:00'>10:00</option>
			<option value='12:00'>12:00</option>
			<option value='14:00'>14:00</option>
			<option value='16:00'>16:00</option>
			<option value='18:30'>18:30</option>
		</select>
		
		<!-- 
		<div id="datetimepicker" class="input-append date">
			<input type="text" style="width:180px;height:29.5px;"></input> <span
				class="add-on"> <i data-time-icon="icon-time"></i>
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
		 -->
		<label class="control-label">&nbsp;&nbsp;&nbsp;结束时间：</label> <select class="span1"
			style="width:206px;height:29.5px;" name="applicationInfo.endTime">
			<option selected='selected'  value='10:00'>10:00</option>
			<option value='12:00'>12:00</option>
			<option value='14:00'>14:00</option>
			<option value='16:00'>16:00</option>
			<option value='18:00'>18:00</option>
			<option value='20:00'>20:00</option>
			<option value='21:30'>21:30</option>
			<option value='22:00'>22:00</option>
		</select>
	</div>

<!-- <label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox3" value="7"> 星期日&nbsp;&nbsp;&nbsp;&nbsp;
			</label> -->


	<div class="control-group bordline">
			<label class="control-label">课程安排星期：</label> <label
				class="checkbox-inline"> <input type="radio"
				 name="applicationInfo.weekChoosen" value="1"> 星期一&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="radio"
				 name="applicationInfo.weekChoosen" value="2"> 星期二&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="radio"
				name="applicationInfo.weekChoosen" value="3"> 星期三&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="radio"
				name="applicationInfo.weekChoosen" value="4"> 星期四&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="radio"
				name="applicationInfo.weekChoosen" value="5" checked> 星期五&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="radio"
				name="applicationInfo.weekChoosen" value="6"> 星期六&nbsp;&nbsp;&nbsp;
			</label> <label class="checkbox-inline"> <input type="radio"
				name="applicationInfo.weekChoosen" value="7"> 星期日&nbsp;&nbsp;&nbsp;&nbsp;
			</label>
		</div>
		<div class="form-actions">
		</div>
	</fieldset>
</form>
