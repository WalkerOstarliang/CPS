/**
 * 查询入户走访
 */
function queryRhzf(){
	$("#rhzfList").query("F","searchform");
}

/**
 * 重置查询条件
 */
function resetSearchForm(){
	$("#searchform").reset();
}

/**
 * 打开入户走访详细信息页面
 * @param {} zfid
 * @param {} opertype
 */
function openRhzfWin(zfid,opertype){
	var data = {"operType":opertype};
	if(zfid){
		data["query.id"] = zfid;
	}
	$.openWindow({
		url:contextPath + "/rhzf/toRhzfInfoPage.action",
		data:data,
		width:"750px",
		height:"600px"
	});
}

/**
 * 注销入户走访
 * @param {} zfid
 * @param {} opertype
 */
function cancelRhzf(zfid,opertype){
	if(confirm("确认注销?")){
		$.ajax({
			url:contextPath + "/rhzf/saveRhzf.action",
			data:{"zfxx.id":zfid,"operType":opertype},
			type:"post",
			dataType:"json",
			success:function(result){
				if(result){
					if(result.id){
						alert("注销成功.");
						queryRhzf();
					}else{
						alert("注销失败.");
					}
				}else{
					alert("注销失败.");
				}
			},
			error:function(){
				alert("请求错误.");
			}
		});
	}
}

/**
 * 导出入户走访
 */
function expRhzf(){
	$("#searchform").attr("action",contextPath + "/rhzf/expRgzf.action");
	$("#searchform").submit();
}