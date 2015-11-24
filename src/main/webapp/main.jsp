<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>预约流程</title>
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript" src="../js/date.js"></script>
<script type="text/javascript">
function next1(){
	document.getElementById("d1").style.display = "none";
	document.getElementById("d2").style.display = "block";
	document.getElementById("li1").style.backgroundColor ="#FFF";
	document.getElementById("li1").style.color ="#000";
	document.getElementById("li2").style.backgroundColor ="#FF4200";
	document.getElementById("li2").style.color ="#FFF";
}
function next2(){
	document.getElementById("d2").style.display = "none";
	document.getElementById("d3").style.display = "block";
	document.getElementById("li2").style.backgroundColor ="#FFF";
	document.getElementById("li2").style.color ="#000";
	document.getElementById("li3").style.backgroundColor ="#FF4200";
	document.getElementById("li3").style.color ="#FFF";
}
function next3(){
	document.getElementById("d3").style.display = "none";
	document.getElementById("d4").style.display = "block";
	document.getElementById("li3").style.backgroundColor ="#FFF";
	document.getElementById("li3").style.color ="#000";
	document.getElementById("li4").style.backgroundColor ="#FF4200";
	document.getElementById("li4").style.color ="#FFF";
}
function next4(){
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
</head>
<body>
 <div class="global">
  <hr />
  <div style="height: 70px;">
   <div style="float: left;">
    <a href="../jsp/main.jsp"><img src="../images/logo.jpg"
     alt="logo" /> </a>
   </div>
   <div style="float: right">
    <div id="div_notlogin">
     <a href="../jsp/login.jsp">登录</a>
     <a href="../jsp/register.jsp" >注册</a>
    </div>
    
    <div id="div_haslogin" style="float:right;display:none;" >
     <p>Welcome! <span id="span_username" style="color:red"></span></p>
     <button id="btn_logout" type="button" class="btn btn-default" onclick="">登出</button>
    </div>
   </div>
  </div>


  <nav class="navbar navbar-default tj-nav">
   <a href="../jsp/main.jsp">
    <button id="yytj" type="button"
     class="btn btn-info navbar-btnv tj-nav-btn" style="height:48px;background:rgba(255, 202, 0, 0.9);color:#FFF">预约体检</button>
   </a> <a href="../jsp/admin.jsp">
    <button id="htgl" type="button"
     class="btn btn-info navbar-btnv tj-nav-btn" style="height:48px;background:rgba(255, 202, 0, 0.9);color:#FFF;display:none">后台管理</button>
   </a>
  </nav>

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
    <strong>1.可预约机构：</strong> <br />
    <div id="div_hospital" style="width:400px;"> </div>
    <div style="border: 0px solid; text-align: right;">
     <button id="page1_next" type="button" class="btn btn-default" onclick="next1()">下一步</button>
    </div>
    </div>

    

   <div id="d2" style="display: none;">
    <strong>2.套餐选择：</strong> <br /> 
    <div id="div_plan" style="width:400px; "> </div>
    <div style="border: 0px solid;">
     <div style="text-align: right;">
      <button id="pre2" type="button" class="btn btn-default" onclick="pre2()">上一步</button>
      <button id="next2" type="button" class="btn btn-default" onclick="next2()">下一步</button>
     </div>
    </div>
   </div>


   <div id="d3"style="display: none;">
   <strong>3.可加项选择：</strong>
    <br />
    <div id="div_otherProject">
    </div>
    <div style="border: 0px solid;">
     <div style="text-align: right;">
      <button id="pre3" type="button" class="btn btn-default" onclick="pre3();">上一步</button>
      <button id="next3" type="button" class="btn btn-default" onclick="next3()">下一步</button>
     </div>
    </div>
   </div>


   <div id="d4" style="display: none;">
    <strong>4.选择预约日期：</strong> <br />
    <input type="text" name="otime" placeholder="2015-12-1" onfocus="HS_setDate(this)"  /> <br />
    <div style="border: 0px solid;">
     <div style="text-align: right;">
      <button id="pre4" type="button" class="btn btn-default" onclick="pre4()">上一步</button>
      <button id="next4" type="button" class="btn btn-default" onclick="next4()">下一步</button>
     </div>
    </div>
   </div>


   <div id="d5" style="display: none;">
    <strong>5.提交完成预约</strong>
    <div id="div_sumbit"></div>
    <div style="bordr: 1px solid">
      <input type="radio" id="alipay" name="payType" value="1">
      <label for="alipay">支付宝支付</label>
      <input type="radio" id="wechatpay" name="payType" value="2">
      <label for="webbank">网银支付</label>
    </div>
    <div style="border: 0px solid;" >
     <div style="text-align: right;">
      <button id="pre5" type="button" class="btn btn-default" onclick="pre5()">上一步</button>
      <button id="btn_submit" type="button" class="btn btn-primary"  style="background:#FF4200;color:#FFF">完成</button>
     </div>
    </div>
    
   </div>
   </div>
  </div>

 </div>
</body>
</html>