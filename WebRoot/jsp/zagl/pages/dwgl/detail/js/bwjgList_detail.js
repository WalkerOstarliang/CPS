//保卫机构
function openBwjgDetail(tr,data){
	openBwjg("toBwjg",data.jgbh,data.bwjgbh);
}

//保卫制度
function openBwzd(tr,data){
	openBwjg("toBwzd",data.jgbh,data.zdbh);
}

//保卫建议书
function openBwjys(tr,data){
	openBwjg("toBwjys",data.jgbh,data.jysbh);
}

function openBwjg(url,jgbh,pk){
	$.openWindow({
		url : contextPath + "/zagl/dw/" + url + ".action",
		width:600,
		height:300,
		data : {"jgbh":jgbh,"operType":"detail","dw.bwjg.bwjgbh":pk,
				"dw.bwzd.zdbh":pk,"dw.bwjys.jysbh":pk,"t": new Date().getTime()},
		callback : function(result){
			return;
		}
	});
}
