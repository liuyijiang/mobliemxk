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
   <span ><a onclick="showCreatePart();" href="javascript:;"  class="btn btn-info btn-small"><i class="icon-pushpin"></i>添加Part</a></span>
   <span class="pull-right" >
      <c:if test="${currentSubjectEntity.highMoney == 0 }">
         <span class="label label-info"><i class="icon-jpy"></i>最高定价${currentSubjectEntity.highMoney }</span>
      </c:if>
      <c:if test="${currentSubjectEntity.highPoint == 0 }">
         <span class="label label-warning"><i class="icon-trophy"></i>最高评分${currentSubjectEntity.highPoint }</span>
      </c:if>
   </span>
   <br />
</span>
<span class="span12">
  <span><strong>${currentSubjectEntity.name }</strong><small class="muted">(<i class="icon-tags"></i>${currentSubjectEntity.tags })</small></span><br/>
  <span class="muted"><small>${currentSubjectEntity.info }</small></span>
</span> 
 <div class="span12" style="height:2px"></div>
  <span class="span12">
        <div class="btn-group">
		  <a href="<%=rootPath %>/multiformityComments?type=1&targetType=subject&traget=${currentSubjectEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-comment"></i>评论${currentSubjectEntity.comments }</a>
		  <a href="<%=rootPath %>/multiformityComments?type=2&targetType=subject&traget=${currentSubjectEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-heart"></i>喜欢${currentSubjectEntity.likes  }</a>
		  <a href="<%=rootPath %>/multiformityComments?type=5&targetType=subject&traget=${currentSubjectEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-jpy"></i>定价${currentSubjectEntity.moneytimes }</a>
		  <a href="<%=rootPath %>/multiformityComments?type=4&targetType=subject&traget=${currentSubjectEntity.id}" class="btn btn-mini" style="font-family:Microsoft YaHei;"><i class="icon-trophy"></i>评分${currentSubjectEntity.pointtimes }</a>
		</div>
  </span>
 <div style="height:7px"></div>
 <div id="parts_div">
 <c:forEach var="options" items="${partShowResponse.list1 }">
    <span class="span12">
       <a href="<%=rootPath%>/partDetail?target=${options.id }"><img style="border:1px solid #ccc;"  src="<%=imgurl%>${options.minimage}" /></a><br />
      <small class="muted">${options.desc}</small>
    </span>
    <div style="height:5px"></div>
 </c:forEach>
 </div>
</div>
<div class="container">
    <div id="loaddiv" class="span12" style="text-align:center;display:none">
        <img src="<%=domain %>loadingred.gif" >
        <span class="muted"><small>正在努力加载...</small></span>
    </div>
</div>
<div class="container">
   <span class="span12">
     <c:if test="${partShowResponse.allPage > 1 }">
       <a href="javascript:;" onclick="loadMore('${currentSubjectEntity.id}')" class="btn btn-small btn-block btn-primary" ><i class="icon-repeat"></i>加载更多</a>
     </c:if>
   </span>
   <div style="height:4px"></div>
   <span class="span12">
   <c:if test="${currentSubjectEntity.qrcodeImage != null}">
    <img style="width:55px" src="<%=imgurl%>${currentSubjectEntity.qrcodeImage}">
     <span><small>${currentSubjectEntity.createTime }</small></span>
   </c:if>
   </span>
</div>
<!-- 添加part -->
    <div id="createPartModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-header">
	       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	       <h3>添加Part</h3>
        </div>
        <div class="modal-body">
          <form id="planform" action="createProjectPlan" enctype="multipart/form-data"
				method="post">
			 <span>
				 <small>选择图片</small>
				 <img id="loading" src="<%=domain %>loadingred.gif" style="display:none">
			 </span>
			 <br />
			  <input id="fileToUpload" style="width:100px" type="file" size="45" name="image"  /><br />
			 <small>写点描述吧</small><br />
			 <textarea id="partinfo" rows="3" style="width:96%" ></textarea>
			 <label class="checkbox" >
                <input type="checkbox" id="useforfaceimage" checked="checked"><span class="text-info">设为专题封面</span>
             </label>
          </form>
        </div>
	    <div class="modal-footer">
	      <a href="javascript:;" class="btn btn-primary" onclick="ajaxFileUpload('${currentSubjectEntity.id }','${currentSubjectEntity.tags }','${uservo.id }')">发布</a>
	      <a href="javascript:;" class="btn" onclick="closeCreatePart()">关闭</a>
	    </div>
    </div>

<script type="text/javascript">
   var allpage = '${partShowResponse.allPage}';
   var subjectpage = 1; 
   function loadMore(id){
	   subjectpage = subjectpage + 1;
	   if(subjectpage <= allpage){
		   $("#loaddiv").show();
		   $.ajax({
		   		url : path + "/loadMoreSubjectParts",
		   		type : "POST",
		   		cache : false,
		   		async : false,
		   		data: {"searchPartRequest.subjectid":id,"searchPartRequest.page":subjectpage},
		   		dataType : "json",
		   		success : function(item) {
		   		 $("#loaddiv").hide();
		   		creatediv(item.list1);
		   	   }
		  }); 
	   }
   }
   
   function creatediv(list){
	   var show = '';
	   for (var i in list){
		   show = show + "<span class='span12'><a href='" + path + "/visitorShowPartsDetailView?target="+ list[i].id +"'><img style='border:1px solid #ccc;'  src='"+ imgurl + list[i].minimage +"' /></a><br />"
		   + "<small class='muted'>"+ list[i].desc +"</small></span><div style='height:5px'></div>";
	   }
	   $("#parts_div").append(show);
   }

   function showCreatePart(){
		 $('#createPartModal').modal({
	       keyboard: false
	   });
	 }
   
   function closeCreatePart(){
		 $('#createPartModal').modal('hide');
	 }
   
   function ajaxFileUpload(subid,tags,username)
	{   
		if(true){
			var info = $('#partinfo').val();
			var faceimage = 1;
			if($("#useforfaceimage").attr("checked")){
				faceimage = 1;
			}else{
				faceimage = 0; 
			}
			var datas = {"createPartRequest.subjectid":subid,"createPartRequest.desc":info,"createPartRequest.type":tags,"createPartRequest.subname":username,"createPartRequest.forfaceimage":faceimage};
			$("#loading").show();
			$.ajaxFileUpload
			(
				{
					url:path + "/createPart.action",
					secureuri:false,
					fileElementId:'fileToUpload',
					dataType: 'json',
					data:datas,
					success: function (data, status)
					{  
						if(data.message == "success"){
							$("#loading").hide();
							closeCreatePart();
			    		    window.location.href= path + "/subjectDetial?targetId="+subid;
						}
						
					},
					error: function (data, status, e)
					{
						$("#loading").hide();
						showCallbackmessageModal(data.message);
					}
				}
			);
		}
		return false;
	}
</script>
<%@ include file="../../../basefootinclude.jsp"%> 
</body>
</html>