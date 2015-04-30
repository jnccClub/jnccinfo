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
	function checkName() {
		var params = $("#subUserForm").serializeArray();
		var username = $("#singUpUsername").val();
		if (invalidUsername(username)) {
			$("#nameValidate").removeClass().addClass("signup_errTips");
			return false;
		}
		$
				.ajax({
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

	function checkRegForm() {
		var isformValid = $("#subUserForm").form('validate');
		if (isformValid) {
			if (!checkName() || !regNameValid) {
				return false;
			}
		} else {
			return false;
		}
		return true;
	}
</script>
<script>
	$(function() {
		regNameValid = false;
		$("#addUser").click(function() {// 必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法

			if (!checkRegForm()) {
				return;
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
		$("#firstRegPasswd").blur(function() {
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
			guestItemHide();
			renewMainId("#mainFrame_Login");
		});
		
		
		$.extend($.fn.validatebox.defaults.rules, {
		    CHS: {
		        validator: function (value, param) {
		            return /^[\u0391-\uFFE5]+$/.test(value);
		        },
		        message: '请输入汉字'
		    },
		    ZIP: {
		        validator: function (value, param) {
		            return /^[1-9]\d{5}$/.test(value);
		        },
		        message: '邮政编码不存在'
		    },
		    QQ: {
		        validator: function (value, param) {
		            return /^[1-9]\d{4,10}$/.test(value);
		        },
		        message: 'QQ号码不正确'
		    },
		    cardNo: {
		        validator: function (value, param) {
		            return /^[0-9]\d{4,10}$/.test(value);
		        },
		        message: '学号或工号不正确'
		    },
		    mobile: {
		        validator: function (value, param) {
		            return /^((\(\d{2,3}\))|(\d{3}\-))?1\d{10}$/.test(value);
		        },
		        message: '手机号码不正确'
		    },
		    loginName: {
		        validator: function (value, param) {
		            return /^[\u0391-\uFFE5\w]+$/.test(value);
		        },
		        message: '登录名称只允许汉字、英文字母、数字及下划线。'
		    },
		    safepass: {
		        validator: function (value, param) {
		            return safePassword(value);
		        },
		        message: '密码由字母和数字组成，至少6位'
		    },
		    equalTo: {
		        validator: function (value, param) {
		            return value == $(param[0]).val();
		        },
		        message: '两次输入的字符不一致'
		    },
		    number: {
		        validator: function (value, param) {
		            return /^\d+$/.test(value);
		        },
		        message: '请输入数字'
		    }, date: {// 验证姓名，可以是中文或英文
                validator: function (value) {
                    //格式yyyy-MM-dd或yyyy-M-d
                    return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value);
                },
                message: '请输入合适的日期格式'
            },
		});
		
		/* 密码由字母和数字组成，至少6位 */
		var safePassword = function (value) {
		    return !(/^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/.test(value));
		};
		

/*	$('#subUserForm input').each(function() {
			if ($(this).attr('required') || $(this).attr('validType'))
				$(this).validatebox();
		});*/
	});
</script>
<div class="mainFrame_SignUp container" style="text-align:center;"
	id="mainFrame_SignUp">
	
	<form class="mainFrame_Table span12" id="subUserForm">
		<table>
			<tr>
				<td><input name="userInfo.username" placeholder="请输入学号/工号"
					class="easyui-validatebox UsernameInput" id="singUpUsername"
					required="true" missingMessage="学号/工号必须填写" validType="cardNo"/></td>
				<td id="nameValidate"><font class="fontRed">*&nbsp;&nbsp;&nbsp;</font>请输入本人学号/工号</td>
			</tr>
			<tr>
				<td><input placeholder="请输入密码"
					class="easyui-validatebox UserPasswdInput" type="password"
					id="firstRegPasswd" required="true" missingMessage="密码必须填写" validType="equalTo['#comPasswd']" /></td>
				<td><font class="fontRed">*&nbsp;&nbsp;&nbsp;</font>请输入3位以上个人密码</td>
			</tr>
			<tr>
				<td><input placeholder="请再次输入密码"
					class="easyui-validatebox UserPasswdInput" type="password"
					required="true" missingMessage="密码必须填写"  name="userInfo.password"
					id="comPasswd" /></td>
				<td><font class="fontRed">*&nbsp;&nbsp;&nbsp;</font>请再次输入密码</td>
			</tr>
			<tr>
				<td><input name="userInfo.realname" placeholder="请输入真实姓名"
					class="easyui-validatebox transInput" required="true"
					missingMessage="真实必须填写" validType="CHS"/></td>
				<td><font class="fontRed">*&nbsp;&nbsp;&nbsp;</font>请输入真实姓名</td>
			</tr>
			<tr>
				<td><input name="userInfo.phoneno" placeholder="请填写您的手机号码"
					class="easyui-validatebox transInput" required="true"
					missingMessage="手机号码必须填写" validType="mobile"/></td>
				<td><font class="fontRed">*&nbsp;&nbsp;&nbsp;</font>请填写您的手机号码</td>
			</tr>
			<tr>
				<td><input name="userInfo.email" placeholder="请填写您的E-mail"
					class="easyui-validatebox transInput" required="true"
					missingMessage="邮件必须填写" validType="email"
					invalidMessage="请填写正确的邮件格式" /></td>
				<td><font class="fontRed">*&nbsp;&nbsp;&nbsp;</font>请填写您的E-mail</td>
			</tr>
			<tr>
				<td><input name="userInfo.qq" placeholder="请填写您的QQ"
					class="easyui-validatebox transInput" required="true"
					missingMessage="必须填写数字" validType="QQ"/></td>
				<td><font class="fontRed">*&nbsp;&nbsp;&nbsp;</font>请填写您的QQ</td>
			</tr>
			<tr>
				<td><select size="1" name="userInfo.role" class="transInput">
						<option value="teacher">教师</option>
						<option selected value="student">学生</option>
				</select></td>
				<td>请选择您的身份</td>
			</tr>
			<tr>
				<td colspan="2" style="height:1px;display:none"><input
					type="reset" value="Reset"></td>
			</tr>
		</table>
		
		<input type="button" class="loginBtn" type="button" value="提交"
			id="addUser" /> <input class="resetBtn" type="reset" value="重置" />
	</form>
</div>
