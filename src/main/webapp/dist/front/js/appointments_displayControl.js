/*用户界面JS*/
$(function(){
	get_hospital();
	$('#btn_logout').click(function() {
		var user=$.cookie('cookie_login');
		$.cookie('cookie_login', "");
		location.href="login.html";
		//setTimeout(function(){location.href = "login.html";},1000);
	});
	
	//page1
	function check_page1() {
		//获取到hospital的id(来自服务器),即html中的value.
		var tmp = $('input:radio[name=hospital]:checked').val();
		return tmp;
	}
	$('#btn_page1_next').click(function() {
		var tmp = check_page1($('#div_hospital'));
		if(tmp == undefined) {
			alert("请选择一个选项！");
			return ;
		}
		$.cookie('cookie_hospitalid', tmp);
		//alert($.cookie('cookie_hospitalid'));
		$("#rightarea div").hide();
		$("#page2").show();
		$("#page2 div").show();
		$("#leftarea li").removeClass("step-active");
		$('#li_xztc').addClass("step-active");
		get_plan();
	});
	
	//page2
	$('#btn_page2_pre').click(function() {
		$("#rightarea div").hide();
		$('#page1').show();
		$('#page1 div').show();
		$("#leftarea li").removeClass("step-active");
		$('#li_tjjg').addClass("step-active");
		//get_hospital();
	});
	function check_page2() {
		var tmp = $('input:radio[name=plan]:checked').val();
		return tmp;
	}
	$('#btn_page2_next').click(function() {
		var tmp = check_page2();
		if(tmp == undefined) {
			alert("请选择一个选项！");
			return ;
		}
		$.cookie('cookie_planid', tmp);
		$("#rightarea div").hide();
		$('#page3').show();
		$('#page3 div').show();
		$("#leftarea li").removeClass("step-active");
		$('#li_kjx').addClass("step-active");
		get_otherProject();
	});
	//page3
	$('#btn_page3_pre').click(function() {
		$("#rightarea div").hide();
		$('#page2').show();
		$('#page2 div').show();
		$("#leftarea li").removeClass("step-active");
		$('#li_xztc').addClass("step-active");
		//get_plan();
	});
	function check_page3() {
		var arr = new Array();
		for(var i = 0;i < num_otherProject; i++) {
			if($('#otherProject'+i).prop("checked")) {
				arr.push(parseInt($('#otherProject'+i).val()));
			}
		}
		return arr;
	}
	$("#btn_page3_next").click(function(){
		arr_otherProject = check_page3();

		$("#rightarea div").hide();
		$('#page4').show();
		$('#page4 div').show();
		$("#leftarea li").removeClass("step-active");
		$('#li_yysj').addClass("step-active");
	});
	$("#btn_page4_pre").click(function() {
		$("#rightarea div").hide();
		$('#page3').show();
		$('#page3 div').show();
		$("#leftarea li").removeClass("step-active");
		$('#li_kjx').addClass("step-active");
	});
	function check_page4() {
		return $('#input_date').val();
	}
	$("#btn_page4_next").click(function() {
		var tmp = check_page4();
		if(tmp == "") {
			alert("请选择一个日期！");
			return;
		}
		$.cookie("cookie_date", tmp);
		$("#rightarea div").hide();
		$('#page5').show();
		$('#page5 div').show();
		$("#leftarea li").removeClass("step-active");
		$('#li_wcyy').addClass("step-active");
		get_sumbit();
	});
	$("#btn_page5_pre").click(function() {
		$("#rightarea div").hide();
		$('#page4').show();
		$('#page4 div').show();
		$("#leftarea li").removeClass("step-active");
		$('#li_yysj').addClass("step-active");
	});
	function check_page5() {
		return $('input:radio[name=payType]:checked').val();
	}
	$("#btn_submit").click(function() {
		var tmp = check_page5();
		if(tmp == undefined) {
			alert("请选择支付方式");
			return ;
		}
		else{
			payType = parseInt(tmp);
		}
		submitOrder();
	});
});
