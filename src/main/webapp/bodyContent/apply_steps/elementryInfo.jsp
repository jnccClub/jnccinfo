<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<fieldset id="elementry_field">
	<legend>请上传预约课程学生名单（从教务处网站下载）</legend>

	<label class="control-label">课程学生名单(<a
		href="configInfo/templateCurriculum.xls">课程学生名单样例.xls</a>)：&nbsp;<input
		id="courseFile" type="text" size="45" name="coursefileUp">
		<button class="btn btn-success" id="btnCourseUpload">上 传</button>
	</label>
	<br>
	<br>
	<legend>请填写申请基本事项（选择已上传学生名单的课程）</legend>
	<div class="control-group">
		<label class="control-label">课程名称：</label> <input id="CApp_CName"
			name="applicationInfo.course" value="计算机网络基础">&nbsp;&nbsp;&nbsp;&nbsp;<label>
	</div>

	<div class="control-group">
		<div class="radio">
			<label class="control-label">学生班级：</label>&nbsp;<input type="text"
				name="applicationInfo.class" disabled="disabled"></input> <label
				class="control-label">&nbsp;&nbsp;&nbsp;预定类型：&nbsp;</label> <label>
				<input type="radio" name="applicationInfo.courseType"
				id="optionsRadios1" value="上机" checked> 上机&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio"
				name="applicationInfo.courseType" value="上课">上课&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio"
				name="applicationInfo.courseType" value="考试">考试
			</label>
		</div>
	</div>

	<div class="control-group">
		<div class="radio">
			<label class="control-label">课程编号：</label> <input type="text"
				name="applicationInfo.applicationId" placeholder="102030_70206097_1"
				disabled="disabled" /> <label class="control-label">&nbsp;&nbsp;&nbsp;课程人数：</label>
			<input type="text" name="applicationInfo.seats" placeholder="50"
				disabled="disabled" />
		</div>
	</div>

	<div class="control-group">
		<div class="radio">
			<label class="control-label">校历学期：</label> <select id="termSelect_app">
				<option value='2015-08-31'>2015~2016(1)秋学期</option>
				<option selected='selected' value='2016-02-22'>2015~2016(2)春学期</option>
				<option value='2016-08-29'>2016~2017(1)秋学期</option>
			</select> <label class="control-label">&nbsp;&nbsp;&nbsp;联系电话：</label> <input
				type="text" name="applicationInfo.contact" placeholder="02552112897" />
		</div>
	</div>
	<div class="control-group" style="position: relative">
		<label class="control-label">起始学周：</label> <select
			name="applicationInfo.beginDate">
		</select> <label class="control-label">&nbsp;&nbsp;&nbsp;结束学周：</label> <select
			name="applicationInfo.endDate">
		</select>
	</div>

	<div class="control-group">
		<label class="control-label">开始时间：</label> <select class="span1"
			style="width: 206px; height: 29.5px;"
			name="applicationInfo.beginTime">
			<option selected='selected' value='08:00'>08:00</option>
			<option value='10:00'>10:00</option>
			<option value='12:00'>12:00</option>
			<option value='14:00'>14:00</option>
			<option value='16:00'>16:00</option>
			<option value='18:30'>18:00</option>
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
		<label class="control-label">&nbsp;&nbsp;&nbsp;结束时间：</label> <select
			class="span1" style="width: 206px; height: 29.5px;"
			name="applicationInfo.endTime">
			<option selected='selected' value='10:00'>10:00</option>
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
			name="applicationInfo.weekChoosen" value="1">
			星期一&nbsp;&nbsp;&nbsp;
		</label> <label class="checkbox-inline"> <input type="radio"
			name="applicationInfo.weekChoosen" value="2">
			星期二&nbsp;&nbsp;&nbsp;
		</label> <label class="checkbox-inline"> <input type="radio"
			name="applicationInfo.weekChoosen" value="3">
			星期三&nbsp;&nbsp;&nbsp;
		</label> <label class="checkbox-inline"> <input type="radio"
			name="applicationInfo.weekChoosen" value="4">
			星期四&nbsp;&nbsp;&nbsp;
		</label> <label class="checkbox-inline"> <input type="radio"
			name="applicationInfo.weekChoosen" value="5" checked>
			星期五&nbsp;&nbsp;&nbsp;
		</label> <label class="checkbox-inline"> <input type="radio"
			name="applicationInfo.weekChoosen" value="6">
			星期六&nbsp;&nbsp;&nbsp;
		</label> <label class="checkbox-inline"> <input type="radio"
			name="applicationInfo.weekChoosen" value="7">
			星期日&nbsp;&nbsp;&nbsp;&nbsp;
		</label>
	</div>
	<div class="form-actions"></div>

	<div id="toolbar4Course">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-book" plain="false" onclick="showCourse()" id="CourseSelDis">全部课程</a>
	</div>


</fieldset>
