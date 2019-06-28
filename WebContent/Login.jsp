<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="JavaScript/checkLogin.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="CSS/loginPage.css" rel="stylesheet">
</head>
<body>
	<img src="images/img2.jpg" id="bcg">
	<h1>学生信息管理系统</h1>
	<div id="container">
		<form method="post" action="LoginProcess" onSubmit="return check()">
		  <div class="form-group1" id="ID">
		    <label for="studentID">账号</label>
		    <input type="text" class="form-control" id="studentID" name="studentID" placeholder="学号" onblur="checkID()">
		  </div>
		  <div class="form-group2" id="pwd">
		    <label for="password">密码</label>
		    <input type="password" class="form-control" id="password" name="password" placeholder="密码"  onblur="checkPwd()">
		  </div>
		  <div>
		  	<span id="forget">
		  		<a href="forgetPassword.jsp">忘记密码</a>
		  	</span>
			  <div class="radiobox">
			    <label>
			      <input type="radio" name="user" checked onclick="change(this)" value="学生"> 学生
			    </label>
			    &nbsp;&nbsp;
			    <label>
			    	<input type="radio" name="user" onclick="change(this)" value="管理"> 管理
			    </label>
			  </div>
		  </div>
		  <button type="submit" class="btn btn-primary">登录</button>
		</form>
	</div>

	<!-- Modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="loginWarningModal" data-backdrop="false" data-keyboard="false">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
	        <h2 class="modal-title">提醒</h2>
	      </div>
	      <div class="modal-body">
	        	<h4>请正确输入学号和密码</h4>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal" id="OK">OK</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="loginErrorModal" data-backdrop="false" data-keyboard="false">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
	        <h2 class="modal-title"></h2>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal" id="OK" onclick="window.location.href='Login.jsp';">OK</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%
		if(request.getAttribute("loginError")!=null){
			String error=request.getAttribute("loginError").toString();
			%>
			<script type="text/javascript">
				$("#loginErrorModal .modal-title").text("<%=error%>");
				$("#loginErrorModal").modal('show');
			</script>
			<%
			request.removeAttribute("loginError");	
		}
	%>
</body>
</html>