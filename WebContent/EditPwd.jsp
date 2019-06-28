<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditPwd</title>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="CSS/EditPwd.css" rel="stylesheet">
<script type="text/javascript">
	var password=<%=session.getAttribute("password")%>;
</script>
</head>
<body>
	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true" id="back"  onclick="window.history.go(-1)"></span>
	<h1>修改密码</h1>
	<hr>
	<div id="container">
	<form method="post" action="UpdatePwd">
	<div id="div1">
		  <div id="old">
		    <label for="oldPwd">旧密码</label>
		    <input type="password" class="form-control" id="oldPwd" name="oldPwd" placeholder="旧密码" onblur="isNull.call(this)&&isCorrect.call(this)&&check()">
		  </div>
		  <div id="newPwd">
		    <label for="newPwd">新密码</label>
		    <input type="password" class="form-control" id="newPwd" name="newPwd" placeholder="新密码" onblur="isNull.call(this)&&isRepeat.call(this)&&check()">
		  </div>
		  <div id="renewPwd">
		    <label for="renewPwd">确认密码</label>
		    <input type="password" class="form-control" id="renewPwd" name="renewPwd" placeholder="确认密码" onblur="isNull.call(this)&&isSame.call(this)&&check()">
		  </div>
		  <button type="submit" class="btn btn-primary" id="submit" disabled="disabled" data-toggle="tooltip" title="完成输入后才能提交">提交</button>
		  <button type="button" class="btn btn-default" id="reset">重置</button>
	</div>
	</form>
	</div>	
	<!-- Modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="successUpdate" data-backdrop="false" data-keyboard="false">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
	        <h2 class="modal-title">提醒</h2>
	      </div>
	      <div class="modal-body">
	        	<h4></h4>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal" id="OK" onclick="window.location.href='Login.jsp'">OK</button>
	      </div>
	    </div>
	  </div>
	</div>
	<%
	if(request.getAttribute("success")!=null){
		String success=request.getAttribute("success").toString();
		%>
		<script type="text/javascript">
			$("#successUpdate .modal-body h4").text("<%=success%>");
			$("#successUpdate").modal('show');	
		</script>
		<%
		request.removeAttribute("success");	
	}
	%>
	<script src="JavaScript/EditPwd.js"></script>
</body>
</html>