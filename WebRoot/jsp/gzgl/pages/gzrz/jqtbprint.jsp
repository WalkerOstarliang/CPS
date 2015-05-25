<%@ page language="java" pageEncoding="UTF-8" contentType="application/msword" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("警情通报.doc", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=UTF-8" >
<title>警情通报</title>
<style type="text/css">
	@font-face{
	font-family:"Times New Roman";
	}
	
	@font-face{
	font-family:"宋体";
	}
	
	@font-face{
	font-family:"微软雅黑";
	}
	
	@font-face{
	font-family:"Tahoma";
	}
	
	@font-face{
	font-family:"Symbol";
	}
	
	@font-face{
	font-family:"Arial";
	}
	
	@font-face{
	font-family:"黑体";
	}
	
	@font-face{
	font-family:"Courier New";
	}
	
	@font-face{
	font-family:"Wingdings";
	}
	
	@list l0:level1{
	mso-level-number-format:decimal;
	mso-level-suffix:space;
	mso-level-text:"%1、";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-bottom:0pt; margin-top:0pt; margin-left:0.0000pt;
	text-indent:0.0000pt;
	font-family:'Times New Roman'; }
	
	@list l1:level1{
	mso-level-number-format:decimal;
	mso-level-suffix:tab;
	mso-level-text:"%1.";
	mso-level-tab-stop:39.0000pt;
	mso-level-number-position:left;
	margin-left:39.0000pt; text-indent:-18.0000pt; margin-bottom:0pt; margin-top:0pt; font-family:'Times New Roman'; }
	
	@list l2:level1{
	mso-level-number-format:bullet;
	mso-level-suffix:tab;
	mso-level-text:\F06C;
	mso-level-tab-stop:81.0000pt;
	mso-level-number-position:left;
	margin-left:81.0000pt; text-indent:-18.0000pt; margin-bottom:0pt; margin-top:0pt; font-family:'Wingdings'; }
	
	@list l3:level1{
	mso-level-number-format:decimal;
	mso-level-suffix:tab;
	mso-level-text:"%1.";
	mso-level-tab-stop:18.0000pt;
	mso-level-number-position:left;
	margin-left:18.0000pt; text-indent:-18.0000pt; margin-bottom:0pt; margin-top:0pt; font-family:'Times New Roman'; }
	
	@list l4:level1{
	mso-level-number-format:bullet;
	mso-level-suffix:tab;
	mso-level-text:\F06C;
	mso-level-tab-stop:18.0000pt;
	mso-level-number-position:left;
	margin-left:18.0000pt; text-indent:-18.0000pt; margin-bottom:0pt; margin-top:0pt; font-family:'Wingdings'; }
	
	@list l5:level1{
	mso-level-number-format:bullet;
	mso-level-suffix:tab;
	mso-level-text:\F06C;
	mso-level-tab-stop:60.0000pt;
	mso-level-number-position:left;
	margin-left:60.0000pt; text-indent:-18.0000pt; margin-bottom:0pt; margin-top:0pt; font-family:'Wingdings'; }
	
	@list l6:level1{
	mso-level-number-format:decimal;
	mso-level-suffix:tab;
	mso-level-text:"%1.";
	mso-level-tab-stop:60.0000pt;
	mso-level-number-position:left;
	margin-left:60.0000pt; text-indent:-18.0000pt; margin-bottom:0pt; margin-top:0pt; font-family:'Times New Roman'; }
	
	@list l7:level1{
	mso-level-number-format:bullet;
	mso-level-suffix:tab;
	mso-level-text:\F06C;
	mso-level-tab-stop:39.0000pt;
	mso-level-number-position:left;
	margin-left:39.0000pt; text-indent:-18.0000pt; margin-bottom:0pt; margin-top:0pt; font-family:'Wingdings'; }
	
	@list l8:level1{
	mso-level-number-format:bullet;
	mso-level-suffix:tab;
	mso-level-text:\F06C;
	mso-level-tab-stop:102.0000pt;
	mso-level-number-position:left;
	margin-left:102.0000pt; text-indent:-18.0000pt; margin-bottom:0pt; margin-top:0pt; font-family:'Wingdings'; }
	
	@list l9:level1{
	mso-level-number-format:decimal;
	mso-level-suffix:tab;
	mso-level-text:"%1.";
	mso-level-tab-stop:81.0000pt;
	mso-level-number-position:left;
	margin-left:81.0000pt; text-indent:-18.0000pt; margin-bottom:0pt; margin-top:0pt; font-family:'Times New Roman'; }
	
	@list l10:level1{
	mso-level-number-format:decimal;
	mso-level-suffix:tab;
	mso-level-text:"%1.";
	mso-level-tab-stop:102.0000pt;
	mso-level-number-position:left;
	margin-left:102.0000pt; text-indent:-18.0000pt; margin-bottom:0pt; margin-top:0pt; font-family:'Times New Roman'; }
	
	p.p0{
	margin:0pt;
	margin-bottom:0.0001pt;
	margin-bottom:0pt;
	margin-top:0pt;
	text-align:justify;
	font-size:10.5000pt; font-family:'Times New Roman'; }
	
	span.10{
	font-family:'Times New Roman'; }
	
	p.p15{
	margin-bottom:0pt;
	margin-top:0pt;
	border-top:none; ;
	mso-border-top-alt:none; ;
	border-right:none; ;
	mso-border-right-alt:none; ;
	border-bottom:none; ;
	mso-border-bottom-alt:none; ;
	border-left:none; ;
	mso-border-left-alt:none; ;
	padding:1pt 4pt 1pt 4pt ;
	text-align:justify;
	font-size:9.0000pt; font-family:'Times New Roman'; }
	
	p.p16{
	margin-bottom:0pt;
	margin-top:0pt;
	text-align:left;
	font-size:9.0000pt; font-family:'Times New Roman'; }
	@page{mso-page-border-surround-header:no;
		mso-page-border-surround-footer:no;}@page Section0{
	margin-top:72.0000pt;
	margin-bottom:72.0000pt;
	margin-left:90.0000pt;
	margin-right:90.0000pt;
	size:595.3000pt 841.9000pt;
	layout-grid:15.6000pt;
	}
	div.Section0{page:Section0;}
</style>
</head>
<body style="tab-interval:21pt; text-justify-trim:punctuation; " >
	<div class="Section0"  style="layout-grid:15.6000pt;" >
		<p class="p0"  style="margin-bottom:0pt; margin-top:0pt; text-align:center; " >
			<span style="mso-spacerun:'yes'; font-weight:bold; font-size:22.0000pt; font-family:'宋体'; " >警情通报</span>
			<span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; " ><o:p></o:p></span>
		</p>
		<p class="p0"  style="margin-bottom:0pt; margin-top:0pt; " >
			<span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; " >&nbsp;&nbsp;&nbsp;</span>
			<span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; " ><o:p></o:p></span>
		</p>
		<p class="p0"  style="text-indent:21.0000pt; margin-bottom:0pt; margin-top:0pt; " >
			<span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; " >&nbsp;</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >本辖区${fn:substring(jqtbBean.ny,0,4)}年${fn:substring(jqtbBean.ny,4,6)}月警情通报如下：</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " ><o:p></o:p></span>
		</p>
		<p class="p0"  style="margin-bottom:0pt; margin-top:0pt; " >
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >&nbsp;&nbsp;&nbsp;</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >刑事案件</span>
			<span style="mso-spacerun:'yes'; text-decoration:underline ;font-size:14.0000pt; font-family:'宋体'; " >&nbsp;&nbsp;${jqtbBean.xsaj}&nbsp;&nbsp;</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >起，</span>
			
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >治安案件</span>
			<span style="mso-spacerun:'yes'; text-decoration:underline ;font-size:14.0000pt; font-family:'宋体'; " >&nbsp;&nbsp;${jqtbBean.zaaj}&nbsp;&nbsp;</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >起，</span>
			
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >调处纠纷</span>
			<span style="mso-spacerun:'yes'; text-decoration:underline ;font-size:14.0000pt; font-family:'宋体'; " >&nbsp;&nbsp;${jqtbBean.tcjf}&nbsp;&nbsp;</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >起，</span>
			
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >灾害事故</span>
			<span style="mso-spacerun:'yes'; text-decoration:underline ;font-size:14.0000pt; font-family:'宋体'; " >&nbsp;&nbsp;${jqtbBean.zhsg}&nbsp;&nbsp;</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >起，</span>
			
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >抢劫、抢夺案件</span>
			<span style="mso-spacerun:'yes'; text-decoration:underline ;font-size:14.0000pt; font-family:'宋体'; " >&nbsp;&nbsp;${jqtbBean.qjqdaj}&nbsp;&nbsp;</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >起，</span>
			
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >入室盗窃案件</span>
			<span style="mso-spacerun:'yes'; text-decoration:underline ;font-size:14.0000pt; font-family:'宋体'; " >&nbsp;&nbsp;${jqtbBean.rsdqaj}&nbsp;&nbsp;</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >起，</span>
			
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >盗窃机动车辆案件</span>
			<span style="mso-spacerun:'yes'; text-decoration:underline ;font-size:14.0000pt; font-family:'宋体'; " >&nbsp;&nbsp;${jqtbBean.dqjdclaj}&nbsp;&nbsp;</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >起，</span>
			<span style="mso-spacerun:'yes'; font-size:12.0000pt; font-family:'宋体'; " ><o:p></o:p></span>
		</p>
		<p class="p0"  style="margin-left:63.0000pt; text-indent:21.0000pt; margin-bottom:0pt; margin-top:0pt; " >
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " ><o:p>&nbsp;</o:p></span>
		</p>
		<p class="p0"  style="margin-bottom:0pt; margin-top:0pt; " >
			<span style="mso-spacerun:'yes'; font-weight:bold; font-size:14.0000pt; font-family:'宋体'; " >典型案例</span>
			<span style="mso-spacerun:'yes'; font-weight:bold; font-size:14.0000pt; font-family:'宋体'; " >：</span>
			<span style="mso-spacerun:'yes'; font-weight:bold; font-size:14.0000pt; font-family:'宋体'; " ><o:p></o:p></span>
		</p>
		<p class="p0"  style="text-indent:21.0000pt; margin-bottom:0pt; margin-top:0pt; " >
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >${jqtbBean.dxaj}</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " ><o:p></o:p></span>
		</p>
		<p class="p0"  style="margin-left:63.0000pt; text-indent:21.0000pt; margin-bottom:0pt; margin-top:0pt; " >
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " ><o:p>&nbsp;</o:p></span>
		</p>
		<p class="p0"  style="margin-bottom:0pt; margin-top:0pt; " >
			<span style="mso-spacerun:'yes'; font-weight:bold; font-size:14.0000pt; font-family:'宋体'; " >防范提示</span>
			<span style="mso-spacerun:'yes'; font-weight:bold; font-size:14.0000pt; font-family:'宋体'; " >：</span>
			<span style="mso-spacerun:'yes'; font-weight:bold; font-size:14.0000pt; font-family:'宋体'; " ><o:p></o:p></span>
		</p>
		<p class="p0"  style="text-indent:21.0000pt; margin-bottom:0pt; margin-top:0pt; " >
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >${jqtbBean.dqffzd}</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " ><o:p></o:p></span>
		</p>
		<p class="p0"  style="margin-left:63.0000pt; text-indent:21.0000pt; margin-bottom:0pt; margin-top:0pt; " >
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " ><o:p>&nbsp;</o:p></span>
		</p>
		<p class="p0"  style="margin-left:273.0000pt; text-indent:21.0000pt; margin-bottom:0pt; margin-top:0pt; text-align:right; " >
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;填报人：刘翼</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " ><o:p></o:p></span>
		</p>
		<p class="p0"  style="margin-left:273.0000pt; text-indent:21.0000pt; margin-bottom:0pt; margin-top:0pt; text-align:right; " >
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " >&nbsp;2014年11月11日</span>
			<span style="mso-spacerun:'yes'; font-size:14.0000pt; font-family:'宋体'; " ><o:p></o:p></span>
		</p>
		<p class="p0"  style="margin-bottom:0pt; margin-top:0pt; text-align:right; " >
			<span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'Times New Roman'; " ><o:p>&nbsp;</o:p></span>
		</p>
	</div>
</body>
</html>