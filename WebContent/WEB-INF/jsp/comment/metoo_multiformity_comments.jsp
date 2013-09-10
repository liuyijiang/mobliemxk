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
    <span class="muted"><small><strong>评论一下</strong></small></span><br />
    <textarea id="commentstextarea" rows="2" style="width:98%;"></textarea>
  </span>
  <span class="span12">
    <span class="pull-left">
       <img style="width:32px;border:1px solid #ccc;" src="<%=imgurl%>${uservo.minimage}" />
       <strong>${uservo.name }</strong>
    </span>
    <a href="" onclick="addTextComents('${traget}','${uservo.id }','${targetType }')" class="pull-right btn btn-success btn-small">评论</a>
  </span>
  <br /><br />
  <div id="comments_div">
   <c:forEach var="options" items="${loadCommentsRespone.listAll }">
      <div class="span12">
		    <span>
		       <img style="width:26px;border:1px solid #ccc;" src="<%=imgurl%>${options.userimage}" />
		        <strong><a href="">${options.username }</a></strong>&nbsp;
		    </span>
	        <c:if test="${options.type == 'text' }">
               <span class='muted'><small>${options.info}</small></span><br />
             </c:if>
             <c:if test="${options.type == 'wav' }">
               <audio controls src="<%=voice %>${options.info }"></audio> 
             </c:if>
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
<c:if test="${loadCommentsRespone.allpage > 1 }">
   <div class="span12" style="height:3px"></div>
     <a href="javascript:;" onclick="loadMore('${traget}')" class="btn btn-primary btn-small btn-block" ><i class="icon-repeat"></i>加载更多</a>
     <br />
</c:if>
<script type="text/javascript">
var allpage = '${loadCommentsRespone.allpage}';
var commnetspage = 1; 
function loadMore(id){
	commnetspage = commnetspage + 1;
	 if(commnetspage <= allpage){
	   $("#loaddiv").show();
	   $.ajax({
	   		url : path + "/loadMoreComments",
	   		type : "POST",
	   		cache : false,
	   		async : false,
	   		data: {"loadCommentsRequest.targeid":id,"loadCommentsRequest.page":commnetspage},
	   		dataType : "json",
	   		success : function(item) {
	   		   $("#loaddiv").hide();
	   		   creatediv(item.listAll);
	   	   }
	  }); 
   }
}

function creatediv(list){
	show = '';
	for (var i in list) {
		show = show + "<div class='span12'><span><img style='width:26px;border:1px solid #ccc;' src='"+ imgurl + list[i].userimage +"' />"
		+ "<strong><a href=''>"+ list[i].username +"</a></strong>&nbsp;</span>";
		if(list[i].type == 'wav'){
			show = show + "<audio controls src='"+ voice + list[i].info +"'></audio><br />";
		}else{
			show = show + "<span class='muted'><small>"+ list[i].info +"</small></span><br />";	
		}
		show = show + "</div><div style='height:4px;'></div>";
	}
	$("#comments_div").append(show);
}

</script>
<%@ include file="../../../basefootinclude.jsp"%> 
<script type="text/javascript">
var replyuserid = '';
function addTextComents(commentedId,commentedUserId,traget){
	  var info = $("#commentstextarea").val();
	  var datas = {"commentsAddRequest.replyUserId":replyuserid,"commentsAddRequest.commentedUserId":commentedUserId,"commentsAddRequest.commentedId":commentedId,"commentsAddRequest.info":info,"commentsAddRequest.target":traget,"commentsAddRequest.type":"text"};
	  $.ajax({
	   		url : path + "/addTextComments.action",
	   		type : "POST",
	   		cache : false,
	   		async : false,
	   		data: datas,
	   		dataType : "json",
	   		success : function(item) {
	   		    if(item == 'success'){
	 			   alert("评论成功！");
	 			   window.location.href= path + "/multiformityComments?type=1&traget=" + commentedId;
			    }else if( item == 'error'){
			   	   alert("网络异常请重试");
			    }else {
			     	alert(item);
			    }
	   		  }
	 }); 
}

</script>
</body>
</html>