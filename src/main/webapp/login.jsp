<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
  	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="dist/front/css/style.css" />

	<script type="text/javascript" src="dist/front/js/date.js"> </script>
  </head>
  
  <body>

    <div class="global">
  <hr />
  <div style="height: 70px;">
   <div style="float: left;">
   </div>
   <div style="float: right">
    <div id="div_notlogin">
     <a href="login.jsp">登录</a>
     <a href="register.jsp" >注册</a>
    </div>
   </div>
  </div>


  <NAV class="navbar navbar-default tj-nav"> 
   <a href="fIndex/index.do"> 
    <button id="yytj" type="button" class="btn btn-info navbar-btnv tj-nav-btn" style="background: rgba(255, 202, 0, 0.9) none repeat scroll 0% 0%; height: 48px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; color: rgb(255, 255, 255);">预约体检</button></a></NAV><NAV class="navbar navbar-default tj-nav"><a href="../jsp/main.jsp"> 
   </a> 
    <a href="admin/index.jsp">
    <button id="htgl" type="button"
     class="btn btn-info navbar-btnv tj-nav-btn" style="height:48px;background:rgba(255, 202, 0, 0.9);color:#FFF;display:none">后台管理</button>
   </a>
   <form>
<!--    <div float:left>插个图</div> -->
   <div style="width:30%; margin: 0 auto;" >
   		<table>
   			<tr>
   				<td width="1px" nowrap="nowrap"></td><td>账号：</td>		
   				<td><input  style="text" name="userno" id="no" class="form-control"></td>	
   			</tr>
   			<tr>
   				<td></td><td>密码：</td>		
   				<td><input type="password" name="pass" id="pass" class="form-control"></td>	
   			</tr>
   		</table>
      <button id="btn_submit" type="button" class="btn btn-primary">登录</button>
   		</div>
   </form>
   </div>
  </body>
</html>
