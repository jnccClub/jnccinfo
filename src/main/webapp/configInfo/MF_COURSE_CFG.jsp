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
			<label> <input type="radio" name="courseUp_option"
				value="901" checked> 更新&nbsp;&nbsp;&nbsp;
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
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="add_course()">添加课程</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="edit_course()">编辑课程</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroy_course()">删除课程</a> 		
		<input class="easyui-searchbox"
			data-options="prompt:'Please Input Value',menu:'#course_mm',searcher:doSearchC"
			style="width:500px"></input>
		<div id="course_mm">
			<div data-options="name:'TEACHERNAME',iconCls:'icon-tip'">教师姓名</div>
			<div data-options="name:'COURSENAME',iconCls:'icon-ok'">课程名称</div>
			<div data-options="name:'CLASSNO',iconCls:'icon-man'">班级学号</div>
		</div>
	</div>

	<div id="dlg_course" class="easyui-dialog"
		style="width:380px;height:480px;padding:10px 20px" closed="true"
		buttons="#dlg_cr_buttons">
		<form id="fm_course" method="post" novalidate>
			<div class="fitem">
				<label>课程名称:</label> 
				<input name="fld_C_NAME" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>课程序号:</label> <input name="fld_C_SERIAL" class="easyui-textbox" required="true" id="input_zoneID">
			</div>
			<div>
				<label>教师姓名:</label><input name="fld_C_TEACHER" class="easyui-textbox" required="true">
				<label>教师工号:</label> <input name="fld_C_TNO" class="easyui-textbox"	required="true"> 
				<label>班级学号:</label> <input name="fld_C_CNO" class="easyui-textbox" required="true">
				<label>班级人数:</label> <input name="fld_C_CNUM" class="easyui-textbox" required="true">
				<label>备注:</label>
				<textarea class="input-xlarge" rows="4" name="fld_C_COMMENT">十六院申请的工程制图软件</textarea>
			</div>
		</form>
	</div>
	<div id="dlg_cr_buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="save_course()" style="width:90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#dlg_course').dialog('close')" style="width:90px">取消</a>
	</div>

</div>

