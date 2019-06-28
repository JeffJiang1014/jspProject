function show1(){
	$("#precise").removeClass("active");
	$("#general").addClass("active");
	$("#condition").css("display","block");
	$("#preciseCondition").css("display","none");
}
function show2(){
	$("#general").removeClass("active");
	$("#precise").addClass("active");
	$("#condition").css("display","none");
	$("#preciseCondition").css("display","block");
}

function deleteInfo(){
	this.parentNode.lastChild.previousSibling.submit();
}