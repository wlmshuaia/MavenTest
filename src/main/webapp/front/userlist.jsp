<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		* { padding: 0; margin: 0;}
		
		.main { width: 960px; margin: 20px auto;}
		.main h1 {}
		.main ul { width: 400px; border: red 1px solid; overflow: hidden;}
		.main ul li { list-style: none; float: left; margin-left: 10px;}
	
	</style>

  </head>
  
  <body>
    
    <div class="main">
    	<h1>用户列表</h1>
    	<div class="list-header">
			<ul>
				<li>用户名</li>
				<li>密码</li>
				<li>操作</li>
			</ul>
    	</div>
    	
    	<ul>
	    	<c:forEach items="${userList}" var="user" >
		    	<div class="list-tr">
		    			<span>${user.username}</span>
		    			<span>${user.password}</span>
		    			<span>
		    				<a href="">编辑</a>
		    			</span>
		    			<span>
		    				<a href="fUser/deleteUser.do?uid=${user.id}">删除</a>
		    			</span>
		    	</div>
	    	</c:forEach>
    	</ul>
    </div>
    
  </body>
</html>
