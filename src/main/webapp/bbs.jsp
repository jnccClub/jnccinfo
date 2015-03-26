<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
#bbsContent label {
	display: inline-block;
	*display: inline;
	*zoom: 18
}
</style>

<div id="MF_BBS" class="row" style="display:none">
	<div>
		<form id="bbsForm">
			<div class="menu-sep"></div>
			<lable>江湖人称：</lable>
			<input style="width:100%" name="ebs.name"></input>
			<div style="height:10px"></div>
			<lable>不矫情的话：</lable>
			<textarea
				style="width:100%;border:2;border-style:solid;border-color:blue;"
				name="ebs.remark"></textarea>

			<input type="button" class="loginBtn" type="button" value="不吐不快"
				id="bbsSubmit" /> <input class="resetBtn" type="reset"
				value="容我重新三思" />
		</form>
		<div class="menu-sep"></div>
		<div class="menu-sep"></div>
		<div id="bbsContent">
		</div>
		<div class="menu-sep"></div>

	</div>

</div>