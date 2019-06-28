<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="db.DBConnection" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Info</title>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="CSS/stuIndexPage.css" rel="stylesheet">
</head>
<body>
	<%
	DBConnection con=new DBConnection();
	con.createConnection();
	String stu_id=(String)session.getAttribute("id");
	String sql="";
	sql="select * from stu_info where stu_id='"+stu_id+"'";
	ArrayList<Map<String,String>> rs=con.queryForList(sql);
	sql="select * from inform";
	ArrayList<Map<String,String>> infoRs=con.queryForList(sql);
	String content=infoRs.get(infoRs.size()-1).get("content").replace("\r\n","</p><p>");
	%>
<h1>个人信息查询</h1>

<div class="dropdown">
	<a href="#" class="dropdown-toggle" data-toggle="dropdown">你好 , <%=rs.get(0).get("name") %>
		<b class="caret"></b>
	</a>
	<ul class="dropdown-menu">
		<li><a href="EditPwd.jsp"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改密码</a></li>
		<li><a href="DestroySession"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>退出登录</a></li>
	</ul>
</div>

<form method="post" action="EditImage" enctype="multipart/form-data">
<div class="table-responsive">
  <table class="table table-striped table-hover table-bordered">
   	<tbody>
   		<tr>
   			<td rowspan='6' style="width:200px" align="center" valign="middle"><img src='<%=rs.get(0).get("img") %>'></td>
   			<td>学号</td>
   			<td><%=rs.get(0).get("stu_id") %></td>
   		</tr>	
		<tr>
			<td>姓名</td>
   			<td><%=rs.get(0).get("name") %></td>
		</tr>
		<tr>
			<td>性别</td>
   			<td><%=rs.get(0).get("sex") %></td>
		</tr>
		<tr>
			<td>入学日期</td>
   			<td><%=rs.get(0).get("enrollment") %></td>
		</tr>
		<tr>
			<td>出生日期</td>
   			<td><%=rs.get(0).get("birthday") %></td>
		</tr>
		<tr>
			<td>民族</td>
   			<td><%=rs.get(0).get("nation") %></td>
		</tr>
		<tr>
			<td style="padding:10px" id="file">
				<input type="file" name="file" style="display:inline-table;" onchange="javascript:$('button').removeAttr('disabled data-toggle title')">
				<button type="submit" class="btn btn-primary" disabled="disabled" data-toggle="tooltip" title="选择你要上传的照片">提交</button>
			</td>
			<td>籍贯</td>
   			<td><%=rs.get(0).get("native_place") %></td>
		</tr>
		<tr>
			<td rowspan='7' id="notification">
				<h3 id="title"><%=infoRs.get(infoRs.size()-1).get("title") %></h3	>
				<div id="content">
					<p><%=content%></p>
				</div>
			</td>
			<td>政治面貌</td>
   			<td><%=rs.get(0).get("political_status") %></td>
		</tr>
		<tr>
			<td>联系电话</td>
   			<td><%=rs.get(0).get("phone_number") %></td>
		</tr>
		<tr>
			<td>身份证号</td>
   			<td><%=rs.get(0).get("id") %></td>
		</tr>
		<tr>
			<td>学历</td>
   			<td><%=rs.get(0).get("qualification") %></td>
		</tr>
		<tr>
			<td>学院</td>
   			<td><%=rs.get(0).get("college") %></td>
		</tr>
		<tr>
			<td>专业</td>
   			<td><%=rs.get(0).get("major") %></td>
		</tr>
		<tr>
			<td>班级</td>
   			<td><%=rs.get(0).get("class") %></td>
		</tr>
   	</tbody>
  </table>
</div>
</form>
</body>
</html>