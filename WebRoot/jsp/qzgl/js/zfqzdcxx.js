function jxQuery()
{
	$("#xldquerylist").query("F","xldqueryform");
}
function openZfqzdcxxInfo(operType,bh)
{
	$.openDialogWindow({
		url : contextPath + "/qzgl/zfqzdc/toZfqzdcxxInfoPage.action",
		data : 
		{
			t : new Date().getTime(),
			operType : operType,
			bh:bh
		},
		width : 980,
		height :600,
		callback : function()
		{
			if ("detail" != operType)
			{
				jxQuery();
			}
		}
	});
}



function czRowCallback(trObj, rowDataObj)
{
	var result = "";
	result += "<a href=\"javascript:openZfqzdcxxInfo('update','" + rowDataObj["bh"] + "')\">调查</a>&nbsp;";
	result += "<a href=\"javascript:openZfqzdcxxInfo('detail','" + rowDataObj["bh"] + "')\">详情</a>";
	return result;
}

function submitSave()
{
	if ($.validateform("infoform"))
	{
		$("#infoform").ajaxSubmit({
			type : "post",
			success : function()
			{
				alert("走访单位调查信息保存成功.");
				$.closeWindow();
			},
			error : function()
			{
				alert("信息保存失败,请重新再试.");
			}
		});
	}
}
function clearForm()
{
	var form = document.forms[0].elements;
        for(var i=0;i<form.length;i++){
            if(form[i].type == 'select-one') {
                form[i].value = 0;
            }else if(form[i].type == 'text') {
                form[i].value = '';
            }
        }
}
