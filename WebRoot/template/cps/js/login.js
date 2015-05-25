$(function(){
	$("#loginbtn").bind("click",function(){
		login();
	});
	
	$(window).keydown(function(event){
	  if(event.keyCode == 13) 
	  {
	   		login();
	  }
	});
});

function login()
{
	var username = $("#username").val();
	var password = $("#password").val();
	if (!$.isBlank(username) && !$.isBlank(password))
	{
		$("#loginform").ajaxSubmit({
			url : contextPath + "/cpsLogin.action",
			type : "post",
			dataType : "json",
			success : function(result)
			{
				if (result != null)
				{
					$.openWindow({
						name : "main",
						url : contextPath + "/index.action"
					})
				}
			}
		});
	}
	else
	{
		alert("用户名密码不能为空.");
	}
}