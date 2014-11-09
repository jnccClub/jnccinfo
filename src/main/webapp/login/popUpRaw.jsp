<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>页面弹窗口,页面变半透明,需关闭弹窗口才操作页面</title>
<style>
html,body {
	font-size: 12px;
	margin: 0px;
	height: 100%;
}

.mesWindow {
	border: #666 1px solid;
	background: #fff;
}

.mesWindowTop {
	height: 30px;
	border-bottom: #eee 1px solid;
	margin-left: 4px;
	padding: 3px;
	font-weight: bold;
	text-align: left;
	font-size: 12px;
}

.mesWindowContent {
	margin: 4px;
	font-size: 12px;
}

.mesWindow .close {
	height: 15px;
	width: 28px;
	border: none;
	cursor: pointer;
	text-decoration: underline;
	background: #fff
}
</style>

<script>
	var isIe = (document.all) ? true : false;
	//设置select见状态
	function setSelectState(state) {
		var objl = document.getElementsByTagName('select');
		for (var i = 0; i < objl.length; i++) {
			objl[i].style.visibility = state;
		}
	}
	function mousePosition(ev) {
		if (ev.pageX || ev.pageY) {
			return {
				x : ev.pageX,
				y : ev.pageY
			};
		}
		return {
			x : ev.clientX + document.body.scrollLeft
					- document.body.clientLeft,
			y : ev.clientY + document.body.scrollTop - document.body.clientTop
		};
	}
	//弹
	function showMessageBox(wTitle, content, pos, wWidth, wHeight) {
		closeWindow();
		var bWidth = parseInt(document.documentElement.scrollWidth);
		var bHeight = parseInt(document.documentElement.scrollHeight);
		if (isIe) {
			setSelectState('hidden');
		}
		var back = document.createElement("div");
		back.id = "back";
		var styleStr = "top:0px;left:0px;position:absolute;background:#666;width:"
				+ bWidth + "px;height:" + bHeight + "px;";
		styleStr += (isIe) ? "filter:alpha(opacity=40);" : "opacity:0.40;";
		back.style.cssText = styleStr;
		document.body.appendChild(back);
		var mesW = document.createElement("div");
		mesW.id = "mesWindow";
		mesW.className = "mesWindow";
		mesW.innerHTML = "<div class='mesWindowTop'><table width='100%' height='100%'><tr><td>"
				+ wTitle
				+ "</td><td style='width:1px;'><input type='button' onclick='closeWindow();' title='关闭窗口' class='close' value='关闭' /></td></tr></table></div><div class='mesWindowContent' id='mesWindowContent'>"
				+ content + "</div><div class='mesWindowBottom'></div>";
		styleStr = "width:" + wWidth + "px;height:" + wHeight
				+ "px;position:absolute;top:50%;left:50%;margin-left:-"
				+ wWidth / 2 + "px;margin-top:-" + wHeight / 2 + "px;";
		mesW.style.cssText = styleStr;
		document.body.appendChild(mesW);
	}
	function showBackground(obj, endInt) {
		obj.filters.alpha.opacity += 1;
		if (obj.filters.alpha.opacity < endInt) {
			setTimeout(function() {
				showBackground(obj, endInt)
			}, 8);
		}
	}
	//关闭窗口
	function closeWindow() {
		if (document.getElementById('back') != null) {
			document.getElementById('back').parentNode.removeChild(document
					.getElementById('back'));
		}
		if (document.getElementById('mesWindow') != null) {
			document.getElementById('mesWindow').parentNode
					.removeChild(document.getElementById('mesWindow'));
		}
		if (isIe) {
			setSelectState('');
		}
	}
	//测试弹
	function testMessageBox(ev) {
		var objPos = mousePosition(ev);
		messContent = "<div style='padding:20px 0 20px 0;text-align:center'>信息</div>";
		showMessageBox('窗口标题', messContent, objPos, 400, 200);
	}
</script>

</head>
<body>
	<div style="padding:20px">
		<div style="text-align:center";>
			<a href="#none" onclick="testMessageBox(event);">弹窗口</a>
		</div>
	</div>
</body>
</html>
