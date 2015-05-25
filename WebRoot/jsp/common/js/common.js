/**
 * 数据库文件下载
 * @param {Object} tableName 表明
 * @param {Object} pkfield 主键字段名称
 * @param {Object} blobfield 大字段名称
 * @param {Object} pid 主键值
 * @param {Object} fileName 生成的文件名称
 */
function dbFileDown(tableName,pkfield,blobfield,pid,fileName)
{
	var url = contextPath + "/download.action?tableName=" + tableName + "&pkfield=" + pkfield + "&blobfield=" + blobfield + "&pid=" + pid + "&fileName=" + fileName;
	window.location.href = url;
}

/**
 * 文件系统文件下载
 * @param {Object} filePath 文件路径 指的是上下文的路径
 * @param {Object} fileName 下载后生成的文件名
 */
function zipFieldDown(filePath, fileName)
{
	window.location.href = contextPath + "/download.action?filePath=" + encodeURIComponent(filePath) + "&fileName=" + fileName;
}

/**
 *  远程数据
 *  通过远程调用查询人员信息，
 *  数据返回java对象CzrkInfoBean 对应的json对象
 * @param {object} sfzh 身份证号
 * @param {object} callback 回答函数
 */
function queryRemoteRyxxBean(sfzh, callback) 
{
	if (!$.isBlank(sfzh) && isSfzh(sfzh))
	{
		$.ajax({
			type:"post", 
			url:contextPath+"/czrkcommon/queryRyxxBean.action", 
			data:"sfzh=" + sfzh, 
			dataType : "json",
			success:function (czrkInfoBean) 
			{
				if ($.isFunction(callback)) 
				{
					callback(czrkInfoBean);
				}
		}});
	}
}

/**
 * 本地人口查询
 * 通过身份证号码查找人员基本信息，查询的数据来源于t_lsgl_rk_jbxx
 * 返回 Java 对象对应  RkJbxxBean 的json对象
 * @param {Object} sfzh 身份证号码
 * @param {Object} callback 回调函数
 */
function queryRkJbxxBeanBySfzh(sfzh, callback)
{
	if (!$.isBlank(sfzh) && isSfzh(sfzh))
	{
		$.ajax({
			url : contextPath + "/czrkcommon/queryRkJbxxBeanBySfzh.action",
			data:"sfzh=" + sfzh,
			dataType : "json",
			success : function(rkJbxxBean)
			{
				if ($.isFunction(callback))
				{
					callback(rkJbxxBean);
				}
			}
		});
	}
}

/**
 * 查询人口信息综合本地查询以及远程调用
 * @param {Object} sfzh
 * @param {Object} callback
 */
function queryRkBean(sfzh, callback)
{	
	if (!$.isBlank(sfzh) && isSfzh(sfzh))
	{
		$.ajax({
			url : contextPath + "/czrkcommon/queryRkBean.action",
			data:"sfzh=" + sfzh,
			dataType : "json",
			success : function(czrkxxBean)
			{
				if ($.isFunction(callback))
				{
					callback(czrkxxBean);
				}
			}
		});
	}
}

/**
 * 
 * @param {Object} params
 * {
 * 	    rootOrgCode : 0,
 *      mutilSelect : true
 * }
 */
function openDwRySelect(params,callback)
{
	$.openDialogWindow({
		url : contextPath  + "/cps/toDwrySelectPage.action?t=" + new Date().getTime()+ "&" + $.param(params),
		width : 800,
		height:600,
		scroll:false,
		callback : function(userBeans)
		{
			if ($.isFunction(callback))
			{
				callback(userBeans);
			}
		}
	});
}

/**
 * 
 * @param {Object} params
 * {
 * 	 	rootOrgCode : 0,
 *      mutilSelect : true,
 *      nodeSelectedType : "ps",
 *      nodeNotSelectedType : "ps"
 * }
 * @param {Object} callback
 */
function openDwSelect(params,callback)
{
	$.openDialogWindow({
		url : contextPath + "/cps/toDwSelectPage.action?t=" + new Date().getTime() + "&" + $.param(params),
		width : 400,
		height : 500,
		scroll : false,
		callback : function(orgBeans)
		{
			if ($.isFunction(callback))
			{
				callback(orgBeans);
			}
		}
	});
}

function openDwSelect2(params,callback)
{
	$.openDialogWindow({
		url : contextPath + "/cps/toDwSelectPage2.action?t=" + new Date().getTime() + "&" + $.param(params),
		width : 400,
		height : 500,
		scroll : false,
		callback : function(orgBeans)
		{
			if ($.isFunction(callback))
			{
				callback(orgBeans);
			}
		}
	});
}

/**
**流口协管员专用
**/
function openDwSelect3(params,callback)
{
	$.openDialogWindow({
		url : contextPath + "/cps/toDwSelectPage3.action?t=" + new Date().getTime() + "&" + $.param(params),
		width : 400,
		height : 500,
		scroll : false,
		callback : function(orgBeans)
		{
			if ($.isFunction(callback))
			{
				callback(orgBeans);
			}
		}
	});
}

/**
 * 
 * @param {Object} params
 * {
 * 	 	rootOrgCode : 0,
 *      mutilSelect : true,
 *      nodeSelectedType : "ps",
 *      nodeNotSelectedType : "ps"
 * }
 * @param {Object} callback
 */
function openXzqhTree(params,callback)
{
	$.openDialogWindow({
		url : contextPath + "/cps/toXzqhTreePage.action?t=" + new Date().getTime() + "&" + $.param(params),
		width : 400,
		height : 500,
		scroll : false,
		callback : function(xzqhBeans)
		{
			if ($.isFunction(callback))
			{
				callback(xzqhBeans);
			}
		}
	});
}

/**
 * 获取所有的孩子节点
 * @param {Object} orgcode
 * @param {Object} leve
 * @param {Object} callback
 */
function getOrgChildOrgListByParentCode(orgcode, leve,callback)
{
	$.ajax({
		type : "post",
		url : contextPath + "/cps/queryOrgChildOrgListByParentCode.action",
		data : {rootOrgCode : orgcode, leve : leve},
		dataType : "json",
		success : function(orgList)
		{
			if ($.isFunction(callback))
			{
				callback(orgList);
			}
		}
	})
}

/**
 * 级联加载县区行政区划
 * @param {Object} value
 * @param {Object} countrydmselect
 */
function doubleSelectCountry(value,countrydmselect,callback,defaultvalue)
{
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/cps/common/loadChildXzqh.action",
		data : "xzqhdm=" + value,
		success : function(countryList)
		{
			if (countrydmselect != null && countrydmselect != "")
			{
				var width = $("#" + countrydmselect).width();
				$("#" + countrydmselect).empty();
				if (countryList != null && countryList.length > 0)
				{
					$("#" + countrydmselect).append("<option value=''> </option>");
					$.each(countryList,function(i,countryObj){
						if (defaultvalue != undefined)
						{
							if (defaultvalue == countryObj["dm"])
							{
								$("#" + countrydmselect).append("<option value='" + countryObj["dm"] + "' selected='selected'>" + countryObj["mc"] + "</option>");
							}
							else
							{
								$("#" + countrydmselect).append("<option value='" + countryObj["dm"] + "'>" + countryObj["mc"] + "</option>");
							}
						}
						else
						{
							$("#" + countrydmselect).append("<option value='" + countryObj["dm"] + "'>" + countryObj["mc"] + "</option>");
						}
					});
				}
			}
			
			if ($.isFunction(callback))
			{
				callback(countryList);
			}
		}
	});
}

function doubleSelectPcs(value, pcsdmselect,callback)
{
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/cps/common/loadCountryPcs.action",
		data : "xzqhdm=" + value,
		success : function(pcsList)
		{
			
			if (pcsdmselect != null && pcsdmselect != "")
			{
				var width = $("#" + pcsdmselect).width();
				$("#" + pcsdmselect).empty();
				if (pcsList != null && pcsList.length > 0)
				{
					$("#" + pcsdmselect).append("<option value=''> </option>");
					$.each(pcsList,function(i,pcsObj){
						$("#" + pcsdmselect).append("<option value='" + pcsObj["orgcode"] + "'>" + pcsObj["orgjc"] + "</option>");
					});
				}
			}
			if ($.isFunction(callback))
			{
				callback(pcsList);
			}
		}
	});
}

/**
 * 
 * @param {Object} pcsdm
 * @param {Object} jwsdmselect
 * @param {Object} callback
 */
function doubleSelectJWS(value, jwsdmselect,callback)
{
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/cps/common/loadJwcByPcs.action",
		data : "orgcode=" + value,
		success : function(jwslist)
		{
		    if (jwsdmselect != null && jwsdmselect != "")
		    {
		    	var width = $("#" + jwsdmselect).width();
				$("#" + jwsdmselect).empty();
				if (jwslist != null && jwslist.length > 0)
				{
					$("#" + jwsdmselect).append("<option value=''> </option>");
					$.each(jwslist,function(i,jwsObj){
						$("#" + jwsdmselect).append("<option value='" + jwsObj["orgcode"] + "'>" + jwsObj["orgjc"] + "</option>");
					});
				}
				//$("#" + jwsdmselect).width(width);
			}
			if ($.isFunction(callback))
			{
				callback(jwslist);
			}
			
		}
	})
}

function doubleSelectJdxz(xzqhdm,jdxzselect,callback,defaultvalue)
{
	if (xzqhdm == null || xzqhdm == undefined || xzqhdm == "undefined")
	{
		xzqhdm = "";
	}
	var xzqh12 = xzqhdm;
	if (xzqhdm.length == 6)
	{
		xzqh12 = xzqhdm + "000000";
	}
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/cps/common/loadJdxzByXzqhParentDm.action",
		data : "xzqhdm=" + xzqh12,
		success : function(list)
		{
			$("#" + jdxzselect).empty();
			if (list != null && list.length > 0)
			{
				$("#" + jdxzselect).append("<option value=''> </option>");
				$.each(list, function(i, obj){
					if (defaultvalue != undefined)
					{
						if (defaultvalue == obj["dm"])
						{
							$("#" + jdxzselect).append("<option value='" + obj["dm"] + "' selected='selected'>" + obj["jc"] + "</option>");
						}
						else
						{
							$("#" + jdxzselect).append("<option value='" + obj["dm"] + "'>" + obj["jc"] + "</option>");
						}
					}
					else
					{
						$("#" + jdxzselect).append("<option value='" + obj["dm"] + "'>" + obj["jc"] + "</option>");
					}
				});
			}
			if ($.isFunction(callback))
			{
				callback(list);
			}
		}
	})
}

/**
 * 加载社区信息通过派出所代码
 */
function doubleSelectSqxxByPcsdm(pcsdm,sqdmselect,callback)
{
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/afgl/sqjbgl/loadSqJbxxBeanListByPcsdm.action",
		data : "pcsdm=" + pcsdm,
		success : function(sqxxlist)
		{
			if (sqdmselect != null && sqdmselect != "")
			{
				var width = $("#" + sqdmselect).width();
				$("#" + sqdmselect).empty();
				if (sqxxlist != null && sqxxlist.length > 0)
				{
					$("#" + sqdmselect).append("<option value=''> </option>");
					$.each(sqxxlist,function(i,jwsObj){
						$("#" + sqdmselect).append("<option value='" + jwsObj["sqbh"] + "'>" + jwsObj["jc"] + "</option>");
					});
				}
			}
			if ($.isFunction(callback))
			{
				callback(sqxxlist);
			}
		}
	})
}

/**
 * 同警务室代码加载社区
 * @param {Object} jwsdm
 * @param {Object} selectid
 * @param {Object} callback
 */
function doubleSelectSqxxByJwsdm(jwsdm,selectid,callback)
{
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/afgl/sqjbgl/loadSqJbxxBeanListByJwsdm.action",
		data : "jwsdm=" + jwsdm,
		success : function(list)
		{
			if (selectid != null && selectid != "")
			{
				var width = $("#" + selectid).width();
				$("#" + selectid).empty();
				if (list != null && list.length > 0)
				{
					$("#" + selectid).append("<option value=''> </option>");
					$.each(list,function(i,obj){
						$("#" + selectid).append("<option value='" + obj["sqbh"] + "'>" + obj["jc"] + "</option>");
					});
				}
			}
			if ($.isFunction(callback))
			{
				callback(list);
			}
		}
	})
}

/**
 * 通过乡镇街道加载社区
 * @param {Object} jdxzdm 街道乡镇代码
 * @param {Object} selectid 级联下拉框
 * @param {Object} callback
 */
function doubleSelectSqByJdxzdm(jdxzdm,selectid,callback,defaultvalue)
{
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/cps/common/loadSqxxByJdxzdm.action",
		data : "xzqhdm=" + jdxzdm,
		success : function(list)
		{
			if (selectid != null && selectid != "")
			{
				var width = $("#" + selectid).width();
				$("#" + selectid).empty();
				if (list != null && list.length > 0)
				{
					$("#" + selectid).append("<option value=''> </option>");
					$.each(list,function(i,obj){
						if (defaultvalue == obj["dm"])
						{
							$("#" + selectid).append("<option value='" + obj["dm"] + "' selected='selected'>" + obj["jc"] + "</option>");
						}
						else
						{
							$("#" + selectid).append("<option value='" + obj["dm"] + "'>" + obj["jc"] + "</option>");
						}
					});
					if (list.length == 1)
					{
						try{
                         $("#" + selectid).find("option:last").attr("selected","selected");
                        }catch(e){
                        }
					}
				}
			}
			if ($.isFunction(callback))
			{
				callback(list);
			}
		}
	});
}

/**
 * 选择社区
 * @param {Object} callback
 */
function openSqxxSelectWin(callback)
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
			if ($.isFunction(callback))
			{
				callback(sqjbxxBean);
			}
		}
	})
}

/**
 * 选择小区
 * @param {Object} sqbh
 * @param {Object} xqselect
 * @param {Object} callback
 */
function doubleXqxxListBySqbh(sqbh,xqselect,callback)
{
	$.ajax({
		type : "post",
		url : contextPath + "/cps/common/findXqxxListBySqbh.action",
		data : "sqbh=" + sqbh,
		dataType : "json",
		success : function(xqxxBeanList)
		{
			if (xqselect != null && xqselect != "")
			{
				var width = $("#" + xqselect).width();
				$("#" + xqselect).empty();
				if (xqxxBeanList != null && xqxxBeanList.length > 0)
				{
					$("#" + xqselect).append("<option value=''> </option>");
					$.each(xqxxBeanList,function(i,obj){
						$("#" + xqselect).append("<option value='" + obj["xqbh"] + "'>" + obj["xqmc"] + "</option>");
					});
				}
				//$("#" + xqselect).width(width);
			}
			if ($.isFunction(callback))
			{
				callback(xqxxBeanList);
			}
		}
	})
}

/**
 * 查询人员信息
 * 返回参数对应RyxxBan
 */
function queryRyxxBean(sfzh, callback) {
	$.ajax({
		type:"post", 
		url:contextPath+"/czrkcommon/queryRyxxBean.action", 
		data:"sfzh=" + sfzh, 
		dataType : "json",
		success:function (ryxxBean) 
		{
			if ($.isFunction(callback)) 
			{
				callback(ryxxBean);
			}
	}});
}


/**
 * 通过警务室代码加载派出所
 * @param {Object} jwsdm
 * @param {Object} callback
 */
function callbackPcsBeanByJwsdm(jwsdm, callback)
{
	$.ajax({
		url : contextPath + "/cps/common/findPcsOrgBeanByJwsdm.action",
		dataType : "json",
		data : "orgcode=" + jwsdm,
		success : function(orgBean)
		{
			if ($.isFunction(callback))
			{
				callback(orgBean);
			}
		}
	})
}

/**
 * 通过警务室代码找对应的社区民警
 * @param {Object} jwsdm
 * @param {Object} callback
 */
function callbackJwsMjBeanListByJwsdm(jwsdm,callback)
{
	$.ajax({
		url : contextPath + "/cps/common/findSqmjBeanListByJwsdm.action",
		dataType : "json",
		data : "orgcode=" + jwsdm,
		success : function(userBeanList)
		{
			if ($.isFunction(callback))
			{
				callback(userBeanList);
			}
		}
	})
}

/**
 * 通派出所代码获取所有的社区集合
 * @param {Object} pcsdm
 * @param {Object} callback
 */
function callbackSqListByPcsdm(pcsdm,callback)
{
	$.ajax({
		url : contextPath + "/cps/common/findSqBeanByPcsdm.action",
		dataType : "json",
		data : "orgcode=" + pcsdm,
		success : function(sqJbxxBeanList)
		{
			if ($.isFunction(callback))
			{
				callback(sqJbxxBeanList);
			}
		}
	})
}

/**
 * 通过父类代码找对应的数据字典
 * @param {Object} parentDm
 * @param {Object} callback
 */
function callbackfindDicBeanByParentDm(zdlb, parentDm, callback)
{
	$.ajax({
		url : contextPath + "/cps/common/findDicBeanByParentDm.action",
		dataType : "json",
		data : "zdlb=" + zdlb + "&parent_dm=" + parentDm,
		success : function(dicBeanList)
		{
			if ($.isFunction(callback))
			{
				callback(dicBeanList);
			}
		}
	})
}

function doubleCountryGajgjg(parentcode,selectid,callback)
{
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/cps/common/queryCountryGajgjg.action",
		data : "parent_dm=" + parentcode,
		success : function(list)
		{
			if (selectid != null && selectid != "")
			{
				$("#" + selectid).empty();
				if (list != null && list.length > 0)
				{
					$("#" + selectid).append("<option value=''> </option>");
					$.each(list,function(i,obj){
						$("#" + selectid).append("<option value='" + obj["dm"] + "'>" + obj["jc"] + "</option>");
					});
				}
			}
			if ($.isFunction(callback))
			{
				callback(list);
			}
		}
	});
}

function doublePcsGajgjg(parentcode,selectid,callback)
{
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/cps/common/queryPcsGajgjg.action",
		data : "parent_dm=" + parentcode,
		success : function(list)
		{
			if (selectid != null && selectid != "")
			{
				$("#" + selectid).empty();
				if (list != null && list.length > 0)
				{
					$("#" + selectid).append("<option value=''> </option>");
					$.each(list,function(i,obj){
						$("#" + selectid).append("<option value='" + obj["dm"] + "'>" + obj["jc"] + "</option>");
					});
				}
			}
			if ($.isFunction(callback))
			{
				callback(list);
			}
		}
	});
}

//根据区县查询可访问派出所
function doubleKfwPcsGajgjg(parentcode,selectid,callback){
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/cps/common/queryKfwPcsByQxDm.action",
		data : "parent_dm=" + parentcode,
		success : function(list)
		{
			if (selectid != null && selectid != "")
			{
				$("#" + selectid).empty();
				if (list != null && list.length > 0)
				{
					$("#" + selectid).append("<option value=''> </option>");
					$.each(list,function(i,obj){
						$("#" + selectid).append("<option value='" + obj["dm"] + "'>" + obj["jc"] + "</option>");
					});
				}
			}
			if ($.isFunction(callback))
			{
				callback(list);
			}
		}
	});
}

function setGbryxx(czrkxxBean)
{
	if (czrkxxBean)
	{
		$("#rybh").val(czrkxxBean["rybh"]);
		$("#xm").val(czrkxxBean["xm"]);
		$("#xb").val(czrkxxBean["xb"]);
		$("#bmch").val(czrkxxBean["bmch"]);
		$("#csrq").val(czrkxxBean["csrq"]);
		$("#zpxx img").attr("src","<c:url value='/cps/common/showPoto.action'/>?sfzh="+czrkxxBean["sfzh"]);
	}
}

function openModalDialog(url,width,height,vArguments,isbars)
{
	if(!isbars) 
	{
		isbars = "no";
	}
	var sFeatures = "dialogWidth="+width+"px;dialogHeight="+height+"px;help=yes;resizable=no;status=no;center=yes;scroll="+isbars+";edge=sunken;";
	return window.showModalDialog(url,vArguments,sFeatures);
}

function openXzSqSelectWin(params,callback)
{
	$.openDialogWindow({
		url : contextPath + "/cps/common/toHnxzqhSelectPage.action?t=" + new Date().getTime() ,
		width:400,
		height:500,
		data : params,
		callback : function(result)
		{
			if ($.isFunction(callback))
			{
				callback(result);
			}
		}
	})
}


function openJlxSelect(callback)
{
	$.openDialogWindow({
		url : contextPath + "/cps/dzjlx/toJlxSelectPage.action?t=" + new Date().getTime(),
		width:700,
		height:450,
		scroll:false,
		callback : function(result)
		{
			if ($.isFunction(callback))
			{
				callback(result);
			}
		}
	})
}

function openAddSelectJlxWin(sqdm,bslx,callback)
{
	var url= contextPath+"/cps/dzjlx/toDzJlxPageInfo.action?t="+ new Date().getTime();
	$.openDialogWindow({
		url :url,
		width:700,
		height:500,
		data : {
			"jlxBean.sssqdm" : sqdm,
			"jlxBean.bslx" : bslx
		},
		callback : function(result)
		{
			if ($.isFunction(callback))
			{
				callback(result);
			}
		}
	})
	
}

function openXqzSelectWinInfo(sqdm,callback)
{
	 var url = contextPath + "/cps/dzjlx/toXqzSelectPage.action?t="+ new Date().getTime();
	 $.openDialogWindow({
		url :url,
		width:700,
		height:600,
		data : 
		{
			"xqzBean.sqdm" : sqdm
		},
		callback : function(result)
		{
			if ($.isFunction(callback))
			{
				callback(result);
			}
		}
	})
}


function openJwsqSelectWin(callback)
{
	$.openDialogWindow({
		url : contextPath + "/cps/common/toJwqSelectPage.action",
		width:600,
		height:200,
		callback : function(jwqobj)
		{
			if ($.isFunction(callback))
			{
				callback(jwqobj);
			}
		}
	})
}

function getXzqhmcByXzqhdm(xzqhdm,callback){
	$.ajax({
		url:contextPath +"/cps/common/getXzqhmcByXzqhdm.action",
		dataType:"json",
		type:"post",
		data:{
			"xzqhdm":xzqhdm
		},
		success:function(mc){
			if ($.isFunction(callback))
			{
				callback(mc);
			}			
		}
	});
}
