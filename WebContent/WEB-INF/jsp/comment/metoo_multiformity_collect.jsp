<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <%@ include file="../../../headerinclude.jsp"%>  
</head>
<body class="mxkbody mxkbackgroud" >
<%@ include file="../public/metoo_mobile_public_header.jsp"%> 
<div class="container">
  <span class="span12">
    <span class="pull-left">
       <img style="width:32px;border:1px solid #ccc;" src="<%=imgurl%>${uservo.minimage}" />
       <strong>${uservo.name }</strong>
    </span>
    <a onclick="collectPart('${traget}')" href="javascript:;" class="pull-right btn btn-danger btn-small"><i class="icon-pushpin"></i>收藏Part</a>
  </span>
</div>
<div style="width:100%;height:4px;"></div>
<div style="height:1px;witdh:100%;background-color:#ccc"></div>
<div style="width:100%;height:8px;"></div>      
<div class="container">
<div id="collect_div">
   <c:forEach var="options" items="${collectlist }">
      <div class="span12">
		    <span>
		       <img style="width:26px;border:1px solid #ccc;" src="<%=imgurl%>${options.collecterImg}" />
		       <strong><a href="">${options.collecterName }</a></strong>&nbsp;
		    </span>
            <span class='muted pull-right'><small>收藏了这个Part<i class="icon-pushpin"></i></small></span><br />
        </div>
       <div style="height:4px;"></div>
<!--        <div style="height:1px;witdh:100%;background-color:#CCCCCC"></div> -->
<!--        <div style="height:4px;"></div> -->
   </c:forEach>
</div>
</div>
<div class="container">
    <div id="loaddiv" class="span12" style="text-align:center;display:none">
        <img src="<%=domain %>loadingred.gif" >
        <span class="muted"><small>正在努力加载...</small></span>
    </div>
</div>
<c:if test="${allpage > 1 }">
   <div class="span12" style="height:3px"></div>
     <a href="javascript:;" onclick="loadMore('${traget}')" class="btn btn-primary btn-small btn-block" ><i class="icon-repeat"></i>加载更多</a>
     <br />
</c:if>
<script type="text/javascript">
var allpage = '${allpage}';
var collectspage = 1; 
function loadMore(id){
	collectspage = collectspage + 1;
	 if(collectspage <= allpage){
	   $("#loaddiv").show();
	   $.ajax({
	   		url : path + "/loadMoreCollect",
	   		type : "POST",
	   		cache : false,
	   		async : false,
	   		data: {"baseRequest.tragetid":id,"baseRequest.page":collectspage},
	   		dataType : "json",
	   		success : function(item) {
	   		   $("#loaddiv").hide();
	   		   creatediv(item);
	   	   }
	  }); 
   }
}

function creatediv(list){
	show = '';
	for (var i in list) {
		show = show + "<div class='span12'><span><img style='width:26px;border:1px solid #ccc;' src='"+ imgurl+ list[i].collecterImg +"' />"
		+"<strong><a href=''>"+ list[i].collecterName +"</a></strong>&nbsp;</span><span class='muted pull-right'><small>"
	    +"收藏了这个Part<i class='icon-pushpin'></i></small></span><br /></div><div style='height:4px;'></div>";
	}
	$("#collect_div").append(show);
}

</script>
<script type="text/javascript">
function collectPart(partid){
	  $.ajax({
 		url : path + "/createUserCollect.action",
 		type : "POST",
 		cache : false,
 		async : false,
 		data: {"collectPartsRequest.targetId":partid},
 		dataType : "json",
 		success : function(item) {
 		    if(item == 'success'){
			   alert("已将Part加入到你的收藏夹");
		    }else if( item == 'error'){
		   	   alert("网络异常请重试");
		    }else {
		     	alert(item);
		    }
 		  }
	 }); 
}

</script>
<%@ include file="../../../basefootinclude.jsp"%> 
</body>
</html>