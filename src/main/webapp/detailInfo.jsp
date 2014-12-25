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

<title>预定课程详细信息</title>
</head>
<body>
	<div class="container" style="height:900">
		<table id="tbl_app_dateL" cellspacing="0" cellpadding="0"
			class="easyui-datagrid">
			<thead>
				<tr>
					<th data-options="field:'fld_CNO',width:180">课程编号</th>
					<th field="fld_CTIME" width="180">创建时间</th>
					<th field="fld_ZONE" width="55">区域</th>
					<th field="fld_FLOOR" width="55">楼层</th>
					<th field="fld_COUREDATE" width="100">上课日期</th>
					<th field="fld_COURSE" width="100">课程</th>
				</tr>
			</thead>
		</table>
		<script type="text/javascript">

			function GetQueryString(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return (r[2]);
				return null;
			}
			
			var appID = GetQueryString("appID");
			var createTime = GetQueryString("createTime");
			$('#tbl_app_dateL').datagrid({
				title : '课程申请具体日历表',
				iconCls : 'icon-edit',//图标 
				width : 700,
				height : '1000',
				nowrap : false,
				striped : true,
				border : true,
				collapsible : false,//是否可折叠的 
				fit : true,//自动大小 
				url : 'res_queryDates.action?appID='+appID+'&createTime='+createTime,
				sortName : 'fld_COUREDATE',
				sortOrder : 'asc',
				remoteSort : false,
				idField : 'fld_CNO',
				singleSelect : false,//是否单选 
				pagination : true,//分页控件 
				rownumbers : true,//行号 
				frozenColumns : [ [ {
					field : '',
					checkbox : true
				} ] ],
				onLoadSuccess : function(data) {
					//$('#tbl_app_dateL').datagrid('selectAll');
				}
			});
			//设置分页控件 
			var p = $('#tbl_app_dateL').datagrid('getPager');
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

			function detailFormat(val, row) {
				return '<a href="#" onclick="queryDetailDate(\''
						+ row.fld_CTIME + '\',\'' + row.fld_CNO + '\')">'
						+ row.fld_CNO + '</a>';
			}

			function queryDetailDate(appId, createTime) {
				alert("appId is:" + appId + ";createTime is:" + createTime);
			}
		</script>
	</div>

</body>
</html>