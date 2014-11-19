<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>




<div class="span9" id="Body_CreateApp" style="display:none">
	<div class="hero-unit">
		<h1>欢迎!</h1>
		<p>如果不清楚如何创建申请，请选择帮助</p>
		<ul>
		<li>填写基本信息</li>
		<li>选择必备软件资源或实验室资源</li>
		<li>选择符合条件的区域</li>
		</ul>
		<p>
			<a href="javascript:(0)" class="btn btn-primary btn-large">创建申请</a> <a
				class="btn btn-large">帮助</a>
		</p>
	</div>

	<div class="span9">
		<h1 id="create_application_title">创建申请</h1>
		<form id="elementry_form" class="form-inline">
		<jsp:include page="apply_steps/elementryInfo.jsp"></jsp:include>
		<jsp:include page="apply_steps/detailInfo.jsp"></jsp:include>
		</form>
	</div>




	<h2>历史申请</h2>
	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>课程名称</th>
				<th>人数</th>
				<th>状态</th>
				<th>申请时间</th>
				<th>查看</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Nike.com Redesign</td>
				<td>Monsters Inc</td>
				<td>New Task</td>
				<td>4 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Nike.com Redesign</td>
				<td>Monsters Inc</td>
				<td>New Message</td>
				<td>5 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Nike.com Redesign</td>
				<td>Monsters Inc</td>
				<td>New Project</td>
				<td>5 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Twitter Server Consulting</td>
				<td>Bad Robot</td>
				<td>New Task</td>
				<td>6 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Childrens Book Illustration</td>
				<td>Evil Genius</td>
				<td>New Message</td>
				<td>9 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Twitter Server Consulting</td>
				<td>Bad Robot</td>
				<td>New Task</td>
				<td>16 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Twitter Server Consulting</td>
				<td>Bad Robot</td>
				<td>New Project</td>
				<td>16 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
			<tr>
				<td>Twitter Server Proposal</td>
				<td>Bad Robot</td>
				<td>Completed Project</td>
				<td>20 days ago</td>
				<td><a href="#" class="view-link">View</a></td>
			</tr>
		</tbody>
	</table>
	<ul class="pager">
		<li class="next"><a href="activity.htm">More &rarr;</a></li>
	</ul>
	<ul class="pager">
		<li class="next">更多信息 <a href="http://www.cssmoban.com/"
			target="_blank" title="联系我们JNCC">联系我们</a> - JNCC club<a
			href="http://www.cssmoban.com/" title="详细地址" target="_blank">详细地址</a>
		</li>
	</ul>
</div>