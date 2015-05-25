function returnSelectedJwq()
{
	var jwqvalue = $("#jwsselect").val();
	if (!$.isBlank(jwqvalue))
	{
		var text = $("#jwsselect").find("option:selected").text();
		var obj = new Object();
		obj.dm = jwqvalue;
		obj.mc = text;
		$.setResultValue(obj);
		$.closeWindow();
	}
	else
	{
		var pcsdm = $("#pcsdm").val();
		if (!$.isBlank(pcsdm))
		{
			var size = $("#jwsselect").find("option").length;
			if (size > 0 && $.isBlank($("#jwsselect").val()))
			{
				alert("请选择警务区/室.");
			}
			else if (size > 0 && !$.isBlank($("#jwsselect").val()))
			{
				var jwqdm = $("#jwsselect").val();
				var jwqmc = $("#jwsselect").find("option:selected").text();
				var obj = new Object();
				obj.dm = jwqdm;
				obj.mc = jwqmc;
				$.setResultValue(obj);
				$.closeWindow();
			}
			else
			{
				var pcsmc = $("#pcsdm").find("option:selected").text();
				var obj = new Object();
				obj.dm = pcsdm;
				obj.mc = pcsmc;
				$.setResultValue(obj);
				$.closeWindow();
			}
		}
		else
		{
			alert("请选择警务区/室,如果没有则必须选择到派出所.")
		}
	}
}