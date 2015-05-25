function jxQuery()
{
	$("#xldquerylist").query("F","xldqueryform");
}

function openZfdwdjxxInfo(operType,bh)
{
	$.openDialogWindow({
		url : contextPath + "/qzgl/zfdwdj/toZfdwdjxxInfoPage.action",
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
			url : contextPath + "/qzgl/zfdwdj/deleteZfdwdjInfo.action",
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


/**批量删除走访单位登记信息**/
function batchDeleteZfdwdjInfo(){
	var selectZfDw = $("#xldquerylist").getSelected();
	var delParam = "";
	if(selectZfDw.length < 1){
		alert("请选择需要删除的数据!");
	}else{
		var verify = confirm("确认删除数据?");
		if(verify){
			$.each(selectZfDw,function(index,ZfdwInfo){
				if(index < selectZfDw.length - 1){
					delParam += ZfdwInfo.bh + ",";
				}else{
					delParam += ZfdwInfo.bh;
				}
			});
			$.ajax({
				type : "post",
				url : contextPath + "/qzgl/zfdwdj/batchDeleteZfdwdjInfo.action",
				data : {'ZfdwInfo.bh' : delParam},
				success : function(result){
					jxQuery();
					eval("var tip = " + result);
					alert(tip);
				}
			});
		}
	}
}


function czRowCallback(trObj, rowDataObj)
{
	var result = "";
	result += "<a href=\"javascript:openZfdwdjxxInfo('update','" + rowDataObj["bh"] + "')\">修改</a>&nbsp;";
	result += "<a href=\"javascript:deleteInfoByBh('" + rowDataObj["bh"] + "')\">删除</a>&nbsp;";
	result += "<a href=\"javascript:openZfdwdjxxInfo('detail','" + rowDataObj["bh"] + "')\">详情</a>";
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
				alert("走访单位登记信息保存成功.");
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

