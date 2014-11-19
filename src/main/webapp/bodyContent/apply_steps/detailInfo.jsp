<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script>
	function showSoftwareHint() {
		alert("come here");
	}
</script>

<style>
.matchSoftwareWindow a {
	display: block;
	width: 100%;
	text-decoration: none;
	color: #000;
}

.focused,.matchSoftwareWindow a:hover {
	background: #1173CC;
	color: #fff;
}

.matchSoftwareWindow {
	overflow: auto;
	display: none;
	width: 204px;
	top: 15px; border : 1px solid #aaa;
	/* IE6以上和FF3样式 */
	background: #fff;
	position: absolute;
	max-height: 150px;
	*width: 192px;
	border: 1px solid #aaa;
}
</style>

<fieldset id="detailInfo_field">
	<legend>请认真选择必备软件或实验资源！</legend>
	<div class="control-group">
		<label class="control-label">操作系统:</label> <select class="span3">
			<option selected='selected' value='1'>Windows XP</option>
			<option value='2'>Windows 7</option>
			<option value='3'>Linux Ubuntu</option>
			<option value='3'>Linux NOIP</option>
			<option value='4'>Windows 2003</option>
		</select>
	</div>

	<div class="control-group">
		<label class="control-label">必备软件：</label>
		<div class="controls">
			<span style="position:relative"><input
				type="text" placeholder="软件名称"
				onkeyup='showHint(this.value,arguments[0])' name="softwareRequired" id="soft_input_1"/>&nbsp;&
			<div class="matchSoftwareWindow" id="matchwindow_1">matchWin</div></span>
			<span style="position:relative"><input
				type="text" placeholder="软件名称"
				onkeyup='showHint(this.value,arguments[0])' name="softwareRequired" id="soft_input_2"/>&nbsp;&
			<div class="matchSoftwareWindow" id="matchwindow_2">matchWin</div></span>
			<span style="position:relative"><input
				type="text" placeholder="软件名称"
				onkeyup='showHint(this.value,arguments[0])' name="softwareRequired" id="soft_input_3"/>
			<div class="matchSoftwareWindow" id="matchwindow_3">matchWin</div></span>
		</div>
	</div>

	<div class="control-group">
		
		<div class="controls">
		<label class="control-label" for="input01">电子邮箱：</label>
			<input type="text" class="input-xlarge" id="input01"
				placeholder="john.smith@example.org" />
					<label class="control-label">联系方式：</label> <input type="text"
			name="applicationInfo.contactNo" placeholder="02552112897" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="textarea">其他说明：</label>
		<div class="controls">
			<textarea class="input-xlarge" id="textarea" rows="4"
				placeholder="计算中心的8楼E区键盘不好用！"></textarea>
		</div>
	</div>

	<div class="control-group">
		<div class="controls">
			<input type="checkbox" id="optionsCheckbox" value="option1"
				checked="checked" />&nbsp;&nbsp;&nbsp;同意南京航空航天大学将军路校区计算中心所有服务条款
		</div>
	</div>
	<div class="form-actions">
		<button class="btn btn-primary" onclick="appFirstNext()">下一步</button>
		<button class="btn">上一步</button>
	</div>
</fieldset>


<script>
	//验证用户名

	/********** 定义匹配数据 ***********/
	//网易邮箱
	var software_list = '@163.com @126.com @129.com @yeah.net ';
	/** 全局变量 **/
	var matchWindow = $("#matchwindow_1");
	var input = $("#soft_input_1");

	//按键上
	var KEY_UP = 38;
	//按键下
	var KEY_DOWN = 40;
	//按键回车
	var KEY_ENTER = 13;
	
	//按TAB键
	var KEY_TAB = 9;

	//进行匹配的对象
	var focusTip;
	//匹配项个数
	var matchSize;

	function showHint(keyword, e) {
		//	alert(matchWindow.style.height+":"+matchWindow.scrollHeight)
		e = e || event;
		
		//按上下键的时候不进行刷新
		if (e.keyCode == KEY_ENTER) {
			input.val(focusTip.html());
			matchWindow.hide();
			input.blur();
		} else if (e.keyCode == KEY_UP) {
			if (matchWindow.css('display') == 'none')
				return;
			//状态复原
			if (focusTip.prev().is("a")) {
				focusTip.prev().addClass("focused");
				focusTip.removeClass("focused");
				focusTip = focusTip.prev();
				matchWindow.scrollTop -= matchWindow.scrollHeight / matchSize;
			} else {
				matchWindow.scrollTop = matchWindow.scrollHeight;
				focusTip.removeClass("focused");
				focusTip = matchWindow.children().last();
				focusTip.addClass("focused");
			}
		} else if (e.keyCode == KEY_DOWN) {
			//防止在未显示匹配框前而导致的错误
			if (matchWindow.css('display') == 'none')
				return;
			//状态复原
			if (focusTip.next().is("a")) {
				matchWindow.scrollTop += matchWindow.scrollHeight / matchSize;
				focusTip.next().addClass("focused");
				focusTip.removeClass("focused");
				focusTip = focusTip.next();
			} else {
				matchWindow.scrollTop = 0;
				focusTip.removeClass("focused");
				focusTip = matchWindow.children().first();
				focusTip.addClass("focused");
			}
		} else {
			//清除已有信息
			matchWindow.empty();
			//隐藏窗口
			matchWindow.hide();
			//保证邮箱格式的正确性
			if (!keyword)
				return;
			//if (!keyword.match(/^[\w\.\-]+@\w*[\.]?\w*/))
				//return;
			//获取匹配字符串,只取@符号后面的内容
			//keyword = keyword.match(/@\w*[\.]?\w*/);
			//进行匹配
			//var matchs = swList.match(new RegExp(keyword + "[^ ]* ", "gmi"));
			//输出匹配结果
			/*if (matchs) {
				matchs = matchs.join('').replace(/ $/, '').split(' ');
				matchSize = matchs.length;
				matchWindow.show();
				var htmlshow= "";
				for (var i = 0, l = matchs.length; i < l; i++) {
					htmlshow += '<a href="javascript:void(0)">'
							+ matchs[i] + '</a>';
				}
			}*/
				var htmlshow= "";
				matchSize = 0;
                $.each(swList,function(id, sw){
                    //如果包含则为table赋值
                    if(sw.id.name.toUpperCase().indexOf(keyword.toUpperCase())!=-1){
                    	htmlshow += '<a href="javascript:void(0)">'
							+ sw.id.name + '</a>';
                    	matchSize = matchSize+1;
                    }
                 });
                if(matchSize>0){
					matchWindow.show();
					matchWindow.html(htmlshow);
                }
			
			//为IE设置max-height
			if (matchWindow.css('maxHeight') == undefined)
				if (matchWindow.scrollHeight >= 100)
					matchWindow.height(100);
				else
					matchWindow.style.height = "0px";
			//初始化匹配焦点
			focusTip = matchWindow.children().first();
			focusTip.addClass("focused");
		}
	}


	/*
		隐藏匹配框，用于鼠标点击非匹配框的任何地方后，
		匹配框都隐藏
	 */
	$(document).click(function(e){  
		e = e || event;
		var target = e.srcElement || e.target;
		if (target.id != $(matchWindow).attr("id")) {
			matchWindow.hide();
			focusTip = null;
		}else if(target.id.indexOf("soft_input")== 0){
			input = $("#"+target.id);
			matchWindow = input.next();
		}
    });  
	
	$(function(){
		$("#soft_input_1").focus(function() {
			input = $("#soft_input_1");
			matchWindow = input.next();
		});
		$("#soft_input_2").focus(function() {
			input = $("#soft_input_2");
			matchWindow = input.next();
		});
		$("#soft_input_3").focus(function() {
			input = $("#soft_input_3");
			matchWindow = input.next();
		});
		
		$(".matchSoftwareWindow").click(function(e) {
			e = e || event;
			var target = e.srcElement || e.target;
			input.val(target.innerHTML);
		});
		
		$(".matchSoftwareWindow").mouseover(function(e) {
			e = e || event;
			var target = e.srcElement || e.target;
			focusTip.removeClass("focused");
			focusTip = $(target);
			$(target).addClass("focused");
		});
	});

	
</script>
