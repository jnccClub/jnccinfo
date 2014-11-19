<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<fieldset>
	<legend>
		预约课程：<a href="#" id="generatedCourse"></a>&nbsp;&nbsp;申请单号：<a href="#"
			id="generatedAppID"></a><br>请确认申请信息：
	</legend>
	<table id='confirm_table' cellspacing="0" cellpadding="0"
		class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><font class="resizeDivClass" id='dragConfirm1'>&nbsp;</font>
					上课日期</th>
				<th><font class="resizeDivClass" id='dragConfirm2'>&nbsp;</font>
					星期</th>
				<th><font class="resizeDivClass" id='dragConfirm3'>&nbsp;</font>
				预约类型</th>
				<th><font class="resizeDivClass" id='dragConfirm4'>&nbsp;</font>
					开始时间</th>
				<th><font class="resizeDivClass" id='dragConfirm5'>&nbsp;</font>
					结束时间</th>
				<th><font class="resizeDivClass" id='dragConfirm6'>&nbsp;</font>
					操作系统</th>
				<th><font class="resizeDivClass" id='dragConfirm7'>&nbsp;</font>
					必备软件</th><th><font class="resizeDivClass" id='dragConfirm8'>&nbsp;</font>
					其他说明</th>
				<th><font class="resizeDivClass" id='dragConfirm8'>&nbsp;</font>
					操作</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>



	<div class="form-actions">
		<button class="btn btn-primary" onclick="appFirstNext()">确 认</button>
		<button class="btn">上一步</button>
	</div>
</fieldset>


<script>
	//获取所有拖动块引用
	var dragConfirm1 = document.getElementById('dragConfirm1');
	var dragConfirm2 = document.getElementById('dragConfirm2');
	var dragConfirm3 = document.getElementById('dragConfirm3');
	var dragConfirm4 = document.getElementById('dragConfirm4');
	var dragConfirm5 = document.getElementById('dragConfirm5');
	var dragConfirm6 = document.getElementById('dragConfirm6');
	var dragConfirm6 = document.getElementById('dragConfirm7');
	var swListtable = document.getElementById('swList_table');

	//设置表格拖动点
	function changeWidth(obj) {
		//在拖动点按下鼠标时，记录拖动点的横坐标
		obj.onmousedown = function(e) {
			e = e || event;
			//this指向obj对象。获取鼠标当前的X轴坐标
			this.mouseDownX = e.clientX;
			//获取font的父元素td的宽度
			this.pareneTdW = this.parentNode.offsetWidth;
			//表格初始宽度
			this.pareneTableW = swListtable.offsetWidth;
			//IE下设置鼠标点捕获，防止鼠标焦点被打断。FF下无须捕获
			if (this.setCapture)
				this.setCapture();

			//鼠标移动时触发的事件，计算拖动了多少偏移量
			document.onmousemove = function(e) {
				e = e || event;
				if (!obj.mouseDownX)
					return;
				//newWidth的值为td宽度加鼠标当前的X轴坐标再减去mouseDownX
				//表示现在比原先移动了多少偏移量
				var newWidth = obj.pareneTdW + e.clientX - obj.mouseDownX;

				//最小宽度为60象素，不可在移动TD
				if (newWidth < 60)
					return;
				//改变td的宽度
				obj.parentNode.style.width = newWidth + 'px';

				swListtable.style.width = obj.pareneTableW + e.clientX
						- obj.mouseDownX;

				//更新隐藏样式
				if (obj.id == 'dragConfirm6')
					(document.styleSheets[0].rules || document.styleSheets[0].cssRules)[0].style.width = newWidth
							+ 'px';
			}
			//在拖动点松开鼠标时，还原拖动点的横坐标
			document.onmouseup = function(e) {
				e = e || event;
				//释放焦点捕获
				if (obj.releaseCapture)
					obj.releaseCapture();
				//设置拖动点X轴坐标为0，表示拖动停止中
				obj.mouseDownX = 0;
			}
		}
	}

	//调用拖动设置函数
	changeWidth(dragConfirm1);
	changeWidth(dragConfirm2);
	changeWidth(dragConfirm3);
	changeWidth(dragConfirm4);
	changeWidth(dragConfirm5);
	changeWidth(dragConfirm6);
	changeWidth(dragConfirm7);
</script>
</div>
