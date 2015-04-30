<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="mainFrame_Login" id="mainFrame_Login">
	<form id="userLoginForm">
		<p>
			尚无登录账号？ <br> <a href="#" id="loginJump2SignUp">快快注册加入我们</a>
		</p>

		<div class="span12">
			<input style="display: inline" name="userInfo.username"
				placeholder="请输入学号/工号" class="UserPasswdInput easyui-validatebox "
				id="loginUserNameInput" required="true" missingMessage="学号/工号必须填写"
				validType="cardNo" /><i class="icon-user" style="display: inline">&nbsp;&nbsp;&nbsp;</i>
		</div>
		<div style="clear: both"></div>
		<div class="span12">
			<input style="display: inline" name="userInfo.password"
				placeholder="请输入密码" class="UserPasswdInput easyui-validatebox "
				type="password" required="true" missingMessage="密码必须填写" /><i
				class="icon-lock" style="display: inline">&nbsp;&nbsp;&nbsp;</i>
		</div>

		<!-- <textarea rows="4" cols="50" name="subject"
			placeholder="Please enter your message" class="message" required></textarea> -->
		<p id="loginErrTips"></p>
		<input class="loginBtn span2" type="button" value="提交"
			id="loginSubmit" /> <input class="resetBtn span2" type="reset"
			value="重置" />
	</form>
	<div style="clear: both"></div>
</div>


<script>
	function showWelBar(u_name) {
		$("#loginInfo").html("欢迎您，" + u_name + "&nbsp;&nbsp;");
		$("#loginEntry").hide();
		$("#logOutEntry").show();
		$("#loginInfo").show();
		
	}

	function isLogin() {
		$.ajax({
			url : 'comAction/user_isLogin.action',
			type : 'post',
			dataType : 'json',
			success : function(data) {
				if (data.resultCause.resultCode.toString() == "200") {
					//alert("恭喜，登录成功！");
					var u_name = data.userInfo.realname.toString();
					var role = data.userInfo.role.toString();
					userItemShow(role);
					showWelBar(u_name);
				} else if (data.resultCause.resultCode.toString() == "404") {
					return;
				} else {
					return;
				}
			}
		});
	}

	$(function() {
		isLogin();
		$("#loginJump2SignUp").click(function() {
			renewMainId("#mainFrame_SignUp");
		});
		$("#loginSubmit")
				.click(
						function() {// 必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
							if (!$("#userLoginForm").form('validate')) {
								return;
							}

							var params = $("#userLoginForm").serializeArray();
							$
									.ajax({
										url : 'comAction/user_loginIn.action',
										type : 'post',
										data : params,
										dataType : 'json',
										success : function(data) {
											if (data.resultCause.resultCode
													.toString() == "200") {
												//alert("恭喜，登录成功！");
												var u_name = data.userInfo.realname
														.toString();
												var role = data.userInfo.role
														.toString();
												userItemShow(role);
												showWelBar(u_name);
												var phoneNo = data.userInfo.phoneno
														.toString();
												$(
														"input[name='applicationInfo.contact']")
														.val(phoneNo);
											} else if (data.resultCause.resultCode
													.toString() == "404") {
												$("#loginErrTips").html(
														"**您输入的用户名不存在**");
												$("#loginErrTips").show();
											} else if (data.resultCause.resultCode
													.toString() == "302") {
												window.location
														.replace(data.resultCause.resultDesc);
											} else {
												$("#loginErrTips").html(
														"**您输入的密码错误**");
												$("#loginErrTips").show();
											}
										}
									});
						});
	});
</script>

