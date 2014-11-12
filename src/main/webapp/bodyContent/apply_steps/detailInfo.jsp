<%--  
  Created by jncc hpf.  
  User: hpf  
  Date: 14-10-15  
  Time: 下午3:46  
  To change this template use File | Settings | File Templates.  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script>
	function showSoftwareHint()	{
		alert("come here");
	}
</script>

<style>
#matchWindow{
		overflow:auto;
		display:none;
		width:191px;
		border:1px solid #aaa;
		
		
		/* IE6以上和FF3样式 */
		background:#fff;
		position:relative;
		max-height:100px;
		*width:192px;
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
		<label class="control-label">联系方式：</label> <input type="text"
			name="applicationInfo.contactNo" placeholder="02552112897" />
	</div>

	<div class="control-group">
		<label class="control-label">必备软件：</label>
		<div class="controls">
			<input type="text" placeholder="软件名称" onkeyup="showSoftwareHint(this.value)" />与
			<input type="text" placeholder="软件名称" onkeyup="showSoftwareHint(this.value)" />与<input
				type="text" placeholder="软件名称" onkeyup="showSoftwareHint(this.value)" />
		</div>
		<div class="controls">
			<div id='matchWindow'>匹配框</div>
			<div id='matchWindow'>匹配框</div>
			<div id='matchWindow' style="display:block">匹配框</div>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="input01">电子邮箱：</label>
		<div class="controls">
			<input type="text" class="input-xlarge" id="input01"
				placeholder="john.smith@example.org" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="fileInput">附加文件：</label>
		<div class="controls">
			<input class="input-file" id="fileInput" type="file" />
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
		<button class="btn btn-primary">下一步</button>
		<button class="btn">上一步</button>
	</div>
</fieldset>


<script>
	//验证用户名
	
	/********** 定义匹配数据 ***********/
	//网易邮箱
	var software_list = '@163.com @126.com @129.com @yeah.net ';
	/** 全局变量 **/
	var matchWindow = document.getElementById('matchWindow');
	var email = document.getElementById('email');
	
	//按键上
	var KEY_UP = 38;
	//按键下
	var KEY_DOWN = 40;
	//按键回车
	var KEY_ENTER = 13;
	
	//进行匹配的对象
	var focusTip;
	//匹配项个数
	var matchSize;
	
	function match(keyword,e){
	//	alert(matchWindow.style.height+":"+matchWindow.scrollHeight)
		e = e || event;
		//按上下键的时候不进行刷新
		if(e.keyCode == KEY_ENTER){
			email.value = email.value.replace(/@.*/,focusTip.innerHTML).replace(/\s/,'');
			matchWindow.style.display='none';
			email.blur();
		}else if(e.keyCode == KEY_UP){
			if(matchWindow.style.display == 'none')return;
			//状态复原
			if(!focusTip.previousSibling){
				focusTip.className = '';
				matchWindow.scrollTop = matchWindow.scrollHeight;
				focusTip = matchWindow.lastChild;
				focusTip.className = 'focused';
			}else{
				focusTip.previousSibling.className = 'focused';
				focusTip.className = '';
				focusTip = focusTip.previousSibling;
				matchWindow.scrollTop -= matchWindow.scrollHeight/matchSize;
			}
		}else if(e.keyCode == KEY_DOWN){
			//防止在未显示匹配框前而导致的错误
			if(matchWindow.style.display == 'none')return;
			//状态复原
			if(!focusTip.nextSibling){
				focusTip.className = '';
				matchWindow.scrollTop = 0;
				focusTip = matchWindow.firstChild;
				focusTip.className = 'focused';
			}else{
				matchWindow.scrollTop += matchWindow.scrollHeight/matchSize;
				focusTip.nextSibling.className = 'focused';
				focusTip.className = '';
				focusTip = focusTip.nextSibling;
			}
		}else{
			//清除已有信息
			matchWindow.innerHTML ='';
			//隐藏窗口
			matchWindow.style.display='none';
			//保证邮箱格式的正确性
			if(!keyword)return;
			if(!keyword.match(/^[\w\.\-]+@\w*[\.]?\w*/))return;
			//获取匹配字符串,只取@符号后面的内容
			keyword = keyword.match(/@\w*[\.]?\w*/);
			//进行匹配
			var matchs = mailBoxs.match(new RegExp(keyword+"[^ ]* ","gm"));
			//输出匹配结果
			if(matchs){
				matchs = matchs.join('').replace(/ $/,'').split(' ');
				matchSize = matchs.length;
				matchWindow.style.display='block';
				for(var i=0,l=matchs.length;i<l;i++){
					matchWindow.innerHTML += '<a href="javascript:void(0)">'+matchs[i]+'</a>';
				}
			}
			//为IE设置max-height
			if(matchWindow.style.maxHeight == undefined)
				if(matchWindow.scrollHeight >= 100)
					matchWindow.style.height="100px";
				else
					matchWindow.style.height="0px";
			//初始化匹配焦点
			focusTip = matchWindow.firstChild;
			focusTip.className = 'focused';
		}
	}
	
	//鼠标更新焦点新焦点
	matchWindow.onmouseover =	function (e){
		e = e || event; 
		var target = e.srcElement||e.target;
		focusTip.className = '';
		target.className = 'focused';
		focusTip = target;
	}

		
	//鼠标点击获取选取匹配项
	matchWindow.onclick =	function (e){
		e = e || event; 
		var target = e.srcElement||e.target;
		email.value = email.value.replace(/@.*/,target.innerHTML);
	}
	
	/*
		隐藏匹配框，用于鼠标点击非匹配框的任何地方后，
		匹配框都隐藏
	*/
	document.onclick=function(e){
		e = e || event; 
		var target = e.srcElement||e.target;
		if(target.id != 'matchWindow'){
			matchWindow.style.display='none';
			focusTip = null;
		}
	}
		
		//获取输入框引用
		var pwd = document.getElementById('pwd');
		//监听获取焦点事件
		pwd.onfocus=function(){
			this.className='border2';
		}
		//追加焦点丢失事件
		if(pwd.attachEvent)
			pwd.attachEvent('onblur',function(){
				pwd.className='border1';
			});
		else
			pwd.addEventListener('blur',function(){
				pwd.className='border1';
			},false);

		var pwdver = document.getElementById('pwdver');
		pwdver.onfocus=function(){
			this.className='border2';
		}
		
		if(pwdver.attachEvent)
			pwdver.attachEvent('onblur',function(){
				pwdver.className='border1';
			});
		else
			pwdver.addEventListener('blur',function(){
				pwdver.className='border1';
			},false);
</script>
