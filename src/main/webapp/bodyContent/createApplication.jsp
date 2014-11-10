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
		<p>
			<a href="javascript:(0)" class="btn btn-primary btn-large">创建申请</a> <a
				class="btn btn-large">帮助</a>
		</p>
	</div>

	<div class="span9">
		<h1>创建申请</h1>
		<form id="edit-profile" class="form-inline">
			<fieldset>
				<legend>请认真填写申请事项！</legend>
				<div class="control-group">
					<label class="control-label">课程名称</label> <input type="text"
						name="applicationInfo.course" placeholder="课程名称" />&nbsp;&nbsp;&nbsp;
					<label class="control-label">课程人数</label> <input type="text"
						name="applicationInfo.seats" placeholder="50" />
					&nbsp;&nbsp;&nbsp; <label class="control-label">联系方式</label> <input
						type="text" name="applicationInfo.contactNo"
						placeholder="02552112897" />
				</div>

				<div class="control-group">
					<label class="control-label">开始日期</label><input type="text" name="userInfo.birth" id="timeBirth"
					onclick="MyCalendar.SetDate(this)" value="1990-01-01" />

				</div>
				<select style="width:3.5em;height:1.7em">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>时
				<select style="width:3.5em;height:1.7em">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>分

				<div class="control-group">
					<label class="control-label" for="input01">Email</label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="input01"
							value="john.smith@example.org" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="fileInput">Photo</label>
					<div class="controls">
						<input class="input-file" id="fileInput" type="file" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="textarea">Biography</label>
					<div class="controls">
						<textarea class="input-xlarge" id="textarea" rows="4">Web technology junkie who writes innovative and bestselling technical books. Also enjoys Sunday bicycle rides and all "good" comedy.</textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="optionsCheckbox">Public
						Profile</label>
					<div class="controls">
						<input type="checkbox" id="optionsCheckbox" value="option1"
							checked="checked" />
					</div>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">Save</button>
					<button class="btn">Cancel</button>
				</div>
			</fieldset>
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