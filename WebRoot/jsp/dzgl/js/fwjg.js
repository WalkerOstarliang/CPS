function loadFwjgList()
{
	var dyh = $("input[name='fwjgdyh']:checked").val();
	loadFwjgPage(dyh);
}
function loadFwjgPage(dyh)
{
	var stid = $("#stid").val();
	$.post(contextPath + "/dzgl/dzxx/loadFwlcjgPage.action",{stid : stid, dyh:dyh,operType : operType},function(datahtml){
		$("#lcxxdiv").html(datahtml);
		$(".fw_list_a").find("div[id^=menu_]").click(function(){
			
			//alert($(document).height() + "===" + $("body").height() + "==" + $(window).height())
			
			var fwid = $(this).attr("fwid");
			var czoffset =  $(this).offset();
			//窗口的高度
			var docheight = $(window).height();
			//菜单的高度
			var menuheight = $("#rightMenu_" + fwid).height();
			$("#rightMenu_" + fwid).css("top","").css("left","");
			//操作按钮的位置高度 + 菜单的高度 如果大于窗口的高度则菜单向上显示
			if (czoffset.top + menuheight>(docheight-20))
			{
				$("#rightMenu_" + fwid).css("top",czoffset.top -menuheight-5).css("left",czoffset.left)
			}
			else
			{
				$("#rightMenu_" + fwid).css("top",czoffset.top +20).css("left",czoffset.left)
			}
			$(".fw_drop").hide();
			$("#rightMenu_" + fwid).show();
		})
		$(document).click(function(e){
			if (e.target.id.indexOf("img_") == -1)
			{
				$(".fw_drop").hide();
			}
		})
	});
}
var layeri;
function openNewFwlc()
{
	var stid = $("#stid").val();
	if (!$.isBlank(stid))
	{
		layeri = $.layer({
			type: 1,
			title: "请输入楼层号",
			closeBtn : false,
			border : [5, 0.5, '#666', true],
			area: ['368px','auto'],
			page: {
				dom : "#pleaselchwin"
			}
		});
	}
	else
	{
		alert("请先保存实体楼栋信息");
	}
}

function addFwlc()
{
	
	var str = $("#layerlch").val();
	if (str != null && str != "")
	{
		var dmcs = $("#dmcs").val();
		if (parseInt(str) > parseInt(dmcs))
		{
			alert("该楼栋最大层数为" + dmcs + "层，你输入的层数不能大于" + dmcs)
			return false;
		}
		else
		{
			var isexistslc = false;
			$("#lcxxdiv").find(".fw_lc").each(function(){
				var value = $(this).attr("value");
				if (value == str)
				{
					isexistslc = true;
					return false;
				}
			})
			if (isexistslc)
			{
				alert("该楼层已经存在，不能重复添加。");
				return false;
			}
			
		}
		$("#lcxxdiv").prepend("<div class=\"fw_lc\" value=\"" +str + "\">" +
			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" + 
			"<tr>" +
			"<td class=\"fw_lc_a\">第<br/>" + str + "<br />层</td>" + 
			"<td>" + 
			"<div class=\"fw_list\">" + 
			"<div class=\"fw_list_add\"><a href=\"#\"  onclick=\"openNewFwJgInfoWin('add','" + str + "')\"><img src=\"" + contextPath + "/jsp/dzgl/images/fw_add.jpg" + "\" title=\"添加房屋\" /></a></div>" + 
			"<div style=\"clear:both;\"></div>" + 
			"</div>" +
			"</td>" +
			"</tr>" +
			"</table>" +
			"</div>");
		layer.close(layeri);
	}
	else
	{
		alert("请输入楼层号。");
	}
}

function closeLchWin()
{
	layer.close(layeri);
}

function openJzrkxxwin(fwid)
{
	layeri=$.layer({
		title : "居住人员信息",
	    type : 2,
	    move : false,
	    iframe : {
	    	src : contextPath+"/dzgl/dzxx/toFwrkShowPage.action?fwid="+fwid
	    },
	    area : ['900px' , '500px'],
		offset : ['100px','']
	});
}
 

function openCzfwDjInfoWin(fwid)
{
	if (!$.isBlank(fwid))
	{
		layerObj=$.layer({
			title : "出租房记录",
		    type : 2,
		    move : false,
		    iframe : {
		    	src : contextPath+"/lsgl/fw/toCzfwInfo.action?closeParentWin=false&fwBean.czfwBean.fwbh="+fwid+"&fwBean.cqlx=2"
		    },
		    area : ['900px' , '400px'],
			offset : ['100px','']
		});
	}
}

function openAddSyrkInfoWin(fwid)
{
	$.openWindow({
		name : "rkwin",
		url : contextPath + "/lsgl/rk/toSyrkInfoPage.action",
		width:1000,
		height:700,
		data : 
		{
			"operType":"add",
			"queryBean.fwid" : fwid
		}
	});
}


function openJwrkInfoWin(fwid)
{
	$.openWindow({
		name : "jwrkwin",
		url : contextPath + "/lsgl/rk/toRkInfoPage.action",
		width : 1000,
		height : 760,
		data : {
			operType : "add",
			"queryBean.rylb":"4",
			"queryBean.fwid":fwid
		}
	});
}


function openSyrkDwInfoWin(fwid)
{
	
	$.openWindow({
		url : contextPath + "/sydw/dwgl/toDwInfoPage.action",
		data : {
			"operType" : "add",
			"queryBean.fwid" : fwid
		},
		width:1000,
		height:700
	})
}

function zxCzFwInfo(fwid){
	if(confirm("确认要注销该出租房屋信息吗?"))
	{
		$.ajax({
			url:contextPath +"/lsgl/fw/deleteCzFwInfo.action",
			type:"post",
			dataType:"json",
			data:{
				"fwBean.fwid":fwid
			},
			success:function(msg){
				if(msg){
					alert("出租房屋注销成功.");
					loadFwjgList();
				}else{
					alert("该出租房屋下面有人员存在，不能注销.");
				}
			}
		})
	}
}

function zxFwInfo(fwid)
{
	if(confirm("确认要注销该房屋信息吗?"))
	{
		$.ajax({
			url:contextPath +"/lsgl/fw/deleteFwjbxx.action",
			type:"post",
			dataType:"json",
			data:{
				"fwBean.fwid":fwid
			},
			success:function(msg){
				if(msg){
					alert("房屋注销成功.");
					loadFwjgList();
				}else{
					alert("该房屋下面有人员存在，不能注销.");
				}
			}
		})
	}
}

function openNewFwJgInfoWin(operType,lch)
{
	var stid = $("#stid").val();
	if(stid =='' || stid ==null){
		alert("请先保存实体基本信息");
		return;
	}
	var dyh = $("input[name='fwjgdyh']:checked").val();
	$.openWindow({
		name : "fwwin",
		url : contextPath + "/lsgl/fw/toFwInfoPage.action",
		width:1000,
		height:720,
		data : {
			operType : operType,
			"queryBean.sfczw" : "0",
			"queryBean.lch" : lch != undefined && lch != null ? lch : "",
			"queryBean.dyh" : dyh,
			"queryBean.stid" : stid
		}
	});
}

function callbackSqSelect()
{
	var x = $("#xzb").val();
  	var y = $("#yzb").val();
  	var sqdm = $("#sqdm").attr("initValue");
  	if (sqdm != null && sqdm !="")
  	{
  	 	showMapService(sqdm);
	}
	document.getElementById("MainMap").contentWindow.localAtCent('',x,y,18);
}

function clickStxxBz(url)
{
	layeri = $.layer({
		type: 1,
		title: "实体信息标注",
		border : [5, 0.5, '#666', true],
		area : ['980px' , '650px'],
		offset : ['30px',''],
		page: {
			dom : "#mapdiv"
		},
		success : function()
		{
			$("#MainMap").attr("src",url);
			//setTimeout("callbackSqSelect()",5000);
		}
	});
}