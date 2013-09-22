 function rsssubject(subjectid,subjectOwnerId){
		  var datas = {"rssSubjectRequest.subjectid":subjectid,"rssSubjectRequest.subjectOwnerId":subjectOwnerId};
		  $.ajax({
		   		url : path + "/rsssubject",
		   		type : "POST",
		   		cache : false,
		   		async : false,
		   		data: datas,
		   		dataType : "json",
		   		success : function(item) {
		   		    if(item == 'success'){
		   		    	showCallbackmessageModal("订阅成功！");
				    }else if( item == 'error'){
				    	showCallbackmessageModal("网络异常请重试");
				    }else {
				    	showCallbackmessageModal(item);
				    }
		   		  }
		 	 }); 
	  }
 
function createUserRelation(id){	  
	  $.ajax({
	   		url : path + "/createUserRelation",
	   		type : "POST",
	   		cache : false,
	   		async : false,
	   		data: {"createRelationShipRequest.userid":id},
	   		dataType : "json",
	   		success : function(item) {
	   		    if(item == 'success'){
	   		    	showCallbackmessageModal("关注成功");
			    }else if( item == 'error'){
			    	showCallbackmessageModal("已经关注");
			    }else {
			    	showCallbackmessageModal(item);
			    }
	   		  }
	 	 });  
  }  


function collectPart(partid){
	  $.ajax({
   		url : path + "/createUserCollect.action",
   		type : "POST",
   		cache : false,
   		async : false,
   		data: {"collectPartsRequest.targetId":partid},
   		dataType : "json",
   		success : function(item) {
   		    if(item == 'success'){
   		    	showCallbackmessageModal("已将Part加入到你的收藏夹");
		    }else if( item == 'error'){
		    	showCallbackmessageModal("网络异常请重试");
		    }else {
		    	showCallbackmessageModal(item);
		    }
   		  }
 	 }); 
  }
  
	function setPoint(targetId,type){
		var point = $("#point_select").val();
		var datas = {"setPointRequest.tragetid":targetId,"setPointRequest.trageType":type,"setPointRequest.point":point};
		$.ajax({
	   		url : path + "/setPoint.action",
	   		type : "POST",
	   		cache : false,
	   		async : false,
	   		data: datas,
	   		dataType : "json",
	   		success : function(item) {
	   		    if(item == 'success'){
	   		    	showCallbackmessageModal("操作成功");
			    }else {
			    	showCallbackmessageModal(item);
			    }
	   		 }
	   });
	}
