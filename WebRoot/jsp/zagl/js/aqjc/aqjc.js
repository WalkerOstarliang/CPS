function saveAqjcBean(){
	//获取事件源
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("nbaqjcform")){
		eventSrcObj.attr("disabled","disabled");
		$("#nbaqjcform").ajaxSubmit({
			url:contextPath + "/zagl/dw/aqjc/saveNbDwAqjcInfo.action",
			type:"post",
			dataType:"json",
			success:function(msg){
				if(msg){
					alert("保存成功.");
					clearform();
					$("#aqjcList").query("F","nbaqjcform");
				}else{
					alert("操作失败.");
				}
				eventSrcObj.removeAttr("disabled");
			}
		});
	}
}


/** 机构选择* */
function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect2({
			rootOrgCode : orgcode.substr(0,4) + "00000000",
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}


/** 选择民警 **/
function openZrmjSelect(rootOrgCode,hidden,show)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#"+hidden).val(userBean["username"]);
				 $("#"+show).val(userBean["realname"]);
			}
		});
}

function clearform(){
	$("#nbaqjcform").find("tr[id^=clear_row]").each(function(i){
		$(this).find(":input").val("");
	});
}

function rowcallbackAqjc(trObj,rowData)
{
	$("#nbaqjcform").eachObjectSetValue(rowData);
}
