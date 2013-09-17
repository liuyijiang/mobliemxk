<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<%@ include file="../../../../configure.jsp"%>  	
<div class="span12 ">
		 <c:forEach var="options" items="${subjectsShowResponse.list1 }">
	           <div >
	               <div style="position:relative;" >
			       <span style="position:absolute; z-index:1; opacity: 0.9;">
			            <c:if test="${options.highPoint == 0 }">
				            <span class="label label-warning"><i class="icon-trophy"></i>最高评分${options.highPoint }</span><br />
				         </c:if>
				         <c:if test="${options.highMoney == 0 }">
				            <span class="label label-info"><i class="icon-jpy"></i>最高定价${options.highMoney }</span><br />
				         </c:if>
				         <c:if test="${options.comments == 0 }">
				            <span class="label label-success"><i class="icon-comment"></i>评论次数${options.comments }</span><br />
				         </c:if>
			       </span>
			        <a href="<%=rootPath %>/subjectDetial?targetId=${options.id }"><img src="<%=imgurl %>${options.faceimage }" /></a>
			      </div>
	              <div class="mxkomitdiv"><small>${options.name }<span class="muted">(${options.category })</span></small></div>
	              <span class="muted"><small>${options.info }</small></span><br />
	               <a class="btn btn-block" href="<%=rootPath %>/subjectDetial?targetId=${options.id }"><i class="icon-edit"></i>继续编辑</a>
	           </div>
	           <hr />
	      </c:forEach>
</div> 
