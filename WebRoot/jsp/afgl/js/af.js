
/**
 * 安防通用信息
 */

/**
 * 打开单位人员选择树   多项选择
 */
function selectDwry(orgcode, hiddenfield, showfield, orgid, orgname)
{
	if(!orgcode){
		orgcode = $("#ssjwsbh").val();
		if(!orgcode){
			orgcode = "0";
		}
	}
	openDwRySelect({
		rootOrgCode : orgcode,
		mutilSelect : true
	},
	function(userbeans){
		if (userbeans){
			var username = "";
			var realname = "";
			var length = userbeans.length;
			for(var i = 0; i < length-1; i ++){
				username += userbeans[i].username + ",";
				realname += userbeans[i].realname + ",";
			}
			$("#"+hiddenfield).val(username + userbeans[length-1].username);
			$("#"+showfield).val(realname + userbeans[length-1].realname);
			if(orgid && orgname){
				$("#"+orgname).val(userbeans[0].orgname);
				$("#"+orgid).val(userbeans[0].orgcode);
			}
		}
		
	});
} 

/**
 * 打开单位人员选择树  单选选择
 */
function selectDwryTree(orgcode, hiddenfield, showfield, orgid, orgname)
{
	if(!orgcode){
		orgcode = $("#ssjwsbh").val();
		if(!orgcode){
			orgcode = "0";
		}
	}
	openDwRySelect({
		rootOrgCode : orgcode,
		mutilSelect : false
	},
	function(userbean){
		if (userbean){
			$("#"+hiddenfield).val(userbean["username"]);
			$("#"+showfield).val(userbean["realname"]);
			$("#"+orgname).val(userbean["orgname"]);
			$("#"+orgid).val(userbean["orgcode"]);
		
		}
		
	});
} 
function selectDwld(orgcode, hiddenfield, showfield)
{ 
	openDwRySelect({
		rootOrgCode : orgcode,
		mutilSelect : true
	},
	function(userbeans){
		if (userbeans){ 
			$("#"+hiddenfield).val(userbeans[0].realname);
			if(!$("#"+showfield).val()){
				if(userbeans[0].mobile){
					$("#"+showfield).val(userbeans[0].mobile);
				}else if(userbeans[0].telephone){
					$("#"+showfield).val(userbeans[0].telephone);
				}
			}
		}
	});
}

function selectRytree(orgcode, hiddenfield, showfield)
{ 
	openDwRySelect({
		rootOrgCode : orgcode,
		mutilSelect : true
	},
	function(userbeans){
		if (userbeans){ 
			$("#"+hiddenfield).val(userbeans[0].username);
		    $("#"+showfield).val(userbeans[0].realname);
		}
	});
}

/**
 * 选择单位
 */
function selectDw(orgcode, hiddenfield, showfield){
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
}

/**
 * 打开行政区划树
 */
function selectXzqh(hiddenfield, showfield)
{
	openXzqhTree({
		rootOrgCode : "430000",
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

/**
 *根据身份证号得到人员信息
 */
function getRyjbxxBySfzh(obj){
	
	var sfzh = $(obj).val();
	if (sfzh) {
		queryRyxxBean(sfzh, function(ryxx){
			if (ryxx) {
				$("#bpcrxm").val(ryxx.xm);
				$("#bpcrxb").val(ryxx.xb);
				$("#bpcrcsrq").val(ryxx.csrq);
				$("#bpcrhjdxz").val(ryxx.zzxz);
				$("#bpcrhjdqh").val(ryxx.zzssxq);
			} 
		});
	}
}
function getZbhRyjbxxBySfzh(obj){
	
	var sfzh = $(obj).val();
	if (sfzh) {
		queryRyxxBean(sfzh, function(ryxx){
			if (ryxx) {
				$("#xm").val(ryxx.xm);
				$("#xb").val(ryxx.xb);
				$("#csrq").val(ryxx.csrq);
				$("#hjdxz").val(ryxx.zzxz);
				$("#hjdqh").val(ryxx.zzssxq);
			} 
		});
	}
}
function getXgdyxxBySfzh(obj){
	var sfzh = $(obj).val();
	if (sfzh) {
		queryRyxxBean(sfzh, function(ryxx){
			if (ryxx) {
				$("#dyxm").val(ryxx.xm);
				$("#dyxb").val(ryxx.xb);
				$("#dycsrq").val(ryxx.csrq);
				$("#dyhjdxz").val(ryxx.zzxz);
				$("#dyhjdqh").val(ryxx.zzssxq);
			} 
		});
	}
}
/**
 * 选择居委会信息
 */
function selectJwh(queryBeanId,flag){
	$.openDialogWindow({
		url : contextPath + "/afgl/jwhgl/toSelectJwhxx.action?t=" + new Date().getTime(),
		width : 750,
		height : 400,
		callback : function(jwhxxBean){
			if(jwhxxBean){
				var json = eval(jwhxxBean);
				if("1"==flag){
					$("#ssjwhbh").val(json.jwhbh);
					$("#ssjwhmc").val(json.jwhmc);
					$("#jwhfzr").val(json.jwhfzrxm);
					$("#jwhfzrlxdh").val(json.jwhfzrlxdh);
				}else if("0"==flag){
					$("#ssjwhbh").val(json.jwhbh);
					$("#ssjwhmc").val(json.jwhmc);
				}
			}
			
		}
	});
}
/**
 * 选择小区信息
 */
function selectXqxx(xqbh,xqmc){
	$.openDialogWindow({
		url : contextPath + "/xqxx/toSelectXqxx.action?t=" + new Date().getTime(),
		width : 750,
		height : 400,
		callback : function(xqxxBean){
			if(xqxxBean){
				$("#" + xqbh).val(xqxxBean.xqbh);
				$("#" + xqmc).val(xqxxBean.xqmc);
			}
		}
	});
}
/**
 * 选择卡口信息
 */
function selectKkxx(queryBeanId,isgj){
	$.openDialogWindow({
		url : contextPath + "/kkxx/toSelectKkxx.action?t=" + new Date().getTime(),
		width : 750,
		height : 400,
		callback : function(kkxxBean){
			if(kkxxBean){
				var json = eval(kkxxBean);
				if(isgj == "1"){
					$("#kkbh").val(json.kkbh);
					$("#kkmc").val(json.kkmc);
				}else{
					$("#kkbh").val(json.kkbh);
					$("#kkwz").val(json.kkwz);
					$("#kkmc").val(json.kkmc);
					$("#kkfw").val(json.kkfw);
//					var queryparams = queryBeanId + ".kkbh=" + json.kkbh;
//					$("#kkxxList").query("P",queryparams);
				}
			}else{
				if(isgj == "1"){
					$("#kkbh").val("");
					$("#kkmc").val("");
				}else{
					$("#kkbh").val("");
					$("#kkwz").val("");
					$("#kkmc").val("");
					$("#kkfw").val("");
				}
			}
		}
	});
}

/**
 * 选择治保会信息
 */
function selectZbhxx(isgj){
	$.openDialogWindow({
		url : contextPath + "/zbhxx/toSelectZbhxx.action?t=" + new Date().getTime(),
		width : 750,
		height : 400,
		callback : function(zbhxxBean){
			if(zbhxxBean){
				if(isgj == "1"){
					var json = eval(zbhxxBean);
					$("#zbhbh").val(json.zbhbh);
					$("#zbhmc").val(json.zbhmc);
				}else{
					var json = eval(zbhxxBean);
					$("#zbhbh").val(json.zbhbh);
					$("#zbhmc").val(json.zbhmc);
					$("#sssqjwmc").val(json.sssqjwmc);
					$("#sspcsmc").val(json.sspcsmc);
					var queryparams = "zbhcyxxQuery.zbhbh=" + json.zbhbh;
					$("#zbhcyxxList").query("P",queryparams);
				}
			}else{
				if(isgj == "1"){
					$("#zbhbh").val("");
					$("#zbhmc").val("");
				}else{
					$("#zbhbh").val("");
					$("#zbhmc").val("");
					$("#sssqjwmc").val("");
					$("#sspcsmc").val("");
				}
			}
		}
	});
}

//选择社区
function openSqxxSelectWin(hiddenid,showid)
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
				$("#"+hiddenid).val(sqjbxxBean.sqbh);
				$("#"+showid).val(sqjbxxBean.sqmc);
			}
		}
	});
}