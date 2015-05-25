function queryXldList()
{
	$("#xldquerylist").query("F","xldqueryform");
}

function rowClickEvent(trObj,rowDataObj)
{
	$.setResultValue(rowDataObj);
	$.closeWindow();
}

function resultSelectedRowData()
{
	var selectes = $("#xldquerylist").getSelected();
	if (selectes.length <=0)
	{
		alert("请选择巡逻队.");
	}
	else
	{
		$.setResultValue(selectes[0]);
		$.closeWindow();
	}
}