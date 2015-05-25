<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("居住证统计报表.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName);   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="ProgId" content="Excel.Sheet">
<meta name="Generator" content="Microsoft Excel 12">
<link rel="File-List" href="czwtjbb.files/filelist.xml">
 <style>
 @page
	{margin:0.98in 0.75in 0.98in 0.75in;
	mso-header-margin:0.51in;
	mso-footer-margin:0.51in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.font0
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font1
	{color:#000080;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font2
	{color:#000000;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font3
	{color:#000000;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font4
	{color:#000000;
	font-size:10.5pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font5
	{color:#000000;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.style0
	{mso-number-format:"General";
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-pattern:auto;
	mso-background-source:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"Normal";
	mso-style-id:0;}
.style16
	{mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
	mso-style-name:"Comma";
	mso-style-id:3;}
.style17
	{mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0\.00_ \;_ \0022\00A5\0022* \\-\#\,\#\#0\.00_ \;_ \0022\00A5\0022* \0022-\0022??_ \;_ \@_ ";
	mso-style-name:"Currency";
	mso-style-id:4;}
.style18
	{mso-number-format:"_ * \#\,\#\#0_ \;_ * \\-\#\,\#\#0_ \;_ * \0022-\0022_ \;_ \@_ ";
	mso-style-name:"Comma[0]";
	mso-style-id:6;}
.style19
	{mso-number-format:"0%";
	mso-style-name:"Percent";
	mso-style-id:5;}
.style20
	{mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0_ \;_ \0022\00A5\0022* \\-\#\,\#\#0_ \;_ \0022\00A5\0022* \0022-\0022_ \;_ \@_ ";
	mso-style-name:"Currency[0]";
	mso-style-id:7;}
.style21
	{color:#000080;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:宋体;
	mso-style-name:"Hyperlink";
	mso-style-id:8;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	mso-number-format:"General";
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-pattern:auto;
	mso-background-source:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;}
.xl23
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-weight:700;}
.xl24
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:bottom;
	color:#000000;
	font-size:9.0pt;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border:.5pt solid #000000;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border:.5pt solid #000000;}
.xl27
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border:.5pt solid #000000;}
.xl28
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl29
	{mso-style-parent:style21;
	text-align:center;
	white-space:normal;
	color:#000000;
	font-size:9.0pt;
	border-left:.5pt solid #000000;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl30
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	color:#000000;
	font-size:9.0pt;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl31
	{mso-style-parent:style0;
	mso-number-format:"0\.00%";
	text-align:center;
	white-space:normal;
	color:#000000;
	font-size:9.0pt;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl32
	{mso-style-parent:style0;
	text-align:right;
	color:#000000;
	font-size:9.0pt;
	border:.5pt solid #000000;}
.xl33
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:bottom;
	color:#000000;
	font-size:9.0pt;
	border-left:.5pt solid #000000;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl34
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border-top:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl35
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border-bottom:.5pt solid #000000;}
</style>
</head>
<body link="blue" vlink="purple">
  <table width="714" border="0" cellpadding="0" cellspacing="0" style='width:535.50pt;border-collapse:collapse;table-layout:fixed;'>
  		<tr height="19" style='height:14.25pt;'>
   			<td class="xl23" height="19" width="714" colspan="11" style='height:14.25pt;width:535.50pt;border-right:none;border-bottom:none;'>居 住 证 统 计 报 表</td>
  		</tr>
   		<tr height="19" style='height:14.25pt;'>
    		<td class="xl24" height="19" colspan="11" style='height:14.25pt;border-right:none;border-bottom:none;'>统计单位： ${jzztjbbBean.orgname}<font class="font5"><span style='mso-spacerun:yes;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></font>
    		<font class="font5">(${jzztjbbBean.tjqsrq}至${jzztjbbBean.tjjzrq})</font>
    		<font class="font5"><span style='mso-spacerun:yes;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></font>
    		<font class="font5">单　　位：　　　　人</font></td>
  	 	</tr>
	   <tr height="19" style='height:14.25pt;'>
		    <td class="xl25" height="38" rowspan="2" style='height:28.50pt;border-right:none;border-bottom:.5pt solid #000000;'>单位</td>
		    <td class="xl26" colspan="5" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>居住证办证数（不包含废证数）</td>
		    <td class="xl26" colspan="2" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>废证</td>
		    <td class="xl34" colspan="2" style='border-right:none;border-bottom:.5pt solid #000000;'>遗失补领证</td>
		    <td class="xl27" rowspan="2" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>办证率</td>
	   </tr>
	   <tr height="19" style='height:14.25pt;'>
		    <td class="xl27">总数</td>
		    <td class="xl28">本省人数</td>
		    <td class="xl28">外省人数</td>
		    <td class="xl28">男</td>
		    <td class="xl28">女</td>
		    <td class="xl28">废证数</td>
		    <td class="xl28">废证率</td>
		    <td class="xl28">遗失补领数</td>
		    <td class="xl35">遗失补领率</td>
	   </tr>
	   <c:forEach items="${jzztjbbBeans}" var="bean" varStatus="st">
		   <tr height="19" style='height:14.25pt;'>
			    <td class="xl30">${bean.orgname}</td>
			    <td class="xl30">${bean.zbzs}</td>
			    <td class="xl30">${bean.bsbzrs}</td>
			    <td class="xl30">${bean.wsbzrs}</td>
			    <td class="xl30">${bean.nanbzrs}</td>
			    <td class="xl30">${bean.nvbzrs}</td>
			    <td class="xl30">${bean.fzs}</td>
			    <td class="xl30">${bean.fzl}&nbsp;</td>
			    <td class="xl30">${bean.ysbls}</td>
			    <td class="xl30">${bean.ysbll}&nbsp;</td>
			    <td class="xl30">${bean.bzl}&nbsp;</td>
		   </tr>
		</c:forEach>
	   	<tr height="19" style='height:14.25pt;'>
	    	<td class="xl32" height="19" colspan="11" style='height:14.25pt;border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>共查到[${fn:length(jzztjbbBeans) - 1}]条记录</td>
	   	</tr>
	   	<tr height="19" style='height:14.25pt;'>
	    	<td class="xl33" height="19" colspan="11" style='height:14.25pt;border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>审核人：<font class="font5">
	    		<span style='mso-spacerun:yes;'>${loginInfo.realname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></font>
	    		<font class="font5">填表人：</font><font class="font5"><span style='mso-spacerun:yes;'>${loginInfo.realname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></font>
	    		<font class="font5">年</font><font class="font5"><span style='mso-spacerun:yes;'>&nbsp;&nbsp;&nbsp;&nbsp; </span></font><font class="font5">月</font><font class="font5"><span style='mso-spacerun:yes;'>&nbsp;&nbsp;&nbsp;&nbsp; </span></font><font class="font5">日填</font></td>
	   	</tr>
  </table>
 </body> 
</html>
