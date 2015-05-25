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
	background:#FFFFFF;
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
   <table width="1728" border="0" cellpadding="0" cellspacing="0" style='width:1296.00pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="72" span="24" style='width:54.00pt;'/>
   <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl22" height="57" width="72" rowspan="3" style='height:42.75pt;width:54.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>序号</td>
    <td class="xl22" width="72" rowspan="3" style='width:54.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>单位</td>
    <td class="xl22" width="144" colspan="2" rowspan="2" style='width:108.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>实有人口</td>
    <td class="xl22" width="144" colspan="2" rowspan="2" style='width:108.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>实有单位</td>
    <td class="xl22" width="288" colspan="4" style='width:216.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>企事业单位</td>
    <td class="xl22" width="432" colspan="6" style='width:324.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>行业场所</td>
    <td class="xl22" width="144" colspan="2" rowspan="2" style='width:108.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>从业人员</td>
    <td class="xl22" width="432" colspan="6" style='width:324.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>社区基本信息</td>
   </tr>
   <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl22" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>单位信息</td>
    <td class="xl22" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>重点要害部位</td>
    <td class="xl22" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>歌舞厅</td>
    <td class="xl22" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>卡拉OK</td>
    <td class="xl22" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>电子游戏</td>
    <td class="xl22" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基本信息</td>
    <td class="xl22" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>干部信息</td>
    <td class="xl22" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>治保会成员</td>
   </tr>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
    <td class="xl22">总数</td>
    <td class="xl22">季度数</td>
   </tr>
   <c:forEach items="${jdTbList}" varStatus="s" var="jdTbL">
	   <tr height="19" style='height:14.25pt;'>
	    <td class="xl24" height="19" style='height:14.25pt;'>${s.index + 1}</td>
		<td class="xl25">${jdTbL.dwmc}&nbsp;</td>
		<td class="xl24">${jdTbL.rk_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.rks}&nbsp;</td>
		<td class="xl24">${jdTbL.dw_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.dws}&nbsp;</td>
		<td class="xl24">${jdTbL.qsydw_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.qsydws}&nbsp;</td>
		<td class="xl24">${jdTbL.zdyhbw_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.zdyhbws}&nbsp;</td>
		
		<td class="xl24">${jdTbL.hycsgwt_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.hycsgwts}&nbsp;</td>
		
		<td class="xl24">${jdTbL.hycsklok_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.hycskloks}&nbsp;</td>
		
		<td class="xl24">${jdTbL.hycsdzyx_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.hycsdzyxs}&nbsp;</td>
		
		<td class="xl24">${jdTbL.cyry_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.cyrys}&nbsp;</td>
		<td class="xl24">${jdTbL.sq_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.sqs}&nbsp;</td>
		<td class="xl24">${jdTbL.sqgb_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.sqgbs}&nbsp;</td>
		<td class="xl24">${jdTbL.zbhcy_zs}&nbsp;</td>
		<td class="xl24">${jdTbL.zbhcys}&nbsp;</td>
	   </tr>
    </c:forEach>
  </table>
 </body>
</html>
