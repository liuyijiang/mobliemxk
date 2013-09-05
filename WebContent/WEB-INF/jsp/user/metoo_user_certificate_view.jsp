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
<div class="span12">
    <ul class="thumbnails"> 
      <c:forEach var="options" items="${certificateRespone.list1 }"> 
         <li class="span3 mxkplan mxkshadow">
             <div class="thumbnail">
              <div style="position:relative;" > 
               <span style="position:absolute; z-index:1; opacity: 0.9;">
                 <span class="label label-info">获证时间：${options.createTime }</span>
               </span>
               <img src="<%=imgurl %>${options.imageurl }" />
               </div>
               <span class='label'><img src="<%=metootitle%>${options.titleImage }">${options.title}</span>
             </div>
         </li>
      </c:forEach>
    </ul>
  </div>
</div>
</body>
</html>