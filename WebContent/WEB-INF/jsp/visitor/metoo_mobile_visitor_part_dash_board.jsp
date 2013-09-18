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
  <span class="pull-left" id="partTitle">
  <c:if test="${type !=null }">
    <strong>${type}</strong>
  </c:if>
  <c:if test="${type == null }">
     <strong>所有模型</strong>
  </c:if>
  </span>
  <span class="pull-right text-success" id="partTitle"><strong>总页数${allpage }|当前<span id="currentpage">1</span></strong></span>
</div>
<div id="partsdivshow" class="container">
</div>
<%@ include file="../public/metoo_mobile_public_footer.jsp"%>
<%@ include file="../../../basefootinclude.jsp"%>  
 <script type="text/javascript">
   var allpage = '${allpage-1}';
   var type = '${type}';
   var page = 0;  
   function loadMore(isNext,isnotfist){
	   $("#loaddiv").show();
	   //chongcookie中获得page
	   var partpage = $.cookie('vpartpage');
	   if(typeof partpage == "undefined"){
		   page = 1;
	   }else{
		   page =  partpage;
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
	   $.cookie('vpartpage',page,{ expires: 1 });//缓存page
	   var datas = {"searchPartRequest.page":page,"searchPartRequest.type":type};
	   $("#partsdivshow").load(path +'/loadMorePartsByPage',datas,function() {
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
			 $.cookie('vpartpage',page,{ expires: 1 });//缓存page
			loadMore(true,false);
		}
   }
   
</script>
</body>
</html>