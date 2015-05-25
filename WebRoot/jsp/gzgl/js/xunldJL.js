/**
 * 数据查询
 */
function searchInfo(){
	$("#xldJLList").query("F","searchform");
}

/**
 * 进入页面视图（新增页，修改页，详情页）
 * @param {} op 操作模式
 * @param {} orgcode 当前登录用户的单位代码
 * @param {} bh 巡逻队奖励编号
 */
function openView(op,orgcode,bh){
	var url = contextPath+"/gzgl/xldjl/toView.action?bean.orgCode=" + orgcode +"&bean.op=" + op;
	if(bh){
		url += "&bean.bh=" + bh;
	}
	$.openDialogWindow({
		url : url,
		width : 700,
		height : 400,
		callback : function(){
			if(op != "detail"){
				searchInfo();
			}
		}
	});
}

/**
 * 保存巡逻队任务
 */
function save(){
	if($.validateform("xunldJLform")){
		$("#xunldJLform").ajaxSubmit({
			type : "post",
			success:function(result){
				eval("var tip = " + result);
				alert(tip);
			}
		});
	}
}

/**
 * 删除巡逻队奖励
 * @param {} bh_param 巡逻队奖励编号
 */
function del(bh_param){
	var bh = "";
	if(bh_param){
		bh = bh_param;
	}else{
		var jls = $("#xldJLList").getSelected();
		if(jls.length > 0){
			$.each(jls,function(index){
				if(index < jls.length - 1){
					bh += jls[index].bh + ",";
				}else{
					bh += jls[index].bh;
				}
			});
		}else{
			alert("请选择需要删除的数据!");
		}
	}
	
	var verify = confirm("确认删除数据?");
	if(verify){
		$.ajax({
			url:contextPath + "/gzgl/xldjl/batchDel.action?bean.bh=" + bh,
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
 * 机构人员选择
 * @param {} orgcode  机构代码
 * @param {} hidden   隐藏表单项ID
 * @param {} show	  显示的表单项ID
 */
function orgUserSelect(orgcode,hidden,show,callback){
	openDwRySelect(
		{
			rootOrgCode : orgcode,
			mutilSelect : false
		},
		function (userbean){
			if(userbean != null){
				$("#"+hidden).val(userbean.username);
				$("#"+show).val(userbean.realname);

				$("#jlpzdwdm").val(userbean.orgcode);
				$("#jlpzdwmc").val(userbean.orgname);
			}
		});
}


/**
 * 机构选择
 * @param {} orgcode  机构代码
 * @param {} hidden   隐藏表单项ID
 * @param {} show	  显示的表单项ID
 */
function orgSelect(orgcode,hidden,show){
	openDwSelect({
		rootOrgCode : orgcode,
  		mutilSelect : false,
   		nodeSelectedType : "ps",
   		nodeNotSelectedType : "ps"
	},function(orgbean){
		if(orgbean != null){
			$("#"+hidden).val(orgbean.id);
			$("#"+show).val(orgbean.name);
		}
	});
}

/**
*查询巡逻队
**/
function openXldSelectWin()
{
	$.openDialogWindow({
		url : contextPath + "/gzgl/xldrw/toXldxxSelectPage.action?t" + new Date().getTime(),
		width:950,
		height : 800,
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