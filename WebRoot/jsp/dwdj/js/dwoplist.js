//查询列表
function queryDwOpList(){
	$("#dwoplist").query("F", "queryForm");
}

/**
 * 重置查询条件
 */
function resetQueryForm(){
	$("#queryForm").get(0).reset();
}

/**
 * 打开单位操作窗口
 * @param {} id 单位id
 * @param {} lx 单位类型 
 * @param {} czbz 操作标识（1：派发 ２：签收　３：退回）
 */
function openDwOpWin(id,lx,czbz,op){
	$.openDialogWindow({
		url:contextPath + "/sydw/dwop/toDwOpPage.action",
		data:{"query.dwid":id,"query.lx":lx,"query.czzt":czbz,"operType":op},
		height:"500px",
		width:"800px",
        callback:function(){
            queryDwOpList();
        }
	});
}

/**
 * 单位锁定管理
 * @param {} sdzt 锁定状态 0：正常 1：锁定
 * @param {} dwid 单位ID
 * @param {} dwlx 单位类型
 */
function dwsdGl(sdzt,dwid,dwlx){
	var tip = "";
	if(sdzt == '1'){
		tip = "锁定后派发的单位将不能退回，确认锁定？";
	}
	if(sdzt == '0'){
		tip = "确认撤销单位锁定？";
	}
	if(confirm(tip)){
		$.ajax({
			url : contextPath + "/sydw/dwop/dwsdGl.action",
			data : {"query.sdzt":sdzt,"query.dwid":dwid,"query.lx":dwlx},
			type : "post",
			dataType : "json",
			success : function(result){
				if(result){
					alert("操作成功.");
                    queryDwOpList();
				}else{
					alert("操作失败.");
				}
			}
		});
	}
}

//新增危爆单位信息
function addDwOpPage(){
	$.openDialogWindow({
		url : contextPath + "/sydw/dwop/toAddWbdwPage.action",
		data : {operType : 'add',t:Math.random()},
		width : 1050,
		height :500,
		callback : function()
		{
			queryDwOpList();
		}
	})
}