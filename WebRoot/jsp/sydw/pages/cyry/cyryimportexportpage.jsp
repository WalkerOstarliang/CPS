<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("从业人员导入重点人员.xls", "UTF-8");
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
	{color:#000000;
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
	border:.5pt solid windowtext;}
.xl23
	{mso-style-parent:style0;
	mso-number-format:"\@";
	border:.5pt solid windowtext;}
.xl24
	{mso-style-parent:style0;
	mso-number-format:"yyyy/m/d\;\@";
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	color:#000000;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	mso-number-format:"\@";
	color:#000000;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	mso-number-format:"yyyy/m/d\;\@";
	color:#000000;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	mso-number-format:"yyyy/m/d";
	color:#000000;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	color:#000000;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
</style>
 </head>
 <body link="blue" vlink="purple">
  <table width="1143" border="0" cellpadding="0" cellspacing="0" style='width:857.25pt;border-collapse:collapse;table-layout:fixed;'>
   <tr height="19" style='height:14.25pt;'>
   	<td class="xl23" align="center" height="19" width="56" style='height:14.25pt;width:42.00pt;'>序号</td>
    <td class="xl22" align="center" width="56" style='height:14.25pt;width:42.00pt;'>姓名</td>
    <td class="xl23" align="center" width="163" style='width:122.25pt;'>身份证号码</td>
    <td class="xl23" align="center" width="101" style='width:75.75pt;'>电话号码</td>
    <td class="xl22" align="center" width="98" style='width:73.50pt;'>职务</td>
    <td class="xl24" align="center" width="79" style='width:59.25pt;'>入职时间</td>
    <td class="xl22" align="center" width="79" style='width:59.25pt;'>离职时间</td>
    <td class="xl22" align="center" width="309" style='width:231.75pt;'>居住地派出所</td>
    <td class="xl22" align="center" width="103" style='width:77.25pt;'>居住地址</td>
    <td class="xl22" align="center" width="45" style='width:33.75pt;'>备注</td>
    <td class="xl22" align="center" width="110" style='width:82.50pt;'>重点人员标记</td>
   </tr>
   <c:forEach items="${zdryCyryBeans}" var="bean" varStatus="st">
	   <tr height="19" style='height:14.25pt;'>
	   	<td class="xl25" height="19" style='height:14.25pt;'>${st.index + 1 }</td>
	    <td class="xl25">${bean.xm }</td>
	    <td class="xl26">${bean.sfzh }</td>
	    <td class="xl26">${bean.lxdh }</td>
	    <td class="xl25">${bean.zw }</td>
	    <td class="xl27">${bean.rzsj }</td>
	    <td class="xl28">${bean.lzsj }</td>
	    <td class="xl29">${bean.jzdpcs }</td>
	    <td class="xl25">${bean.jzdz }</td>
	    <td class="xl25">${bean.bz }</td>
	    <td class="xl30">${bean.zdrylbms }</td>
	   </tr>
   </c:forEach>
  </table>
 </body>
</html>
