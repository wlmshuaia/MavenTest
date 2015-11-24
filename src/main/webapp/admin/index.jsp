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
    
    <style type="text/css">
    	${demo.css}
    </style>
  </head>
  
  <body>
	<%@ include file="common/header.jsp" %>

	<div class="container-fluid">
		<%@ include file="common/nav.jsp" %>
	    
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  <h1 class="page-header">网站概况</h1>
		
		  <div class="row placeholders">
	        <div class="col-xs-6 col-sm-3 placeholder " id="userCount">
	          <img data-src="holder.js/100x100?theme=social&size=20&text=${infoMap.userCount }" class="img-responsive" alt="Generic placeholder thumbnail">
	          <h4>用户量</h4>
	<!--           <span class="text-muted">Something else</span> -->
	        </div>
	        <div class="col-xs-6 col-sm-3 placeholder" id="vistorCount">
	          <img data-src="holder.js/100x100?bg=EE403D&fg=fff&size=20&text=2000" class="img-responsive" alt="Generic placeholder thumbnail">
	<!--           <img data-src="custom.holder/200x200?theme=custom&auto=yes"  class="img-responsive" alt="Generic placeholder thumbnail"> -->
	          <h4>访问量</h4>
	        </div>
	        <div class="col-xs-6 col-sm-3 placeholder" id="packageCount">
	<!--           <img data-src="holder.js/200x200?theme=lava?text=1200" class="img-responsive" alt="Generic placeholder thumbnail"> -->
	          <img data-src="holder.js/100x100?theme=industrial&size=20&text=${infoMap.packageCount}" class="img-responsive" alt="Generic placeholder thumbnail">
	          <h4>预约套餐</h4>
	        </div>
	      </div>
	      
	      <h2 class="sub-header">访问量统计</h2>
          <div class="table-responsive">
			<div id="container" style="width: 95%;"></div>
		  </div>
	</div>
	
<%@ include file="common/footer.jsp" %>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="assets/js/vendor/holder.js"></script>
    <script src="assets/js/vendor/highcharts.js"></script>
    <script src="assets/js/vendor/exporting.js"></script>
	<script>
		$(function () {
		    $('#container').highcharts({
		        title: {
		            text: '月访问量统计',
		            x: -20 //center
		        },
		        subtitle: {
// 		            text: 'Source: WorldClimate.com',
// 		            x: -20
		        },
		        xAxis: {
		            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
		                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
		        },
		        yAxis: {
		            title: {
		                text: '次数'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#808080'
		            }]
		        },
		        tooltip: {
		            valueSuffix: ''
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: [{
		            name: '用户量',
		            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
		        }, {
		            name: '点击量',
		            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
		        },]
		    });
		});
	</script>

