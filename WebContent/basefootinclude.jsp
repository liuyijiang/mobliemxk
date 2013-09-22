<%
	String fassets = "http://www.waileecn.com/mxk/assets"; 
%>
<div id="callbackmessageModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-body">
        <span class="text-error" id="callbackmessage"></span>
      </div>
</div>
<script type="text/javascript">
  function showCallbackmessageModal(message){
	$("#callbackmessage").html(message);
	 $('#callbackmessageModal').modal({
	      keyboard: false
	  });
   }
</script>
<script type="text/javascript" src="<%=fassets %>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=fassets %>/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=fassets %>/js/bootstrap-transition.js" ></script>
<script type="text/javascript" src="<%=fassets %>/js/bootstrap-dropdown.js" ></script>
<script type="text/javascript" src="<%=fassets %>/js/bootstrap-alert.js" ></script>
<script type="text/javascript" src="assets/js/metoo.js"></script>
<script type="text/javascript" src="assets/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=fassets %>/js/ajaxfileupload.js"></script>

