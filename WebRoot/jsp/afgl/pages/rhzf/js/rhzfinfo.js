/**
 * 保存入户走访
 */
function saveRhzf(){
	if($.validateform("rhzfform")){
		$("#rhzfform").ajaxSubmit({
			url:contextPath + "/rhzf/saveRhzf.action",
			type:"post",
			dataType:"json",
			success:function(result){
				if(result){
					if(result.id){
						$("#id").val(result.id);
						$("#rhzfry_old").val(result.rhzfry_old);
						alert("保存成功.")
					}else{
						alert("保存失败.")
					}
				}else{
					alert("保存失败.")
				}
			}
		});
	}
}

/**
 * 地址选择
 */
function dzselect(){
	$.openDialogWindow({
		url : contextPath + "/lsgl/fw/toSelectFwWin.action",
		width:900,
		height:650,
		data : {
			"queryBean.rylb":"2",
			"queryBean.selectType" : "select", 
			t: new Date().getTime()
		},
		callback : function(resultObj)
		{
			if (resultObj)
			{
				var fwxxBean = resultObj["fwxxBean"];
				$("#dzid").val(fwxxBean["dzid"]);
				$("#dzmc").val(fwxxBean["dzmc"]);
				$("#fwid").val(fwxxBean["fwid"]);
				refreshZfryList();
			}
		}
	});
}

/**
 * 刷新走访人员列表
 */
function refreshZfryList(){
	var zfid = $("#id").val();
	var dzid = $("#dzid").val();
	if(dzid){
		$.ajax({
			url:contextPath + "/rhzf/refreshZfryList.action",
			data:{"query.dzid":dzid,"query.id":zfid},
			type:"post",
			dataType:"json",
			success:function(result){
				clearZfryList();
				fullZfryList(result);
			},
			error:function(){
				alert("请求错误.");
			}
		});
	}else{
		alert("请先选择地址");
	}
}

/**
 * 清除走访人员list
 */
function clearZfryList(){
	$("#zfryTab").find("tr[id^=datarow]").remove();
}

/**
 * 填充走访人员list
 */
function fullZfryList(datalist){
	var html = "";
	$.each(datalist,function(i,data){
		var isChecked = "";
		if(data["sfjm"]){
			if(data["sfjm"] != "null" && data["sfjm"] == "1"){
				isChecked = "checked=\"checked\"";
			}
		}
		
		html += "<tr id=\"datarow" + eval(Number(i)+1) + "\">";
		html += "<td style=\"text-align:center\">" + eval(Number(i)+1) + "</td>";
		//html += "<td style=\"text-align:left\">" + data["cz"] + "</td>";
		html +="<td style=\"text-align:left\">"; 
		html += "<span onclick=\"openSyrkInfoPage('rydaxx','" + data["rybh"] + "','" + data["rylb"] + "')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;"; 
		if($("#opertype").val() != "detail" && $("#userLeve").val() == "5"){
			html += "<span onclick=\"openRkInfo('update','" + data["rkid"] + "','" + data["rybh"] + "','" + data["rylb"] + "','" + data["rkfwglid"] + "')\" style=\"color:green\" class=\"cps_span_href\">修改</span>";
		}
		html += "</td>";
		html += "<td style=\"text-align:left\">" + data["xm"] + "</td>";
		html += "<td style=\"text-align:center\">" + data["sfzh"] + "</td>";
		html += "<td style=\"text-align:left\">" + data["hjdxz"] + "</td>";
		html += "<td style=\"text-align:left\">" + data["lxdh"] + "</td>";
		html += "<td style=\"text-align:center\">";
		html += "<input type=\"checkbox\" name=\"zfxx.zfryList[" + i+ "].sfjm\" value=\"1\"" + isChecked + " />";
		html += "<input type=\"hidden\" name=\"zfxx.zfryList[" + i+ "].rybh\" value=\"" + data["rybh"] + "\" />";
		html +="</td>";
		html += "</tr>";
	});
	$("#zfryTab").append(html);
}

/**
 * 打开实有人口详情
 * @param {} operType
 * @param {} rybh
 * @param {} rylb
 */
function openSyrkInfoPage(operType, rybh, rylb)
{
	var rybh = rybh == undefined ? "" : rybh;
	$.openWindow({
		url : contextPath + "/lsgl/rk/toRkInfoPage.action",
		data : {"operType" : operType,"queryBean.rybh" : rybh,"queryBean.rylb" :rylb,  t:new Date().getTime()},
		width : 1000,
		height : 760
	});
}

/**
 * 打开实有人口修改
 * @param {} operType
 * @param {} rkid
 * @param {} rybh
 * @param {} rylb
 * @param {} rkfwglid
 */
function openRkInfo(operType,rkid,rybh,rylb,rkfwglid)
{
	var newrkid = (rkid == undefined || rkid == null) ? "" : rkid;
	var newrybh = (rybh == undefined || rybh == null) ? "" : rybh;
	var rkfwglid = (rkfwglid == undefined || rkfwglid == null) ? "" : rkfwglid;
	if (rylb != "4")
	{	
		$.openWindow({
			name : "rkwin",
			url : contextPath + "/lsgl/rk/toRyInfoUpdatePage.action",
			data : {
				"operType" : operType,
				"queryBean.rkid":newrkid,
				"queryBean.rybh" : newrybh,
				"queryBean.rylb" :rylb,
				"queryBean.rkfwglid" : rkfwglid,
				t:new Date().getTime()
			},
			width : 1000,
			height : 760
		});
	}
	else
	{
		$.openWindow({
			name : "rkwin",
			url : contextPath + "/lsgl/rk/toRkInfoPage.action",
			data : {
				"operType" : operType,
				"queryBean.rkid":newrkid,
				"queryBean.rybh" : newrybh,
				"queryBean.rylb" :rylb,
				"queryBean.rkfwglid" : rkfwglid,
				t:new Date().getTime()
			},
			width : 1000,
			height : 760
		});
	}
}

/**
 * 打开实有人口新增
 * @param {} operType
 * @param {} rylb
 */
function openSyrkRkInfo(operType, rylb)
{
	var fwid = $("#fwid").val();
	if(fwid){
		if (rylb != "4")
		{
			$.openWindow({
				name : "win",
				url : contextPath + "/lsgl/rk/toSyrkInfoPage.action",
				width : 1000,
				height : 760,
				data : {
					operType : operType,
					"queryBean.rylb":rylb,
					"queryBean.fwid":fwid,
					t:new Date().getTime()
				}
			});
		}
		else
		{
			$.openWindow({
				name : "win",
				url : contextPath + "/lsgl/jwrk/toJwrkQueryPage.action",
				width : 1000,
				height : 760,
				data : {
					operType : operType,
					"queryBean.rylb":rylb,
					"queryBean.fwid":fwid,
					t:new Date().getTime()
				}
			});
		}
	}
	else
	{
		alert("请先选择地址.");
	}
}

$(function(){
	if($("#opertype").val() == 'detail'){
		$("#rhzfpanel").displayInputForText();
		$("#zfsj").attr("disabled","disabled");
	}
})