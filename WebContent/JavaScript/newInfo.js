$("#new").click(function(){
	$('#newinfo').modal('show');
});
function showSearch(){$("#content").css("display","none");$("#search").css("display","block");}
function showInfo(){$("#content").css("display","block");$("#search").css("display","none");}

function deleteNotification(){
	this.previousSibling.previousSibling.submit();
}

