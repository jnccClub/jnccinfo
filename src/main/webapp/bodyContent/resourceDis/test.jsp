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

<script src="../../js/common/jquery.min.js"></script>
<script type="text/javascript" src='../../js/common/jquery.js'></script>
<script type="text/javascript"
	src='../../js/common/jquery.easyui.min.js'></script>
<script src="../../js/common/bootstrap.min.js"></script>
<script src="../../js/common/site.js"></script>
<script type="text/javascript" src="../../js/Calendar4.js"></script>
<script type="text/javascript" src='../../js/datepick/datepick.js'></script>
<script type="text/javascript"
	src='../../js/common/bootstrap-datetimepicker.min.js'></script>
<script type="text/javascript" src='../../js/file/ajaxfileupload.js'></script>
<script type="text/javascript" src='../../js/table/EdTable.js'></script>
<script type="text/javascript"
	src='../../js/common/jquery.contextmenu.r2.js'></script>
<script type="text/javascript" src='../../js/table/softwareOperate.js'></script>
<script type="text/javascript" src='../../js/application/application.js'></script>
<script type="text/javascript" src='../../js/gloableDefine.js'></script>
<script type="text/javascript" src='../../js/cfg/zoneConfig.js'></script>

<title>JNCC booking</title>
</head>
<body>
	<h2>中国人</h2>
	<p>Click the buttons on datagrid toolbar to do crud actions.</p>

	<table id="list_data" cellspacing="0" cellpadding="0">
		<thead>
			<tr>
				<th field="fldAppDept" width="100">部门</th>
				<th field="fldAppNode" width="100">网站</th>
				<th field="fldAppName" width="100">名称</th>
				<th field="fldAppMgr" width="100">管理员</th>
				<th field="fldAppNote" width="100">注释</th>
				<th field="fldAppType" width="100">类型</th>
				<th field="fldTelphone" width="100">电话</th>
				<th field="fldAppImg" width="100">职务</th>
				<th field="fldAppMonitor" width="100">启用监测</th>
				<th field="fldAppLevel" width="100">要重级别</th>
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
			idField : 'fldId',
			singleSelect : false,//是否单选 
			pagination : true,//分页控件 
			rownumbers : true,//行号 
			frozenColumns : [ [ {
				field : 'ck',
				checkbox : true
			} ] ],
			toolbar : [ {
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					openDialog("add_dialog", "add");
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					openDialog("add_dialog", "edit");
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					delAppInfo();
				}
			} ],
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
	</script>

</body>
</html>