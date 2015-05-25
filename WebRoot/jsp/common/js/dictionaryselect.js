function queryList(){
	$("#dictionarySelectList").query("F","dictionarySelectForm");
}

function dictionarycheck() {
	var datas = $("#dictionarySelectList").getSelected();
	var selected = "";		
	if (datas && datas.length > 0)
	{
	//	if (datas && datas.length > 1)
	//	{
	//		alert('只能选择一条数据。');
	//		return false;
	//	}
		var arrDm = new Array();
		var arrName= new Array();
		
		for(var i=0;i<datas.length;i++){
			arrDm.push(datas[i].dm);
			arrName.push(datas[i].mc);
		}
		var orgInfo = {
			orgDm : arrDm,
			orgName : arrName
		};
		window.returnValue = orgInfo;
		window.close(); 
	}
	else
	{
		alert("温馨提示：您尚未选中数据项！");
		return false;
	}
}

function singleSelect() {
			var datas = $("#dictionarySelectList").getSelected();
			var selected = "";
		
			if (datas && datas.length > 0)
			{
				if (datas && datas.length > 1)
				{
					alert('只能选择一条数据。');
					return false;
				}
				var orgInfo = {
					orgDm : datas[0].dm,
					orgName : datas[0].mc
				}
				window.returnValue = orgInfo;
				window.close(); 
			}
			else
			{
				alert("温馨提示：您尚未选中数据项！");
				return false;
			}
		}

function adddictionary(){
	$.openDialogWindow({
		url : contextPath + "/dic/selectdic/toZdyInsertPage.action",
		data : {t : new Date().getTime()},
		height : 200,
		width : 500,
		scroll : false,
		callback : function()
		{
			
		}
	});
}

function saveZdyDictionary(){
	var zdmc=$("#select").find("option:selected").text();
	var mc=$("#mc").val();
	queryList();
	if($("#mc").val().length<1){
		alert("名称为空;请输入名称");
		return false;
	}
	if(confirm("你确定要添加自定义数据吗?列表中是否有值?")){
		if ($.validateform("dictionarySelectForm")){	
			$.ajax({
				type:"post",
				url:contextPath+"/dic/selectdic/isExistMc.action",
				data:{"bean.mc":mc,t:new Date().getTime()},
				dataType:"json",
				success:function(msg){
					if(msg){
						alert("名称已存在，请查询！")
					}else{
						$("#dictionarySelectForm").ajaxSubmit({
							url : contextPath + "/dic/selectdic/saveZdyDctionary.action",
							data:{"bean.zdmc":zdmc},
							type : "post",
							dataType : "json",
							success :function(msg)
							{
								if (msg)
								{	
									alert("数据保存成功");	
									queryList();
								}
								else
								{
									alert("数据保存失败.");
								}
							}
						});
					
					}
				}
			});
			
		}
	}
}