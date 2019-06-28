		function isNull(){
			if($(this).val()===""){
				var warning=$("<span>");
				warning.attr("id","nullwarning");
				warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true''></span>"+" 密码不能为空");
				if(this.id=="oldPwd"){
					$("#old #nullwarning").remove();
					$(warning).appendTo("#old");
				}
				if(this.id=="newPwd"){
					$("#newPwd #nullwarning").remove();
					$(warning).appendTo("#newPwd");
				}
				if(this.id=="renewPwd"){
					$("#renewPwd #nullwarning").remove();
					$(warning).appendTo("#renewPwd");
				}
				return false;
			}
			else{
				$("#nullwarning").remove();
				return true;
			}
		}
		function isCorrect(){
			if(this.id=="oldPwd"){
				if($(this).val()!=password){
					$("#pwdCorrect").remove();
					$("#pwdIncorrect").remove();
					var warning=$("<span>");
					warning.attr("id","pwdIncorrect");
					warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true''></span>"+" 密码错误");
					$(warning).appendTo("#old");
					return false;
				}
				else{
					$("#pwdIncorrect").remove();
					$("#pwdCorrect").remove();
					var correct=$("<span>");
					correct.attr("id","pwdCorrect");
					correct.html("<span class='glyphicon glyphicon-ok-sign' aria-hidden='true'></span>"+" 密码正确")
					$(correct).appendTo('#old');
					return true;
				}
			}
		}
		function isSame(){
			if($(this).val()!=$("input[id='newPwd']").val()){
				$("#pwdSame").remove();
				$("#pwdNotsame").remove();
				var warning=$("<span>");
				warning.attr("id","pwdNotsame");
				warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true''></span>"+" 密码不一致");
				$(warning).appendTo("#renewPwd");
				return false;
			}
			else{
				$("#pwdSame").remove();
				$("#pwdNotsame").remove();
				var correct=$("<span>");
				correct.attr("id","pwdSame");
				correct.html("<span class='glyphicon glyphicon-ok-sign' aria-hidden='true'></span>"+" 密码一致")
				$(correct).appendTo('#renewPwd');
				return true;
			}
		}
		function isRepeat(){
			if($(this).val()==$("input[id='oldPwd']").val()){
				$("#pwdRepeat").remove();
				$("#pwdNotRepeat").remove();
				var warning=$("<span>");
				warning.attr("id","pwdRepeat");
				warning.html("<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true''></span>"+" 新密码与旧密码相同");
				$(warning).appendTo("#newPwd");
				return false;
			}
			else{
				$("#pwdRepeat").remove();
				$("#pwdNotRepeat").remove();
				var correct=$("<span>");
				correct.attr("id","pwdNotRepeat");
				correct.html("<span class='glyphicon glyphicon-ok-sign' aria-hidden='true'></span>"+" 密码可用")
				$(correct).appendTo('#newPwd');
				return true;
			}
		}
		
		$("#reset").click(function(){
				$("input").val("");
				$("#pwdRepeat").remove();
				$("#pwdNotRepeat").remove();
				$("#pwdSame").remove();
				$("#pwdNotsame").remove();
				$("#pwdCorrect").remove();
				$("#pwdIncorrect").remove();
				$("#nullwarning").remove();
		})
		function check(){
			if($("#pwdSame").length>0&&$("#pwdNotRepeat").length>0&&$("#pwdCorrect").length>0)
				$("#submit").removeAttr("disabled data-toggle title");
		}
		