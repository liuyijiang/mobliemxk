<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<%@ include file="../../../../configure.jsp"%>  	
<div class="span12">
	 <c:forEach var="options" items="${partShowResponse.list1 }">
			<div >
			   <div style="position:relative;" >
			       <span style="position:absolute; z-index:1; opacity: 0.8;">
			           <c:if test="${options.highPoint != 0 }">
			             <span class="label label-important">最高评分${options.highPoint }</span>
			           </c:if>
			       </span>
			       <a href="<%=rootPath %>/partDetail?target=${options.id }">
			         <img src="<%=imgurl %>${options.minimage}" />
			       </a>
			   </div>
				<span class="muted"><small>${options.desc }</small></span><br />
				<c:if test="${options.subjectid != '#' }">
				  <span class="text-info"><small><a href="<%=rootPath %>/vistiorShowSubjectDatail?target=${options.subjectid}">《${options.subname }》</a></small></span><br />
				</c:if>
				   <span class="label">${options.type }</span>
				    <span class="pull-right muted">
				        <small>
					    <i class="icon-comment"></i>评论${options.comments + options.audios  }
					    <i class="icon-pushpin"></i>收藏${options.collect }
					    </small>
				    </span>
			    <hr />
			</div>
    </c:forEach>
</div>	