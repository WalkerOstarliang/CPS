function clearQuery(){
	$("#lxsx").val("");
	$("#lfsj_from").val("");
	$("#lfsj_to").val("");
	$("#lfzt").val("");
	jxquery()
}

function clearForm(){
	$("#cljgms").val("");
	$("#jsdwdm").val("");
}

function jxquery(){
	$("#lxclquerylist").query("F","lxclqueryform");
}

function selectDw(orgcode, hiddenfield, showfield){
	openDwSelect({
		rootOrgCode : orgcode.substr(0,6)+"000000",
  		mutilSelect : false,
   		nodeSelectedType : "ps",
   		nodeNotSelectedType : "ps"
	},function(orgbeans){
		if(orgbeans){
			$("#"+hiddenfield).val(orgbeans.id);
			$("#"+showfield).val(orgbeans.name);
		}
	});
}

function openInfoWin(operType,bh)
{	
	$.openDialogWindow({
		url : contextPath + "/qzgl/lxclgl/toClOrZf.action",
		data : {operType : operType,bh : bh,t:new Date().getTime()},
		width : 980,
		height : 450,
		callback : function()
		{
			if($(operType != "detail"))
			{
				clearQuery();
				jxquery();
			}
		}
	})
}
function selectDwry(orgcode,hiddenfield, showfield,mc)
{
	if(orgcode){
			orgcode = "430000000000";
	}
	openDwRySelect({
		rootOrgCode : orgcode,
		mutilSelect : false
	},
	function(userbean){
		if (userbean){
			$("#"+hiddenfield).val(userbean["orgcode"]);
			$("#"+mc).val(userbean["realname"]);
			$("#"+showfield).val(userbean["orgname"]);
		}
	});
}
function chuli(){
	if($("#operType").val()=="chuli"){
		$("#czlx").val("3");
	}
	else if($("#operType").val()=="zhuanfa"){
		$("#czlx").val("2");
	}
	if ($.validateform("lxclqueryform"))
	{
		$("#lxclqueryform").ajaxSubmit({
			type : "post",
			success : function()
			{
				if($("#operType").val()=="chuli"){
					alert("登记成功！");
					window.close();
				}
				else if($("#operType").val()=="zhuanfa"){
					alert("转发成功！");
					window.close();
				}
			}
		})
	}
}

