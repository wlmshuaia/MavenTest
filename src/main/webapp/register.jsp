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
    <title>用户注册</title>
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
   				<td width="1px" nowrap="nowrap"><p style="color:red;">*</p></td><td>用户编号</td>		
   				<td><input  style="text" name="userno" id="no" class="form-control"></td>	
   			</tr>
   			<tr>
   				<td><p style="color:red">*</p></td><td>设置密码</td>		
   				<td><input type="password" name="pass" id="pass" class="form-control"></td>	
   			</tr>
   			<tr>
   				<td><p style="color:red">*</p></td><td>确认密码</td>		
   				<td><input  type="password" name="repass" id="repass" class="form-control"></td>	
   			</tr>
   			<tr>
   				<td><p style="color:red">*</p></td><td>姓名</td>		
   				<td><input  type="text" name="username" id="username" class="form-control"></td>	
   			</tr>   			
   			<tr>
   				<td><p style="color:red">*</p></td><td>性别</td>		
   				<td><input  type="radio" name="sex" checked="checked">男<input type="radio" name="sex"  >女</td>	
   			</tr>
   			<tr>
   				<td><p style="color:red">*</p></td><td>生日</td>		
   				<td><input  type="text" name="birthday" placeholder="1993-1-1" onfocus="HS_setDate(this)" class="form-control"/></td>	
   			</tr>
   			<tr>
   				<td><p style="color:red">*</p></td><td>手机号码</td>		
   				<td><input  type="text" name="cellphone" id="cellno" class="form-control"></td>	
   			</tr>   
			<tr>
   				<td><p style="color:red">*</p></td><td>城市</td>		
   				<td><select type="select" name="Item" id="type" class="form-control">
				<option value="北京">
   				 北京 
    			</option>
    			<option value="上海">
     			上海
    			</option>
				<option value="杭州">
     			杭州
    			</option>
  				 </select><td> 	
   			</tr>  			
   			<tr>
   				<td><p style="color:red">*</p></td><td>证件号</td>		
   				<td><input  type="text" name="idno" id="idno" class="form-control"></td>	
   			</tr>   
   			<tr>
   				<td><p style="color:red">*</p></td><td>邮箱</td>		
   				<td><input  type="text" name="email" id="email" class="form-control"></td>	
   			</tr>
			  			   		
   		</table>
      <button id="btn_submit" type="button" class="btn btn-primary"  style="background:#FF4200;color:#FFF">注册</button>
   		</div>
   </form>
   </div>
  </body>
</html>
