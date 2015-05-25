function queryList(){
	$("#commonDzjlxList").query("F","jlxSelectForm");
}
function clearform(){
	$("#jlxSelectForm").find("tr[id^=clear_row]").each(function(i){
		$(this).find(":input").val("");
	});
}

function singleSelect() {
			var datas = $("#commonDzjlxList").getSelected();
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


function rowdblClickReturn(trObj, rowdata)
{
 	$.setResultValue(rowdata);
	$.closeWindow();
}

function rowDblClickCallback(trObj, rowdata)
{
	$.setResultValue(rowdata);
	$.closeWindow();
}


function saveZdyJlxInfo(mc){
	if (!$.isBlank(mc))
	{
		$("#jlxSelectForm").ajaxSubmit({
			url : contextPath + "/cps/dzjlx/insertCommonDzJlxInfo.action",
			type : "post",
			dataType : "json",
			success :function(msg)
			{
				if(msg){
					alert("保存成功！")
					window.close();
					queryList();
				}else{
					alert("操作失败，请重试!");
				}
			}
		});
	}
}

function isExistJlxMc(){
	var mc=$("#mc").val();
	var ssxzqh=$("#ssxzqh").val();
	if ($.validateform("jlxSelectForm"))
	{
	
		var id =$("#id").val();
		if(id==null || id =="")
		{
			$.ajax({
				url : contextPath + "/cps/dzjlx/isExistJlxMc.action",
				type : "post",
				dataType : "json",
				data:
				{
					"jlxBean.mc":mc,
					"jlxBean.ssxzqh":ssxzqh
				},
				success : function(msg)
				{
					if(msg)
					{
						alert("同一个行政区划中只能有一条唯一的街路巷，请勿重复添加");
						return ;
					}else{
						saveZdyJlxInfo(mc);
					}
				}		
			});
		}
		else
		{
			saveZdyJlxInfo(mc);
		}
		
	}
}

/**
 * 打开行政区划树
 */
function selectXzqh(hiddenfield, showfield,rootOrgCode)
{
	openXzqhTree({
		rootOrgCode : rootOrgCode,
  		mutilSelect : false,
   		nodeSelectedType : "ps",
   		nodeNotSelectedType : "ps"
	},function(xzqhBean){
		if(xzqhBean){
			$("#"+hiddenfield).val(xzqhBean.id);
			$("#"+showfield).val(xzqhBean.name);
		}
	});
}
function openJlxWin(operType,id){
	$.openDialogWindow({
		url : contextPath + "/cps/dzjlx/openJlxWin.action",
		width:1000,
		height:300,
		scroll:false,
		data:{
			"operType":operType,
			"jlxBean.id":id,
			t:new Date().getTime()
		},
		
		callback:function(){
			if("detail" != operType){
				queryList();
			}
		}
	})
}

function deteleJlx(id){
	if(confirm("确定要注销该条数据吗?")){
		$.ajax({
			url : contextPath + "/cps/dzjlx/deleteJlx.action",
			dataType:"json",
			type:"post",
			data:{
				"jlxBean.id":id
			},
			success:function(msg){
				if(msg){
					alert("注销成功！");
					queryList();
				}else{
					alert("操作失败！");
				}
			}
		})
	}
}

