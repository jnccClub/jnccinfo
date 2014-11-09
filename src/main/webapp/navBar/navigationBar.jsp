<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<ul id="gn-menu" class="gn-menu-main">
	<li class="gn-trigger"><a class="gn-icon gn-icon-menu"><span>个人中心</span></a>
		<nav class="gn-menu-wrapper">
			<div class="gn-scroller">
				<ul class="gn-menu">
					<li><a class="gn-icon gn-icon-search">查看申请</a></li>
					<li><a class="gn-icon gn-icon-download">下载</a>
						<ul class="gn-submenu">
							<li><a class="gn-icon gn-icon-illustrator">Vector
									Illustrations</a></li>
							<li><a class="gn-icon gn-icon-photoshop">Photoshop files</a></li>
						</ul></li>
					<li><a class="gn-icon gn-icon-cog">Settings</a></li>
					<li><a class="gn-icon gn-icon-help">Help</a></li>
					<li><a class="gn-icon gn-icon-archive">Archives</a>
						<ul class="gn-submenu">
							<li><a class="gn-icon gn-icon-article">Articles</a></li>
							<li><a class="gn-icon gn-icon-pictures">Images</a></li>
							<li><a class="gn-icon gn-icon-videos">Videos</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /gn-scroller -->
		</nav></li>
	<li><a href="#">首页</a></li>
	<li><a href="#">简介</a></li>
	<li><a href="#">有事说事</a></li>
	<li><a href="#">问题讨论</a></li>
	<li><a class="codrops-icon codrops-icon-prev" href="#"><span>查看</span></a></li>
	<li id="loginEntry"><a class="codrops-icon codrops-icon-drop"
		href="#"><span>登录/注册</span></a><a href='javarscript:(0)' id="logOutEntry">退出</a></li>	
</ul>

<script>
	new gnMenu(document.getElementById('gn-menu'));
</script>
