function queryList(){
	$("#jzztablegrid").query("F","queryForm");
}

function refreshDayinPage4List()
{
	$("#jzzxxList").query("F","jzzxxForm");
}

function queryJzzxxhcList()
{
	var sfzh = $("#jzzsfzh").val();
	if (sfzh != null && sfzh != "")
	{
		if (isSfzh(sfzh))
		{
			$("#jzztablegrid").query("F","queryForm");
		}
		else
		{
			alert("身份证号码格式不正确.");
		}
	}
	else
	{
		alert("请输入身份证号");
	}
}

function clickJzzxxRow(trobj, rowdata)
{
	var jzzxxbh = rowdata["jzzxxbh"];
	var fzrq = rowdata["fzrq"];
	var yxqx = rowdata["yxqx"];
	var jzzdyzt = rowdata["jzzdyzt"];
	$("#jzzxxbh").val(jzzxxbh);
	$("#fzrq").val(fzrq);
	$("#yxqx").val(yxqx);
	$("#jzzdyzt").val(jzzdyzt);
}

function saveJzzxxBean()
{
	if ($.validateform("jzzxxForm"))
	{
		$("#jzzxxForm").ajaxSubmit({
			url : contextPath + "/lsgl/jzzxx/saveLdrkJzzxxBean.action",
			type : "post",
			dataType : "json",
			success: function(result)
			{
				if (result == "cannotupdate")
				{
					alert("居住证已制证或被注销，不能再进行修改.");
				}
				else if (result == null)
				{
					alert("居住证保存时发生错误，请稍后再试.");
				}
				else 
				{
					alert("居住证信息保存成功.");
					$("#jzzxxbh").val(result["jzzxxbh"]);
					$("#jzzxxList").query("F","jzzxxForm");
				}
			}
		})
	}
}
//居住证延期保存
function YqsaveJzzxxBean(){
	if ($.validateform("jzzxxForm"))
	{
		$("#jzzxxForm").ajaxSubmit({
			url : contextPath + "/lsgl/jzzxx/saveLdrkJzzxxYqBean.action",
			type : "post",
			dataType : "json",
			success: function(result)
			{
				if (result == null)
				{
					alert("居住证保存时发生错误，请稍后再试.");
				}
				else 
				{
					alert("居住证信息保存成功.");
					$("#jzzxxbh").val(result["jzzxxbh"]);
					$("#yjzzxxbh").val('');
					$("#jzzxxList").query("F","jzzxxForm");
				}
			}
		})
	}
}
/** 居住证预览 打印*/
function preJzzxxDy(dyzt){
	var jzzxxbh = $("#jzzxxbh").val();
	var rybh=$("#jzzrybh").val();
	if(jzzxxbh == null || jzzxxbh == undefined || jzzxxbh == ""){
		alert("请先登记居住证信息;");
		return ;
	}
		
	var selectes = $("#jzzxxList").getSelected();
	if (selectes.length == 0)
	{
		alert("请选择要打印的居住证记录");
		return false;
	}
		
	var jzzdyzt = selectes[0]["jzzdyzt"];
	var jzzzxbs = selectes[0]["jzzzxbs"];
	var ldrkzxbs = selectes[0]["ldrkzxbsms"];
	var xzzxz = selectes[0]["xzzxz"];
	if (dyzt != "1" && jzzdyzt == "10")
	{
		alert("当前居住证还未制证，无法进行该操作.");
		return false;
	}
	else if (dyzt == "1" && jzzdyzt == "20")
	{
		alert("居住已经打印，不能重复打印.");
		return false;
	}
	else if (dyzt == "1" && ldrkzxbs== "1")
	{
		alert("流动人口已经注销，无法进行打印,请打印有效的流动人口信息，如果有效流动人口地址不正确，请重新登记正确的流动人口.");
		return false;
	}
	else if (jzzzxbs == "1")
	{
		alert("居住证已经注销,无法操作.");
		return false;
	}
	else 
	{
		if (confirm("当前要打印的居住证地址为【" + xzzxz + "】,请核准是否正确，继续打印点击确定，否则请重新登记居住证信息后在进行打印。"))
		{
			$.openWindow({
				url : contextPath + "/lsgl/jzzxx/toPrintPage.action",
				width : 600,   //320
				height : 500,  //230
				scroll:false,
				data :
				{
					"bean.jzzrybh":rybh,	
					"dyzt":dyzt,
					"bean.jzzxxbh" : jzzxxbh
				}
			});
	 	}
	}
	
	
}


/** 居住证打印 */
function JzzxxDy(){
	var jzzxxbh = $("#jzzxxbh").val();
	var rybh=$("#jzzrybh").val();
	if(jzzxxbh == null || jzzxxbh == undefined || jzzxxbh == ""){
		alert("请先登记居住证信息;");
		return ;
	}
	$("#displayview").attr("src",contextPath+"/lsgl/jzzxx/toPrintPage.action?bean.jzzrybh="+rybh);
}

function zxJzzxx(jzzxxbh){
	if(confirm("确定要注销该居住证信息吗?"))
	{
		$.ajax({
			type : "post",
			url : contextPath + "/lsgl/jzzxx/zxJzzxxBean.action",
			data : {
				"queryBean.jzzxxbh" : jzzxxbh
			},
			success : function()
			{
				$("#jzzxxList").query("F","jzzxxForm");
			}
		})
	}
}

function NewDate(str) { 
	str = str.split('-'); 
	var date = new Date(); 
	date.setUTCFullYear(str[0], str[1] - 1, str[2]); 
	date.setUTCHours(0, 0, 0, 0); 
	return date; 
} 
/*
function getYxDate(value){
	var qfDate=$("#zzzqfrq").val();
	if(qfDate == null || qfDate =='' || qfDate == undefined){
		alert("请填写签发日期.");
		return;
	}
	var qf = new NewDate(qfDate);
	if("1" == value){
		qf.setMonth(qf.getMonth()+1);
	}
	else if("2" == value){
		qf.setMonth(qf.getMonth()+3);
	}
	else if("3" == value){
		qf.setMonth(qf.getMonth()+6);
	}
	else if("4" == value){
		qf.setMonth(qf.getMonth()+12);
	}
	else if("5" == value){
		qf.setMonth(qf.getMonth()+24);
	}
	else if("6" == value){
		qf.setMonth(qf.getMonth()+36);
	}
	$("#zzzyxqjzrq").val(qf.getFullYear()+"-"+eval(qf.getMonth()+1)+"-"+qf.getDate());
	
}*/

function getYxDate(value){
	var qf = new Date();
	if("1" == value){
		qf.setMonth(qf.getMonth()+1);
	}
	else if("2" == value){
		qf.setMonth(qf.getMonth()+3);
	}
	else if("3" == value){
		qf.setMonth(qf.getMonth()+6);
	}
	else if("4" == value){
		qf.setMonth(qf.getMonth()+12);
	}
	else if("5" == value){
		qf.setMonth(qf.getMonth()+24);
	}
	else if("6" == value){
		qf.setMonth(qf.getMonth()+36);
	}
	
	$("#zzzyxqjzrq").val(qf.getFullYear()+"-"+eval(qf.getMonth()+1)+"-"+qf.getDate());
	
}

function changeZxbs(zxbs){
	//成功
	if ("0" == zxbs)
	{
		$("#zxsj").val("");
		$("#zxyy").val("");
		$("#zxsj").attr("disabled","true");
		$("#zxyy").attr("disabled","true");
		$("#njzqx").removeAttr("disabled");
	}
	//已注销
	else if ("1" == zxbs)
	{
		$("#njzqx").val("");
		$("#zzzyxqjzrq").val("");
		$("#zxsj").removeAttr("disabled");
		$("#zxyy").removeAttr("disabled");
		$("#njzqx").attr("disabled","true");
	
		$("#zxsj").addClass("validate[required]");
		$("#zxyy").addClass("validate[required]");
		
		$("#zxsjLabel").html("<font color=\"red\">*</font>注销时间：");
		$("#zxyyLabel").html("<font color=\"red\">*</font>注销原因：");
	}
}

function saveLdrkYanQiInfo(){
	if ($.validateform("ldrkYanQiForm")){
		$("#ldrkYanQiForm").ajaxSubmit({
			url : contextPath + "/lsgl/rk/updateLdrkBean.action",
			type : "post",
			dataType : "json",
			success: function(msg){
				if(msg){
					alert("数据保存成功,即将关闭窗口.");
					$.closeWindow();
				}else{
					alert("数据操作失败.请重新再试.");
				}			
			}
		})
	}
}

/**
	居住证打印列表上的操作
*/
function JzzxxListCz(tdObj, rowDataObj){
	var content = "";
	var jzzxxbh = rowDataObj["jzzxxbh"];
	if(rowDataObj.jzzzxbs == "0")
	{
		content = "<span  onclick=\"zxJzzxx('" + jzzxxbh + "')\" style=\"color:green\" class=\"cps_span_href\">注销</span>";
	}
	else
	{
		content = "<span style=\"color:red\">注销后不能再操作</span>";
	}
	return content;
}

function jzzBatchPrint(){
	var rybhs = [];
	var selects = $("#jzztablegrid").getSelected();
	if(selects.length > 0){
		$.each(selects,function(i,obj){
			
			rybhs.push(obj["jzzrybh"]);
		});
		
		$.openWindow({
			url:contextPath+"/lsgl/jzzxx/toBatchPrintPage.action",
			dataType:"json",
			data:{
				"rybhs" : rybhs.join(",")
			}
		})
	}else{
		alert("请选择要打印的记录.");
	}
}

function openLdrkJzzxxWin(operType,rybh,zzbh){
	$.openWindow({
		name : "jzzxxWin1",
		url : contextPath + "/lsgl/jzzxx/toAddJzzxxPage.action",
		width:900,
		height:450,
		data : 
		{
			"operType":operType,
			"bean.jzzrybh":rybh,
			"zzbh" : zzbh
		}
	});
}

function openPreviewPage(jzzrybh,jzzxxbh)
{	
	if (jzzrybh != null && jzzrybh != "")
	{
		 $.layer({
		    type : 2,
		    title : "居住证预览界面",
		    iframe : {
		    	src : contextPath + "/lsgl/jzzxx/toPreViewPage.action?bean.jzzrybh="+jzzrybh+"&bean.jzzxxbh=" + jzzxxbh
		    },
		    area : ['370px','270px'],
			offset : ['60px',''],
			border :[5,0.3,'#869fe2',true],
			bgcolor : '#869fe2'
		});
	}
	else
	{
		alert("该人员还未办理居住.")
	}
}


function openPreviewPage1()
{	
	var jzzrybh = $("#jzzrybh").val();
	var jzzxxbh = $("#jzzxxbh").val();
	if(jzzxxbh == null || jzzxxbh == '' )
	{
		alert("请先登记居住证信息.");
		return
	}
	 $.layer({
	    type : 2,
	    title : "居住证预览界面",
	    iframe : {
	    	src : contextPath + "/lsgl/jzzxx/toPreViewPage.action?bean.jzzrybh="+jzzrybh+"&bean.jzzxxbh=" + jzzxxbh
	    },
	    area : ['370px','270px'],
		offset : ['60px',''],
		border :[5,0.3,'#869fe2',true],
		bgcolor : '#869fe2'
	});
}

/**
 * 居住证打印
 * 打印状态：1--首次打印  2--遗失补打  3--错证重打
 * 居住证打印状态:10--未制证  20--已制证  30--注销
 * @param {} dyzt
 */
function openPreviewNone(dyzt)
{
	var selectes = $("#jzztablegrid").getSelected();
	if (selectes.length == 0)
	{
		alert("请选择要打印的居住证记录");
		return false;
	}
	else if (selectes.length > 20)
	{
		alert("批量打印一次最多能打印20个.");
		return false;
	}
	var rybhs = new Array();
	var jzzbhs = new Array();
	var validateresult = true;
	$.each(selectes,function(i,obj){
		var jzzdyzt = obj["jzzdyzt"];
		var jzzzxbs = obj["jzzzxbs"];
		var ldrkzxbs = obj["ldrkzxbsms"];
		if (dyzt != "1" && jzzdyzt == "10")
		{
			alert("选择记录中存在还未制证的居住证信息，请去掉后在操作.");
			validateresult = false;
			return false;
		}
		else if (dyzt == "1" && jzzdyzt == "20")
		{
			alert("选择记录中存在已经制证过的居住信息，不能重复打印.");
			validateresult = false;
			return false;
		}
		else if (dyzt == "1" && ldrkzxbs == "1")
		{
			alert("流动人口已经注销，无法进行打印,请打印有效的流动人口信息，如果有效流动人口地址不正确，请重新登记正确的流动人口.");
			validateresult = false;
			return false;
		}
		else if (jzzzxbs == "1")
		{
			alert("选择记录中存在已经注销的居住证信息,请删除后再操作.");
			validateresult = false;
			return false;
		}
		jzzbhs.push(obj["jzzxxbh"]);
		rybhs.push(obj["jzzrybh"]);
		
	});
	if (validateresult == true)
	{
		if (confirm("打印前请核准地址是否正确，继续打印点击确定，否则请重新登记居住证信息后在进行打印。"))
		{
			$("#rybhs").val(rybhs.join(","));
			$("#jzzbhs").val(jzzbhs.join(","));
			$("#hiddendyzt").val(dyzt);
			$("#jzzdyform").submit();
		}
	}
	
}

function openPrintView()
{
	var rybhs = [];
	var selects = $("#jzztablegrid").getSelected();
	if(selects.length > 0){
		$.each(selects,function(i,obj){
			rybhs.push(obj["jzzrybh"]);
		});
		$.openWindow({
			url : contextPath + "/lsgl/jzzxx/toBatchPrintPage.action?rybhs="+rybhs.join(","),
			width:700,
			height:500
		});
	}else{
		alert("请选择要打印的记录.");
	}
	
}

function printpr()   //预览函数
{
	PageSetup_Null();
	document.all("dayinDiv").style.display="none"; //打印之前先隐藏不想打印输出的元素（此例中隐藏“打印”和“打印预览”两个按钮）
	var OLECMDID = 7;
	var PROMPT = 1; 
	var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	document.body.insertAdjacentHTML('beforeEnd', WebBrowser); 
	WebBrowser1.ExecWB(OLECMDID, PROMPT);
	WebBrowser1.outerHTML = "";
	document.all("dayinDiv").style.display="";//打印之后将该元素显示出来（显示出“打印”和“打印预览”两个按钮，方便别人下次打印）
}


function doPage()
{
    layLoading.style.display = "none";//同上
}

//设置网页打印的页眉页脚为空 
function PageSetup_Null() 
{ 
	try 
	{ 
	var Wsh=new ActiveXObject("WScript.Shell"); 
	HKEY_Key="header"; 
	Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,""); 
	HKEY_Key="footer"; 
	Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,""); 
	} 
	catch(e) 
	{} 
} 

//设置网页打印的页眉页脚为默认值 
function PageSetup_Default() 
{ 
	try 
	{ 
	var Wsh=new ActiveXObject("WScript.Shell"); 
	HKEY_Key="header"; 
	Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"&w&b页码,&p/&P"); 
	HKEY_Key="footer"; 
	Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"&u&b&d"); 
	} 
	catch(e) 
	{} 
} 

//打开实有人口页面
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

//居住导出
function downloadJzz(){
	var url = contextPath + "/lsgl/jzzxx/downloadJjz.action";
	$("#queryForm").attr("action",url);
	$("#queryForm").attr("target","jjzdcFrame");
	$("#queryForm").attr("method","post");
	
	$("#queryForm").submit();
	
	$("#queryForm").attr("action","");
	$("#queryForm").attr("target","");
}
