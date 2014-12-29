<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.inline_div label,.inline_div input {
	display: inline-block;
	*display: inline;
	*zoom: 1
}
</style>


<div class="row" id="MF_COURSE_CFG" style="display:none">
	<div
		style="border-radius: 50px;TEXT-ALIGN: center;MARGIN-RIGHT: auto; MARGIN-LEFT: auto; background-color:#EEE;">
		<h1>-----------课程信息-----------</h1>
		<div>
			<label class="control-label">&nbsp;&nbsp;&nbsp;课程清单(<a
				href="configInfo/templateCurriculum.xls">课程清单模板.xls</a>)：&nbsp;<input
				id="courseFile" type="text" size="45" name="coursefileUp">
				<button class="btn btn-success" id="btnCourseUpload">上 传</button>
			</label>

		</div>

		<div class="option-inline-radio">
			<label class="control-label">&nbsp;&nbsp;&nbsp;课程配置类型：&nbsp;</label>
			<label> <input type="radio" name="courseUp_option" value="901" checked>
				更新&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio" name="sw_option" value="902">增加&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio" name="sw_option" value="903">覆盖&nbsp;&nbsp;&nbsp;
			</label> <label> <input type="radio" name="sw_option" value="904">删除
			</label>
		</div>
	</div>
	<br> <br>


	<table id="tbl_course" cellspacing="0" cellpadding="0"
		class="easyui-datagrid" toolbar="#tbl_c_toolbar">
		<thead>
			<tr>
				<th data-options="field:'fld_C_NAME',width:150">课程名称</th>
				<th data-options="field:'fld_C_SERIAL',width:150">课程序号</th>
				<th data-options="field:'fld_C_TEACHER',width:80">教师姓名</th>
				<th data-options="field:'fld_C_TNO',width:80">教师工号</th>
				<th data-options="field:'fld_C_CNO',width:150">班级学号</th>
				<th data-options="field:'fld_C_CNUM',width:50">学生人数</th>
				<th data-options="field:'fld_C_COMMENT',width:150">备注</th>
			</tr>
		</thead>
	</table>

	<div id="tbl_c_toolbar">
		<input
			class="easyui-searchbox"
			data-options="prompt:'Please Input Value',menu:'#course_mm',searcher:doSearchC"
			style="width:500px"></input>
		<div id="course_mm">
			<div data-options="name:'SNAME',iconCls:'icon-tip'">教师姓名</div>
			<div data-options="name:'SZONE',iconCls:'icon-ok'">课程名称</div>
			<div data-options="name:'SMANAGER',iconCls:'icon-man'">班级学号</div>
		</div>
	</div>

</div>

