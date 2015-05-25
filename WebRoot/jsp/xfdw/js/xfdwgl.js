/*
派发
*/
function hzldPf(hzxh, ssdwdm){
	$.openWindow({
		url : contextPath + "/xfdw/hzld/toHzpfPage.action?t=" + new Date().getTime(),
		data :{"hzldBean.hzxh":hzxh,"hzldBean.ssdwdm":ssdwdm},
		width : 700,
		height : 500,
		callback:function(){
			queryHzld();
		}
	});
}

/*
打开火灾签收页面
*/
function openHzQs(hzxh){
	$.openWindow({
		url : contextPath + "/xfdw/hzld/toHzldPfPage.action?t=" + new Date().getTime(),
		data :{"hzldBean.hzxh":hzxh},
		width : 700,
		height : 500,
		callback:function(){
			//queryHzld();
		}
	});
}

/*
退回
*/
function hzldTh(hzxh){
	
	$.openWindow({
		url : contextPath + "/xfdw/hzld/toHzThPage.action?t=" + new Date().getTime(),
		data :{"hzldBean.hzxh":hzxh},
		width : 700,
		height : 500,
		callback:function(){
			
		}
	});
}

/**
打开详情
*/
function openDeail(hzxh){
	var data = {"queryBean.hzxh":hzxh};
	
	$.openWindow({
		url : contextPath + "/xfdw/hzld/toHzldDeailPage.action?t=" + new Date().getTime(),
		data :data,
		width : 960,
		height : 600,
		callback:function(){
			
		}
	});
}