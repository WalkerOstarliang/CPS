<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("派出所基本情况统计表.xls", "UTF-8");
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
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font1
	{color:windowtext;
	font-size:10.0pt;
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
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
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
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;}
.xl22
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-size:10.0pt;
	border:1.0pt solid windowtext;}
.xl23
	{mso-style-parent:style0;
	white-space:normal;
	border-left:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;}
.xl24
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	border-left:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;}
</style>
 </head>
 <body link="blue" vlink="purple">
  <table width="1914" border="0" cellpadding="0" cellspacing="0" style='width:1435.50pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="35" style='mso-width-source:userset;mso-width-alt:1120;'/>
   <col width="113" style='mso-width-source:userset;mso-width-alt:3616;'/>
   <col width="72" style='width:54.00pt;'/>
   <col width="80" style='mso-width-source:userset;mso-width-alt:2560;'/>
   <col width="93" style='mso-width-source:userset;mso-width-alt:2976;'/>
   <col width="105" style='mso-width-source:userset;mso-width-alt:3360;'/>
   <col width="136" style='mso-width-source:userset;mso-width-alt:4352;'/>
   <col width="110" style='mso-width-source:userset;mso-width-alt:3520;'/>
   <col width="85" style='mso-width-source:userset;mso-width-alt:2720;'/>
   <col width="58" span="2" style='mso-width-source:userset;mso-width-alt:1856;'/>
   <col width="57" style='mso-width-source:userset;mso-width-alt:1824;'/>
   <col width="72" style='width:54.00pt;'/>
   <col width="57" span="2" style='mso-width-source:userset;mso-width-alt:1824;'/>
   <col width="44" span="3" style='mso-width-source:userset;mso-width-alt:1408;'/>
   <col width="83" style='mso-width-source:userset;mso-width-alt:2656;'/>
   <col width="70" span="2" style='mso-width-source:userset;mso-width-alt:2240;'/>
   <col width="72" style='width:54.00pt;'/>
   <col width="83" style='mso-width-source:userset;mso-width-alt:2656;'/>
   <col width="72" span="3" style='width:54.00pt;'/>
   <tr height="33.33" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
    <td class="xl22" height="33.33" width="35" style='height:25.00pt;width:26.25pt;' >序号</td>
    <td class="xl22" width="113" style='width:84.75pt;' >单位名称</td>
    <td class="xl22" width="72" style='width:54.00pt;' >所长姓名</td>
    <td class="xl22" width="80" style='width:60.00pt;' >级别</td>
    <td class="xl22" width="93" style='width:69.75pt;' >派出所类别</td>
    <td class="xl22" width="105" style='width:78.75pt;' >派出所等级</td>
    <td class="xl22" width="136" style='width:102.00pt;' >人均公用经费保障(万)</td>
    <td class="xl22" width="110" style='width:82.50pt;' >实际拨付到位(万)</td>
    <td class="xl22" width="85" style='width:63.75pt;' >辖区面积(㎡)</td>
    <td class="xl22" width="58" style='width:43.50pt;' >汽车(辆)</td>
    <td class="xl22" width="58" style='width:43.50pt;' >电脑(台)</td>
    <td class="xl22" width="57" style='width:42.75pt;' >单警装备(套)</td>
    <td class="xl22" width="72" style='width:54.00pt;' >防弹头盔(套)</td>
    <td class="xl22" width="57" style='width:42.75pt;' >防弹背心(套)</td>
    <td class="xl22" width="57" style='width:42.75pt;' >防刺背心(套)</td>
    <td class="xl22" width="44" style='width:33.00pt;' >警力数</td>
    <td class="xl22" width="44" style='width:33.00pt;' >辅警数</td>
    <td class="xl22" width="44" style='width:33.00pt;' >社区数</td>
    <td class="xl22" width="83" style='width:62.25pt;' >建立警务室数</td>
    <td class="xl22" width="70" style='width:52.50pt;' >社区民警数</td>
    <td class="xl22" width="70" style='width:52.50pt;' >驻村民警数</td>
    <td class="xl22" width="72" style='width:54.00pt;' >社区民警配备辅警数</td>
    <td class="xl22" width="83" style='width:62.25pt;' >农村警务室数</td>
    <td class="xl22" width="72" style='width:54.00pt;' >户籍人口数</td>
    <td class="xl22" width="72" style='width:54.00pt;' >流动人口数</td>
    <td class="xl22" width="72" style='width:54.00pt;' >重点人员数</td>
   </tr>
   <c:forEach items="${pcsjbxxList}" var="pcsjbxx" varStatus="st">
   <tr height="21.33" style='height:16.00pt;mso-height-source:userset;mso-height-alt:320;'>
    <td class="xl23" height="21.33" align="right" style='height:16.00pt;'>${st.index + 1 }</td>
    <td class="xl24">${pcsjbxx.orgname}</td>
    <td class="xl24">${pcsjbxx.pcsszxm }</td>
    <td class="xl24">${pcsjbxx.jbms }</td>
    <td class="xl24">${pcsjbxx.lbms }</td>
    <td class="xl24">${pcsjbxx.djms }</td>
    <td class="xl24">${pcsjbxx.rjgyjfbz }</td>
    <td class="xl24">${pcsjbxx.sjbfdw }</td>
    <td class="xl24">${pcsjbxx.xqmj }</td>
    <td class="xl24">${pcsjbxx.qcs }</td>
    <td class="xl24">${pcsjbxx.dnts }</td>
    <td class="xl24">${pcsjbxx.djzbs }</td>
    <td class="xl24">${pcsjbxx.fdtks }</td>
    <td class="xl24">${pcsjbxx.fdbxs }</td>
    <td class="xl24">${pcsjbxx.fcbxs }</td>
    <td class="xl24">${pcsjbxx.jls }</td>
    <td class="xl24">${pcsjbxx.fjs }</td>
    <td class="xl24">${pcsjbxx.sqs }</td>
    <td class="xl24">${pcsjbxx.sqjwss }</td>
    <td class="xl24">${pcsjbxx.sqmjs }</td>
    <td class="xl24">${pcsjbxx.zcmjs }</td>
    <td class="xl24">${pcsjbxx.sqmjpbfjs }</td>
    <td class="xl24">${pcsjbxx.ncjwss }</td>
    <td class="xl24">${pcsjbxx.hjrks }</td>
    <td class="xl24">${pcsjbxx.zzrks }</td>
    <td class="xl24">${pcsjbxx.zddxs }</td>
   </tr>
	</c:forEach>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl27" height="19" colspan="26" style='height:14.25pt;mso-ignore:colspan;'/>
   </tr>
  </table>
 </body>
</html>

