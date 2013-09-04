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
   <c:forEach var="options" items="${loadCommentsRespone.listAll }">
      <div class="span12">
		    <span>
		       <img style="width:20px" class="img-polaroid border-radius" src="<%=imgurl%>${options.userimage}" />
		        <strong><a href="">${options.username }</a></strong>&nbsp;
		    </span>
	        <c:if test="${options.type == 'text' }">
               <span class='muted'>${options.info}</span><br />
             </c:if>
             <c:if test="${options.type == 'wav' }">
               <audio controls src="<%=voice %>${options.info }"></audio> 
             </c:if>
        </div>
       <div style="height:4px;"></div>
       <div style="height:1px;witdh:100%;background-color:#CCCCCC"></div>
       <div style="height:4px;"></div>
   </c:forEach>
</div>
<div id="more" class="container">
</div>
<c:if test="${loadCommentsRespone.allpage > 1 }">
   <div class="span12" style="height:3px"></div>
     <a class="btn btn-small btn-block" ><i class="icon-repeat"></i>加载更多</a>
     <br />
</c:if>
</body>
</html>