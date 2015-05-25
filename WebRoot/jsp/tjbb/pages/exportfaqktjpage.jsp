<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("辖区发案情况统计报表.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName);   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="ProgId" content="Excel.Sheet"/>
  <meta name="Generator" content="WPS Office ET"/>
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
	{color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font2
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
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
.xl22
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-weight:700;
	border-left:1.0pt solid windowtext;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;}
.xl23
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-size:11.0pt;
	border:1.0pt solid windowtext;}
.xl24
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFF99;
	font-size:11.0pt;
	border:1.0pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	font-size:11.0pt;
	border:1.0pt solid windowtext;}
</style>
 </head>
 <body link="blue" vlink="purple">
  <table width="854" border="0" cellpadding="0" cellspacing="0" style='width:640.50pt;border-collapse:collapse;table-layout:fixed;'>
   <tr height="19" style='height:14.25pt;'>
   	<td colspan="8" class="xl22" algin="center">${queryBean.orgname}年度发案汇总报表</td>
   </tr>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl22" height="19" width="39" style='height:14.25pt;width:29.25pt;'>序号</td>
    <td class="xl22" width="127" style='width:95.25pt;'>单位名称</td>
    <td class="xl22" width="140" style='width:105.00pt;'>刑事案件</td>
    <td class="xl22" width="116" style='width:87.00pt;'>行政案件</td>
    <td class="xl22" width="107" style='width:80.25pt;'>抢劫案</td>
    <td class="xl22" width="96" style='width:72.00pt;'>抢夺案</td>
    <td class="xl22" width="117" style='width:87.75pt;'>入室盗窃案</td>
    <td class="xl22" width="112" style='width:84.00pt;'>盗抢机动车</td>
   </tr>
   <c:forEach items="${yearFaqkBeans}" var="bean" varStatus="st">
	   <tr height="19" style='height:14.25pt;'>
	    <td class="xl23" height="19" style='height:14.25pt;'>${st.index + 1 }</td>
	    <td class="xl23">${bean.tjyf }</td>
	    <td class="xl23">${bean.xsaj}</td>
	    <td class="xl23">${bean.zaaj}</td>
	    <td class="xl23">${bean.qjajs}</td>
	    <td class="xl23">${bean.qdajs}</td>
	    <td class="xl23">${bean.rsdqaj}</td>
	    <td class="xl23">${bean.dqjdclaj}</td>
	   </tr>
	   
   </c:forEach>
  </table>
  <table width="854" border="0" cellpadding="0" cellspacing="0" style='width:640.50pt;border-collapse:collapse;table-layout:fixed;'>
   <tr height="19" style='height:14.25pt;'>
   	<td colspan="8" ></td>
   </tr>
   <tr height="19" style='height:14.25pt;'>
   	<td colspan="8" class="xl22" algin="center">${queryBean.orgname}辖区发案统计报表</td>
   </tr>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl22" height="19" width="39" style='height:14.25pt;width:29.25pt;'>序号</td>
    <td class="xl22" width="127" style='width:95.25pt;'>单位名称</td>
    <td class="xl22" width="140" style='width:105.00pt;'>刑事案件</td>
    <td class="xl22" width="116" style='width:87.00pt;'>行政案件</td>
    <td class="xl22" width="107" style='width:80.25pt;'>抢劫案</td>
    <td class="xl22" width="96" style='width:72.00pt;'>抢夺案</td>
    <td class="xl22" width="117" style='width:87.75pt;'>入室盗窃案</td>
    <td class="xl22" width="112" style='width:84.00pt;'>盗抢机动车</td>
   </tr>
   <c:forEach items="${jqtbFaqkBeans}" var="bean" varStatus="st">
	   <tr height="19" style='height:14.25pt;'>
	    <td class="xl23" height="19" style='height:14.25pt;'>${st.index + 1 }</td>
	    <td class="xl23">${bean.orgname }</td>
	    <td class="xl23">${bean.xsaj}</td>
	    <td class="xl23">${bean.zaaj}</td>
	    <td class="xl23">${bean.qjajs}</td>
	    <td class="xl23">${bean.qdajs}</td>
	    <td class="xl23">${bean.rsdqaj}</td>
	    <td class="xl23">${bean.dqjdclaj}</td>
	   </tr>
   </c:forEach>
  </table>
 </body>
</html>
