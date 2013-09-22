<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<div class="navbar navbar-inverse navbar-fixed-top" style="opacity: 0.9;">
	<div class="navbar-inner">
		<div class="container" style="text-align:center;">
			<a class="pull-left btn btn-small btn-success" onclick="showHeaderActionModal()"><i class="icon-cog"></i>功能</a>
			<span>
			   <font style="font-size:14px" color="#FFFFFF">${uservo.name }</font>
			</span>
			<a href="<%=rootPath %>/userIndex" class="pull-right btn btn-small btn-primary"><i class="icon-home"></i>主页</a>
		</div>
	</div>
</div>
<div id="metooHeaderActionModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-body">
     <a onclick="cleanvpartpage();" href="<%=rootPath %>/partDashBoard" class="btn btn-large btn-block btn-primary"><i class="icon-pushpin"></i>单图分享</a>
     <a onclick="cleanvsubpage();" href="<%=rootPath %>/subjectDashBoard" class="btn btn-large btn-block btn-success" ><i class="icon-hdd"></i>专辑分享</a>
     <a href="javascript:;" class="btn btn-large btn-block btn-info" onclick="showFilterModal()" ><i class="icon-th"></i>过滤类型</a>
     <a href="javascript:;" class="btn btn-large btn-inverse btn-block" onclick="showSearchModal()" ><i class="icon-search"></i>搜索专辑</a>
     </div>
</div>

<div id="metooFilterModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-body">
         <a href="<%=rootPath %>/partDashBoardType?type=METOO_MODEL_TYPE_JCMX" class="btn btn-large btn-block " type="button">舰船模型</a>
         <a href="<%=rootPath %>/partDashBoardType?type=METOO_MODEL_TYPE_TKMX" class="btn btn-large btn-block " type="button">装甲模型</a>
         <a href="<%=rootPath %>/partDashBoardType?type=METOO_MODEL_TYPE_ZJMX" class="btn btn-large btn-block " type="button">战机模型</a>
         <a href="<%=rootPath %>/partDashBoardType?type=METOO_MODEL_TYPE_SBMX" class="btn btn-large btn-block " type="button">手办模型</a>
         <a href="<%=rootPath %>/partDashBoardType?type=METOO_MODEL_TYPE_DMMX" class="btn btn-large btn-block " type="button">动漫模型</a>
         <a href="<%=rootPath %>/partDashBoardType?type=METOO_MODEL_TYPE_GDMX" class="btn btn-large btn-block " type="button">高达模型</a>
         <a href="<%=rootPath %>/partDashBoardType?type=METOO_MODEL_TYPE_QTMX" class="btn btn-large btn-block " type="button">其他模型</a>
         <a href="<%=rootPath %>/partDashBoardType?type=METOO_MODEL_TYPE_SYMX" class="btn btn-large btn-block " type="button">所有模型</a>
      </div>
</div>


<div id="metooSearchModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-body">
        <form id="top_form" action="<%=rootPath %>/subjectDashBoard" method="POST">
          <input class="span4" placeholder="搜专辑..." type="text" id="topsearchparm" name="visitorSeeSubjectDashBoardRequest.parm" >
        </form>
        <a href="javascript:;" onclick="to_search()" class="btn">查询专题</a>
      </div>
</div>



<script type="text/javascript">

function to_search(){
	 var top_parm = $("#topsearchparm").val();
	 if(top_parm == ""){
		 showCallbackmessageModal("请输入查询条件！");
	 }else{
		 cleanvsubpage();
		 $("#top_form").submit();
	 } 
 }

   function showHeaderActionModal(){
		 $('#metooHeaderActionModal').modal({
	      keyboard: false
	  });
	}
    function showFilterModal(){
	   $('#metooFilterModal').modal({
		      keyboard: false
	  }); 
	   $('#metooHeaderActionModal').modal('hide'); 
    }
    
    function showSearchModal(){
 	   $('#metooSearchModal').modal({
 		      keyboard: false
 	  }); 
 	  $('#metooHeaderActionModal').modal('hide'); 
     }
    
    function filter(type){
    	filterType = type;
    }
    
    function cleanvsubpage(){
       $.cookie('vsubpage',1,{ expires: 1 });
    }
    
    function cleanvpartpage(){
        $.cookie('vpartpage',1,{ expires: 1 });
     }
    
</script>
