function czRowCallback(trObj,rowdataobj)
{
	var html = "";
	html += "<a href=\"javascript:openCzrkInfoWin('update','" + rowdataobj["rybh"] + "')\">修改</a>&nbsp;";
	html += "<a href=\"javascript:openCzrkInfoWin('detail','" + rowdataobj["rybh"] + "')\">详情</a>";
	
	return html;
}

function jxQuery()
{
	$("#czrkQueryList").query("F","czrkQueryForm");
}

function openCzrkInfoWin(operType,rybh)
{
	$.openDialogWindow({
		url : contextPath + "/lsgl/czrk/queryCzrkInfoByRybh.action",
		data : {operType : operType,rybh : rybh,t:new Date().getTime()},
		width : 1080,
		height : 800,
		callback : function()
		{
			$(operType != "detail")
			{
				jxQuery();
			}
		}
	})
}

function getCzrkxxBySfzh(obj)
{
	var sfzh = $(obj).val();
	if(sfzh) {
		queryCzrkBean(sfzh, function(czrk) {
			if(czrk) {
				
			}
		});
	}
}

/**
 * 打开行政区划树
 */
function selectXzqh(hiddenfield, showfield, flag)
{
	openXzqhTree({
		rootOrgCode : "430000",
  		mutilSelect : false,
   		nodeSelectedType : "ps",
   		nodeNotSelectedType : "ps"
	},function(xzqhBean){
		if(xzqhBean){
			$("#"+hiddenfield).val(xzqhBean.id);
			$("#"+showfield).val(xzqhBean.name);
			if(flag == 1) {
				doubleSelectPcs(xzqhBean.id,'pcsselect');
			}
		}
	});
}

function doubleJswAndSqxx(pcsdm)
{
	doubleSelectJWS(pcsdm,"jwsselect");
	doubleSelectSqxxByPcsdm(pcsdm,"sqdmselect");
}

function openSelectSqmjSelectWin() {
	var dm = $("#sqdmselect").val();
	if(!dm) {
		dm = $("#jwsselect").val();
	}
	if(!dm) {
		dm = $("#pcsselect").val();
	}
	 
	if(!dm)
	{
		alert("请先选择派出所.");
		return;
	}
	openDwRySelect({
		rootOrgCode : dm,
		mutilSelect : true
	},
	function(userbeans)
	{
		if (userbeans != null && userbeans.length > 0)
		{
			var sqmjxms = [];
			var mjjhs = [];
			
			$.each(userbeans,function(i, userbean){
				sqmjxms.push(userbean["realname"]);
				mjjhs.push(userbean["username"]);
			});
			if (sqmjxms.length > 0)
			{
				$("#sqmjxm").val(sqmjxms.join(","));
			}
			if (mjjhs.length > 0)
			{
				$("#zrqmjjh").val(lxdhs.join(","));
			}
		}
	});
}

function submitSave()
{
	if ($.validateform("czrkSaveForm"))
	{
		$("#czrkSaveForm").ajaxSubmit({
			dataType : "json",
			type : "post",
			success : function(result)
			{
				if (result)
				{
					alert("保存信息成功,将关闭窗口.");
					$.closeWindow();
					$("#czrkQueryList").query("F","czrkQueryForm");
				}
				else
				{
					alert("保存失败，请重试.");
				}
			}
		})
	}
}