<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="db.DBConnection" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management</title>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="CSS/manIndexPage.css" rel="stylesheet">
<script src="JavaScript/newInfo.js"></script>
<script src="JavaScript/search.js"></script>
</head>
<%
	DBConnection con=new DBConnection();
	con.createConnection();
	String stu_info_sql=(String)request.getAttribute("preciseCondition");
	String stu_info_sql1=(String)request.getAttribute("condition");
	String id=(String)session.getAttribute("id");
	String sql="";
	sql="select * from manage_info where manage_id='"+id+"'";
	ArrayList<Map<String,String>> rs=con.queryForList(sql);
	sql="select * from inform";
	ArrayList<Map<String,String>> infoRs=con.queryForList(sql);
	if(stu_info_sql!=null){
		sql=stu_info_sql;
	}else{
		if(stu_info_sql1!=null){
			sql=stu_info_sql1;
		}else{
			sql="select * from stu_info";
		}
	}
	ArrayList<Map<String,String>> stu_info=con.queryForList(sql);
	if(rs!=null)
		session.setAttribute("name",rs.get(0).get("name"));
	String message=(String)request.getAttribute("message");
	String news=(String)request.getAttribute("news");
	if(message!=null){
		if("success".equals(message)){%>
			<div class="alert alert-success alert-dismissible" role="alert">发 布 成 功
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<%
		}
		else{%>
			<div class="alert alert-danger alert-dismissible" role="alert">发 布 失 败
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<%
		}
		request.removeAttribute("message");
	}
	if(news!=null){
		if("success".equals(news)){%>
			<div class="alert alert-success alert-dismissible" role="alert">添 加 成 功
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<%
		}
		else{%>
			<div class="alert alert-danger alert-dismissible" role="alert">添 加 失 败
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<%
		}
		request.removeAttribute("news");
		%>
		<script type="text/javascript">
				window.location("manIndex.jsp");
			</script>
	<%}
%>
<body>
	<div id="navigation">
		<div id="man">
			<h3>管理端</h3>
			<hr>
			<table>
				<tr>
					<td rowspan='2'><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					<td id="name"><%=rs.get(0).get("name") %>
				</tr>
				<tr>
					<td id="id"><%=rs.get(0).get("manage_id") %>
				</tr>
			</table>
		</div>
		<table id="sidebar">
			<tr onclick="showSearch()"><td><a><span class="glyphicon glyphicon-search" aria-hidden="true"></span>信息查询</a></tr>
			<tr onclick="showInfo()"><td><a><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>我的通知</a></tr>
			<tr><td><a href="DestroySession"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>退出登录</a></tr>
		</table>
	</div>
	
	<div id="search">
		<nav class="navbar navbar-default navbar-fixed-top">
  			<div class="container">
    			<p class="navbar-text"><span class="glyphicon glyphicon-list" aria-hidden="true"></span>学生信息查询</p>
  			</div>
		</nav>
		<ul class="nav nav-tabs">
		  <li role="presentation" class="active" id="general" onclick="show1()"><a style="cursor: pointer;">模糊查询</a></li>
		  <li role="presentation" id="precise"  onclick="show2()"><a style="cursor: pointer;">精确查询</a></li>
		</ul>
		<div id="condition">
			<form action="condition" method="post">
				<div class="form-group">
					<label>学院</label>
					<input class="form-control" name="college">
				</div>
				<div class="form-group">
					<label>专业</label>
					<input class="form-control" name="major">
				</div>
				<div class="form-group">
					<label>班级</label>
					<input class="form-control" name="className">
				</div>
				<button class="btn btn-primary">查找</button>
			</form>
		</div>
		<div id="preciseCondition">
			<form action="preciseCondition" method="post">
				<div class="form-group">
					<label>学号</label>
					<input class="form-control" name="stu_id">
				</div>
				<button class="btn btn-primary">查找</button>
			</form>
		</div>
		<div id='resultNav'>
			<div>查询结果</div>
			<button class="btn btn-success" data-toggle="modal" data-target="#newModal">添&nbsp;&nbsp;加</button>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<td>学号
					<td>姓名
					<td>性别
					<td>入学日期
					<td>学院
					<td>专业
					<td>班级
					<td>操作
				</tr>
			</thead>
			<tbody>
				<%
				for(int i=0;i<stu_info.size();i++){				
				%>
					<tr>
						<td><%=stu_info.get(i).get("stu_id") %>
						<td><%=stu_info.get(i).get("name") %>
						<td><%=stu_info.get(i).get("sex") %>
						<td><%=stu_info.get(i).get("enrollment") %>
						<td><%=stu_info.get(i).get("college") %>
						<td><%=stu_info.get(i).get("major") %>
						<td><%=stu_info.get(i).get("class") %>
						<td><button class="btn btn-danger" onclick="deleteInfo.call(this)">删&nbsp;除</button>
						<form method="post" action="DeleteInfo"><input name="del_stu_id" value='<%=stu_info.get(i).get("stu_id") %>'></form>
					</tr>
				<%}
				%>
			</tbody>
		</table>
	</div>
	
	<div id="content">
		<div>
			<span class="glyphicon glyphicon-plus-sign" aria-hidden="true" id="new"  data-toggle="modal" data-target="#newinfo"></span>
		</div>
		<%for(int i=infoRs.size()-1;i>=0;i--){
			String content=infoRs.get(i).get("content").replace("\r\n","</p><p>");
			String date=infoRs.get(i).get("date");
			%>
		<div class="jumbotron">
		<form action="DeleteNotification" method="post">
			<input name="id" value='<%=infoRs.get(i).get("id") %>'>
		</form>
		<button type="button" class="close" onclick="deleteNotification.call(this)"><span aria-hidden="true">&times;</span></button>
		  <h2 id="title"><%=infoRs.get(i).get("title") %></h2>
		  <hr>
		  <div id="information">
		  		<p><%=content%></p>
		  </div>
		  <div id="foot">
		  	<span id="date"><%=date.replace(".0","") %></span>
		  </div>
		</div>
		<%} %>
	</div>
	<!-- model -->
	<div class="modal fade bs-example-modal-lg" id="newinfo" tabindex="-1" role="dialog" data-backdrop="false" data-keyboard="false">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">新通知</h4>
	      </div>
	      <div class="modal-body">
	        <form method="post" action="NewInfo" id="addinfo">
	          <div class="form-group">
	            <label for="recipient-name" class="control-label">标题</label>
	            <input type="text" class="form-control" name="title" id="message-title">
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="control-label">内容</label>
	            <textarea class="form-control" id="message-text" name="content"></textarea>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="submit" onclick="javascript:$('#addinfo').submit()">发布</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- new -->
	<!-- Modal -->
	<div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加新的学生信息</h4>
	      </div>
	      <div class="modal-body">
	        <form action="newStu" method="post" id="newStu">
	        	<div class="form-group">
				    <label for="stu_id">学号</label>
				    <input type="text" class="form-control" id="stu_id" name="stu_id" placeholder="学号">
				 </div>
				 <div class="form-group">
				    <label for="stuname">姓名</label>
				    <input type="text" class="form-control" id="stuname" name="stuname" placeholder="姓名">
				 </div>
				 <div class="form-group">
				    <label for="sex">性别</label>
				    <input type="text" class="form-control" id="sex" name="sex" placeholder="性别">
				 </div>
				 <div class="form-group">
				    <label for="enrollment">入学日期</label>
				    <input type="text" class="form-control" id="enrollment" name="enrollment" placeholder="入学日期">
				 </div>
				 <div class="form-group">
				    <label for="birthday">出生日期</label>
				    <input type="text" class="form-control" id="birthday" name="birthday" placeholder="出生日期">
				 </div>
				  <div class="form-group">
				    <label for="nation">民族</label>
				    <input type="text" class="form-control" id="nation" name="nation" placeholder="民族">
				 </div>
				 <div class="form-group">
				    <label for="native_place">籍贯</label>
				    <input type="text" class="form-control" id="native_place" name="native_place" placeholder="籍贯">
				 </div>
				 <div class="form-group">
				    <label for="political_status">政治面貌</label>
				    <input type="text" class="form-control" id="political_status" name="political_status" placeholder="政治面貌">
				 </div>
				 <div class="form-group">
				    <label for="phone_number">联系电话</label>
				    <input type="text" class="form-control" id="phone_number" name="phone_number" placeholder="联系电话">
				 </div>
				 <div class="form-group">
				    <label for="id">身份证号</label>
				    <input type="text" class="form-control" id="id" name="id" placeholder="身份证号">
				 </div>
				 <div class="form-group">
				    <label for="qualification">学历</label>
				    <input type="text" class="form-control" id="qualification" name="qualification" placeholder="学历">
				 </div>
				 <div class="form-group">
				    <label for="college">学院</label>
				    <input type="text" class="form-control" id="college" name="college" placeholder="学院">
				 </div>
				 <div class="form-group">
				    <label for="major">专业</label>
				    <input type="text" class="form-control" id="major" name="major" placeholder="专业">
				 </div>
				 <div class="form-group">
				    <label for="class">班级</label>
				    <input type="text" class="form-control" id="class" name="class" placeholder="班级">
				 </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="javascript:$('#newStu').submit()">添加</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>