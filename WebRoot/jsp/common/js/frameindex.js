function showOrHideLeftfameset()
{
		var cols = $("#mainfameset").attr("cols");
		if (cols == "170,*")
		{
			$("#mainfameset").attr("cols","0,*");
		}
		else
		{
			$("#mainfameset").attr("cols","170,*");
		}
		
}