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
       <img style="width:24px" class="img-polaroid border-radius" src="<%=imgurl %>${targetUserVO.minimage }" />
       <span><strong>${targetUserVO.name }</strong></span>
        <span class="pull-right"><button class="btn btn-inverse btn-mini"><i class="icon-plus-sign"></i>加关注</button></span>
    </span>
  </span>
  <div class="span12" style="height:1px"></div>
  <c:if test="${partEntity.subjectid != '#' }">
   <span class="span12"><small>来自专题：<a href="">${partEntity.subname }</a></small></span>
  </c:if>
  <div style="position:relative;" >
       <span style="position:absolute; z-index:1; opacity: 0.8;">
           <c:if test="${partEntity.highPoint != 0 }">
             <span class="label"><small>最高评分${partEntity.highPoint }</small></span>
           </c:if>
       </span>
        <img style="border:1px solid #ccc;" src="<%=imgurl %>${partEntity.image}">
  </div>
  <span class="span12">
     <span class="muted">
       <small>${partEntity.desc }</small>
     </span>
  </span>
    <div class="span12" style="height:2px"></div>
  <span class="span12">
    <span class="pull-left">
       <a class="btn btn-mini btn-danger" href="javascript:;" onclick="collectPart('${options.id}')">
		 <i class="icon-pushpin"></i>收藏
       </a>
    </span>
    <span class="pull-right">
        <div class="btn-group pull-right">
		  <a href="#" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-comment"></i>评论${partEntity.audios + partEntity.comments  }</a>
		  <a href="#" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-heart"></i>喜欢${partEntity.likes  }</a>
		  <a href="#" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-pushpin"></i>收藏${partEntity.collect }</a>
		</div>
    </span>
  </span>
  <div class="span12" style="height:3px"></div>
  <br />
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