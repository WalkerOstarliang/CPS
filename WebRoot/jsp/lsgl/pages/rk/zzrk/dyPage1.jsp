<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/lsgl/js/jzzxx.js"></creator:Script>
<creator:Script src="/template/default/js/jquery-1.6.min.js"></creator:Script>
<creator:Script src="/jsp/common/js/jquery.PrintArea.js"></creator:Script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<style type="text/css">
		 div{
		 	font-size:10px;
		 	font-family: 黑体,仿宋;
		 }
		 html { -webkit-text-size-adjust:none }

	</style>
	<SCRIPT language=javascript>
function printpr()   //预览函数
{
document.all("qingkongyema").click();//打印之前去掉页眉，页脚
document.all("dayinDiv").style.display="none"; //打印之前先隐藏不想打印输出的元素（此例中隐藏“打印”和“打印预览”两个按钮）
var OLECMDID = 7;
var PROMPT = 1; 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser); 
WebBrowser1.ExecWB(OLECMDID, PROMPT);
WebBrowser1.outerHTML = "";
document.all("dayinDiv").style.display="";//打印之后将该元素显示出来（显示出“打印”和“打印预览”两个按钮，方便别人下次打印）
}
function printTure()   //打印函数
{
    document.all('qingkongyema').click();//同上
    document.all("dayinDiv").style.display="none";//同上
    window.print();
    document.all("dayinDiv").style.display="";
}
function doPage()
{
    layLoading.style.display = "none";//同上
}
</SCRIPT>
<script language="VBScript">
dim hkey_root,hkey_path,hkey_key
hkey_root="HKEY_CURRENT_USER"
hkey_path="\Software\Microsoft\Internet Explorer\PageSetup"
//设置网页打印的页眉页脚为空
function pagesetup_null()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header" 
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
end function
//设置网页打印的页眉页脚为默认值
function pagesetup_default()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header" 
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&w&b页码，&p/&P"
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&u&b&d"
end function
</script>
</head>
<body style="margin: 0px;padding: 0px">
	<div style="background-color:#E9EDF7;text-align: left;">
		<img id="button1" src="<c:url value="/systemico/dy.jpg" />" name="button_print"  onclick="javascript:printit()" width="40px" height="30px" alt="打印" />
	</div>
	<div style="background-color:#ACA899;height: 95%;"  >
		<div style="background-color:#FFFFFF;width: 80%;height: 80%;margin: 3% 10% 3% 25%; ">
			<div  id="maxDiv" style="background:url('<c:url value="/systemico/110.bmp" />') no-repeat;width: 303px;height: 192px;border: 0px;background-color:#FFFFFF;">
				<div style="float: left;width: 190px;" >
					<div style="height:22px;padding-left: 64px;padding-top: 18px;">${rkBean.jbxxBean.xm}</div>
					<div style="height:25px;padding-left: 64px;padding-top: 14px;">${rkBean.jbxxBean.xbms}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;汉</div>
					<div style="height:25px;padding-left: 90px;padding-top: 9px;">${rkBean.jbxxBean.sfzh}</div>
					<div style="height:25px;padding-left: 64px;padding-top: 7px;">${year}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${month}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${day}</div>
					<div style="height:25px;padding-left: 64px;padding-top: 8px;">${bean.yxqx}</div>
				</div>
				<div style="padding: 10px;float: right;height:135px ">
					<img border="0" id="zpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${rkBean.jbxxBean.sfzh}" width="80px" height="97px" title="全国人口库照片" alt="全国人口库照片" />
				</div>
				<div style="height:25px;padding-left: 64px;padding-top: 11px;">${rkBean.jbxxBean.hjdxz}</div>
				<div style="height:25px;width: 280px;padding-left: 64px;padding-top: 10px;overflow-x: hidden;">${rkBean.jbxxBean.xzzxz}</div>
			</div>
		</div>
	</div>
	<!-- background:url('<c:url value="/systemico/110.bmp" />') no-repeat;-->
	</body>
</html>





