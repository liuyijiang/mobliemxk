<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<%@ include file="../../../../configure.jsp"%> 
<div class="span12">
	    <c:forEach var="options" items="${visitorSearchSubjectRespone.subjectsShowResponse.list1 }">
			<div>
			   <div style="position:relative;" >
			       <span style="position:absolute; z-index:1; opacity: 0.9;" >
			            <c:if test="${options.type == 'FOR-ALL'}">
				            <br />
			                <span class="label label-important"><i class="icon-group "></i>${options.joinpeople }人参与</span><br />
				         </c:if>
				         <c:if test="${options.highPoint > 0 }">
				            <span class="label label-warning"><i class="icon-trophy"></i>最高评分${options.highPoint }</span><br />
				         </c:if>
				         <c:if test="${options.highMoney > 0 }">
				            <span class="label label-info"><i class="icon-jpy"></i>最高定价${options.highMoney }</span><br />
				         </c:if>
				         <c:if test="${options.qrcodeImage != null }">
				           <img style="width:26px;border:1px solid #ccc;" src="<%=imgurl %>${options.qrcodeImage }" />
				         </c:if>
			       </span>
			       	<a href="<%=rootPath %>/vistiorShowSubjectDatail?target=${options.id}"><img src="<%=imgurl %>${options.faceimage}" /></a>
			   </div>
				<span class="muted"><small><strong>${options.name }</strong><span class="muted">(${options.category })</span></small></span><br />
				<span class="muted"><small>${options.info }</small></span><br />
				<span>
				  <img style="width:26px;border:1px solid #ccc;" src="<%=imgurl %>${options.userimage}" >
				  <a href="javascript:;">${options.username }</a>
				</span><br />
				    <span class="label">${options.category }</span>
				    <span class="pull-right muted">
				        <small>
				         <i class="icon-comment"></i>评论${options.comments }
				         <i class="icon-pushpin"></i>Parts${options.parts }
				         <c:if test="${options.type == 'PUBLIC'}">
				           <span class="label label-success">公开</span>
				         </c:if>
				         <c:if test="${options.type == 'FOR-ALL'}">
				           <span class="label label-warning">共享</span>
				         </c:if>
					    </small>
				    </span>
			    <br />
			</div>
			<hr />
	    </c:forEach>
</div> 
