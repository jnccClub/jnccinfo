<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="jncc booking" />
<meta name="keywords" content="jncc,booking,huangpengfei" />
<meta name="author" content="huangpengfei" />
<link rel="shortcut icon" href="../favicon.ico">

<link
	href="<s:url value='/css/main.css' encode='false' includeParams='none'/>"
	rel="stylesheet" type="text/css" media="all" />

<script src="js/common/jquery.min.js"></script>
<script type="text/javascript" src='js/common/jquery.js'></script>
<script type="text/javascript" src='js/common/jquery.easyui.min.js'></script>
<script src="js/common/bootstrap.min.js"></script>
<script src="js/common/site.js"></script>
<script type="text/javascript" src="js/Calendar4.js"></script>
<script type="text/javascript" src='js/datepick/datepick.js'></script>
<script type="text/javascript"
	src='js/common/bootstrap-datetimepicker.min.js'></script>
<script type="text/javascript" src='js/file/ajaxfileupload.js'></script>
<script type="text/javascript" src='js/table/EdTable.js'></script>
<script type="text/javascript" src='js/common/jquery.contextmenu.r2.js'></script>
<script type="text/javascript" src='js/table/softwareOperate.js'></script>
<script type="text/javascript" src='js/application/application.js'></script>
<script type="text/javascript" src='js/gloableDefine.js'></script>
<script type="text/javascript" src='js/cfg/zoneConfig.js'></script>

<title>JNCC booking</title>
</head>
<body>
	<h2>中国人</h2>
	<p>Click the buttons on datagrid toolbar to do crud actions.</p>

	<table id="dg" title="My Users" class="easyui-datagrid"
		style="width:700px;height:250px" url="get_users.php"
		toolbar="#toolbar" pagination="true" rownumbers="true"
		fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="firstname" width="50">First Name</th>
				<th field="lastname" width="50">Last Name</th>
				<th field="phone" width="50">Phone</th>
				<th field="email" width="50">Email</th>
			</tr>
		</thead>
		<tbody>
			<tr datagrid-row-index="0" class="datagrid-row" style="height: 25px;">
				<td field="firstname"><div style="height:auto;"
						class="datagrid-cell datagrid-cell-c1-firstname">12345</div></td>
				<td field="lastname"><div style="height:auto;"
						class="datagrid-cell datagrid-cell-c1-lastname">11113</div></td>
				<td field="phone"><div style="height:auto;"
						class="datagrid-cell datagrid-cell-c1-phone">123123</div></td>
				<td field="email"><div style="height:auto;"
						class="datagrid-cell datagrid-cell-c1-email">413123@qq.com</div></td>
			</tr>
			<tr datagrid-row-index="1" class="datagrid-row" style="height: 25px;">
				<td field="firstname"><div style="height:auto;"
						class="datagrid-cell datagrid-cell-c1-firstname">123</div></td>
				<td field="lastname"><div style="height:auto;"
						class="datagrid-cell datagrid-cell-c1-lastname">123</div></td>
				<td field="phone"><div style="height:auto;"
						class="datagrid-cell datagrid-cell-c1-phone">213</div></td>
				<td field="email"><div style="height:auto;"
						class="datagrid-cell datagrid-cell-c1-email">鹅13@163.com</div></td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td field="firstname">11111</td>
				<td field="lastname">kao</td>
				<td field="phone">+86-010-110</td>
				<td field="email">testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>11111</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>11111</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>11111</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>11111</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>11111</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>11111</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>55555</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>55555</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>55555</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>55555</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>55555</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
			<tr class="datagrid-row" style="height: 25px;">
				<td>666666</td>
				<td>kao</td>
				<td>+86-010-110</td>
				<td>testssf</td>
			</tr>
		</tbody>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="newUser()">New User</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="editUser()">Edit User</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove
			User</a>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width:400px;height:280px;padding:10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">User Information</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>First Name:</label> <input name="firstname"
					class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>Last Name:</label> <input name="lastname"
					class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>Phone:</label> <input name="phone" class="easyui-textbox">
			</div>
			<div class="fitem">
				<label>Email:</label> <input name="email" class="easyui-textbox"
					validType="email">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')"
			style="width:90px">Cancel</a>
	</div>
	<script type="text/javascript">
		var url;
		function newUser() {
			$('#dlg').dialog('open').dialog('setTitle', 'New User');
			$('#fm').form('clear');
			url = 'save_user.php';
		}
		function editUser() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('setTitle', 'Edit User');
				$('#fm').form('load', row);
				url = 'update_user.php?id=' + row.id;
			}
		}
		function saveUser() {
			$('#fm').form('submit', {
				url : url,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.errorMsg) {
						$.messager.show({
							title : 'Error',
							msg : result.errorMsg
						});
					} else {
						$('#dlg').dialog('close'); // close the dialog
						$('#dg').datagrid('reload'); // reload the user data
					}
				}
			});
		}
		function destroyUser() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$.messager.confirm('Confirm',
						'Are you sure you want to destroy this user?',
						function(r) {
							if (r) {
								$.post('destroy_user.php', {
									id : row.id
								}, function(result) {
									if (result.success) {
										$('#dg').datagrid('reload'); // reload the user data
									} else {
										$.messager.show({ // show error message
											title : 'Error',
											msg : result.errorMsg
										});
									}
								}, 'json');
							}
						});
			}
		}
	</script>
	<style type="text/css">
#fm {
	margin: 0;
	padding: 10px 30px;
}

.ftitle {
	font-size: 14px;
	font-weight: bold;
	padding: 5px 0;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.fitem {
	margin-bottom: 5px;
}

.fitem label {
	display: inline-block;
	width: 80px;
}

.fitem input {
	width: 160px;
}
</style>

</body>
</html>