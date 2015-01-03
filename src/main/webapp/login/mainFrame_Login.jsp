<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="mainFrame_Login" style="text-align:center;"
	id="mainFrame_Login">
	<form id="userLoginForm">
		<p>
			尚无登录账号？ <br> <a href="#"
				id="loginJump2SignUp">快快注册加入我们</a>
		</p>

		<input name="userInfo.username" placeholder="请输入学号/工号"
			class="UsernameInput" required id="loginUserNameInput" /> <input
			name="userInfo.password" placeholder="请输入密码" class="UserPasswdInput"
			type="password" required />
		<!-- <textarea rows="4" cols="50" name="subject"
			placeholder="Please enter your message" class="message" required></textarea> -->
		<p id="loginErrTips"></p>
		<input type="button" class="loginBtn" type="submit" value="提交"
			id="loginSubmit" /> <input class="resetBtn" type="reset" value="重置" />
	</form>
</div>

<script>
function showWelBar(u_name){
	$("#loginInfo").html(
			"欢迎您，" + u_name + "&nbsp;&nbsp;");
	$("#loginEntry").hide();
	$("#logOutEntry").show();
	$("#loginInfo").show();
	renewMainId("#MF_Body");
}
	$(function() {
		$("#loginJump2SignUp").click(function() {
			renewMainId("#mainFrame_SignUp");
		});
		$("#loginSubmit").click(
				function() {// 必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
					var params = $("#userLoginForm").serializeArray();
					$.ajax({
						url : 'comAction/user_loginIn.action',
						type : 'post',
						data : params,
						dataType : 'json',
						success : function(data) {
							if (data.resultCause.resultCode.toString() == "200") {
								//alert("恭喜，登录成功！");
								var u_name = data.userInfo.realname.toString();
								var role = data.userInfo.role.toString();
								userItemShow(role);
								showWelBar(u_name);
								
								
							} else if (data.resultCode.toString() == "404") {
								$("#loginErrTips").html("**您输入的用户名不存在**");
								$("#loginErrTips").show();
							} else {
								$("#loginErrTips").html("**您输入的密码错误**");
								$("#loginErrTips").show();
							}
						}
					});
				});
	});
</script>

