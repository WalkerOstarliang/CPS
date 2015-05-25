<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("公安部流动人口统计表.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename="+fileName);   
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
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font1
	{color:#0000FF;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font2
	{color:#800080;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font3
	{color:#000000;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font4
	{color:#000000;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font5
	{color:#000000;
	font-size:10.5pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font6
	{color:#000000;
	font-size:11.0pt;
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
.style21
	{color:#0000FF;
	font-size:12.0pt;
	text-decoration:underline;
	text-underline-style:single;
	font-family:宋体;
	mso-style-name:"Hyperlink";
	mso-style-id:8;}
.style22
	{color:#800080;
	font-size:12.0pt;
	text-decoration:underline;
	text-underline-style:single;
	font-family:宋体;
	mso-style-name:"Followed Hyperlink";
	mso-style-id:9;}
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
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;}
.xl24
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-weight:700;}
.xl25
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:bottom;
	color:#000000;
	font-size:9.0pt;
	border-bottom:.5pt solid #000000;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl27
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border-left:.5pt solid #000000;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl28
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border-top:.5pt solid #000000;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl29
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border-right:.5pt solid #000000;}
.xl30
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border:.5pt solid #000000;}
.xl31
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl32
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:10.5pt;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl33
	{mso-style-parent:style0;
	text-align:right;
	color:#000000;
	font-size:9.0pt;
	border:.5pt solid #000000;}
.xl34
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:bottom;
	color:#000000;
	font-size:9.0pt;}
.xl35
	{mso-style-parent:style0;
	text-align:right;
	vertical-align:bottom;
	color:#000000;
	font-size:9.0pt;}
.xl36
	{mso-style-parent:style0;
	color:#000000;
	font-size:11.0pt;}
  </style>
  
 </head>
 <body link="blue" vlink="purple">
  <table width="1346" border="0" cellpadding="0" cellspacing="0" style='width:1009.50pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="266" style='mso-width-source:userset;mso-width-alt:8512;'/>
   <col width="88" style='mso-width-source:userset;mso-width-alt:2816;'/>
   <col width="64" span="2" style='mso-width-source:userset;mso-width-alt:2048;'/>
   <col width="59" style='mso-width-source:userset;mso-width-alt:1888;'/>
   <col width="66" style='mso-width-source:userset;mso-width-alt:2112;'/>
   <col width="62" style='mso-width-source:userset;mso-width-alt:1984;'/>
   <col width="63" style='mso-width-source:userset;mso-width-alt:2016;'/>
   <col width="66" style='mso-width-source:userset;mso-width-alt:2112;'/>
   <col width="60" style='mso-width-source:userset;mso-width-alt:1920;'/>
   <col width="59" style='mso-width-source:userset;mso-width-alt:1888;'/>
   <col width="45" style='mso-width-source:userset;mso-width-alt:1440;'/>
   <col width="44" style='mso-width-source:userset;mso-width-alt:1408;'/>
   <col width="53" style='mso-width-source:userset;mso-width-alt:1696;'/>
   <col width="61" style='mso-width-source:userset;mso-width-alt:1952;'/>
   <col width="59" style='mso-width-source:userset;mso-width-alt:1888;'/>
   <col width="51" style='mso-width-source:userset;mso-width-alt:1632;'/>
   <col width="59" style='mso-width-source:userset;mso-width-alt:1888;'/>
   <col width="57" style='mso-width-source:userset;mso-width-alt:1824;'/>
   <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl24" height="19" width="1346" colspan="19" style='height:14.25pt;width:1009.50pt;border-right:none;border-bottom:none;'>暂 住 人 口 管 理 统 计 报 表</td>
   </tr>
   <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl25" height="19" colspan="19" style='height:14.25pt;border-right:none;border-bottom:.5pt solid #000000;'>
    	&nbsp;&nbsp;统计单位：<span style='mso-spacerun:yes;'>${zzrktjbbBean.orgname}</span>
    	&nbsp;&nbsp;统计时间：<span style='mso-spacerun:yes;'>${zzrktjbbBean.tjyf} </span>
    	&nbsp;&nbsp;备案机关：国家统计局</td>
   </tr>
   <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl26" height="95" rowspan="5" style='height:71.25pt;border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;width:100px;'/>
    <td class="xl27" rowspan="5" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>合计</td>
    <td class="xl28" colspan="2" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>性 别</td>
    <td class="xl28" colspan="3" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>暂 住 时 间</td>
    <td class="xl28" colspan="6" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>来 自 地 区</td>
    <td class="xl28" colspan="6" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>居 住 处 所</td>
   </tr>
   <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl27" rowspan="4" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>男</td>
    <td class="xl27" rowspan="4" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>女</td>
    <td class="xl29">半以</td>
    <td class="xl29">半五</td>
    <td class="xl29">五以</td>
    <td class="xl30" colspan="2" rowspan="2" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>省内</td>
    <td class="xl30" colspan="2" rowspan="2" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>省外</td>
    <td class="xl29">港</td>
    <td class="xl29">国</td>
    <td class="xl29">旅</td>
    <td class="xl29">居</td>
    <td class="xl29">单</td>
    <td class="xl29">工</td>
    <td class="xl29">租</td>
    <td class="xl29">其</td>
   </tr>
   <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl29">   </td>
    <td class="xl29">年 </td>
    <td class="xl29">   </td>
    <td class="xl29">澳</td>
    <td class="xl29">外</td>
    <td class="xl29">居</td>
    <td class="xl29">民</td>
    <td class="xl29">位</td>
    <td class="xl29">地</td>
    <td class="xl29">赁</td>
    <td class="xl29">他</td>
   </tr>
   <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl29">年下</td>
    <td class="xl29">至年</td>
    <td class="xl29">年上</td>
    <td class="xl27" rowspan="2" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>市</td>
    <td class="xl27" rowspan="2" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>县</td>
    <td class="xl27" rowspan="2" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>市</td>
    <td class="xl27" rowspan="2" style='border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>县</td>
    <td class="xl29">台</td>
    <td class="xl29"/>
    <td class="xl29"/>
    <td class="xl29">家</td>
    <td class="xl29">内</td>
    <td class="xl29">现</td>
    <td class="xl29">房</td>
    <td class="xl29"/>
   </tr>
   <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl32"/>
    <td class="xl32"/>
    <td class="xl32"/>
    <td class="xl32"/>
    <td class="xl32"/>
    <td class="xl32"/>
    <td class="xl32">中</td>
    <td class="xl32">部</td>
    <td class="xl32">场</td>
    <td class="xl32">屋</td>
    <td class="xl32"/>
   </tr>
   <c:forEach items="${zzrktjbbBeans}" var="bean" varStatus="st">
		<tr>
			<td class="xl32" height="19" style='height:14.25pt;'>${bean.jzsymc}</td>
			<td class="xl32">${bean.hj}</td>
			<td class="xl32">${bean.xbmnum}</td>
			<td class="xl32">${bean.xbwnum}</td>
			<td class="xl32">${bean.njzqxbnyxnum}</td>
			<td class="xl32">${bean.njzqxbnzwnnum}</td>
			<td class="xl32">${bean.njzqxwnys}</td>
			<td class="xl32">${bean.hjdlxsns}</td>
			<td class="xl32">${bean.hjdlxsnx}</td>
			<td class="xl32">${bean.hjdlxsws}</td>
			<td class="xl32">${bean.hjdlxswx}</td>
			<td class="xl32">${bean.hjdlxgat}</td>
			<td class="xl32">${bean.hjdlxgw}</td>
			<td class="xl32">${bean.zzcslj}</td>
			<td class="xl32">${bean.zzcsjmjz}</td>
			<td class="xl32">${bean.zzcsdwnb}</td>
			<td class="xl32">${bean.zzcsgdxc}</td>
			<td class="xl32">${bean.zzcszlfw}</td>
			<td class="xl32">${bean.zzcsqt}</td>
		</tr>
	</c:forEach>
   <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl33" height="19" colspan="19" style='height:14.25pt;border-right:.5pt solid #000000;border-bottom:.5pt solid #000000;'>共查到[13]条记录</td>
   </tr>
    <tr height="19" style='height:14.25pt;mso-height-source:userset;mso-height-alt:285;'>
    <td class="xl33" height="19" colspan="19" style='height:14.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	填表人：${loginInfo.realname}        审核人：  ${loginInfo.realname}      
    	<span style='mso-spacerun:yes;'>&nbsp;&nbsp;&nbsp; </span>年  
    	<span style='mso-spacerun:yes;'>&nbsp; </span>月  
    	<span style='mso-spacerun:yes;'>&nbsp; </span>日 填</td>
   </tr>
  </table>
 </body>
</html>