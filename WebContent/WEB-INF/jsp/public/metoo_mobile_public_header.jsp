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
     <a href="<%=rootPath %>/partDashBoard" class="btn btn-large btn-block btn-primary"><i class="icon-pushpin"></i>单图分享</a>
     <a class="btn btn-large btn-block btn-success" ><i class="icon-hdd"></i>专辑分享</a>
     <a class="btn btn-large btn-block btn-warning" ><i class="icon-weibo"></i>官方微博</a>
     <a class="btn btn-large btn-block btn-info" onclick="showfiler()" ><i class="icon-th"></i>过滤类型</a>
     <a class="btn btn-large btn-inverse btn-block" onclick="showfiler()" ><i class="icon-search"></i>搜索专辑</a>
     </div>
</div>

<div id="metooFilterModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-body">
      <button class="btn btn-large btn-block " type="button">舰船模型</button>
      <button class="btn btn-large btn-block " type="button">战机模型</button>
      </div>
</div>
<script type="text/javascript">
   function showHeaderActionModal(){
		 $('#metooHeaderActionModal').modal({
	      keyboard: false
	  });
	}
    function showFilterModal(){
	   $('#metooFilterModal').modal({
		      keyboard: false
	  }); 
    }
</script>
