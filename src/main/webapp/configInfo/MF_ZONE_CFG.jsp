<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.inline_div label,.inline_div input {
	display: inline-block;
	*display: inline;
	*zoom: 1
}
</style>

<div class="row" id="MF_ZONE_CFG" style="display:none">

	<h2>
		区域配置:&nbsp;&nbsp;
		<button class="btn btn-success" id="btnZoneRefresh">刷 新</button>
		&nbsp;&nbsp;
		<button class="btn btn-success" id="btnZoneSave">保 存</button>
	</h2>
	<form id="zoneaddForm"
		style="border: dashed 1px yellow;border-radius: 50px;MARGIN-RIGHT: auto; MARGIN-LEFT: auto; background-color:#EEE;">
		<br>
		<div class="inline_div">
			&nbsp;&nbsp;&nbsp;&nbsp; <label>区域：</label> <input type="text"
				placeholder="区域" name="zoneCfg.zone" /> <label
				class="control-label">楼层：</label> <input type="text"
				placeholder="楼层" name="zoneCfg.floor" /> <label
				class="control-label">座位数：</label> <input type="text"
				placeholder="座位数" name="zoneCfg.seats" /><label class="control-label">备注：</label> <input type="text"
				placeholder="备注" name="zoneCfg.comment" /> 
		</div>
		<div class="inline_div">
			&nbsp;&nbsp;&nbsp;&nbsp; <label class="control-label">投影：</label> <select
				class="span3" name="zoneCfg.projector">
				<option selected='selected' value=false>无</option>
				<option value=true>有</option>
			</select> <label class="control-label">&nbsp;&nbsp;教师管理软件：</label> <select class="span3"
				name="zoneCfg.teachermanage">
				<option selected='selected' value=false>无</option>
				<option value=true>有</option>
			</select> <label
				class="control-label">&nbsp;&nbsp;麦克：</label> <select class="span3"
				name="zoneCfg.mic">
				<option selected='selected' value=false>无</option>
				<option value=true>有</option>
			</select>
		</div>

		<div style="TEXT-ALIGN: center;">
			<button class="btn " id="btnZoneAdd">增加</button>
		</div>

	</form>

	<table id='zone_table' cellspacing="0" cellpadding="0"
		class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><font>&nbsp;</font> 区域</th>
				<th><font>&nbsp;</font> 楼层</th>
				<th><font>&nbsp;</font> 座位数</th>
				<th><font>&nbsp;</font> 麦克风</th>
				<th><font>&nbsp;</font> 投影仪</th>
				<th><font>&nbsp;</font> 教师管理</th>
				<th><font>&nbsp;</font> 备注</th>
				<th><font>&nbsp;</font> 操作</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>


