<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="MF_ADARRANGE" style="display: none" class="span9">
	<div class="portlet box red">
		<div class="portlet-title">
			<div class="caption">
				<b>已预订课程微调：</b>
			</div>
		</div>
		<div class="portlet-body">
			<div class="control-group">
				<div class="radio form-inline">
					&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)"
						class="easyui-linkbutton" iconCls="icon-lock" plain="true">待调日期：</a>
					<input name="adjust.DatePick" onclick="MyCalendar.SetDate(this)"
						value="" type="text" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="control-label">樓層：</label> <select class="span1" style="width: 206px; height: 29.5px;"
						name="adjust.floor"></select>
				</div>
			</div>

			<div class="control-group">
				<div class="radio form-inline">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="control-label">區域：&nbsp;</label> <select class="span1" style="width: 206px; height: 29.5px;"
						name="adjust.zone"></select>
				</div>
			</div>
			<div class="control-group">
				<div class="radio form-inline">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label class="control-label">開始時間：&nbsp;</label>
					<select class="span1" style="width: 206px; height: 29.5px;"
						name="adjust.beginTime">
						<option selected='selected' value='08:00'>08:00</option>
						<option value='10:00'>10:00</option>
						<option value='12:00'>12:00</option>
						<option value='14:00'>14:00</option>
						<option value='16:00'>16:00</option>
						<option value='18:30'>18:00</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
						class="control-label">結束時間：</label> <select class="span1"
						style="width: 206px; height: 29.5px;" name="adjust.endTime">
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
			</div>
			<div class="control-group">
				<div class="radio form-inline">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label class="control-label">课程名称：&nbsp;</label>
					<input type="text" name="adjust.courseName" disabled="disabled" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
						class="control-label">课程编号：</label> <input type="text"
						name="adjust.courseSerial" disabled="disabled" />
				</div>
			</div>
			<div class="control-group">
				<div class="radio form-inline">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
						class="control-label">教师姓名：&nbsp;</label> <input type="text"
						name="adjust.teacherName" disabled="disabled" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
						class="control-label">教师工号：</label> <input type="text"
						name="adjust.teacherNo" disabled="disabled" />
				</div>
			</div>
			<div class="control-group">
				<div class="radio form-inline">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
						class="control-label">学生人数：&nbsp;</label> <input type="text"
						name="adjust.stuNum" disabled="disabled" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
						class="control-label">班机信息：</label> <input type="text"
						name="adjust.classNo" disabled="disabled" />
				</div>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="javascript:void(0)" class="btn btn-primary btn-large"
					onclick="queryCurrentCourse()">查詢信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="javascript:void(0)" class="btn  btn-large"
					onclick="clearCourseInfo()">清空信息</a>
			</div>
			<br>
			<div class="divBkColor"></div>
			<div class="control-group form-inline">
				<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="control-label">新课程信息：</label>
				<input id="adjust_appid" name="applicationInfo.course"
					value="计算机网络基础">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="javascript:void(0)" class="btn btn-large"
					onclick="adjustZoneArrange()">確認修改</a>
			</div>
			<div style="clear: both"></div>
			<div class="divBkColor"></div>

			<div id="ADJUSTCOURSEINFO_DIV"></div>
		</div>
		<div>说明：仅允许上课同学机器异常时自助预定。</div>
	</div>
</div>
