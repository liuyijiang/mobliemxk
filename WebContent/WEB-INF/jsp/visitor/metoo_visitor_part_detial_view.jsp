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
       <span><strong>${targetUserVO.name }</strong></span>
        <span class="pull-right">
         <a class="btn btn-inverse btn-mini"><i class="icon-plus-sign"></i>关注模友</a>
         <a class="btn btn-mini btn-danger" href="javascript:;" onclick="collectPart('${partEntity.id}')">
		 <i class="icon-pushpin"></i>收藏Part
         </a>
        </span>
    </span>
  </span>
  <div class="span12" style="height:1px"></div>
  <c:if test="${partEntity.subjectid != '#' }">
   <span class="span12"><small>来自专题：<a href="">${partEntity.subname }</a></small></span>
  </c:if>
  <div style="position:relative;" >
       <span style="position:absolute; z-index:1; opacity: 0.9;">
           <c:if test="${partEntity.highPoint != 0 }">
             <span class="label"><small>最高评分${partEntity.highPoint }</small></span>
           </c:if>
       </span>
        <img style="border:1px solid #ccc;" src="<%=imgurl %>${partEntity.minimage}">
  </div>
  <span class="span12">
     <span class="muted">
       <small>${partEntity.desc }</small>
     </span>
  </span>
    <div class="span12" style="height:2px"></div>
  <span class="span12">
    <span class="pull-left">
      <c:if test="${partEntity.highPoint > 0 }">
        <strong>${partEntity.highPoint }分</strong>
      </c:if>
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
  <div class="span12" style="height:3px"></div><br />
  <div class="span12" style="height:5px"></div>
  <c:if test="${partEntity.audios + partEntity.comments != 0 }">
     <c:forEach var="options" items="${partNewCommentsResponse.list }">
         <span class="span12">
		    <span>
		       <img style="width:26px;border:1px solid #ccc;" src="<%=imgurl %>${options.userimage }" />
		       <span><strong><a href="">${options.username }</a></strong></span>
		       <c:if test="${options.type == 'text' }">
	               <span class='muted'><small>${options.info}</small></span><br />
	             </c:if>
	             <c:if test="${options.type == 'wav' }">
	               <audio controls src="<%=voice %>${options.info }"></audio> 
	             </c:if>
		    </span>
        </span>
        <div class="span12" style="height:3px"></div>
     </c:forEach>
     <div class="span12" style="height:3px"></div>
     <a class="btn btn-small btn-block" href="<%=rootPath %>/multiformityComments?type=1&traget=${partEntity.id}"  ><i class="icon-comments-alt"></i>更多评论</a>
    <div class="span12" style="height:5px"></div>
  </c:if>
  <span class="span12">
    <span class="muted"><small><strong>评论一下</strong></small></span><br />
    <textarea rows="3" style="width:98%"></textarea>
  </span>
  <span class="span12">
    <button class="pull-right btn btn-success btn-small">评论</button>
  </span>
</div>
<%-- <%@ include file="../public/metoo_mobile_public_no_function_footer.jsp"%> --%>
<%@ include file="../../../basefootinclude.jsp"%>  
</body>
</html>