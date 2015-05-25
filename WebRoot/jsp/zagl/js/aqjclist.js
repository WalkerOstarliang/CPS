/**查询安全检查列表**/
function queryAqjcList(){
	$("#aqjcList").query("F", "queryForm");
}

function czop(trobj,data){
	var html="<span class=\"cps_span_href\" onclick=\"openAqjcDetail('" + data.jlbh + "','" 
				+ data.jgbh + "','" 
				+ data.hylb + "','" 
				+ data.dwfl + "','" 
				+ data.sfnbgl + "','" 
				+ data.sfzagl + "','"
				+ data.dwmc + "')\">详情</span>&nbsp;";
	return html;
}


//打开安全检查详情
function openAqjcDetail(jlbh,jgbh,hylb,dwfl,sfnbgl,sfzagl,dwmc){
	//打开内保安全检查页面
	if(sfnbgl == '1' && dwfl){
		$.openWindow({
			url:contextPath + "/nbdwaqjc/toAqjcPage.action",
			data : 
			{
				"aqjc.id":jlbh,
				"jgbh" : jgbh,
				"dwmc" : dwmc,
				"dwlb" : dwfl,
				"operType" : "detail"
			},
			width:1000,
			height:800
		});
	}
	//打开危爆单位检查页面
	else if(sfzagl == '1' && hylb.indexOf('04') != -1 && dwfl){
		var url;
		var data_param;
		if(dwfl == '6'){//枪支
			url = contextPath + "/sydw/wbdwgl/toAqjcWbdw.action";
			data_param = {"qzjcBean.jgbh" : jgbh,"qzjcBean.id" : jlbh,"operType":"detail"};
		}else if(dwfl == '3' || dwfl == '4' ){//剧毒化学
			url = contextPath + "/sydw/wbdwgl/toJdhxWbdw.action";
			data_param = {"jdhxBean.jgbh" : jgbh,"jdhxBean.id" : jlbh,"operType":"detail"};
			//data_param = {"jdhxBean.jgbh" : jgbh,"dwlb" : dwfl};
		}
		else if(dwfl == '2' || dwfl == '5'){//易制爆危险化学
			url = contextPath + "/sydw/wbdwgl/toWxhxWbdw.action";
			data_param = {"wxhxBean.jgbh" : jgbh,"wxhxBean.id" : jlbh,"operType":"detail"};
			//data_param = {"wxhxBean.jgbh" : jgbh,"dwlb" : dwfl};
		}
		if(url && data_param){
			$.openWindow({
			url:url,
			data:data_param,
			width:1000,
			height:800
		});
		}
	}
	//打开一般单位检查页面
	else{
		$.openWindow({
			url:contextPath + "/zagl/dw/toAqjcDetail.action",
			data:{"dw.aqjc.jlbh":jlbh},
			width:900,
			height:600
		});
	}
}

//导出安全检查
function downloadAqjcExcel(){
	$("#queryForm").attr("action",contextPath + "/zagl/dw/downloadAqjc.action");
	$("#queryForm").attr("method","post");
	$("#queryForm").attr("target","exportiframe");
	$("#queryForm").submit();
	$("#queryForm").attr("action","");
	$("#queryForm").removeAttr("target");
}

//把货物类别填充到单位分类
function clickAqjcdjBtn()
{
	//机构编号
	var jgbh;
	//单位名称
	var dwmc;
	//单位分类
	var dwfl;
	//行业类别
	var hylb;
	//是否内保管理
	var sfnbgl;
	//是否治安管理
	var sfzagl;
	
	var selectes = $("#aqjcList").getSelected();
	
	if (selectes.length > 0)
	{
		jgbh = selectes[0]["jgbh"];
		dwfl = selectes[0]["dwfl"];
		hylb = selectes[0]["hylb"];
		sfnbgl = selectes[0]["sfnbgl"];
		sfzagl = selectes[0]["sfzagl"];
		dwmc = selectes[0]["dwmc"];
		
		//打开内保单位检查
		if(sfnbgl == '1' && dwfl){
			$.openWindow({
				url:contextPath + "/nbdwaqjc/toAqjcPage.action",
				data : 
				{
					"jgbh" : jgbh,
					"dwmc" : dwmc,
					"dwlb" : dwfl,
					"operType" : "add"
				},
				width:1000,
				height:800
			});
		}
		//打开危爆单位检查页面
		else if(sfzagl == '1' && hylb.indexOf('04') != -1 && dwfl){
			var url;
			var data_param;
			if(dwfl == '6'){//枪支
				url = contextPath + "/sydw/wbdwgl/toAqjcWbdw.action";
				data_param = {"qzjcBean.jgbh" : jgbh,"dwlb" : dwfl};
			}else if(dwfl == '3' || dwfl == '4' ){//剧毒化学
				url = contextPath + "/sydw/wbdwgl/toJdhxWbdw.action";
				data_param = {"jdhxBean.jgbh" : jgbh,"dwlb" : dwfl};
			}
			else if(dwfl == '2' || dwfl == '5'){//易制爆危险化学
				url = contextPath + "/sydw/wbdwgl/toWxhxWbdw.action";
				data_param = {"wxhxBean.jgbh" : jgbh,"dwlb" : dwfl};
			}
			if(url && data_param){
				$.openWindow({
					url:url,
					data:data_param,
					width:1000,
					height:800
				});
			}
		}
		//打开一般单位检查页面
		else{
			$.openWindow({
				name : "aqjcwin",
				url : contextPath + "/sydw/dwgl/sydw/dwgl/toOpenPage.action",
				width:1000,
				height:740,
				data : {
					"operType" : "add",
					"dwBean.dwjbxx.jgbh" : jgbh,
					"dwBean.dwjbxx.dwmc" : dwmc,
					"page" : "aqjcinfo"
				}
			});
		}
	}
	else
	{
		alert("请选择一条安全检查记录.")
	}
}