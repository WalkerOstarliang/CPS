function jxquery(){
	$("#zdryjglist").query("F","queryForm");
}
function openZdryInfo(operType)
{	
	$.openWindow({
		url : contextPath + "/lsgl/zdry/toSFZHInfoPage.action",
		data : {
			operType : operType,
			t:new Date().getTime()
		},
		width : 1100,
		height : 760,
		callback : function(){
			jxquery();
		}
	});
}

function queryBtnQueryList()
{
	queryList();
}

function queryList(){
	$("#gzdxbh").val("");
	$("#zdrylist").query("F","queryForm");
}

//重点人员认领
function zdryRl(bh){
	$.ajax({
		url:contextPath + "/lsgl/zdry/zdryRl.action?zdryBean.gzdxbh=" + bh + "&t=" + new Date().getTime(),
		type:"post",
		success:function(){
			alert("认领成功!");
			queryList();
		}
	});
}

//打开重点人员派发窗口
function openZdryPf(rybh,opertype){
	$.openWindow({
		url : contextPath + "/lsgl/zdry/toZdryPfPage.action?queryBean.rybh=" + rybh + "&operType=" + opertype + "&t=" + new Date().getTime(),
		width:900,
		height:650,
		callback : function(resultObj)
		{
		}
	});
}

//重点人员退回
function openZdryth(rybh,opertype){
	$.openWindow({
		url : contextPath + "/lsgl/zdry/toZdrythpage.action?queryBean.rybh=" + rybh + "&operType=" + opertype + "&t=" + new Date().getTime(),
		width:900,
		height:650,
		callback : function(resultObj)
		{
		}
	});
}

//打开人口信息
function openSyrkInfoPage(operType, rybh, rylb)
{
	var rybh = rybh == undefined ? "" : rybh;
	$.openWindow({
		url : contextPath + "/lsgl/rk/toRkInfoPage.action",
		data : {"operType" : operType,"queryBean.rybh" : rybh,"queryBean.rylb" :rylb,  t:new Date().getTime()},
		width : 1000,
		height : 760
	});
}

//打开托管窗口
function openTgxxPage(rybh,sfzh,opertype){
	/*$.ajax({
		url : contextPath + "/lsgl/zdry/sftg.action",
		data : {"zdryBean.sfzh":sfzh},
		type : "post",
		dataType : "json",
		success :function(bean){
			if(bean == null){
				$.openWindow({
					url : contextPath + "/lsgl/zdry/toZdryTgPage.action",
					data : {"queryBean.rybh" : rybh,"t":new Date().getTime()},
					width : 1000,
					height : 760
				});
			}else{
				alert("人员已托管.");
			}
		}
	});*/
	
	$.openWindow({
		url : contextPath + "/lsgl/zdry/toZdryTgPage.action",
		data : {"queryBean.rybh" : rybh,"operType":opertype,"t":new Date().getTime()},
		width : 1000,
		height : 760
	});
}


//点击退回按钮
function zdryTh(){
	var selectZdry = $("#zdrylist").getSelected();
	if(selectZdry.length != 1 ){
		alert("请先选择从一位重点人员!");
		return;
	}else{
		openZdryth(selectZdry[0].rybh);
	}
}

//点击派发按钮
function zdrypf(){
	var selectZdry = $("#zdrylist").getSelected();
	if(selectZdry.length != 1 ){
		alert("请先选择从一位重点人员!");
		return;
	}else{
		openZdryPf(selectZdry[0].rybh);
	}
}

//点击托管按钮
function zdryTg(){
	var selectZdry = $("#zdrylist").getSelected();
	if(selectZdry.length != 1 ){
		alert("请先选择从一位重点人员!");
		return;
	}else{
		openTgxxPage(selectZdry[0].rybh,selectZdry[0].sfzh);
	}
}

//点击在控登记
function zdryZkdj(){
	var selectZdry = $("#zdrylist").getSelected();
	if(selectZdry.length != 1 ){
		alert("请先选择从一位重点人员!");
		return;
	}else{
		openZdryInfoPage('update',selectZdry[0].sfzh,selectZdry[0].rybh,"showMenu");
	}
}

//打开人员接管窗口
function openRyjgWin(rybh,tgxxId,opertype){
	$.openWindow({
		url : contextPath + "/lsgl/zdry/toZdryJgPage.action",
		data : {"zdryBean.tgxxId":tgxxId,"queryBean.rybh" : rybh,"operType":opertype,"t":new Date().getTime()},
		width : 1000,
		height : 760
	});
}

/**
 * 重点人员导出Excel
 */
function downloadExcel(){
	/*
	var selectZdry = $("#zdrylist").getSelected();
	var gzdxbh = "";
	if(selectZdry.length > 1){
		for(var i=0; i<selectZdry.length; i++){
			if(i< selectZdry.length - 1){
				if(i == 0){
					gzdxbh += selectZdry[i].gzdxbh + "',";
				}else{
					gzdxbh += "'" + selectZdry[i].gzdxbh + "',";		
				}
			}
			if(i == selectZdry.length - 1){
				gzdxbh += "'" + selectZdry[i].gzdxbh ;
			}
		}
	}else{
		if(selectZdry.length == 1){
			gzdxbh = selectZdry[0].gzdxbh;
		}
	}
	
	$("#gzdxbh").val(gzdxbh);
	*/
	$("#queryForm").attr("action",contextPath + "/lsgl/zdry/downloadZdry.action?t=" + new Date().getTime());
	$("#queryForm").attr("method","post");
	$("#queryForm").get(0).submit();
	
}

