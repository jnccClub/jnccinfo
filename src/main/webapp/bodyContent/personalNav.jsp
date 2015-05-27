<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="span3" id="Body_PersonalNav">
	<div class="well" style="padding: 8px 0;">
		<ul class="nav nav-list">
			<li class="nav-header">计算中心</li>
			<li class="active" id="welcome_body"><a href="#"><i
					class="icon-white icon-home"></i> 首页</a></li>
			<li id="create_Application"><a href="#"><i
					class="icon-folder-open"></i> 创建申请</a></li>
			<li id="audit_Application"><a href="#"><i class="icon-check"></i>
					审批申请</a></li>
			<li><a href="javascript:void(0)"><i class="icon-envelope"></i> 消息</a></li>
			<li><a href="javascript:void(0)"><i class="icon-file"></i> 已审批申请</a></li>
			<li id="all_info_li"><a href="javascript:void(0)" ><i class="icon-list-alt"></i>
					教师信息维护</a></li>
			<li class="nav-header">我的账户</li>
			<li id="person_info_li"><a href="javascript:void(0)"
				onclick="profileInit()"><i class="icon-user"></i> 个人信息</a></li>
			<li><a href="javascript:void(0)"><i class="icon-cog"></i> 设置</a></li>
			<li class="divider"></li>
			<li id="tSelf_Book_li"><a href="javascript:void(0)"
				onclick="tSelfBook()"><i class="icon-info-sign"></i> 自助区域使用</a></li>
			<li class="nav-header">如何预约</li>
			<li><a href="javascript:void(0)"><i class="icon-picture"></i> 查看进度</a></li>
			<li><a href="javascript:void(0)"><i class="icon-stop"></i> 邮件提醒</a></li>
		</ul>
	</div>
</div>
