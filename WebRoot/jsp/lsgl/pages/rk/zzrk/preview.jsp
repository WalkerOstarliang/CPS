<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/lsgl/js/jzzxx.js"></creator:Script>
<creator:Script src="/template/default/js/jquery-1.6.min.js"></creator:Script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<style type="text/css">
		 div{
		 	font-weight: bold;
		 }
		 html { -webkit-text-size-adjust:none }

	</style>
	<script type="text/javascript">
			var contextPath = "${contextPath}";
			
			
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
			function printTure()   //打印函数
			{
				afterPrint();
			    PageSetup_Null();
			    //document.all("dayinDiv").style.display="none";//同上
			    document.getElementById("dayinDiv").style.display="none";//同上
			    window.print();
			    document.getElementById("dayinDiv").style.display=""; 
			    //document.all("dayinDiv").style.display="";
			   
			}
			
			
			
			function afterPrint(){
				var rybh = "${bean.jzzrybh}";
				$.ajax({
					url: contextPath+"/lsgl/jzzxx/updateJzzxxBeanDyZt.action",
					type:"post",
					dataType:"json",
					data:{
						"bean.jzzrybh":rybh
					},
					success:function(){
					}
				})
			}
			
			function doPage()
			{
			    layLoading.style.display = "none";//同上
			}
			
			
			var HKEY_Root,HKEY_Path,HKEY_Key; 
			HKEY_Root="HKEY_CURRENT_USER"; 
			HKEY_Path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"; 
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
			

	</script> 
</head>
<body style="margin: 0px;padding: 0px">
		<div  id="maxDiv" style="width: 310px;height: 192px;border: 0px;background-color:#FFFFFF;">
		<div  style="width:309px;">
			<div style="float: left;width: 190px;" >
				<div style="height:20px;padding-left: 64px;"></div>
				<div style="font-family: 黑体;font-size: 12px;font-weight: normal;height:24px;padding-left: 64px;padding-top: 2px;">${jbxxBean.xm}</div>
				<div style="height:22px;padding-left: 64px;">
					<div  style="font-family: 黑体;font-size: 12px;font-weight: normal;float: left;padding-top: 5px;">${jbxxBean.xbms}</div>
					<div  style="font-family: 黑体;font-size: 12px;font-weight: normal;text-align:left; padding-left:60px;padding-top: 6px;" >${jbxxBean.mzms}</div>
				</div>
				<div style="font-family: 黑体;font-size: 12px;font-weight: normal;height:23px;padding-left: 92px;padding-top: 7px;">${jbxxBean.sfzh}</div>
				<div style="font-family: 黑体;font-size: 12px;font-weight: normal;height:24px;padding-left: 64px; width: 100%">
					<div style="font-family: 黑体;font-size: 12px;font-weight: normal;float: left;padding-top: 9px;padding-left: 5px;">${year}</div>
					<div style="font-family: 黑体;font-size: 12px;font-weight: normal;float: right;padding-right: 33px;padding-top: 9px;">${day}</div>
					<div style="font-family: 黑体;font-size: 12px;font-weight: normal;float: right;margin-right: 22px;padding-top: 9px;  ">${month}</div></div>
				<div style="height:34px;padding-left: 85px;padding-top: 10px;font-family: 黑体;font-size: 12px;font-weight: normal;">${bean.yxqxms}</div>
			</div>
			<div style="padding: 10px;float: right; padding-top: 35px; ">
				<img border="0" id="zpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${jbxxBean.sfzh}" width="80px" height="97px" title="全国人口库照片" alt="全国人口库照片" />
			</div>
		</div>
		<div style="height:20px;width: 309px;padding-left: 70px;padding-top: 5px;font-family: 黑体;font-size: 10px;font-weight: normal;">${jbxxBean.hjdxz}</div>
		<div style="height:25px;width: 309px;padding-left: 70px;padding-top: 2px;font-family: 黑体;font-size: 10px;font-weight: normal;">${bean.xzzxz}</div>
	</div>
	
	<!-- background:url('<c:url value="/systemico/110.bmp" />') no-repeat;-->
	</body>
</html>





