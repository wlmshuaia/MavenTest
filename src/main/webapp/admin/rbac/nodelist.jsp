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
	            <label for="recipient-username" class="col-sm-2 control-label">名称:</label>
	            <div class="col-sm-10">
	            	<input type="text" name="name" class="form-control" id="recipient-username">
	            	<input type="hidden" name="id" value="">
	            	<input type="hidden" name="pid" value="">
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="recipient-age" class="col-sm-2 control-label">描述:</label>
	            <div class="col-sm-10">
	            	<input type="text" name="remark" class="form-control" id="recipient-age">
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="recipient-age" class="col-sm-2 control-label">地址:</label>
	            <div class="col-sm-10">
	            	<input type="text" name="address" class="form-control" id="recipient-age">
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="recipient-age" class="col-sm-2 control-label">标题:</label>
	            <div class="col-sm-10">
	            	<input type="text" name="title" class="form-control" id="recipient-age">
	            </div>
	          </div>
	        </form>
	        
	        <div class="editAssign">
	        	<!-- <div class="panel panel-default">
				  <div class="panel-heading">
				  </div>
				  <div class="panel-body">
				  </div>
				</div> -->
	        </div>
	        
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
		  	<h1 class="page-header">节点列表</h1>
		  	
		  	<div class="table-handler">
		  		<div class="btn-group" role="group" aria-label="">
				  <button type="button" class="btn btn-default" id="addUser" data-toggle="modal" data-target="#ifHandle" data-whatever="0-add"><i class="glyphicon glyphicon-plus"></i> 添加应用</button>
				</div>
		  	</div>
		  	
		    <div class="table-container">
		    	
		    	<c:forEach items="${oneMap.keySet()}" var="one">
			    	
		    			<div class="panel panel-default">
						  <div class="panel-heading">
<!-- 		    				${one} -->
		    				${oneMap.get(one).get('remark') }
		    				<div class="btn-group btn-group-sm" role="group" aria-label="">
							  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#ifHandle" data-whatever="${oneMap.get(one).get('id')}-add">添加控制器</button>
							  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#ifHandle" data-whatever="${oneMap.get(one).get('id')}-delete">删除</button>
							</div>
						  </div>
						  <div class="panel-body">
						  	
						  	<c:forEach items="${oneMap.get(one).get('child').keySet()}" var="two">
			    					
			    					<div class="panel panel-default">
									  <div class="panel-heading">
									  ${oneMap.get(one).get('child').get(two).get('remark')}
					    				<div class="btn-group btn-group-sm" role="group" aria-label="">
										  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#ifHandle" data-whatever="${oneMap.get(one).get('child').get(two).get('id')}-add">添加子分类</button>
										  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#ifHandle" data-whatever="${oneMap.get(one).get('child').get(two).get('id')}-delete">删除</button>
										</div>
									  </div>
									  
									  <c:if test="${!empty oneMap.get(one).get('child')[two]['child']}">
									  	<div class="panel-body">
									  		<ul class="list-group ul-inline">
			  			    					<c:forEach items="${oneMap.get(one).get('child').get(two).get('child')}" var="node">
					    							<li class="list-group-item">
					    								${node.remark}
					    								<div class="btn-group btn-group-sm" role="group" aria-label="">
														  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#ifHandle" data-whatever="${node.id}-edit">编辑</button>
														  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#ifHandle" data-whatever="${node.id}-delete">删除</button>
														</div>
					    							</li>
					    						</c:forEach>
				    						</ul>
										</div>
									  </c:if>
									  
									</div>
									
			    			</c:forEach>
							
						  </div>
						</div>
						
		    	</c:forEach>
		    	
		    </div>
		    
		  </div>
	
	</div>
	
<%@ include file="../common/footer.jsp" %>

	<script src="dist/js/admin/common-handler.js"></script>
	<script src="dist/js/admin/node-handler.js"></script>

