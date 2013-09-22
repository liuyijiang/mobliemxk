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
<a href="javascript:;" onclick="setPoint('${traget}','${targetType}')" class="pull-right btn btn-info btn-small"><i class="icon-trophy"></i>评分</a>
<span class="span12">
   <select id="point_select" style="width:60px">
       <option value="1">1</option>
       <option value="2">2</option>
        <option value="3">3</option>
         <option value="4">4</option>
          <option value="5">5</option>
      <option value="6">6</option>
       <option value="7">7</option>
        <option value="8">8</option>
         <option value="9">9</option>
          <option value="10">10</option>
   </select>
</span>
</div> 
<div class="container">
  <span class="span12">
    <span class="pull-left">
       <img style="width:32px;border:1px solid #ccc;" src="<%=imgurl%>${uservo.minimage}" />
       <strong>${uservo.name }</strong>
    </span>
  </span>
</div>
<div style="width:100%;height:4px;"></div>
<div style="height:1px;witdh:100%;background-color:#ccc"></div>
<div style="width:100%;height:8px;"></div>    
<div class="container">
<div id="collect_div">
   <c:forEach var="options" items="${pointInfoResponse.list }">
      <div class="span12">
		    <span>
		       <img style="width:26px;border:1px solid #ccc;" src="<%=imgurl%>${options.userimage}" />
		       <strong><a style="color:#000000;" href="">${options.username }</a></strong>&nbsp;
		    </span>
            <span class='muted pull-right'><small>评分${options.point }&nbsp;<i class="icon-trophy"></i></small></span><br />
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
<c:if test="${pointInfoResponse.allpage > 1 }">
   <div class="span12" style="height:3px"></div>
     <a href="javascript:;" onclick="loadMore('${traget}')" class="btn btn-primary btn-small btn-block" ><i class="icon-repeat"></i>加载更多</a>
     <br />
</c:if>
<script type="text/javascript">
var allpage = '${pointInfoResponse.allpage}';
var likepage = 1; 
function loadMore(id){
	likepage = likepage + 1;
	 if(likepage <= allpage){
	   $("#loaddiv").show();
	   $.ajax({
	   		url : path + "/loadMorePoint",
	   		type : "POST",
	   		cache : false,
	   		async : false,
	   		data: {"pageModel.tragetId":id,"pageModel.currentPage":likepage},
	   		dataType : "json",
	   		success : function(item) {
	   		   $("#loaddiv").hide();
	   		   creatediv(item.list);
	   	   }
	  }); 
   }
}

function creatediv(list){
	show = '';
	for (var i in list) {
		show = show + "<div class='span12'><span><img style='width:26px;border:1px solid #ccc;' src='"+ imgurl+ list[i].userimage +"' />"
		+"<strong><a style='color:#000000;' href=''>"+ list[i].username +"</a></strong>&nbsp;</span><span class='muted pull-right'><small>"
	    +"评分"+ list[i].point +"&nbsp;<i class='icon-trophy'></i></small></span><br /></div><div style='height:4px;'></div>";
	}
	$("#collect_div").append(show);
}

</script>
<script type="text/javascript">
function setPoint(targetId,type){
	var point = $("#point_select").val();
	var datas = {"setPointRequest.tragetid":targetId,"setPointRequest.trageType":type,"setPointRequest.point":point};
	$.ajax({
   		url : path + "/setPoint.action",
   		type : "POST",
   		cache : false,
   		async : false,
   		data: datas,
   		dataType : "json",
   		success : function(item) {
   			if(item == 'success'){
   				showCallbackmessageModal("评论成功！");
	 			   //window.location.href= path + "/multiformityComments?type=4&traget=" + targetId;
			    }else if( item == 'error'){
			    	showCallbackmessageModal("网络异常请重试");
			    }else {
			    	showCallbackmessageModal(item);
			    }
   		 }
   });
}

</script>
<%@ include file="../../../basefootinclude.jsp"%> 
</body>
</html>