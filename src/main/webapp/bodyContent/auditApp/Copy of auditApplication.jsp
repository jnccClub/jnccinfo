<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div>
	<h2>中国人</h2>
	<p>Click the buttons on datagrid toolbar to do crud actions.</p>

	<table id="list_data" cellspacing="0" cellpadding="0"
		class="easyui-datagrid" toolbar="#toolbar">
		<thead>
			<tr>
				<th data-options="field:'fld_CNO',width:140,formatter:detailFormat">课程编号</th>
				<th field="fld_CUSR" width="55">创建人</th>
				<th field="fld_COURSENAME" width="55">课程名称</th>
				<th field="fld_CLASSNAME" width="55">班级名称</th>
				<th field="fld_BTYPE" width="55">预定类型</th>
				<th field="fld_SEATS" width="55">座位</th>
				<th field="fld_CTIME" width="150">创建时间</th>
				<th field="fld_OSYSTEM" width="100">操作系统</th>
				<th field="fld_SWARE" width="100">软件信息</th>
				<th field="fld_PHONE" width="55">联系电话</th>
				<th field="fld_EMAIL" width="55">电子邮箱</th>
				<th field="fld_STATUS" width="55">当前状态</th>
				<th	data-options="field:'fld_DETAIL',width:55">具体信息</th>
			</tr>
		</thead>
	</table>
	<script type="text/javascript">
		$('#list_data').datagrid({
			title : '课程申请信息',
			iconCls : 'icon-edit',//图标 
			width : 700,
			height : 'auto',
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,//是否可折叠的 
			fit : true,//自动大小 
			url : 'res_list.action',
			//sortName: 'code', 
			//sortOrder: 'desc', 
			remoteSort : false,
			idField : 'fld_CNO',
			singleSelect : false,//是否单选 
			pagination : true,//分页控件 
			rownumbers : true,//行号 
			frozenColumns : [ [ {
				field : '',
				checkbox : true
			} ] ],
			/*toolbar :
			[ {
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					newUser();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					editUser();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					destroyUser();
				}
			} ],*/
			onLoadSuccess : function(data) {
				//$('#list_data').datagrid('selectAll');
			}
		});
		//设置分页控件 
		var p = $('#list_data').datagrid('getPager');
		$(p).pagination({
			pageSize : 10,//每页显示的记录条数，默认为10 
			pageList : [ 5, 10, 15 ],//可以设置每页记录条数的列表 
			beforePageText : '第',//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		/*onBeforeRefresh:function(){
		    $(this).pagination('loading');
		    alert('before refresh');
		    $(this).pagination('loaded');
		}*/
		});

		function newUser() {
			$('#dlg').dialog('open').dialog('setTitle', '新申请');
			$('#fm').form('clear');
			url = 'save_user.php';
		}
		function editUser() {
			var row = $('#list_data').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('setTitle', '修改申请');
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
				$.messager.confirm('确认信息', '请确认是否此条记录?', function(r) {
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

		function detailFormat(val, row) {
			return '<a href="#" onclick="queryDetailDate(\'' + row.fld_CTIME
					+ '\',\'' + row.fld_CNO + '\')">'+row.fld_CNO+'</a>';
		}

		function queryDetailDate(appId, createTime) {
			alert("appId is:" + appId + ";createTime is:" + createTime);
		}
	</script>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="newUser()">新申请</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="editUser()">修改申请</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroyUser()">删除申请
			User</a>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width:300px;height:380px;padding:10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">课程信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>课程编号:</label> <input name="fld_CNO" class="easyui-textbox"
					required="true">
			</div>
			<div class="fitem">
				<label>课程名称:</label> <input name="fld_COURSENAME"
					class="easyui-textbox" required="true">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="saveUser()" style="width:90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')"
			style="width:90px">取消</a>
	</div>

	<div id="dlg_dateInfos" class="easyui-dialog"
		style="width:300px;height:380px;padding:10px 20px" closed="true"
		buttons="#dlg-buttons">
	<table cellspacing="0" cellpadding="0"	>
		<thead>
			<tr>
				<th field="fld_CNO" width="140">课程编号</th>
				<th field="fld_CUSR" width="55">创建人</th>
				<th field="fld_COURSENAME" width="55">课程名称</th>
				<th field="fld_CLASSNAME" width="55">班级名称</th>
				<th field="fld_BTYPE" width="55">预定类型</th>
				<th field="fld_SEATS" width="55">座位</th>
				<th field="fld_CTIME" width="150">创建时间</th>
				<th field="fld_OSYSTEM" width="100">操作系统</th>
				<th field="fld_SWARE" width="100">软件信息</th>
				<th field="fld_PHONE" width="55">联系电话</th>
				<th field="fld_EMAIL" width="55">电子邮箱</th>
				<th field="fld_STATUS" width="55">当前状态</th>
			</tr>
		</thead>
	</table>
	</div>

</div>