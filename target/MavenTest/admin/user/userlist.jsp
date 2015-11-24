<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp" %>
	
	<%@ include file="../common/nav.jsp" %>
   
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	  <h1 class="page-header">用户列表</h1>
	  	
	  	<div class="">
	  		<div class="btn-group" role="group" aria-label="">
			  <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> 增加</button>
			  <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-check"></i> 查看</button>
			  <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-edit"></i> 修改</button>
			  <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i> 删除</button>
			</div>
	  	</div>
	  	
	    <div class="">
	    	<table class="table table-hover">
	    		<thead>
	    			<tr>
	    				<th>
    						<input type="checkbox">
	    				</th>
		    			<th>用户名</th>
		    			<th>性别</th>
		    			<th>年龄</th>
		    			<th>手机号</th>
		    			<th>邮箱</th>
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
		    						<c:otherwise>
		    							女
		    						</c:otherwise>
		    					</c:choose>
		    				</td>
		    				<td>${user.age }</td>
		    				<td>
		    					<c:choose>
		    						<c:when test="${user.phone != null }">
		    							${user.phone }
		    						</c:when>
		    						<c:otherwise>
		    							无
		    						</c:otherwise>
		    					</c:choose>
		    				</td>
		    				<td>
		    					<c:choose>
		    						<c:when test="${user.email != null }">
		    							${user.email }
		    						</c:when>
		    						<c:otherwise>
		    							无
		    						</c:otherwise>
		    					</c:choose>
		    				</td>
		    				<td>
		    					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="">编辑 </button>
		    					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" data-whatever="${user.id}">删除 </button>
		    					
		    					<!-- <button type="button" class="btn btn-danger"  data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">删除</button>
		    					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="exampleModalLabel">提示</h4>
								      </div>
								      <div class="modal-body">
								      	确认删除？
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-primary">确认</button>
								        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								      </div>
								    </div>
								  </div>
								</div> -->
								
		    				</td>
		    			</tr>
	    			</c:forEach>
	    		</tbody>
	    	</table>
	    </div>
	    
	  </div>
	
	</div>
	
<%@ include file="../common/footer.jsp" %>

	<script src="dist/js/admin/user-handler.js"></script>

