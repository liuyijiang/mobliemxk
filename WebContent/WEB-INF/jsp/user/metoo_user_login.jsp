<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <%@ include file="../../../headerinclude.jsp"%>
 <style type="text/css">
   audio
{
-webkit-transition:all 0.5s linear;
-moz-transition:all 0.5s linear;
-o-transition:all 0.5s linear;
transition:all 0.5s linear;
-moz-border-radius:7px 7px 7px 7px ;
-webkit-border-radius:7px 7px 7px 7px ;
border-radius:7px 7px 7px 7px ;
width:100px;
height:28px;
}
 
 </style>
</head>
<body class="mxkbody">
<div class="navbar navbar-inverse navbar-fixed-top" style="opacity: 0.9;">
	<div class="navbar-inner">
		<div class="container" style="text-align:center;">
			<a href="<%=rootPath %>/showHelp" class="pull-left btn btn-info"><i class="icon-exclamation-sign"></i>米兔</a>
		</div>
	</div>
</div>
	
	<div class="container" id="logindiv">
	   <c:if test="${!empty message}">
			<div id="error" class="alert alert-error">
			   <a class="close" data-dismiss="alert">×</a>
			   <p>${message }</p>
			</div>
	   </c:if>
		<form id="loginSub" action="loginIn" method="post">
			<h2 class="text-info">用户登陆</h2>
			<input type="text" name="userLoginRequest.loginName" class="input-block-level"
				placeholder="用户邮箱" /> <input type="password" name="userLoginRequest.loginPass"
				class="input-block-level" placeholder="用户密码" /> 
			<a class="btn btn-large btn-block btn-success" onclick="sub()" href="javascript:;" ><i class="icon-signin"></i>用户登陆</a>
	        <a class="btn btn-large btn-block btn-primary"  href="<%=rootPath %>/registerView"><i class="icon-user"></i>用户注册</a>	
		</form>
	</div>
<%-- <%@ include file="../public/metoo_mobile_public_no_function_footer.jsp"%> --%>
<script type="text/javascript">
   function sub(){
	   document.getElementById("loginSub").submit();
   }
</script>	
</body>
</html>