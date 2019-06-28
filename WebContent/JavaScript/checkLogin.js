	function checkID(){
		if($('#idWarning').length>0)
			$('#idWarning').remove();
		if($('#idCorrect').length>0)
			$('#idCorrect').remove();
		var warning=$("<p>");
		warning.attr("id","idWarning");
		if($('#studentID').val()==="")
			warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"+" 学号不能为空");
		else {
			if($('#studentID').val().length!=13)
				warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"+" 学号应为13位数字组合");
		}
		if(warning.text()===""){
			var correct=$("<p>");
			correct.attr("id","idCorrect");
			correct.html("<span class='glyphicon glyphicon-ok-sign' aria-hidden='true'></span>"+" 学号格式正确")
			$(correct).appendTo('#ID');
			return true;
		}
		else{
			$(warning).appendTo('#ID');
			return false;
		}
	}
	
	function checkManage(){
		if($('#idWarning').length>0)
			$('#idWarning').remove();
		if($('#idCorrect').length>0)
			$('#idCorrect').remove();
		if($('#manWarning').length>0)
			$('#manWarning').remove();
		if($('#manCorrect').length>0)
			$('#manCorrect').remove();
		var warning=$("<p>");
		warning.attr("id","manWarning");
		if($('#studentID').val()==="")
			warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"+" 工号不能为空");
		if(warning.text()===""){
			var correct=$("<p>");
			correct.attr("id","manCorrect");
			correct.html("<span class='glyphicon glyphicon-ok-sign' aria-hidden='true'></span>"+" 工号格式正确")
			$(correct).appendTo('#ID');
			return true;
		}
		else{
			$(warning).appendTo('#ID');
			return false;
		}
	}
	
	function checkPwd(){
		if($('#pwdWarning').length>0)
			$('#pwdWarning').remove();
		if($('#pwdCorrect').length>0)
			$('#pwdCorrect').remove();
		var warning=$("<p>");
		warning.attr("id","pwdWarning");
		if($('#password').val()==="")
			warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"+" 密码不能为空");
		if(warning.text()===""){
			var correct=$("<p>");
			correct.attr("id","pwdCorrect");
			correct.html("<span class='glyphicon glyphicon-ok-sign' aria-hidden='true'></span>"+" 密码格式正确")
			$(correct).appendTo('#pwd');
			return true;
		}
		else{
			$(warning).appendTo('#pwd');
			return false;
		}
	}
	
	
	function check(){
		if(($('#manCorrect').length>0||$('#idCorrect').length>0)&&$('#password').val()!==""){
			return true;
		}
		else{
			$('#loginWarningModal').modal('show');
			return false;
		}
	}
	
	function change(obj){
		clear();
		if($(obj).val()=="管理"){
			$("#studentID").attr("placeholder","工号");
			$("#studentID").attr("onblur","checkManage()");
		}
		if($(obj).val()=="学生"){
			$("#studentID").attr("placeholder","学号");
			$("#studentID").attr("onblur","checkID()");
			$("#forget").append('<a href="forgetPassword.jsp">忘记密码</a>');
		}
	}
	
	function clear(){
		$("#studentID").val("");
		$("#password").val("");
		$("#forget").empty();
		if($('#idWarning').length>0)
			$('#idWarning').remove();
		if($('#idCorrect').length>0)
			$('#idCorrect').remove();
		if($('#manWarning').length>0)
			$('#manWarning').remove();
		if($('#manCorrect').length>0)
			$('#manCorrect').remove();
		if($('#pwdWarning').length>0)
			$('#pwdWarning').remove();
		if($('#pwdCorrect').length>0)
			$('#pwdCorrect').remove();

	}

	$(function(){
        if (window.history && window.history.pushState) {
            $(window).on('popstate', function () {
                window.history.pushState('forward', null, '');
                window.history.forward(1);
            });
        }
        window.history.pushState('forward', null, '');
        window.history.forward(1);
    })
	