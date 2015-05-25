//弹出层
var layerObj;

//关闭弹出层
function closeLayer(){
	if(layerObj){
		layer.close(layerObj);
	}
}

/**
 * 查询列表
 */
function queryRkList(){
	$("#rylist").query("F","searchForm");
}

/**
 * 重置查询表单
 */
function clearSearchForm(){
	$("#searchForm").reset();
}

//选择社区
function openSqxxSelectWin()
{
	$.openDialogWindow({
		url : contextPath + "/afgl/sqjbgl/toOpenSqListSelectWin.action",
		width : 900,
		height : 500,
		data : {
			t: new Date().getTime()
		},
		callback : function(sqjbxxBean)
		{
			if (sqjbxxBean)
			{
				//警务室
				$("#jwqdm").val(sqjbxxBean.gxsqjwsdm);
				$("#jwqmc").val(sqjbxxBean.gxsqjwsmc);
				
				//行政社区
				$("#mbdwdm").val(sqjbxxBean.sqbh);
				$("#mbdwmc").val(sqjbxxBean.sqmc);
			}
		}
	});
}

//清除社区选择
function clearSqSelect(){
	$("#jwqdm").val("");
	$("#jwqmc").val("");
	$("#mbdwdm").val("");
	$("#mbdwmc").val("");
}

//打开派发窗口
function openRypfWin(){
	var selected = $("#rylist").getSelected();
	if(selected.length < 1){
		alert("请选数据.");
		return;
	}else{
		//先清除派发数据
		$("#pf_rkid").val("");
		clearSqSelect();
		//重新赋值
		var rkid = "";
		var flag = false;
		for(i = 0 ; i < selected.length ; i++ ){
			if(i < selected.length - 1){
				rkid += selected[i]["rkid"] + ",";
			}else{
				rkid += selected[i]["rkid"];
			}
			if(selected[i]["czzt"] == "1"){
				flag = true;
				break;
			}
		}
		
		if(flag){
			alert("所选人员中存在已派发人员.");
			return;
		}
		
		$("#pf_rkid").val(rkid);
		layerObj = $.layer({
	 	type:1,
	 	title:false,
	 	area:['500px','100px'],
	 	border: [10, 0.3, '#000'],
	 	shade: [0.5, '#000',true],
	 	page: {
			dom: '#rypf' 
		}
	 });
	}
}

/**
 * 保存人员派发信息
 */
function saveRyPfxx(){
	if ($.validateform("rypfform"))
	{
		$("#rypfform").ajaxSubmit({
			url:contextPath + "/whsrk/whsRkPf.action",
			type : "post",
			dataType:"json",
			success : function(result)
			{
				if (result)
				{
					alert("保存信息成功.");
					closeLayer();
				}
				else
				{
					alert("保存信息失败.");
				}
			}
		});
	}
}

//打开退回窗口
function openRythWin(){
	var selected = $("#rylist").getSelected();
	if(selected.length < 1){
		alert("请先选择数据.");
		return;
	}else{
		//先清除派发数据
		$("#th_rkid").val("");
		$("#thyy").val("");
		//重新赋值
		var rkid = "";
		for(i = 0 ; i < selected.length ; i++ ){
			if(i < selected.length - 1){
				rkid += selected[i]["rkid"] + ",";
			}else{
				rkid += selected[i]["rkid"];
			}
		}
		$("#th_rkid").val(rkid);
		layerObj = $.layer({
	 	type:1,
	 	title:false,
	 	area:['500px','140px'],
	 	border: [10, 0.3, '#000'],
	 	shade: [0.5, '#000',true],
	 	page: {
			dom: '#ryth' 
		}
	 });
	}
}

//保存人员退回
function saveRyThxx(){
	if ($.validateform("rythform"))
	{
		$("#rythform").ajaxSubmit({
			url:contextPath + "/whsrk/whsRkTh.action",
			type : "post",
			dataType:"json",
			success : function(result)
			{
				if (result)
				{
					alert("保存信息成功.");
					closeLayer();
				}
				else
				{
					alert("保存信息失败.");
				}
			}
		});
	}
}

//打开反馈窗口
function openRyfkWin(){
	var selected = $("#rylist").getSelected();
	if(selected.length < 1){
		alert("请先选择数据.");
		return;
	}else{
		//先清除派发数据
		$("#fk_rkid").val("");
		$("#fknr").val("");
		//重新赋值
		var rkid = "";
		for(i = 0 ; i < selected.length ; i++ ){
			if(i < selected.length - 1){
				rkid += selected[i]["rkid"] + ",";
			}else{
				rkid += selected[i]["rkid"];
			}
		}
		$("#fk_rkid").val(rkid);
		layerObj = $.layer({
	 	type:1,
	 	title:false,
	 	area:['500px','165px'],
	 	border: [10, 0.3, '#000'],
	 	shade: [0.5, '#000',true],
	 	page: {
			dom: '#ryfk' 
		}
	 });
	}
}


//保存人员反馈
function saveRyFkxx(){
	if ($.validateform("ryfkform"))
	{
		var fklx = $("select[id='fklx'] option:selected").val();
		if(fklx == '9' && $("#fknr").val() == ""){
			alert("请填写反馈内容.");
			return;
		}
		$("#ryfkform").ajaxSubmit({
			url:contextPath + "/whsrk/whsRkFk.action",
			type : "post",
			dataType:"json",
			success : function(result)
			{
				if (result)
				{
					alert("保存信息成功.");
					closeLayer();
				}
				else
				{
					alert("保存信息失败.");
				}
			}
		});
	}
}

/**
 * 实有人口登记
 */
function syrkdj(){
	var selected = $("#rylist").getSelected();
	if(selected.length == 1){
		var iframe = $("#mainiframe",parent.document);
		if(iframe){
			iframe.attr("src",contextPath + 
				"/lsgl/rk/toSyrkDjQueryPage.action?queryBean.zjhm=" + selected[0]["sfhm"]);
		}
	}else{
		alert("请选择一条记录.");
	}
}

//导出未核实人口
function expWhsRk(){
	$("#searchForm").attr("action",contextPath + "/whsrk/expWhsRk.action");
	$("#searchForm").attr("target","expWhsrk");
	$("#searchForm").submit();
}


