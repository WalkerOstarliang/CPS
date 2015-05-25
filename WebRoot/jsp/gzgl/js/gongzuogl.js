function queryData()
{
	
	$("#datagridList").query("F", "searchform");
}
/**
 * 新增日志
 */
function toNewRz()
{
	$.openWindow({
		url : contextPath + "/gzgl/rzgl/toAddRizhi.action?t="+ new Date().getTime(),
		width : 900,
		height : 450
	});
}

/**
 * 选择执行民警
 * @param {} orgCode  选择的单位代码
 */
function selectZhixMJ(orgCode)
{
	openDwRySelect(
		{
			rootOrgCode : orgCode,
			mutilSelect : false
		},
		function (userbeans)
		{
			if (userbeans)
			{
				$("#mjxm").val(userbeans["realname"]).focus();
				$("#mjsfzh").val(userbeans["sfzh"]).focus();
				$("#mjjh").val(userbeans["username"]);//username表示警号
				$("#mjdwdm").val(userbeans["orgcode"]);
				$("#mjdwmc").val(userbeans["orgname"]);
				
				loadGzrzByGzRqAndJh();
			}
		});
}



/**
 * 列表操作列回调函数
 * @param {Object} trObj	单元格document元素
 * @param {Object} rowdataObj	当前行的json对象数据
 */
function rizhiOpCallback(trObj, rowdataObj)
{
	var rizhiBhao = rowdataObj['rzbh'];
	
	if (!rizhiBhao)
	{
		alert("获取数据异常");
		return;
	}
	var content = "";
	content = "<a href='#' onclick=\"openEditRizhi(\'" + rizhiBhao + "\')\">修改</a>&nbsp;" + 
			"<a href='#' onclick=\"delRizhi(\'" + rizhiBhao + "\')\">删除</a>&nbsp;";
	
	content += "<a href='#' onclick=\"openDetailRizhi(\'" + rizhiBhao + "\')\">详情</a>";
	
	return content;
}

/**
 * 编辑日志
 * @param {} rizhiBhao 日志编号
 */
function openEditRizhi(rizhiBhao)
{
	$.openWindow({
				url : contextPath+ "/gzgl/rzgl/toEditRizhi.action?rizhiQuery.rzbh="+ rizhiBhao + "&t=" + new Date().getTime(),
				width : 900,
				height : 450
			});
}

/**
 * 删除日志
 * @param {} rizhiBhao 日志编号
 */
function delRizhi(rizhiBhao)
{
	if (confirm("确认删除该记录吗？"))
	{
		$.ajax({
		type : "post",
		url : contextPath + "/gzgl/rzgl/saveRizhiBean.action?rizhiBean.op=delete",
		data : "rizhiBean.rzbh=" + rizhiBhao,
		success : function(result)
		{
			if (!result)
			{
				alert("删除工作日志失败，请稍后再试.");
			}
			else
			{
				queryData();//刷新表格数据
			}
		}
	});
	}
}

/**
 * 打开日志详情
 * @param {} rizhiBhao 日志编号
 */
function openDetailRizhi(rizhiBhao)
{
	$.openDialogWindow({
				url : contextPath+ "/gzgl/rzgl/toViewRizhiDetail.action?rizhiQuery.rzbh="+ rizhiBhao + "&t=" + new Date().getTime(),
				width : 900,
				height : 450,
				callback : function() {//刷新表格数据
				}
			});
}

function buildSelectItems()
{
	var rizhiSelected = $("#datagridList").getSelected();
	var delBhao = "";
	if (rizhiSelected !== null)
	{
		$(rizhiSelected).each(function(i){
			if (i < rizhiSelected.length - 1)
			{
				delBhao += (this.rzbh + ',');
			}
			else
			{
				delBhao += (this.rzbh);
			}
		});
	}
	
	
	if (!delBhao || delBhao == null)
	{
		alert("请选择数据项!");
		return false;
	}
	return delBhao;
}
/**
 * 批量删除日志
 * @return {Boolean}
 */
function batchDelRizhiList()
{
	var rizhiSelected = $("#datagridList").getSelected();
	var delBhao = "";
	if (rizhiSelected != null)
	{
		$(rizhiSelected).each(function(i){
			if (i < rizhiSelected.length - 1)
			{
				delBhao += (this.rzbh + ',');
			}
			else
			{
				delBhao += (this.rzbh);
			}
		});
		
		if (!delBhao || delBhao == null)
		{
			alert("请选择数据项!");
			return false;
		}
		
		if (!confirm("确认删除选择项吗?"))
		{
			return false;
		}
		
		$.ajax({
			type : "post",
			data : {'rizhiQuery.rzbh': delBhao},
			url : contextPath + "/gzgl/rzgl/batchSaveRizhis.action?t=" + new Date().getTime() + "&op=delete",
			success : function(result) {
				if (!result)
				{
					queryData();
				}
				else
				{
					alert("操作失败，请稍后再试.");
				}
				
			}
		});
	}
}

/**
 * 新增工作总结
 */
function toNewZj()
{
	$.openDialogWindow({
				url : contextPath
						+ "/gzgl/zjgl/toAddZjie.action?a=1"
						+ "&t=" + new Date().getTime(),
				width : 800,
				height : 460,
				callback : function() {//刷新表格数据
					queryData();
				}
			});
}

/**
 * 工作总结列表操作列回调函数
 * @param {Object} trObj	行document元素
 * @param {Object} rowdataObj	当前行的json对象数据
 */
function zjieOpCallback(trObj, rowdataObj)
{
	var zjieBhao = rowdataObj['zjbh'];
	
	if (!zjieBhao)
	{
		alert("获取数据异常");
		return;
	}
	
	var content = "";
	if (rowdataObj.zjmjjh==mjjh || rowdataObj.djrjh==mjjh)
	{
		content += "<a href='#' onclick=\"openEditZjie(\'" + zjieBhao + "\')\">修改</a>&nbsp;<a href='#' onclick=\"delZjie(\'" + zjieBhao + "\')\">删除</a>&nbsp";
	}
	content += "<a href='#' onclick=\"openDetailZjie(\'" + zjieBhao + "\')\">详情</a>";
	
	return content;
}

/**
 * 编辑工作总结
 * @param {} zjieBhao 工作总结编号
 */
function openEditZjie(zjieBhao)
{
	$.openDialogWindow({
				url : contextPath
						+ "/gzgl/zjgl/toEditZjie.action?a=1&zjieQuery.zjbh="+zjieBhao
						+ "&t=" + new Date().getTime(),
				width : 900,
				height : 450,
				callback : function() {//刷新表格数据
					queryData();
				}
			});
}

/**
 * 删除工作总结
 * @param {} zjieBhao 工作总结编号
 */
function delZjie(zjieBhao)
{
	if (confirm("确认删除该记录吗？"))
	{
		$.ajax({
			type : "post",
			url : contextPath + "/gzgl/zjgl/saveZongjieBean.action?zjieBean.op=delete",
			data : "zjieBean.zjbh=" + zjieBhao,
			success : function(result)
			{
				if (!result)
				{
					alert("删除工作日志失败，请稍后再试.");
				}
				else
				{
					queryData();//刷新表格数据
				}
			}
		})
	}
}

/**
 * 工作总结详情
 * @param {} zjieBhao 工作总结编号
 */
function openDetailZjie(zjieBhao)
{
	$.openDialogWindow({
				url : contextPath
						+ "/gzgl/zjgl/toViewZjie.action?a=1&zjieQuery.zjbh="+zjieBhao
						+ "&t=" + new Date().getTime(),
				width : 800,
				height : 400,
				callback : function() {//刷新表格数据
				}
			});
}

/**
 * 批量删除工作总结
 * @return {Boolean}
 */
function batchDelZjieList()
{
	var zjieSelected = $("#datagridList").getSelected();
	var zjieBhaos = "";
	if (zjieSelected != null)
	{
		$(zjieSelected).each(function(i){
			if (i < zjieSelected.length - 1)
			{
				zjieBhaos += (this.zjbh + ',');
			}
			else
			{
				zjieBhaos += (this.zjbh);
			}
		});
	}
	
	if (!zjieBhaos || zjieBhaos == null)
	{
		alert("请选择数据项!");
		return false;
	}
	
	if (!confirm("确认删除已选择项吗?"))
	{
		return false;
	}

	$.ajax({
		cache : false,
		type : "post",
		data : {'zjieQuery.zjbh' : zjieBhaos, 'zjieQuery.op' : "delete"},
		url : contextPath + "/gzgl/zjgl/batchSaveZongjieBeans.action?t=" + new Date().getTime(),
		success : function(result){
			if (!result)
			{
				queryData();//刷新表格
			}
			else
			{
				alert("删除数据失败，请稍后再试.");
			}
		}
	});
}

function selectDepart(orgCode)
{
	openDwSelect(
		{
			rootOrgCode : orgCode,
			mutilSelect : false
		}, 
		function(userbeans){
			if (userbeans)
			{
				$("#dwbh").val(userbeans.id);
				$("#dwmc").val(userbeans.name)
			}
	});
}

/**
 * 新增任务派发
 */
function toNewRw()
{
	$.openDialogWindow({
				url : contextPath
						+ "/gzgl/rwgl/toAddRenwu.action?a=1"
						+ "&t=" + new Date().getTime(),
				width : 900,
				height : 500,
				callback : function() {//刷新表格数据
					queryData();
				}
			});
}

/**
 * 跳转到任务反馈
 */
function toFKRW(){
	$.openDialogWindow({
				url : contextPath
						+ "/gzgl/rwgl/toFankuiRenwu.action?a=1"
						+ "&t=" + new Date().getTime(),
				width : 900,
				height : 500
			});
}

/**
 * 执行民警选择
 * @param {} orgCode
 */
function selectZhixMjs(orgCode)
{
	openDwRySelect(
		{
			rootOrgCode : orgCode,
			mutilSelect : true
		},
		function (userbeans)
		{
			if (userbeans)
			{
				
				if (userbeans.length > 0)
				{
					var record = "";
					/*var clmjjh="";
					var clmjsfzh="";
					var clmjdwdm="";
					var clmjdwmc="";*/
					var j = $("#zxmjs tbody").find("tr").length;
					$(userbeans).each(function(i){
						//对已选择的进行滤过
			              /*  if(i==0){
							record = userbeans[i]["realname"]+",";
							clmjjh = userbeans[i]["username"]+",";
							clmjsfzh = userbeans[i]["sfzh"]+",";
							clmjdwdm = userbeans[i]["orgcode"]+",";
							clmjdwmc = userbeans[i]["orgname"]+",";
							}else if(i!=userbeans.length-1){
							record +=userbeans[i]["realname"]+",";
							clmjjh += userbeans[i]["username"]+",";
							clmjsfzh += userbeans[i]["sfzh"]+",";
							clmjdwdm += userbeans[i]["orgcode"]+",";
							clmjdwmc += userbeans[i]["orgname"]+",";
							}else{
								record +=userbeans[i]["realname"];
								clmjjh += userbeans[i]["username"];
							    clmjsfzh += userbeans[i]["sfzh"];
							    clmjdwdm += userbeans[i]["orgcode"];
							    clmjdwmc += userbeans[i]["orgname"];
							}*/
		
					/*	if (checkExist(this.username))
						{
							alert("已选择" + this.realname);
							return;
						}*/
						record = "<tr><td>";
						record += this.realname;
						record += "</td><td>";
						record += this.orgname;
						record += "<input type='hidden' name='renwuBean.mjins[" + j + "].clmjxm' value='" + this.realname + "'>";
						record += "<input type='hidden' name='renwuBean.mjins[" + j + "].clmjjh' value='" + this.username + "'>";
						record += "<input type='hidden' name='renwuBean.mjins[" + j + "].clmjsfzh' value='" + this.sfzh + "'>";
						record += "<input type='hidden' name='renwuBean.mjins[" + j + "].clmjdwdm' value='" + this.orgcode + "'>";
						record += "<input type='hidden' name='renwuBean.mjins[" + j + "].clmjdwmc' value='" + this.orgname + "'>";
						record += "<input type='hidden' name='renwuBean.mjins[" + j + "].op' value='add'>";
						record += "</td><td>";
						record += "<input type='button' value='删除' onclick='delRecord(this);'/>";
						record += "</td></tr>";
						$("#zxmjs tbody").append(record);	
						j++;
					});
					/*$("#zxmj").val(record);
					$("#clmjjh").val(clmjjh);
					$("#clmjsfzh").val(clmjsfzh);
					$("#clmjdwdm").val(clmjdwdm);
					$("#clmjdwmc").val(clmjdwmc);*/
					
				}
			}
		});
}

function checkExist(mjjh)
{
	var result = false;
	$("#zxmjs tbody").find("input[type='hidden'][name$='clmjjh']").each(function(){
		if ($(this).val().toString() == (mjjh + ""))
		{
			result = true;
		}
	});
	return result;
}

function delRecord(obj)
{
	$(obj).parent().parent().css('display', 'none').find("input[type='hidden'][name$='op']").val('delete');
}


function booCheck(tdObj, rowdataobj)
{
	if ('0' == rowdataobj.cljg)
	{
		$(tdObj).text('未完成');
	}
	else if ('1' == rowdataobj.cljg)
	{
		$(tdObj).text('已完成');
	}
	else if ('2' == rowdataobj.cljg)
	{
		$(tdObj).text('部分完成');
	}
	else if ('3' == rowdataobj.cljg)
	{
		$(tdObj).text('其他');
	}
	else
	{
		$(tdObj).text('-');
	}
}

function kooCheck(tdObj, rowdataobj)
{
	if ('1' == rowdataobj.rwclzt)
	{
		$(tdObj).text('已处理');
	}
	else if ('0' == rowdataobj.rwclzt)
	{
		$(tdObj).text('未处理');
	}
	else
	{
		$(tdObj).text('-');
	}
}

function openDetailRenwu(renwuBH,op)
{
	$.openDialogWindow({
				url : contextPath
						+ "/gzgl/rwgl/toViewRenwu.action?a=1"
						+ "&t=" + new Date().getTime(),
				data : {"renwuQuery.rwbh" : renwuBH,"renwuQuery.op":op},
				width : 800,
				height : 600,
				callback : function() {//刷新表格数据
					if(op == "update"){
						queryData();
					}
				}
			});
}

function renwufkOpCallback(tdObj, rowDataObj)
{
	var content = "";
	if (rowDataObj.rwclzt != '1')
	{
		content += "<a href='#' onclick='openFkuiRenwu(\"" + rowDataObj.rwbh + "\", \"" + rowDataObj.clmjid + "\")'>反馈</a>";
	}
	content += "&nbsp;<a href='#' onclick='openFkuiDetail(\"" + rowDataObj.rwbh + "\", \"" + rowDataObj.clmjid + "\")'>详情</a>";
	$(tdObj).html(content);
}

function openFkuiRenwu(renwuBH, clmjID)
{
	$.openDialogWindow({
				url : contextPath
						+ "/gzgl/rwgl/toFankuiRenwu.action?a=1"
						+ "&t=" + new Date().getTime(),
				data : 
				{
					"renwuQuery.rwbh" : renwuBH,
					"renwuQuery.clmjid" : clmjID
				},
				width : 800,
				height : 500,
				callback : function() {//刷新表格数据
					queryData();
				}
			});
}

function openFkuiDetail(renwuBH, clmjID)
{
	$.openDialogWindow({
		url : contextPath
				+ "/gzgl/rwgl/toViewFankuiRenwu.action?a=1"
				+ "&t=" + new Date().getTime(),
		data : 
		{
			"renwuQuery.rwbh" : renwuBH,
			"renwuQuery.clmjid" : clmjID
		},
		width : 800,
		height : 500,
		callback : function() {//刷新表格数据
			queryData();
		}
	});
}


/**
 * 删除任务
 * @param {} bh   任务编号
 */
function delRenwu(bh){
	var qr = window.confirm("确认删除任务?");
	if(qr == true){
		$.ajax({
			url:contextPath + '/gzgl/rwgl/delRenwu.action?t=' + new Date().getTime(),
			data:{"bh":bh},
			type:"post",
			success:function(result){
				queryData();
				eval("var tip = " + result);
				alert(tip);
			},
			error:function(){
				alert("删除任务请求失败!");
			}
		});
	}else{
		return;
	}
}

/**
 * 签收任务
 * @param {} bh 任务编号
 */
function qsRenwu(bh){
	var qr = window.confirm("确认签收任务?");
	if(qr == true){
		$.ajax({
			url:contextPath + '/gzgl/rwgl/qsRenwu.action?t=' + new Date().getTime(),
			data:{"bh":bh},
			type:"post",
			success:function(result){
				queryData();
				eval("var tip = " + result);
				alert(tip);
			},
			error:function(){
				alert("签收任务请求失败!");
			}
		});
	}else{
		return;
	}
}

/**
 * 任务反馈
 */
function fkRenwu(renwuBH){
	$.openDialogWindow({
				url : contextPath
						+ "/gzgl/rwgl/toViewRenwu.action?a=1"
						+ "&t=" + new Date().getTime(),
				data : {"renwuQuery.rwbh" : renwuBH,"renwuQuery.op":"fk"},
				width : 900,
				height : 700,
				callback : function() {//刷新表格数据
					queryData();
				}
			});
}

/**
* 任务派发附件下载
**/
function downloadrwfjxx(fjid){
	window.location = contextPath+"/gzgl/rwgl/downloadrwfjxx.action?fjBean.id="+fjid;
}

/**
*跳转到任务处理页面
**/
function openDetailRenwucl(renwuBH,op){
	$.openDialogWindow({
				url : contextPath
						+ "/gzgl/rwgl/toViewRenwucl.action?a=1"
						+ "&t=" + new Date().getTime(),
				data : {"renwuQuery.rwbh" : renwuBH,"renwuQuery.op":op},
				width : 800,
				height : 600,
				callback : function() {//刷新表格数据
					if(op == "update"){
						queryData();
					}
				}
			});
}

/**
 * 提交
 */
function submitNewBean()
{
	if ($.validateform("beanform"))
	{
		$("#beanform").ajaxSubmit({
			dataType : "json",
			type : "post",
			success : function(result)
			{
				if(result=="1")
				{
					alert("请选择执行民警");
				}
				else{
					alert(result);
					window.close();
				}
			}
		});
	}
}

function changeZjlb(value)
{
	var result = "";
	//月总结
	if ("1" == value)
	{
		var currentMonth = new Date().getMonth() + 1;
		result = currentMonth + "月份总结";	
	}
	//季度总结
	else if ("2" == value)
	{
		var currentMonth = new Date().getMonth() + 1;
		if (currentMonth <=3)
		{
			result = "第一季度总结";
		}
		else if (currentMonth >3 && currentMonth <=6)
		{
			result = "第二季度总结";
		}
		else if (currentMonth >6 && currentMonth <= 9)
		{
			result = "第三季度总结";
		}
		else
		{
			result = "第四季度总结";
		}
	}
	//半年总结
	else if ("3" == value)
	{
		var currentMonth = new Date().getMonth() + 1;
		if (currentMonth <=6)
		{
			result = "上半年总结";
		}
		else 
		{
			result = "下半年总结";
		}
	}
	//年度总结
	else if ("4" == value)
	{
		var currentYear = new Date().getFullYear();
		result = currentYear + "年度总结";
	}
	$("#zjlxms").val(result);
}

function exportRzWord(){
	var dataSelects = $("#datagridList").getSelected();
	if(dataSelects.length>0){
		if(confirm("确定要导出所选记录吗?")){
//			$("#exportform").attr("action",contextPath + "/gzgl/rzgl/exportRzzhiList.action");
			var rzids = [];
			$.each(dataSelects,function(i){
				var gzRzBean = dataSelects[i]; 
				rzids.push(gzRzBean.rzbh);				
			})
			var rzid = rzids.join(",");
			$("#rzid").val(rzid);
//			$("#exportform").attr("target","exportiframe");
//			$("#exportform").submit();
		$.openWindow({
		 	name : "exportwin",
		 	url : contextPath + "/gzgl/rzgl/exportRzBean.action",
		 	data : {rzid:rzid},
		 	width:900,
		 	height:700
		 });
		}
	}else{
		alert("请选择一条记录.");
	}
}
function downLoadRz(){
	var size = $("#datagridList").getTotalSize();
	var _data = $("#searchform").serialize();
	if(size == 0){
		alert('没有数据，请先查询')
		return false;
	};
	if(size > 0 && size <= 50000){
		if(confirm("确定要导出查询出的所有记录吗?")){
			$.openWindow({
				url:contextPath + "/gzgl/rzgl/downLoadRzlist.action?"+_data,
				width:900,
		 		height:700
			})
		};
	}else{
		alert('一次只能导出50000条')
	};
}


function loadGzrzByGzRqAndJh()
{
	var rzbt = "";
	var gzrq = $("#gzrq").val();
	var mjjh = $("#mjjh").val();
	var mjxm = $("#mjxm").val();
	if (!$.isBlank(gzrq) && !$.isBlank(mjjh))
	{
		$.ajax({
			url : contextPath + "/gzgl/rzgl/loadGzrzBean.action",
			data : "rizhiBean.gzmjjh=" + mjjh + "&rizhiBean.gzrq=" + gzrq,
			dataType : "json",
			success : function(rzBean)
			{
				if (rzBean != null)
				{
					var rzbh = rzBean["rzbh"];
					var gzms = rzBean["gznrms"];
					var clms = rzBean["cljgms"];
					$("#rzbh").val(rzbh);
					$("#cljgms").val(clms);
					$("#gznrms").val(gzms);
				}
				else
				{
					$("#rzbh").val("");
					$("#cljgms").val("");
					$("#gznrms").val("");
				}
			}
		});
		rzbt = gzrq + mjxm + "日志登记";
		$("#rzbt").val(rzbt);
	}
	
}