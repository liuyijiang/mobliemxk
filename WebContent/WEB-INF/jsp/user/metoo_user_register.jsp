<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <%@ include file="../../../headerinclude.jsp"%>
</head>
<body class="mxkbody mxkbackgroud">
<div class="navbar navbar-inverse navbar-fixed-top" style="opacity: 0.9;">
	<div class="navbar-inner">
		<div class="container" style="text-align:center;">
			<a href="<%=rootPath %>/showHelp" class="pull-left btn btn-info"><i class="icon-exclamation-sign"></i>米兔</a>
		    <a href="<%=rootPath %>/loginView" class="pull-right btn btn-success"><i class="icon-signin"></i>登陆</a>
		</div>
	</div>
</div>
	<div class="container ">
	      <form id="re" action="userRegister" enctype="multipart/form-data" method="post">
				<span style="font-size: 20px;" class="text-info"><strong>用户注册</strong></span><br />
				<span class="muted"><small>注册后你可以创建自己的模型专题，分享收藏其他模型玩家的part</small></span>
				<div style="height:3px"></div>
				<label>用户昵称</label>
				<input id="username" type="text"
					class="input-block-level" name="userRegisterRequest.username"
					placeholder="用户名要唯一哟"
					onblur="valiateparm('name')" />
				<br /> 
				<label>邮箱地址</label> 
				<input id="useremail" type="text"
					class="input-block-level"  onblur="valiateparm('email')"
					placeholder="邮箱地址这是你的登陆账号"
					name="userRegisterRequest.email">
				<br />
				<label>用户密码</label> 
				<input id="password"
					type="password" class="input-block-level" 
					placeholder="设置密码"
					name="userRegisterRequest.password"
					onblur="ispass()" />
				<br />
				<div style="height:3px"></div>
				<label>性别</label> 
				<select name="userRegisterRequest.sex">
					<option value="1">男</option>
					<option value="0">女</option>
				</select> <br /> 
				<label>关注方向</label> 
				<select name="userRegisterRequest.interest">
					<option value='舰船模型'>舰船模型</option>
					<option value='装甲模型'>装甲模型</option>
					<option value='战机模型'>战机模型</option>
					<option value='动漫模型'>动漫模型</option>
					<option value='动态航空'>动态模型</option>
					<option value='其他模型'>其他模型</option>
				</select>
	  </form>
		<button class="btn btn-primary btn-block btn-large" onclick="smb()"><i class="icon-user"></i>完成注册</button>
  </div>
<%@ include file="../../../basefootinclude.jsp"%>  
	<script type="text/javascript">
   
	  function valiateparm(type){
	    	if(type == "email"){
	    		$("#emailvaliate").html("");
	    		if(!isEmail()){
	    			return;
	    		}
	    		var parm = $('#useremail').val();
	    		var datas = {"registerCheckRequest.parm":parm,"registerCheckRequest.type":type};
	    		validate(datas,type);
	    	}else if(type == "name"){
	    		$("#namevaliate").html("");
	    		if(!isName()){
	    			return;
	    		}
	    		var parm = $('#username').val();
	    		var datas = {"registerCheckRequest.parm":parm,"registerCheckRequest.type":type};
	    		validate(datas,type);
	    	}
	    }
	   
	    function validate(datas,type){
	    	$.ajax({
				url : path + "/registerCheck",
				type : "POST",
				cache : false,
				async : false,
				data: datas,
				dataType : "json",
				success : function(item) {
					callback(item,type);
				}
	       });
	    }
	
	    function callback(message,type){
	    	if(type == "email"){
	    		if(message == "success"){
	    			emailvalidate = true;
	    		}else{
	    			emailvalidate = false;
	    			showCallbackmessageModal("这个邮箱已被使用");
	    		}
	    	}else if(type == "name"){
	    		if(message == "success"){
	    			namevalidate = true;
	    		}else{
	    			namevalidate = false;
	    			showCallbackmessageModal("这个昵称已被使用");
	    		}
	    	}
	    }
	    
	</script>
	<script type="text/javascript">
	var passbeanvalidate = false;
	var namevalidate = false;
	var emailvalidate = false;
	
	function isEmail() {
		var strEmail = $("#useremail").val();
		if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1){
			return true;
		}else{
			showCallbackmessageModal("这个邮箱格式不正确");
			return false;
		}
	  }  
	
	function isName(){
		var parm = $("#username").val();
		if(parm != ""){
			return true;
		}else{
			showCallbackmessageModal("昵称不能为空");
			return false;
		}
	}
	
	function ispass(){
		var parm = $("#password").val();
		if(parm != ""){
			passbeanvalidate = true;
		}else{
			passbeanvalidate = false;
			showCallbackmessageModal("密码不能为空");
		}
	}
	
	function smb(){
        if(passbeanvalidate && namevalidate && emailvalidate){
        	$('#re').submit();
        }
	}
	</script>
</body>
</html>