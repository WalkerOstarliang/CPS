function submitSave(clo){
	if ($.validateform("lxlfform"))
	{
		$("#lxlfform").ajaxSubmit({
			type : "post",
			success : function()
			{
				if($("#operType").val()=="add"){
					alert("新增成功！");
					window.close();
				}
				else if($("#operType").val()=="update"){
					alert("修改成功！");
					if(clo=="true"){
						window.close(); 
					}
				}
			}
		});
	}
}

function clearForm()
{
	$("#lfzt").val("");
	$("#lxsx").val("");
	$("#lflx").val("");
	$("#lflxrsfzh").val("");
	$("#lflxrxm").val("");
	$("#lflxrlxdh").val("");
	$("#lflxrjtzz").val("");
	$("#sjjdmjxm").val("");
	$("#sjjdmjdw").val("");
	$("#lfsj").val("");
	$("#lfnr").val("");
}
function setLflxryxx(ryxxBean)
{
	if (ryxxBean)
	{
		$("#lflxrxm").val(ryxxBean["xm"]);
		$("#lflxrjtzz").val(ryxxBean["zzxz"]);
	}
}

function selectDw(orgcode, hiddenfield, showfield){
	var tmp=$("#"+hiddenfield).val();
	openDwSelect({
		rootOrgCode : orgcode,
  		mutilSelect : false,
   		nodeSelectedType : "ps",
   		nodeNotSelectedType : "ps"
	},function(orgbeans){
		if(orgbeans){
			$("#"+hiddenfield).val(orgbeans.id);
			$("#"+showfield).val(orgbeans.name);
		}
	});
	if($("#jsdwdm").val()!=tmp){
		$("#zf").val("zhuanfa");
		$("#zhuanfa").show();
	}
	else{
		$("#zhuanfa").hide();
		$("#zf").val("--");
	}
}
function selectDwry(orgcode, orgid, orgname)
{
	if(orgcode){
			orgcode = orgcode;
	}
	openDwRySelect({
		rootOrgCode : orgcode,
		mutilSelect : false
	},
	function(userbean){
		if (userbean){
			$("#sjjdmjdm").val(userbean["username"]);
			$("#sjjdmjxm").val(userbean["realname"]);
			$("#sjjdmjlxdh").val(userbean["telephone"]);
			$("#sjjdmjdwdm").val(userbean["orgcode"]);
			$("#sjjdmjdw").val(userbean["orgname"]);
			$("#lfsj").focus();
		}
	});
} 