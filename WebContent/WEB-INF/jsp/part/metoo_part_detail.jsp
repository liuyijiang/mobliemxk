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
  <c:if test="${partEntity.subjectid != '#' }">
   <span class="span12"><small>来自专题：<a href="">${partEntity.subname }</a></small></span><br />
  </c:if>
  <span class="label">${partEntity.type }</span><br />
  <div class="span12" style="height:2px"></div>
  <div style="position:relative;" >
       <span style="position:absolute; z-index:1; opacity: 0.8;">
           <c:if test="${partEntity.highPoint != 0 }">
             <span class="label"><i class="icon-trophy"></i>最高评分${partEntity.highPoint }</span><br />
           </c:if>
           <c:if test="${partEntity.highPoint != 0 }">
              <span class="label label-warning"><i class="icon-microphone"></i>语音评论${partEntity.audios}</span>
           </c:if>
       </span>
        <img style="border:1px solid #ccc;"  src="<%=imgurl %>${partEntity.minimage}">
  </div>
  <span class="span12">
     <span class="muted">
       <small>${partEntity.desc }</small>
     </span>
  </span>
  <div class="span12" style="height:2px"></div>
  <span class="span12">
     <span class="muted">
       <small><i class="icon-time"></i>发布时间:${partEntity.createTime }</small>
     </span>
  </span>
    <div class="span12" style="height:2px"></div>
  <span class="span12">
    <span class="pull-left">
       <a class="btn btn-mini btn-danger" href="javascript:;" onclick="deletePart('${partEntity.id}')">
		 <i class="icon-remove-sign"></i>删除
       </a>
    </span>
    <span class="pull-right">
        <div class="btn-group pull-right">
		  <a href="<%=rootPath %>/multiformityComments?type=1&traget=${partEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-comment"></i>评论${partEntity.audios + partEntity.comments  }</a>
		  <a href="<%=rootPath %>/multiformityComments?type=2&traget=${partEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-heart"></i>喜欢${partEntity.likes  }</a>
		  <a href="<%=rootPath %>/multiformityComments?type=3&traget=${partEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-pushpin"></i>收藏${partEntity.collect }</a>
		  <a href="<%=rootPath %>/multiformityComments?type=4&traget=${partEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-trophy"></i>评分${partEntity.highPointTime }</a>
		</div>
    </span>
  </span>
  <div class="span12" style="height:3px"></div>
  <br />
  <div class="span12" style="height:6px"></div>
  <c:if test="${partEntity.audios + partEntity.comments != 0 }">
     <c:forEach var="options" items="${partNewCommentsResponse.list }">
         <span class="span12">
		    <span>
		       <img style="width:26px;border:1px solid #ccc;" src="<%=imgurl %>${options.userimage }" />
		       <span><strong>${options.username }</strong></span>
		       <c:if test="${options.type == 'text' }">
	               <span class='muted'>${options.info}</span><br />
	             </c:if>
	             <c:if test="${options.type == 'wav' }">
	               <audio controls src="<%=voice %>${options.info }"></audio> 
	             </c:if>
		    </span>
        </span>
        <div class="span12" style="height:3px"></div>
     </c:forEach>
     <div class="span12" style="height:3px"></div>
     <a class="btn btn-small btn-block" ><i class="icon-comments-alt"></i>更多评论</a>
     <br />
  </c:if>
  <c:if test="${partEntity.audios + partEntity.comments == 0 }">
    <br />
    <div class="container" style="text-align:center;">
       <span class="muted">暂无评论</span>
    </div>
  </c:if>
</div>
<%-- <%@ include file="../public/metoo_mobile_public_no_function_footer.jsp"%> --%>
<%@ include file="../../../basefootinclude.jsp"%>  
<script type="text/javascript">
function deletePart(partid){
	  if(!confirm("确定要删除吗？")){
		return;  //deleteProject
      }else{
	    var datas = {"target":partid};
	    $.ajax({
		url : path + "/deletePart.action",
		type : "POST",
		cache : false,
		async : false,
		data: datas,
		dataType : "json",
		success : function(item) {
			if(item == 'success'){
			   window.location.href= path + "/userSharePartsView";
		     }else{
			   alert("操作失败");
		     }
	      }
	   });
     }
   }

</script>
</body>
</html>