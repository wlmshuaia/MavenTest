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
  	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- <link rel="icon" href="../../favicon.ico"> -->
	
    <title>后台管理系统</title>
	
    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom styles for this template -->
    <link href="dist/css/admin/dashboard.css" rel="stylesheet">
    <link href="dist/css/admin/style.css" rel="stylesheet">
	
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
	
	<%@ include file="../common/header.jsp" %>
	
	<!-- 模态框 -->
	<div class="modal fade bs-example-modal-sm" id="ifHandle">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">提示</h4>
	      </div>
	      <div class="modal-body">
	        <p>确认删除？</p>
	        <form name="" method="post" id="editUserForm" class="form-horizontal">
	          <div class="form-group">
	            <label for="recipient-username" class="col-sm-2 control-label">姓名:</label>
	            <div class="col-sm-10">
	            	<input type="text" name="username" class="form-control" id="recipient-username">
	            	<input type="hidden" name="id" value="0">
	            	<input type="hidden" name="password" value="">
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="recipient-sex" class="col-sm-2 control-label">性别:</label>
	            <div class="col-sm-10">
		            <label class="radio-inline">
					  <input type="radio" name="sex" value="1">男
					</label>
					<label class="radio-inline">
						<input type="radio" name="sex" value="0">女
					</label>
					<label class="radio-inline">
						<input type="radio" name="sex" value="2">未知
					</label>
				</div>
	          </div>
	          <div class="form-group">
	            <label for="recipient-age" class="col-sm-2 control-label">年龄:</label>
	            <div class="col-sm-10">
	            	<input type="text" name="age" class="form-control" id="recipient-age">
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="recipient-phone" class="col-sm-2 control-label">手机:</label>
	           	<div class="col-sm-10">
	           		<input type="text" name="phone" class="form-control" id="recipient-phone">
	           	</div>
	          </div>
	          <div class="form-group">
	            <label for="recipient-email" class="col-sm-2 control-label">邮箱:</label>
	            <div class="col-sm-10">
	            	<input type="text" name="email" class="form-control" id="recipient-email">
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="message-intro" class="col-sm-2 control-label">简介:</label>
	            <div class="col-sm-10">
	            	<textarea class="form-control" name="intro" id="message-intro" rows="6"></textarea>
	            </div>
	          </div>
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary btnConfirm" data-dismiss="modal">确定</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="modal fade bs-example-modal-sm un-display" id="handleSuccess">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">提示</h4>
	      </div>
	      <div class="modal-body">
	        <p>删除成功！</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary btnConfirm" data-dismiss="modal">确定</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="container-fluid">
	
		<%@ include file="../common/nav.jsp" %>
	   	
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  	<h1 class="page-header">用户列表</h1>
		  	
		  	<div class="table-handler">
		  		<div class="btn-group" role="group" aria-label="">
				  <button type="button" class="btn btn-default" id="addUser" data-toggle="modal" data-target="#ifHandle" data-whatever="1-add"><i class="glyphicon glyphicon-plus"></i> 添加</button>
				  <button type="button" class="btn btn-default" id="checkUser"><i class="glyphicon glyphicon-check"></i> 查看</button>
				  <button type="button" class="btn btn-default" id="editUser"><i class="glyphicon glyphicon-edit"></i> 修改</button>
				  <button type="button" class="btn btn-default" id="deleteUser"><i class="glyphicon glyphicon-trash"></i> 删除</button>
				</div>
		  	</div>
		  	
		    <div class="table-container">
		    	<table class="table table-hover table-layout">
		    		<thead>
		    			<tr>
		    				<th>
	    						<input type="checkbox" id="chooseAll">
		    				</th>
			    			<th>用户名</th>
			    			<th>性别</th>
			    			<th>年龄</th>
			    			<th>手机号</th>
			    			<th>邮箱</th>
			    			<th>简介</th>
			    			<th>操作</th>
		    			</tr>
		    		</thead>
		    		<tbody>
		    			<c:forEach items="${userList}" var="user">
		    				<tr>
			    				<td>
			    					<input type="checkbox" name="users" >
			    				</td>
			    				<td>${user.username}</td>
			    				<td>
			    					<c:choose>
			    						<c:when test="${user.sex == 1 }">
			    							男
			    						</c:when>
			    						<c:when test="${user.sex == 0 }">
			    							女
			    						</c:when>
			    						<c:otherwise>
			    							未知
			    						</c:otherwise>
			    					</c:choose>
			    				</td>
			    				<td>${user.age }</td>
			    				<td>
			    					<c:choose>
			    						<c:when test="${user.phone != null}  or ${user.phone != ''}">
			    							${user.phone }
			    						</c:when>
			    						<c:otherwise>
			    							无
			    						</c:otherwise>
			    					</c:choose>
			    				</td>
			    				<td>
			    					<c:choose>
			    						<c:when test="${user.email != null} or ${user.email != ''}">
			    							${user.email }
			    						</c:when>
			    						<c:otherwise>
			    							无
			    						</c:otherwise>
			    					</c:choose>
			    				</td>
			    				<td class="td-intro">
			    					<c:choose>
			    						<c:when test="${user.intro != null}">
			    							${user.intro }
			    						</c:when>
			    						<c:otherwise>
			    							无
			    						</c:otherwise>
			    					</c:choose>
			    				</td>
			    				<td>
			    					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ifHandle" data-whatever="${user.id}-edit">编辑 </button>
			    					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#ifHandle" data-whatever="${user.id}-delete">删除 </button>
			    				</td>
			    			</tr>
		    			</c:forEach>
		    		</tbody>
		    	</table>
		    </div>
		    
		    <div class="page">
	    		<c:choose>
	    			<c:when test="${pageMap.curr - 1 > 0 }">
		    			<span class="prePage">
		    				<i class="glyphicon glyphicon-triangle-left"></i>
		    				<a href="admin/User/userlist.do?page=${pageMap.curr-1 }">上一页</a>
	    				</span>
	    			</c:when>
	    			<c:otherwise>
	    				<span class="noPage">
	    					<i class="glyphicon glyphicon-triangle-left"></i>
	    					<a href="javascript:void(0)">上一页</a>
	    				</span>
	    			</c:otherwise>
	    		</c:choose>
		    	
		    	<ul>
		    		<c:forEach var="page" begin="${pageMap.pStart}" end="${pageMap.pEnd}">
		    			<c:choose>
		    				<c:when test="${pageMap.curr == page}">
		    					<a href=""><li class="currPage">${page}</li></a>
		    				</c:when>
		    				<c:otherwise>
		    					<a href="admin/User/userlist.do?page=${page}"><li>${page}</li></a>
		    				</c:otherwise>
		    			</c:choose>
		    		</c:forEach>
		    	</ul>
		    	
		    	<%-- <span class="nextPage">
		    		<a href="admin/User/userlist.do?page=${pageMap.curr+1}">下一页</a>
		    	</span> --%>
		    	<c:choose>
	    			<c:when test="${pageMap.curr + 1 <= pageMap.pEnd}">
		    			<span class="nextPage">
		    				<a href="admin/User/userlist.do?page=${pageMap.curr + 1 }">下一页</a>
		    				<i class="glyphicon glyphicon-triangle-right"></i>
	    				</span>
	    			</c:when>
	    			<c:otherwise>
	    				<span class="noPage">
	    					<a href="javascript:void(0)">下一页</a>
	    					<i class="glyphicon glyphicon-triangle-right"></i>
	    				</span>
	    			</c:otherwise>
	    		</c:choose>
		    </div>
		    
		  </div>
	
	</div>
	
<%@ include file="../common/footer.jsp" %>

	<script src="dist/js/admin/common-handler.js"></script>
	<script src="dist/js/admin/user-handler.js"></script>

