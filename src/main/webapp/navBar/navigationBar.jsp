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
					<li class="active"><a href="#" onclick="renewMainId('#MF_Body')">首页</a></li>
					<li><a href="#" onclick="queryMFDetailInof()">查看</a></li>
					<li><a href="#">帮助</a></li>
					<li class="dropdown"><a href="help.htm"
						class="dropdown-toggle" data-toggle="dropdown">引导 <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="help.htm">欢迎页面</a></li>
							<li><a href="help.htm">预留页面</a></li>
							<li><a href="help.htm">预留页面</a></li>
							<li><a href="help.htm">预留页面</a></li>
							<li class="divider"></li>
							<li class="nav-header">信息配置</li>
							<li><a href="#" onclick="renewMainId('#MF_SW_CFG')">软件信息</a></li>
							<li><a href="help.htm">硬件信息配置</a></li>
							<li><a href="#" onclick="renewMainId('#MF_ZONE_CFG')">区域信息配置</a></li>
						</ul></li>
				</ul>
				<!-- <form class="navbar-search pull-left" action="">
					<input type="text" class="search-query span2" placeholder="Search" />
				</form>
				 -->
				<ul class="nav pull-right">
					<li><a href="profile.htm">70208888</a></li>
					<li><a href="login.htm">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

