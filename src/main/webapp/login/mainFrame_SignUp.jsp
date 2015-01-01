<%@ page contentType="text/html;charset=UTF-8" language="java"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<script type="text/javascript">
	function invalidUsername(username) {
		if (username == null || username.length == 0) {
			$("#nameValidate").html("姓名不能为空！");
			return true;
		}
		if (username.length > 10) {
			$("#nameValidate").html("长度最多为10个字符！");
			return true;
		}
		return false;
	}
	function checkName(){
		var params = $("#subUserForm").serializeArray();
		var username = $("#singUpUsername").val();
		if (invalidUsername(username)) {
			$("#nameValidate").removeClass().addClass(
					"signup_errTips");
			return false;
		}
		$.ajax({
			url : 'comAction/user_checkUsername.action',
			type : 'post',
			data : params,
			dataType : 'json',
			success : function(data) {
				if (data.resultCode.toString() == "200") {
					$("#nameValidate").removeClass().addClass(
							"signup_correctTips");
					$("#nameValidate").html("恭喜，用户名可用");
					$("#addUser").removeAttr("disabled");
					regNameValid = true;
				} else {
					$("#nameValidate").removeClass().addClass(
							"signup_errTips");
					$("#nameValidate").html("用户名已经注册");
					$("#addUser").attr('disabled', "true");
					regNameValid = false;
				}
			}
		});
		return true;
	}
	function checkComPasswd(){
		var fPasswd = $("#firstRegPasswd").val();
		var sPasswd = $("#comPasswd").val();
		if(fPasswd == ""){
			alert("Passwd can't be empty!");
			return false;
		}
		if(fPasswd == sPasswd){
			return true;
		}else{
			alert("Not same password at the two times!");
			return false;
		}
	}
	
	function checkRegForm(){
		if(!checkName() || !regNameValid){
			return false;
		}
		if(!checkComPasswd()){
			return false;
		}
		return true;
	}
</script>
<script>
	$(function() {
		regNameValid = false;
		$("#addUser").click(
				function() {// 必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
					if(!checkRegForm()){
						return ;
					}
					var params = $("#subUserForm").serializeArray();
					$.ajax({
						url : 'comAction/user_add.action',
						type : 'post',
						data : params,
						dataType : 'json',
						success : function(data) {
							if (data.resultCode.toString() == "200") {
								alert("恭喜，成功加入我们！请登录");
								username = "";
								$("#loginInfo").hide();
								$("#logOutEntry").hide();
								$("#loginEntry").show();
								renewMainId("#mainFrame_Login");
							} else {
								alert("用户添加异常，请重新注册或联系管理员，谢谢！");
							}
						}
					});
				});
		$("#firstRegPasswd").blur(function(){
			checkComPasswd();
		});
		$('#singUpUsername').blur(function() { // 必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
					checkName();
				});
		$("table tr").each(function() {
			//$("td:eq(0)").addClass("signupLabel");
			//$("td:eq(1)").addClass("signupInput");
			//$("td:eq(2)").addClass("signupTips");
			$(this).children("td:eq(0)").addClass("signupInput");
			$(this).children("td:eq(1)").addClass("signupLabel");
		});

		$("#signUpJump2LoginIn").click(function() {
			renewMainId("#mainFrame_Login");
		});
	});
</script>
<div class="mainFrame_SignUp" style="text-align:center;"
	id="mainFrame_SignUp">
	<form class="mainFrame_Table" id="subUserForm">
		<table >
			<tr>
				<td><input name="userInfo.username" placeholder="请输入学号/工号"
					class="UsernameInput" required id="singUpUsername" /></td>
				<td id="nameValidate">请输入本人学号/工号</td>
			</tr>
			<tr>
				<td><input  placeholder="请输入密码"
					class="UserPasswdInput" type="password" required="true" id="firstRegPasswd"/></td>
				<td>请输入3位以上个人密码</td>
			</tr>
			<tr>
				<td><input placeholder="请再次输入密码" class="UserPasswdInput"
					type="password" required name="userInfo.password" id="comPasswd"/></td>
				<td>请再次输入密码</td>
			</tr>
			<tr>
				<td><input name="userInfo.realname" placeholder="请输入真实姓名"
					class="transInput" required /></td><td>请输入真实姓名</td>
			</tr>
			<tr>
				<td><input name="userInfo.phoneno" placeholder="请填写您的手机号码"
					class="transInput" required /></td><td>请填写您的手机号码</td>
			</tr>
			<tr>
				<td><input name="userInfo.email" placeholder="请填写您的E-mail"
					class="transInput" required /></td><td>请填写您的E-mail</td>
			</tr>
			<tr>
				<td><input name="userInfo.qq" placeholder="请填写您的QQ"
					class="transInput" required /></td><td>请填写您的QQ</td>
			</tr>
			<tr>
				<td><select size="1" name="userInfo.role" class="transInput">
						<option value="teacher">教师</option>
						<option selected value="student">学生</option>
						<option value="other">其他</option>
				</select></td>
				<td>请选择您的身份</td>
			</tr>
			<tr>
				<td colspan="2" style="height:1px;display:none"><input
					type="reset" value="Reset"></td>
			</tr>
		</table>
		
		<input type="button" class="loginBtn" type="submit" value="提交"
			id="addUser" /> <input class="resetBtn" type="reset" value="重置" />
	</form>
</div>
