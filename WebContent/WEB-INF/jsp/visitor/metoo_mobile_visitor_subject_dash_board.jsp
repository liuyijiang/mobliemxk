<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../../../headerinclude.jsp"%>  
</head>
<body class="mxkbody mxkbackgroud" onload="loadMore(false,false)">
<%@ include file="../public/metoo_mobile_public_header.jsp"%> 
<div class="container">
    <div id="loaddiv" class="span12" style="text-align:center;display:none">
        <img src="<%=domain %>loadingred.gif" >
        <span class="muted"><small>正在努力加载...</small></span>
    </div>
</div>
<div class="container">
  <span class="pull-left" id="partTitle"><strong>所有模型</strong></span>
  <span class="pull-right text-success" id="partTitle"><strong>总页数${allpage }|当前<span id="currentpage">1</span></strong></span>
</div>
<div id="partsdivshow" class="container">
</div>
<c:if test="${allpage > 1 }">
<%@ include file="../public/metoo_mobile_public_footer.jsp"%>
</c:if>
<%@ include file="../../../basefootinclude.jsp"%>  
 <script type="text/javascript">
   var allpage = '${allpage-1}';
   var trags = '${trags}';
   var page = 0;  
   function loadMore(isNext,isnotfist){
	   $("#loaddiv").show();
	   //chongcookie中获得page
	   var subpage = $.cookie('vsubpage');
	   if(typeof subpage == "undefined"){
		   page = 1;
	   }else{
		   page =  subpage;
	   }
	   number = parseInt(page);
	   if(isnotfist){
		   if(isNext){
			   page = number + 1;
	   	   }else{
	   	      page = number - 1;
	   		   if(page < 0){
	   			page = 1;
	   		   }
	       }
	   }else{
		   page = number;
	   }
	   $.cookie('vsubpage',page,{ expires: 1 });//缓存page
	   var datas = {"visitorSeeSubjectDashBoardRequest.page":page, "visitorSeeSubjectDashBoardRequest.parm":trags};
	   $("#partsdivshow").load(path +'/loadMoreSubjectByPage',datas,function() {
	    	$("#loaddiv").hide();
	    	$("#currentpage").html(page);
	    	window.scrollTo(0,0);
	    	
	   });  
   }
   
   function changepage(){
	   var targetpage = $("#navpage").val();
	   var regu = /^[-]{0,1}[0-9]{1,}$/;
		if (!regu.test(targetpage.trim())) {
			showCallbackmessageModal("页数输入有误");
			return;
		}else{
			if(parseInt(targetpage) > parseInt(allpage)){
				targetpage = allpage;
			}
			page = targetpage;
			$.cookie('vsubpage',page,{ expires: 1 });//缓存page
			loadMore(true,false);
		}
   }
   
</script>
</body>
</html>