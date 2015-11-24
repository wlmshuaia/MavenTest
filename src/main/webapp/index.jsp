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
	<title>预约流程</title>
	<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="dist/front/css/style.css" />
	<script type="text/javascript" src="dist/front/js/date.js"></script>
</head>
<body>

  	<!-- 模态框 -->
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



 <div class="global">
  <hr />
  <div style="height: 70px;">
   <div style="float: left;">
     <a href="#">logo</a>
   </div>
   <div style="float: right">
    <div id="div_notlogin">
     <a href="login.jsp">登录</a>
     <a href="register.jsp" >注册</a>
    </div>
    
    <div id="div_haslogin" style="float:right;display:none;" >
     <p>Welcome! <span id="span_username" style="color:red"></span></p>
     <button id="btn_logout" type="button" class="btn btn-default" onclick="">登出</button>
    </div>
   </div>
  </div>
	
  <nav class="navbar navbar-default tj-nav">
   <a href="fIndex/index.do">
    <button id="yytj" type="button"
     class="btn btn-info navbar-btnv tj-nav-btn" style="height:48px;background:rgba(255, 202, 0, 0.9);color:#FFF">预约体检</button>
   </a> <a href="admin/index.jsp">
    <button id="htgl" type="button"
     class="btn btn-info navbar-btnv tj-nav-btn" style="height:48px;background:rgba(255, 202, 0, 0.9);color:#FFF;display:none">后台管理</button>
   </a>
  </nav>

  <form action="" method="post" id="orderForm">

  <div id="yytj"
   style="height: 400px; border: 0px solid; display: block;">

   <div id="leftarea" style="float: left; margin-top: 0px;">
    <ul class="list-group">
     <li id="li1" class="list-group-item leftlist" style="background:#FF4200;color:#FFF">1.预约体检机构</li>
     <li id="li2" class="list-group-item leftlist">2.选择套餐</li>
     <li id="li3" class="list-group-item leftlist">3.选择可加项</li>
     <li id="li4" class="list-group-item leftlist">4.选择预约时间</li>
     <li id="li5" class="list-group-item leftlist">5.提交完成预约</li>
    </ul>
   </div>

   
   <div id="rightarea">
   <div id="d1"  style="display: block;">
   <div class="page-header">
    	<h2>1.可预约机构：</h2>
   </div>
   <div id="div_hospital"> </div>
   <div class="order-option">
    	<ul class="list-group">
	    	<c:forEach items="${hostpitalList}" var="obj">
	    		<li class="list-group-item">
	    			<label>
	    				<input type="radio" name="hospital" value="${obj.id}"/>
	    				${obj.name }
	    			</label>
	    		</li>
	    	</c:forEach>
    	</ul>
     	<button id="page1_next" type="button" class="btn btn-default" onclick="fnext1()">下一步</button>
    </div>
    </div>

   <div id="d2" style="display: none;">
    <div class="page-header">
    	<h2>2.套餐选择：</h2>
   </div>
   <div id="div_plan"> </div>
   <div class="order-option">
    	<ul class="list-group">
	    	<c:forEach items="${packageList}" var="obj">
	    		<li class="list-group-item">
	    			<label>
	    				<input type="radio" name="cid" value="${obj.id}"/>
	    				${obj.name }
	    			</label>
	    		</li>
	    	</c:forEach>
    	</ul>
     	<button id="pre2" type="button" class="btn btn-default" onclick="pre2()">上一步</button>
      	<button id="next2" type="button" class="btn btn-default" onclick="javascript:fnext2();">下一步</button>
    </div>
   </div>


   <div id="d3"style="display: none;">
   <div class="page-header">
    	<h2>3.可加项选择：</h2>
   </div>
   <div id="div_otherProject"> </div>
   <div class="order-option">
    	<ul class="list-group">
	    	<c:forEach items="${projectList}" var="obj">
	    		<li class="list-group-item">
	    			<label>
	    				<input type="radio" name="project" value="${obj.id}"/>
	    				${obj.name }
	    			</label>
	    		</li>
	    	</c:forEach>
    	</ul>
      	<button id="pre3" type="button" class="btn btn-default" onclick="pre3();">上一步</button>
      <button id="next3" type="button" class="btn btn-default" onclick="fnext3()">下一步</button>
    </div>
    
   </div>


   <div id="d4" style="display: none;">
   <div class="page-header">
    	<h2>4.选择预约日期：</h2>
   </div>
   <div class="order-option">
    	<input type="text" name="ordertime" class="form-control" placeholder="2015-12-1" onfocus="HS_setDate(this)"  /> <br />
      	<button id="pre4" type="button" class="btn btn-default" onclick="pre4()">上一步</button>
      	<button id="next4" type="button" class="btn btn-default" onclick="fnext4()">下一步</button>
    </div>
    
   </div>


   <div id="d5" style="display: none;">
     <div class="page-header">
    	<h2>5.提交完成预约</h2>
   </div>
   <div id="div_sumbit"> </div>
   <div class="order-option">
   
   		<ul class="list-group">
	    	<li class="list-group-item">
	    		<label for="wechatpay">
			      	<input type="radio" id="wechatpay" name="paytype" value="0">
			      	微信支付
			      </label>
	    	</li>
	    	<li class="list-group-item">
	    		<label for="alipay">
			      	<input type="radio" id="alipay" name="paytype" value="1">
			      	支付宝支付
			      </label>
	    	</li>
	    	<li class="list-group-item">
	    		<label for="wechatpay">
			      	<label for="bankpay">
				      	<input type="radio" id="bankpay" name="paytype" value="2">
				      	网银支付
				    </label>
	    	</li>
    	</ul>
	      
      	<button id="pre5" type="button" class="btn btn-default" onclick="pre5()">上一步</button>
      	<button id="btn_submit" type="button" class="btn btn-primary"  style="background:#FF4200;color:#FFF">完成</button>
    </div>
     
    </div>
    
    </form>
   </div>
   </div>
  </div>

 </div>
</body>
	
	<script type="text/javascript" src="dist/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#btn_submit").bind("click", fSubmitOrder);
		});
		
		function fSubmitOrder() {
			var sForm = fGetFormSerializable($("#orderForm"));
			console.log(sForm);
			
			$.ajax({
				url: "fIndex/addOrder.do",
				method: 'post',
				data: JSON.stringify(sForm),
				dataType: 'json',
				contentType: 'application/json',
				success: function(data) {
					fHandleSuccess("", "订单提交成功！");
				},
				error: function(data) {
					console.log("save Object error...");
				}
			});
		}
		
		/**
		 * 操作成功
		 * @param title
		 * @param content
		 */
		function fHandleSuccess(title, content) {
			var hsModal = $("#handleSuccess") ;
			// 打开模态框
			hsModal.modal("show");
			// 设置模态框内容
			if("" == title) {
				title = "提示";
			}
			hsModal.find(".modal-title").html(title);
			hsModal.find(".modal-body").html(content);
			hsModal.find(".btnConfirm").bind("click", fReload);
		}
		
		/**
		 * 页面重新加载
		 */
		function fReload() {
			window.location.reload();
		}
		
		/**
		 * 获取表单序列化数据，并返回json对象
		 * @param obj
		 */
		function fGetFormSerializable(obj) {
			var fields = $(obj).serializeArray();
			
			// 组装json对象
			var sForm = {};
			$.each(fields, function(k, v){
				sForm[v.name] = v.value;
			});
			return sForm;
		}
		
		function fnext1(){
			document.getElementById("d1").style.display = "none";
			document.getElementById("d2").style.display = "block";
			document.getElementById("li1").style.backgroundColor ="#FFF";
			document.getElementById("li1").style.color ="#000";
			document.getElementById("li2").style.backgroundColor ="#FF4200";
			document.getElementById("li2").style.color ="#FFF";
		}
		function fnext2(){
			document.getElementById("d2").style.display = "none";
			document.getElementById("d3").style.display = "block";
			document.getElementById("li2").style.backgroundColor ="#FFF";
			document.getElementById("li2").style.color ="#000";
			document.getElementById("li3").style.backgroundColor ="#FF4200";
			document.getElementById("li3").style.color ="#FFF";
		}
		function fnext3(){
			document.getElementById("d3").style.display = "none";
			document.getElementById("d4").style.display = "block";
			document.getElementById("li3").style.backgroundColor ="#FFF";
			document.getElementById("li3").style.color ="#000";
			document.getElementById("li4").style.backgroundColor ="#FF4200";
			document.getElementById("li4").style.color ="#FFF";
		}
		function fnext4(){
			document.getElementById("d4").style.display = "none";
			document.getElementById("d5").style.display = "block";
			document.getElementById("li4").style.backgroundColor ="#FFF";
			document.getElementById("li4").style.color ="#000";
			document.getElementById("li5").style.backgroundColor ="#FF4200";
			document.getElementById("li5").style.color ="#FFF";
		}
		function pre2(){
			document.getElementById("d2").style.display = "none";
			document.getElementById("d1").style.display = "block";
			document.getElementById("li2").style.backgroundColor ="#FFF";
			document.getElementById("li2").style.color ="#000";
			document.getElementById("li1").style.backgroundColor ="#FF4200";
			document.getElementById("li1").style.color ="#FFF";
		}
		function pre3(){
			document.getElementById("d3").style.display = "none";
			document.getElementById("d2").style.display = "block";
			document.getElementById("li3").style.backgroundColor ="#FFF";
			document.getElementById("li3").style.color ="#000";
			document.getElementById("li2").style.backgroundColor ="#FF4200";
			document.getElementById("li2").style.color ="#FFF";
		}
		function pre4(){
			document.getElementById("d4").style.display = "none";
			document.getElementById("d3").style.display = "block";
			document.getElementById("li4").style.backgroundColor ="#FFF";
			document.getElementById("li4").style.color ="#000";
			document.getElementById("li3").style.backgroundColor ="#FF4200";
			document.getElementById("li3").style.color ="#FFF";
		}
		function pre5(){
			document.getElementById("d5").style.display = "none";
			document.getElementById("d4").style.display = "block";
			document.getElementById("li5").style.backgroundColor ="#FFF";
			document.getElementById("li5").style.color ="#000";
			document.getElementById("li4").style.backgroundColor ="#FF4200";
			document.getElementById("li4").style.color ="#FFF";
		}
		
	</script>


</html>