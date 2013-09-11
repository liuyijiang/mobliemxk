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
<span class="span12 form-inline">
    <input id="submoney" style="width:160px" placeholder="你的定价" type="text">
    <a href="javascript:;" onclick="setMoney('${traget}')" class=" btn btn-warning btn-small"><i class="icon-jpy"></i>定价</a>
</span>
</div> 
<div style="width:100%;height:4px;"></div>
<div class="container">
  <span class="span12">
    <span class="pull-left">
       <img style="width:32px;border:1px solid #ccc;" src="<%=imgurl%>${uservo.minimage}" />
       <strong>${uservo.name }</strong>
    </span>
  </span>
</div>
<div style="width:100%;height:4px;"></div>
<div style="height:1px;witdh:100%;background-color:#ccc"></div>
<div style="width:100%;height:8px;"></div>  

<div class="container">
<div id="collect_div">
   <c:forEach var="options" items="${priceResponse.list }">
      <div class="span12">
		    <span>
		       <img style="width:26px;border:1px solid #ccc;" src="<%=imgurl%>${options.setPriceUserImage}" />
		       <strong><a style="color:#000000;" href="">${options.setPriceUserName }</a></strong>&nbsp;
		    </span>
            <span class='muted pull-right'><small>报价${options.money }&nbsp;<i class="icon-jpy"></i></small></span><br />
        </div>
       <div style="height:4px;"></div>
<!--        <div style="height:1px;witdh:100%;background-color:#CCCCCC"></div> -->
<!--        <div style="height:4px;"></div> -->
   </c:forEach>
</div>
</div>
<div class="container">
    <div id="loaddiv" class="span12" style="text-align:center;display:none">
        <img src="<%=domain %>loadingred.gif" >
        <span class="muted"><small>正在努力加载...</small></span>
    </div>
</div>
<c:if test="${priceResponse.allpage > 1 }">
   <div class="span12" style="height:3px"></div>
     <a href="javascript:;" onclick="loadMore('${traget}')" class="btn btn-primary btn-small btn-block" ><i class="icon-repeat"></i>加载更多</a>
     <br />
</c:if>
<script type="text/javascript">
var allpage = '${priceResponse.allpage}';
var likepage = 1; 
function loadMore(id){
	likepage = likepage + 1;
	 if(likepage <= allpage){
	   $("#loaddiv").show();
	   $.ajax({
	   		url : path + "/loadMoreMoney",
	   		type : "POST",
	   		cache : false,
	   		async : false,
	   		data: {"pageModel.tragetId":id,"pageModel.currentPage":likepage},
	   		dataType : "json",
	   		success : function(item) {
	   		   $("#loaddiv").hide();
	   		   creatediv(item.list);
	   	   }
	  }); 
   }
}

function creatediv(list){
	show = '';
	for (var i in list) {
		show = show + "<div class='span12'><span><img style='width:26px;border:1px solid #ccc;' src='"+ imgurl+ list[i].setPriceUserImage +"' />"
		+"<strong><a style='color:#000000;' href=''>"+ list[i].setPriceUserName +"</a></strong>&nbsp;</span><span class='muted pull-right'><small>"
	    +"报价"+ list[i].money +"&nbsp;<i class='icon-jpy'></i></small></span><br /></div><div style='height:4px;'></div>";
	}
	$("#collect_div").append(show);
}

</script>
<script type="text/javascript">
function setMoney(id){
	var money = $("#submoney").val();
	var datas = {"setPriceRequest.subjectid":id,"setPriceRequest.money":money};
	if(isNaN(money)){
		alert('请输入一个正确的金额');
	}else{
	   if(money < 0){
		   alert("这也太少了吧");
	   }else{
		   $.ajax({
		 		url : path + "/setPriceToSubject",
		 		type : "POST",
		 		cache : false,
		 		async : false,
		 		data: datas,
		 		dataType : "json",
		 		success : function(item) {
		 			if(item=='success'){
		 				alert("定价成功");
		 			}else if(item=='error'){
		 				alert("网络连接异常");
		 			}else{
		 				alert(item);
		 			}
		 	    }
		});
	   }
	}
}
</script>
<%@ include file="../../../basefootinclude.jsp"%> 
</body>
</html>