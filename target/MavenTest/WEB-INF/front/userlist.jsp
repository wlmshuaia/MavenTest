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

  </head>
  
  <body>
    
    <div class="main">
    	<h1>用户列表</h1>
    	<div class="list-header">
			<ul>
				<li>用户名</li>
				<li>密码</li>
			</ul>
    	</div>
    	<c:forEach items="${userList}" var="user" >
	    	<div class="list-tr">
	    		<ul>
	    			<li>${user.username}</li>
	    			<li>${user.password}</li>
	    			<li>
	    				<a href="">编辑</a>
	    			</li>
	    			<li>
	    				<a href="fUser/deleteUser?uid=${user.id}">删除</a>
	    			</li>
	    		</ul>
	    	</div>
    	</c:forEach>
    </div>
    
  </body>
</html>
