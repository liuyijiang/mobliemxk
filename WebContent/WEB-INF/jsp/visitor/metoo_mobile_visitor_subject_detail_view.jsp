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
    <span>
       <img style="width:26px;border:1px solid #ccc;" src="<%=imgurl %>${targetUserVO.minimage }" />
       <span><strong><a href="">${targetUserVO.name }</a></strong></span>
        <span class="pull-right">
           <a onclick="createUserRelation('${targetUserVO.id}')" href="javascript:;" class="btn btn-inverse btn-mini"><i class="icon-plus-sign"></i>关注</a>
           <a onclick="rsssubject('${subjectEntity.id}','${subjectEntity.userid }')" href="javascript:;" class="btn btn-primary btn-mini"><i class="icon-rss"></i>订阅</a>
        </span>
    </span>
  </span>
<span class="span12">
  <span><strong>${subjectEntity.name }</strong><small class="muted">(<i class="icon-tags"></i>${subjectEntity.tags })</small></span><br/>
  <span class="muted"><small>${subjectEntity.info }</small></span>
</span> 
 <div class="span12" style="height:2px"></div>
  <span class="span12">
        <div class="btn-group">
		  <a href="<%=rootPath %>/multiformityComments?type=1&targetType=subject&traget=${subjectEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-comment"></i>评论${subjectEntity.comments }</a>
		  <a href="<%=rootPath %>/multiformityComments?type=2&targetType=subject&traget=${subjectEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-heart"></i>喜欢${subjectEntity.likes  }</a>
		  <a href="<%=rootPath %>/multiformityComments?type=5&targetType=subject&traget=${subjectEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-jpy"></i>定价${subjectEntity.moneytimes }</a>
		  <a href="<%=rootPath %>/multiformityComments?type=4&targetType=subject&traget=${subjectEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-trophy"></i>评分${subjectEntity.pointtimes }</a>
		</div>
  </span>
 <div style="height:7px"></div>
 <c:forEach var="options" items="${partShowResponse.list1 }">
    <span class="span12">
       <a href="<%=rootPath%>/visitorShowPartsDetailView?target=${options.id }"><img style="border:1px solid #ccc;"  src="<%=imgurl%>${options.minimage}" /></a><br />
      <small class="muted">${options.desc}</small>
    </span>
    <div style="height:3px"></div>
 </c:forEach>
</div>
<div class="container">
</div>
<div class="container">
   <span class="span12">
     <a class="btn btn-small btn-block btn-primary" ><i class="icon-repeat"></i>加载更多</a>
   </span>
   <div style="height:4px"></div>
   <span class="span12">
   <c:if test="${subjectEntity.qrcodeImage != null}">
    <img style="width:55px" src="<%=imgurl%>${subjectEntity.qrcodeImage}">
     <span><small>${subjectEntity.createTime }</small></span>
   </c:if>
   </span>
    <div style="height:3px"></div>
</div>
<div class="container">
<span class="span12">
    <span class="muted"><small><strong>评论一下</strong></small></span><br />
    <textarea id="commentstextarea" rows="3" style="width:98%"></textarea>
  </span>
<span class="span12">
    <button onclick="addTextComents('${subjectEntity.id}','${subjectEntity.userid }','subject')" class="pull-right btn btn-success btn-small">评论</button>
  </span>  
  
</div>
  <br />
<script type="text/javascript">
var replyuserid = '';
function addTextComents(commentedId,commentedUserId,traget){
	  var info = $("#commentstextarea").val();
	  var datas = {"commentsAddRequest.replyUserId":replyuserid,"commentsAddRequest.commentedUserId":commentedUserId,"commentsAddRequest.commentedId":commentedId,"commentsAddRequest.info":info,"commentsAddRequest.target":traget,"commentsAddRequest.type":"text"};
	  $.ajax({
	   		url : path + "/addTextComments",
	   		type : "POST",
	   		cache : false,
	   		async : false,
	   		data: datas,
	   		dataType : "json",
	   		success : function(item) {
	   		    if(item == 'success'){
	 			   alert("评论成功！");
	 			   //window.location.href= path + "/visitorShowPartsDetailView?target=" + commentedId;
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