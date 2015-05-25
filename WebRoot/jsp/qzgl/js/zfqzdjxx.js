function jxQuery()
{
	$("#xldquerylist").query("F","xldqueryform");
}

function openZfqzdjxxInfo(operType,bh)
{
	$.openDialogWindow({
		url : contextPath + "/qzgl/zfqzdj/toZfqzdjxxInfoPage.action",
		data : 
		{
			t : new Date().getTime(),
			operType : operType,
			bh:bh
		},
		width : 980,
		height :500,
		callback : function()
		{
			if ("detail" != operType)
			{
				jxQuery();
			}
		}
	});
}


function deleteInfoByBh(bh){
	if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/zfqzdj/deleteZfqzdjInfo.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除来访来信信息.");
					jxQuery();
				}
			}
		});
	}
}
function czRowCallback(trObj, rowDataObj)
{
	var result = "";
	result += "<a href=\"javascript:openZfqzdjxxInfo('update','" + rowDataObj["bh"] + "')\">修改</a>&nbsp;";
	result += "<a href=\"javascript:deleteInfoByBh('" + rowDataObj["bh"] + "')\">删除</a>&nbsp;";
	result += "<a href=\"javascript:openZfqzdjxxInfo('detail','" + rowDataObj["bh"] + "')\">详情</a>";
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
				alert("走访群众登记信息保存成功.");
				$.closeWindow();
			},
			error : function()
			{
				alert("信息保存失败,请重新再试.");
			}
		});
	}
}


/**批量删除走访单位登记信息**/
function batchDeleteZfqzdjInfo(){
	var selectZfQz = $("#xldquerylist").getSelected();
	var delParam = "";
	if(selectZfQz.length < 1){
		alert("请选择需要删除的数据!");
	}else{
		var verify = confirm("确认删除数据?");
		if(verify){
			$.each(selectZfQz,function(index,ZfqzInfo){
				if(index < selectZfQz.length - 1){
					delParam += ZfqzInfo.bh + ",";
				}else{
					delParam += ZfqzInfo.bh;
				}
			});
			$.ajax({
				type : "post",
				url : contextPath + "/qzgl/zfqzdj/batchDeleteZfqzdjInfo.action",
				data : {'ZfqzInfo.bh' : delParam},
				success : function(result){
					jxQuery();
					eval("var tip = " + result);
					alert(tip);
				}
			});
		}
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
