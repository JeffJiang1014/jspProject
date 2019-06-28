function ch(){
	$(".progress #caseVerte").css({
		"-webkit-animation-name": "caseVerte1",
		"-webkit-animation-play-state":"running",
		"width":"50%"
	});
	$("#point #first").css("color","white");
}
function back(){
	$(".progress #caseVerte").css({
		"-webkit-animation-name": "caseVerteBack",
		"-webkit-animation-play-state":"running",
		"width":"0%"
	});
	$("#point #first").css("color","black");
}
function complete(){
	$(".progress #caseVerte").css({
		"-webkit-animation-name": "caseVerte2",
		"-webkit-animation-play-state":"running",
		"width":"100%"
	});
	$("#point #second").css("color","white");
	$('.progress #caseVerte').on('webkitAnimationEnd',function(){
		$("#point").empty();
		$(".progress #caseVerte").attr("class","progress-bar progress-bar-success");
		$(".progress #caseVerte").html('<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span> 密码重置成功');
	});
}

$("#back").click(function(){
	window.location.href="Login.jsp";
})

$('#next').click(function(){
	$("#div1").css("display","none");
	$("#div2").css("display","block");
	$("#div2 input").val("");
	$("#pwdSame").remove();
	$("#pwdNotsame").remove();
	$("#pwdAvailable").remove();
	$("#complete").attr("disabled","disabled");
	$("#complete").attr("data-toggle","tooltip");
	$("#complete").attr("title","完成输入后才能提交");
	ch();
})

$('#last').click(function(){
	$("#div1").css("display","block");
	$("#div2").css("display","none");
	back();
})

$("#complete").click(function(){
	complete();
})

function isNull(){
	if($(this).val()===""){
		var warning=$("<span>");
		warning.attr("id","nullwarning");
		if(this.name=="studentID"){
			warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true''></span>"+" 学号不能为空");
			$("#studentID #nullwarning").remove();
			$(warning).appendTo("#studentID");
		}
		if(this.name=="name"){
			warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true''></span>"+" 姓名不能为空");
			$("#name #nullwarning").remove();
			$(warning).appendTo("#name");
		}
		if(this.name=="id"){
			warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true''></span>"+" 身份证号不能为空");
			$("#id #nullwarning").remove();
			$(warning).appendTo("#id");
		}
		if(this.name=="newPassword"){
			warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true''></span>"+" 密码不能为空");
			$("#password #nullwarning").remove();
			$(warning).appendTo("#password");
		}
		if(this.name=="renewPassword"){
			warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true''></span>"+" 密码不能为空");
			$("#repassword #nullwarning").remove();
			$(warning).appendTo("#repassword");
		}
		return false;
	}
	else{
		$("#nullwarning").remove();
		return true;
	}
}

function checkInfo(){
	if($("input[name='studentID']").val()!=""&&$("input[name='name']").val()!=""&&$("input[name='id']").val()!="")
		$("#next").removeAttr("disabled data-toggle title");
}

function checkPwd(){
	if(this.name=="newPassword"){
		$("#pwdAvailable").remove();
		var correct=$("<span>");
		correct.attr("id","pwdAvailable");
		correct.html("<span class='glyphicon glyphicon-ok-sign' aria-hidden='true'></span>"+" 密码可用")
		$(correct).appendTo('#password');
	}
	if(this.name=="renewPassword"){
		if($(this).val()!=$("input[name='newPassword']").val()){
			$("#pwdSame").remove();
			$("#pwdNotsame").remove();
			var warning=$("<span>");
			warning.attr("id","pwdNotsame");
			warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true''></span>"+" 密码不一致");
			$(warning).appendTo("#repassword");
			return false;
		}
		else{
			$("#pwdSame").remove();
			$("#pwdNotsame").remove();
			var correct=$("<span>");
			correct.attr("id","pwdSame");
			correct.html("<span class='glyphicon glyphicon-ok-sign' aria-hidden='true'></span>"+" 密码一致")
			$(correct).appendTo('#repassword');
			return true;
		}
	}
}

function check(){
	if($("#pwdSame").length>0&&$("#pwdAvailable").length>0)
		$("#complete").removeAttr("disabled data-toggle title");
}