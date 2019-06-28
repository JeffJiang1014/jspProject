<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="db.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForgetPassword</title>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="CSS/forgetPassword.css" rel="stylesheet">
</head>
<body>
	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true" id="back"></span>
	<h1>重置密码</h1>
	<hr>
	<div class="progress">
  		<div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 50%" id="caseVerte"></div>
	</div>
	<div id="container">
	<form method="post" action="ResetPwd">
	<div id="div1">
		  <div id="studentID">
		    <label for="studentID">学号</label>
		    <input type="text" class="form-control" name="studentID" placeholder="学号" onblur="isNull.call(this)&&checkInfo()">
		  </div>
		  <div id="name">
		    <label for="name">姓名</label>
		    <input type="text" class="form-control" name="name" placeholder="姓名" onblur="isNull.call(this)&&checkInfo()">
		  </div>
		  <div id="id">
		    <label for="id">身份证号</label>
		    <input type="text" class="form-control" name="id" placeholder="身份证号" onblur="isNull.call(this)&&checkInfo()">
		  </div>
		  <button type="button" class="btn btn-primary" id="next" disabled="disabled" data-toggle="tooltip" title="请输入个人信息">下一步</button>
	</div>
	<div id="div2">
		  <div class="form-group1" id="password">
		    <label for="password">新密码</label>
		    <input type="password" class="form-control" name="newPassword" onblur="isNull.call(this)&&checkPwd.call(this)&&check()">
		  </div>
		  <div class="form-group2" id="repassword">
		    <label for="name">确认密码</label>
		    <input type="password" class="form-control"  name="renewPassword" onblur="isNull.call(this)&&checkPwd.call(this)&&check()">
		  </div>
		  <div id="btn">
		  	<button type="button" class="btn  btn-default" id="last">上一步</button>
		  	<button type="button" class="btn btn-primary" id="complete" disabled="disabled"  data-toggle="tooltip" title="完成输入后才能提交" onclick="javascript:setTimeout(function(){$('form').submit()},2500)">完成</button>
		  </div>
	</div>
	</form>
	</div>
	<div id="point">
		<label id="first">第一步：输入验证信息</label>
		<label id="second">第二步：重置密码</label>
	</div>
</body>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="JavaScript/forget.js"></script>
</html>

