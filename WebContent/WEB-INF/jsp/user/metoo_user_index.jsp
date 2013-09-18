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
<!--    <span class="span12"> -->
     <table>
       <tr>
         <td>
           <img style="width:100px" src="<%=imgurl %>${uservo.image}" class="img-polaroid border-radius"/>
         </td>
         <td>
          <span><strong>${uservo.name }</strong></span><br />
          <span class="muted">${uservo.info }</span><br />
           <span class="muted">
	     <span class="label label-info"><img src="<%=metootitle%>${uservo.shareTileImage }">${uservo.shareTitle}</span><br />
	     <span class="label label-success"><img src="<%=metootitle%>${uservo.commentTileImage}">${uservo.commentTitle } </span><br />
	     <span class="label label-important"><img src="<%=metootitle%>${uservo.subjectTileImage}">${uservo.subjectTitle }</span> 
	  </span>  
         </td>
       </tr>
     </table>
<div style="height:5px"></div>
   <span class="span12">
     <a class="btn btn-large btn-block btn-success" onclick="showCreatePart()" href="javascript:;" ><i class="icon-globe"></i>分享Part</a>
    </span>
     <div style="height:24px"></div>
     <span class="span12">
     <a onclick="cleanmypartpage()" class="btn btn-large btn-block" href="<%=rootPath %>/userSharePartsView"><i class="icon-rss-sign"></i>我的分享</a>
     <a class="btn btn-large btn-block" href="<%=rootPath %>/userSubjectView"><i class="icon-hdd"></i>我的专辑</a>
     <a onclick="cleanmycolectpartpage()" class="btn btn-large btn-block" href="<%=rootPath %>/userCollectIndex"><i class="icon-pushpin"></i>我的收藏</a>
     <a class="btn btn-large btn-block" href="<%=rootPath %>/showUserCertificate" ><i class="icon-bookmark"></i>我的证书</a>
   </span>
</div>

<div id="createPartModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-header">
	       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	       <h3>快速分享Part</h3>
        </div>
        <div class="modal-body">
          <form id="planform" action="createProjectPlan" enctype="multipart/form-data"
				method="post">
			 <span class="muted">把你看到你做过的经典分享给大家</span><br />	
			 <span>
				 <img id="loading" src="<%=domain %>loadingred.gif" style="display:none">
			 </span>
			 <br />
			 <div class="btn-group">
                      <a class="btn dropdown-toggle btn " data-toggle="dropdown" href="javascript:;">
                        <i class="icon-tags"></i><span id="showtags">Part标签</span>
                      <span class="caret"></span>
				    </a>
				     <ul class="dropdown-menu">
					   <li><a href="javascript:;" onclick="chooseTags('舰船模型')">舰船模型</a></li>
					   <li><a href="javascript:;" onclick="chooseTags('装甲模型')">装甲模型</a></li>
					   <li><a href="javascript:;" onclick="chooseTags('战机模型')">战机模型</a></li>
					   <li><a href="javascript:;" onclick="chooseTags('手办模型')">手办模型</a></li>
					   <li><a href="javascript:;" onclick="chooseTags('动漫模型')">动漫模型</a></li>
					   <li><a href="javascript:;" onclick="chooseTags('高达模型')">高达模型</a></li>
					   <li><a href="javascript:;" onclick="chooseTags('其他模型')">其他模型</a></li>
		               </ul>
				    </div><br />
			 <input id="fileToUpload" style="width:100px" type="file" size="45" name="image"  /><br />
			 <small>写点描述吧</small><br />
			 <textarea id="partinfo" rows="3" style="width:96%" ></textarea>
          </form>
        </div>
	    <div class="modal-footer">
	      <a href="javascript:;" class="btn btn-primary" onclick="ajaxFileUpload()">发布</a>
	      <a href="javascript:;" class="btn" onclick="closeCreatePart()">关闭</a>
	    </div>
    </div>
<script type="text/javascript">
function showCreatePart(){
	 $('#createPartModal').modal({
     keyboard: false
 });
}

function closeCreatePart(){
	 $('#createPartModal').modal('hide');
}

function chooseTags(tag){
	tags = tag;
	$('#showtags').html(tag);
	   
}

function cleanmycolectpartpage(){
	 $.cookie('mycolectpartpage',1,{ expires: 1 });
}

function cleanmypartpage(){
	 $.cookie('mypartpage',1,{ expires: 1 });
}


</script>
<script type="text/javascript"> 
   var tags = '';

   function validateImage() {
  	  return true;
   }
  
  
	function ajaxFileUpload()
	{   
		if(validateImage()){
			var info = $('#partinfo').val();
			if(tags == ''){
				alert("为Part加个标签吧！");
				return ;
			}
			var datas = {"createPartRequest.desc":info,"createPartRequest.type":tags};
			$("#loading").show();
			$.ajaxFileUpload
			(
				{
					url:path + "/createSinglePart.action",
					secureuri:false,
					fileElementId:'fileToUpload',
					dataType: 'json',
					data:datas,
					success: function (data, status)
					{  
						if(data.message == "success"){
							$("#loading").hide();
							closeCreatePart();
			    		    window.location.href= path + "/userSharePartsView";
						}
						
					},
					error: function (data, status, e)
					{
						$("#loading").hide();
						alert(data.message);
					}
				}
			);
		}
		return false;
	}
	</script>
<%-- <%@ include file="../public/metoo_mobile_public_no_function_footer.jsp"%> --%>
<%@ include file="../../../basefootinclude.jsp"%>  
</body>
</html>