/**
 * 打开视图
 * @param {} op 操作模式
 * @param {} orgcode 登录用户的机构代码（用于加载可访问的巡逻队）
 * @param {} bh 巡逻队任务编号（新增时为空）
 */
function openView(op,orgcode,bh){
	var url = contextPath+"/gzgl/xldrw/toView.action?queryBean.orgCode=" + orgcode +"&queryBean.op=" + op;
	if(bh){
		url += "&queryBean.bh=" + bh;
	}
	$.openDialogWindow({
		url : url,
		width : 900,
		height : 400,
		callback : function(){
			if(op != "detail"){
				searchInfo();
			}
		}
	});
}

/**
 * 巡逻队任务查询
 */
function searchInfo(){
	$("#xldRwList").query("F","searchform");
}

/**
 * 根据巡逻队编号查询巡逻队员
 */
function queryXldyByBh(){
	var bh = $("#xldbh").val();
	alert(bh);
	if(bh == "" || bh == null || bh == undefined){
		$("#zxryxm").val("");
	}else{
		$.ajax({
			url:contextPath + "/gzgl/xldrw/queryXldyByBh.action",
			data:{"xldbh":bh},
			type:"post",
			dataType:"json",
			cache:false,
			success:function(result){
				var xldy_xm = "";
				$.each(result,function(index){
					if(index < result.length - 1){
						xldy_xm += result[index].xldyxm + ",";
					}else{
						xldy_xm += result[index].xldyxm;
					}
				});
				$("#zxryxm").val(xldy_xm);
			},
			error:function(){
				alert("根据巡逻队编号查询巡逻队员请求失败!");
			}
			
		});
	}
}

/**
 * 保存巡逻队任务
 */
function save(){
	if($.validateform("xunldRwform")){
		$("#xunldRwform").ajaxSubmit({
			type : "post",
			success:function(result){
				eval("var tip = " + result);
				alert(tip);
				window.close();
			}
		});
	}
}

/**
 * 删除巡逻队任务
 * @param {} bh_param 巡逻队任务编号
 */
function del(bh_param){
	var bh = "";
	if(bh_param){
		bh = bh_param;
	}else{
		var rws = $("#xldRwList").getSelected();
		if(rws.length > 0){
			$.each(rws,function(index){
				if(index < rws.length - 1){
					bh += rws[index].bh + ",";
				}else{
					bh += rws[index].bh;
				}
			});
		}else{
			alert("请选择需要删除的数据!");
		}
	}
	
	var verify = confirm("确认删除数据?");
	if(verify){
		$.ajax({
			url:contextPath + "/gzgl/xldrw/batchDelXunldRW.action?bean.bh=" + bh,
			type:"post",
			success:function(result){
				searchInfo();
				eval("var tip = " + result);
				alert(tip);
			},
			error:function(){
				alert("删除数据请求失败!");
			}
			
		});
	}
	
}

/**
*查询巡逻队
**/
function openXldSelectWin()
{
	$.openDialogWindow({
		url : contextPath + "/gzgl/xldrw/toXldxxSelectPage.action?t=" + new Date().getTime(),
		width:950,
		height : 500,
		scroll : false,
		callback : function(xldxxBean)
		{
			if (xldxxBean)
			{
				$("#xldmc").val(xldxxBean["xldmc"]);
				$("#xldbh").val(xldxxBean["xldbh"]);
			}
			
		}
	})
}


/**
*巡逻队员选择窗口
**/
function queryXldySelectWin(id){
	var bh = $("#xldbh").val();
	var xldmc =encodeURI($("#xldmc").val());
	if(bh == "" || bh == null || bh == undefined){
		alert("请先选择巡逻队！");
	}else{
	$.openDialogWindow({
		url : contextPath + "/afgl/xldxx/toXldyxxSelectPage.action?t=" + new Date().getTime() + "&queryBean.xldbh=" + bh+"&queryBean.xldmc="+xldmc,
		width:950,
		height : 500,
		scroll : false,
		callback : function(Xldyxx)
		{
			if (Xldyxx)
			{
				$("#"+id).val(Xldyxx["xldyxm"]);
			}
			
		}
	});
	}
	
}