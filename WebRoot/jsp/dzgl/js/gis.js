var MapServicesUrl = "";
function mapBjdw()
{
	var flag =1;	
	var obj={
		JCPTSTBH:'1',
		DZMC:$("#stmc").val(),
		STFL:$("#stfl").val(),
		DMCS:$("#dmcs").val(),
		DXCS:$("#dxcs").val(),
		JZJG:$("#jzjg").val(),
		KFS:$("#kfs").val(),
		WYGLDW:$("#wygldw").val(),
		ZBDW:$("#zbdw").val(),
		XFDJ:$("#xfdj").val(),
		GXSJ:new Date().pattern("yyyy/MM/dd HH:mm:ss"),
		XZQHDM:$("#xzqh").val(),
		XZQHBM:$("#xzqh").find("option:selected").text(),
		MPHM:$("#mph").val(),
		XQZ:$("#xqz").val(),
		LDXZ:$("#ldxz").val(),
		JLXDM:$("#jlxdm").val(),
		JLXBM:$("#jlxmc").val(),
		SQCWDM:$("#sqdm").val() + "",
		SQBM:$("#sqdm").find("option:selected").text(),
		GXDWDM:$("#djdwdm").val(),
		PCSMC:$("#djdwmc").val()
	};
	document.getElementById('MainMap').contentWindow.MapServices.url = MapServicesUrl;
  	document.getElementById('MainMap').contentWindow.autoMoveXY(flag,obj);
}

function getYX()
{
	var xyStr = document.getElementById('MainMap').contentWindow.Entity.saveFtr.overlay.toString();
	if (xyStr != null && xyStr != "")
	{
		var xyArr = xyStr.split(",");
		$("#xzb").val(xyArr[0]);
		$("#yzb").val(xyArr[1]);
	}
}

function autoMapDw()
{
	 
	var bzzdcj=
	{
		oid:'1',
		type:"Point",
		value:$("#xzb").val() + "," + $("#yzb").val(),
		data : {
			JCPTSTBH:$("#stbm").val(),
			DZMC:$("#stmc").val(),
			STFL:$("#stfl").val(),
			DMCS:$("#dmcs").val(),
			DXCS:$("#dxcs").val(),
			JZJG:$("#jzjg").val(),
			KFS:$("#kfs").val(),
			WYGLDW:$("#wygldw").val(),
			ZBDW:$("#zbdw").val(),
			XFDJ:$("#xfdj").val(),
			GXSJ:new Date().pattern("yyyy/MM/dd HH:mm:ss"),
			XZQHDM:$("#xzqh").val(),
			XZQHBM:$("#xzqh").find("option:selected").text(),
			MPHM:$("#mph").val(),
			XQZ:$("#xqz").val(),
			LDXZ:$("#ldxz").val(),
			JLXDM:$("#jlxdm").val(),
			JLXBM:$("#jlxmc").val(),
			SQCWDM:$("#sqdm").val() + "",
			SQBM:$("#sqdm").find("option:selected").text(),
			GXDWDM:$("#djdwdm").val(),
			PCSMC:$("#djdwmc").val()
		}
	};
	var feature={BZDZ:new Array()};
	feature.BZDZ.push(bzzdcj);
	document.getElementById('MainMap').contentWindow.MapServices.url = MapServicesUrl;
	document.getElementById('MainMap').contentWindow.Entity.bf_ftr={data:{DZMC:$("#stmc").val()}};
    document.getElementById('MainMap').contentWindow.Entity.approvedEntity_call(feature);
}

$(function(){
	var operType = $("#operType").val();
	if (operType == "update")
	{
		
	}
});