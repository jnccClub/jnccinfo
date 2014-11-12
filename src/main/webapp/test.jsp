<%@ page language="java" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>AJAX输入提示</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css" media="screen">
.onmouset_out {
	background-color: #99CCFF;
	padding: 2px 6px 2px 6px;
}

.onmouset_over {
	background-color: #006600;
	padding: 2px 6px 2px 6px;
}

#result_display {
	border: 1px solid #FFFFFF;
}
</style>
<script type="text/javascript">
	var xmlHttp;
	//创建XMLHttpRequest对象   
	function createXmlHttp() {
		//根据window.XMLHttpRequest对象是否存在使用不同的创建方式   
		if (window.XMLHttpRequest) {
			//FireFox、Opera等浏览器支持的创建方式   
			xmlHttp = new XMLHttpRequest();
		} else {
			//IE浏览器支持的创建方式   
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function inputSuggest() {
		var txtValue = document.getElementById('txt').value;
		createXmlHttp();
		xmlHttp.onreadystatechange = _handle;
		url = "suggest.do?txtValue=" + txtValue;
		xmlHttp.open("POST", url, false);
		xmlHttp.send(null);
	}
	function _handle() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				var str = xmlHttp.responseText.split("#");
				var s = document.getElementById('result_display')
				s.innerHTML = '';
				for (i = 0; i < str.length - 1; i++) {
					var suggest = '<div onmouseover="onmouseOver(this);" ';
					suggest += 'onmouseout="onmousetOut(this);" ';
					suggest += 'onclick="setSuggestValue(this.innerHTML);" ';
					suggest += 'class="onmouset_out">' + str[i] + '</div>';
					s.innerHTML += suggest;
				}
			}
		}
	}
	function onmouseOver(div) {
		div.className = 'onmouse_over';
	}
	function onmousetOut(div) {
		div.className = 'onmouset_out';
	}
	function setSuggestValue(value) {
		document.getElementById('txt').value = value;
		document.getElementById('result_display').innerHTML = '';
	}
</script>
</head>

<body>
	<h3>一个简单的AJAX输入提示</h3>
	<form id="frmSearch" action="">
		<input type="text" id="txt" name="author" alt="输入条件"
			onkeyup="inputSuggest();" style="width:200px" /> <input type="submit"
			id="search" value="搜索" alt="搜索" /><br />
		<div id="result_display" style="width:200px"></div>
	</form>
</body>
</html>
