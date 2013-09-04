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
       <img style="width:19px" class="img-polaroid border-radius" src="<%=imgurl %>${targetUserVO.minimage }" />
       <span><strong><a href="">${targetUserVO.name }</a></strong></span>
        <span class="pull-right"><button class="btn btn-inverse btn-mini"><i class="icon-plus-sign"></i>加关注</button></span>
    </span>
  </span>
<span class="span12">
  <span><strong>${subjectEntity.name }</strong><small class="muted">(<i class="icon-tags"></i>${subjectEntity.tags })</small></span><br/>
  <span class="muted"><small>${subjectEntity.info }</small></span>
</span> 
 <div class="span12" style="height:2px"></div>
  <span class="span12">
        <div class="btn-group">
		  <a href="#" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-comment"></i>评论${subjectEntity.comments }</a>
		  <a href="#" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-heart"></i>喜欢${subjectEntity.likes  }</a>
		  <a href="#" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-pushpin"></i>定价${subjectEntity.moneytimes }</a>
		  <a href="#" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-pushpin"></i>评分${subjectEntity.pointtimes }</a>
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
</div>
<%@ include file="../../../basefootinclude.jsp"%> 
</body>
</html>