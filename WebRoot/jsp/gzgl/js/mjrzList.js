/**人员选择**/
function userSelect(orgcode,userleve,show,hidden) {
	if(userleve == 1){
		orgcode = orgcode.substr(0,2) + "0000000000";
	}else if(userleve == 2){
		orgcode = orgcode.substr(0,4) + "00000000";
	}else if(userleve == 3){
		orgcode = orgcode.substr(0,6) + "000000";
	}else if(userleve == 4){
		orgcode = orgcode.substr(0,8) + "0000";
	}
	
	openDwRySelect({rootOrgCode:orgcode, mutilSelect:false}, function (userbean) {
		if (userbean != null) {
			$("#" + hidden).val(userbean.username);
			$("#" + show).val(userbean.realname);
		}
	});
}


/* 打开日志汇总弹出层 */
var pcsRyDiv;
function openRzhzWin(){
	pcsRyDiv = $.layer({
	 	type:1,
	 	title:false,
	 	area:['400px','110px'],
	 	border: [0],
	 	shade: [0.5, '#000',true],
	 	closeBtn:[false],
	 	page: {
			dom: '#rzhzDiv' 
		}
	 });
	
	$("input[name='rizhiQuery.rzzq'][value='0']").attr("checked","checked"); 
	$("input[name='rizhiQuery.rzzq'][value='0']").trigger("click");
}
/*关闭日志汇总弹出层*/
function closeRzhzWin(){
	layer.close(pcsRyDiv);
}

/*日志汇总*/
function rzhz(){
 	var rzzq ;
	var rzzqObj = $("input[name='rizhiQuery.rzzq']");
	$.each(rzzqObj,function(index){
		if($(rzzqObj[index]).attr("checked") == "checked"){
			rzzq = $(rzzqObj[index]).val();
		}
	})
	
	//关闭汇总的弹出层
	closeRzhzWin();
	
	//打开汇总后的日志台账窗口
	$.openWindow({
		url:contextPath + "/gzgl/rzgl/toRzhzPage.action?" + $("#rzhz").serialize(),
		width:"760px",
		height:"800px"
	});
}

/*点击日志周期*/
function rzzqclick(){
	var rzzq = $("input[name='rizhiQuery.rzzq'][checked='checked']").val();
	var sysdate =$("#sysdate").val();
	//得到系统日期
	var now = new Date(sysdate.substr(0,4),Number(sysdate.substr(4,2)) - 1,sysdate.substr(6,2));
	//得到前一天
	now = new Date(now.getTime() - 24*60*60*1000);
	
	//周报
	if(rzzq == '0'){
		//截止时间填充为前一天
		$("#hz_endtime").val(now.getFullYear() + "-" + (Number(now.getMonth()) + 1) + "-" + now.getDate());
		
		//获取星期
		var day = now.getDay();
		if(day == 0){
			day = 7
		}
		var time = now.valueOf() - (day-1) * 24 * 60 * 60 * 1000;
		var newDate = new Date(time);
		//开始时间填充为周一
		$("#hz_starttime").val(newDate.getFullYear() + "-" + (Number(newDate.getMonth()) + 1) + "-" +  newDate.getDate());
	}else if(rzzq == '1'){//月报
		//截止时间填充为前一天
		$("#hz_endtime").val(now.getFullYear() + "-" + (Number(now.getMonth()) + 1) + "-" + now.getDate());
		
		//开始时间填写为1号
		now.setDate(1);
		$("#hz_starttime").val(now.getFullYear() + "-" + (Number(now.getMonth()) + 1) + "-" +  now.getDate());
		
	}
	
}

/*清空汇总表单*/
function clearHzForm(){
	$("input[name='rizhiQuery.rzzq'][checked='checked']").removeAttr("checked");
	$("#hz_starttime").val("");
	$("#hz_endtime").val("");
}

//清除汇总周期
function clearHzzq(){
	$("input[name='rizhiQuery.rzzq'][checked='checked']").removeAttr("checked");
}

