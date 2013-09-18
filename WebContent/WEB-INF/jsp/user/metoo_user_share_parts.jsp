<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../../../headerinclude.jsp"%>  
</head>
<body class="mxkbody mxkbackgroud" onload="loadMore(true,false)">
<%@ include file="../public/metoo_mobile_public_header.jsp"%> 
<div class="container">
    <div id="loaddiv" class="span12" style="text-align:center;display:none">
        <img src="<%=domain %>loadingred.gif" >
        <span class="muted"><small>正在努力加载...</small></span>
    </div>
</div>
<div class="container">
  <span class="pull-left" id="partTitle"><strong>我的单图分享</strong></span>
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
   var page = 0;  
   var userid= '${uservo.id}';
   function loadMore(isNext,isnotfist){
	   $("#loaddiv").show();
	   var mypartpage = $.cookie('mypartpage');
	   if(typeof mypartpage == "undefined"){
		   page = 1;
	   }else{
		   page =  mypartpage;
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
	   $.cookie('mypartpage',page,{ expires: 1 });//缓存page
	   var datas = {"searchPartRequest.subjectid":"#","searchPartRequest.userid":userid,"searchPartRequest.page":page};
	   $("#partsdivshow").load(path +'/loadMoreUserShareParts',datas,function() {
	    	$("#loaddiv").hide();
	    	$("#currentpage").html(page);
	    	window.scrollTo(0,0);
	    	
	   });  
   }
   
   function changepage(){
	   var targetpage = $("#navpage").val();
	   var regu = /^[-]{0,1}[0-9]{1,}$/;
		if (!regu.test(targetpage.trim())) {
			alert("页数输入有误");
			return;
		}else{
			if(parseInt(targetpage) > parseInt(allpage)){
				targetpage = allpage;
			}
			page = targetpage;
			$.cookie('mypartpage',page,{ expires: 1 });//缓存page
			loadMore(true,false);
		}
   }
   
</script>
</body>
</html>