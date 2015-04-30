<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<div class="navbar" id="mainFrame_Nav">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand" href="#">计算中心</a>
			<div class="nav-collapse">
				<ul class="nav">
					<li class="active"><a href="#"
						onclick="renewMainId('#MF_HOME')">首页</a></li>

					<li class="dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" id="queryCenter">查询 <b
							class="caret"></b></a>
						<ul class="dropdown-menu" >
							<li><a href="#" onclick="queryMFWeekInfo()">每周课表</a></li>
							<li><a href="#" onclick="queryMFDetailInfo()">预约查询</a></li>	
						</ul>
					</li>
						
					<li><a href="#" onclick="renewMainId('#MF_Body')" id="personCenter">教师预约</a></li>
					<li><a href="#" onclick="bbsShow()">留言板</a></li>
					<li><a href="#" onclick="stuBookingShow()" id="stuBookingEntry">学生预定</a></li>
					<li class="dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" id="maintainCenter">维护中心 <b
							class="caret"></b></a>
						<ul class="dropdown-menu" >
							<li><a href="help.htm">欢迎页面</a></li>
							<li><a href="help.htm">预留页面</a></li>
							<li><a href="help.htm">预留页面</a></li>
							<li><a href="help.htm">预留页面</a></li>
							<li class="divider"></li>
							<li class="nav-header">信息配置</li>
							<li><a href="#" onclick="displaySW()">软件信息</a></li>
							<li><a href="#" onclick="disCourse()">课程信息配置</a></li>
							<li><a href="#" onclick="renewMainId('#MF_ZONE_CFG')">区域信息配置</a></li>
						</ul></li>
				</ul>
				<!-- <form class="navbar-search pull-left" action="">
					<input type="text" class="search-query span2" placeholder="Search" />
				</form>
				 -->
				<ul class="nav pull-right">
					<li><a href="#" id="loginEntry" onclick="renewMainId('#mainFrame_Login')">登录/注册</a></li>
					<li><a href="#" id="loginInfo"></a></li>
					<li><a href="#" id="logOutEntry" onclick="logOut()">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

