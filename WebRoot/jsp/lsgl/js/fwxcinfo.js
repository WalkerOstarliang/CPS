

/**
 * 责任民警
 * @param {Object} rootOrgCode
 */
function openZrmjSelect(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#sszrmjjh").val(userBean["username"]);
				 $("#sszrmjxm").val(userBean["realname"]);
				 $("#sszrdwdm").val(userBean["orgcode"]);
				 $("#sszrdwmc").val(userBean["orgname"]);
				 $("#sszrmjlxdh").val(userBean["telephone"]);
			}
		});
}

function openXcmjSelect(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : true
		},
		function(userBeans)
		{
			if(userBeans){
				var xcmjxms = [];
				$.each(userBeans,function(i,userBean){
					xcmjxms.push(userBean["realname"]);
					if (i == 0)
					{
						 $("#xcmjdwdm").val(userBean["orgcode"]);
						 $("#xcmjdwmc").val(userBean["orgname"]);
					}
				});
				 $("#xcmjxm").val(xcmjxms.join(","));
			 }
		});
}

function openXcmjSelectSingle(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#xcmjxm").val(userBean["realname"]);
				 $("#xcmjdwdm").val(userBean["orgcode"]);
				 $("#xcmjdwmc").val(userBean["orgname"]);
			}
		});
}
/**
 * 操作民警
 * @param {Object} rootOrgCode
 */
function openCzmjSelect(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#czrxm").val(userBean["realname"]);
				 $("#czdwdm").val(userBean["orgcode"]);
				 $("#czdwmc").val(userBean["orgname"]);
			}
		});
}


function clearform(){
	$("#fwxxform").find("tr[id^=clear_row]").each(function(i){
		$(this).find(":input").val("");
	});
}
function callcall(){
	if($.validateform("fwxxform")){
		$("#fwxxform").ajaxSubmit({
			url: contextPath+"/lsgl/fw/savaFwxcBean.action",
			type:"post",
			dataType:"json",
			success:function(fwBean){
				if (fwBean != null && !$.isBlank(fwBean["fwid"]))
				{
					alert("房屋巡查信息保存成功");
					clearform();
					$("#fwid").val(fwBean["fwid"])
					$("#xcdjtablgrid").query("F","fwxxform");
				}
				else
				{
					alert("房屋巡查信息保存失败，请重试！");
				}
			}
		})
	}
}


function openFwDwSelect(rootOrgCode, callback)
{
	openDwSelect({ 
		rootOrgCode : rootOrgCode,
        mutilSelect : false
    },function(orgBean){
       callback(orgBean);
    });
}

function openFwPcsDwSelect(callback)
{
	var rootOrgCode = $("#ssgajgjgdm").val();
	if (!$.isBlank(rootOrgCode))
	{
		openFwDwSelect(rootOrgCode,callback);
	}
	else
	{
		alert("请先选择所属公安机构.");
	}
}

function callbackSsgajgjg(orgBean)
{
	if (orgBean != null)
	{
		$("#ssgajgjgdm").val(orgBean["id"]);
		$("#ssgajgjgmc").val(orgBean["name"]);
	}
}

function callbackSspcs(orgBean)
{
	if (orgBean != null)
	{
		$("#sspcsdm").val(orgBean["id"]);
		$("#sspcsmc").val(orgBean["name"]);
	}
}

function rowcallbackCzfxcdj(trObj,rowData)
{
	$("#xcdjxx").eachObjectSetValue(rowData);
}


