<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("派出所基本情况年度汇总表.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName);   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> <html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
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
	text-align:center;}
.xl23
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	border:1.0pt solid windowtext;}
.xl24
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	border-left:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	border:1.0pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFF99;
	border:1.0pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	border:1.0pt solid windowtext;}
</style>
 </head>
 <body link="blue" vlink="purple">
  <table width="2778" border="0" cellpadding="0" cellspacing="0" style='width:2083.50pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="37" class="xl22" style='mso-width-source:userset;mso-width-alt:1184;'/>
   <col width="141" style='mso-width-source:userset;mso-width-alt:4512;'/>
   <col width="56" style='mso-width-source:userset;mso-width-alt:1792;'/>
   <col width="101" style='mso-width-source:userset;mso-width-alt:3232;'/>
   <col width="87" style='mso-width-source:userset;mso-width-alt:2784;'/>
   <col width="72" style='mso-width-source:userset;mso-width-alt:2304;'/>
   <col width="56" span="2" style='mso-width-source:userset;mso-width-alt:1792;'/>
   <col width="57" style='mso-width-source:userset;mso-width-alt:1824;'/>
   <col width="56" style='mso-width-source:userset;mso-width-alt:1792;'/>
   <col width="73" span="3" style='mso-width-source:userset;mso-width-alt:2336;'/>
   <col width="56" span="14" style='mso-width-source:userset;mso-width-alt:1792;'/>
   <col width="70" style='mso-width-source:userset;mso-width-alt:2240;'/>
   <col width="56" span="2" style='mso-width-source:userset;mso-width-alt:1792;'/>
   <col width="73" style='mso-width-source:userset;mso-width-alt:2336;'/>
   <col width="56" span="13" style='mso-width-source:userset;mso-width-alt:1792;'/>
   <col width="73" style='mso-width-source:userset;mso-width-alt:2336;'/>
   <tr height="114" style='height:85.50pt;'>
    <td class="xl23" height="114" width="37" style='height:85.50pt;width:27.75pt;'>序号</td>
    <td class="xl23" width="141" style='width:105.75pt;'>使用单位名称</td>
    <td class="xl23" width="56" style='width:42.00pt;'>实有数（人）</td>
    <td class="xl23" width="101" style='width:75.75pt;'>县级公安机关总警力数</td>
    <td class="xl23" width="87" style='width:65.25pt;'>派出所实有警力占县级公安机关总警力的比例小于40％的县区局数</td>
    <td class="xl23" width="72" style='width:54.00pt;'>当年（统计期）接受过集中业务培训的民警数</td>
    <td class="xl23" width="56" style='width:42.00pt;'>派出所数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>城区户籍所数（个）</td>
    <td class="xl23" width="57" style='width:42.75pt;'>20人及以上的城区派出所数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>建制镇派出所数（个）</td>
    <td class="xl23" width="73" style='width:54.75pt;'>10人及以上的建制镇派出所数（个）</td>
    <td class="xl23" width="73" style='width:54.75pt;'>建制乡派出所数(个)</td>
    <td class="xl23" width="73" style='width:54.75pt;'>5人及以上的建制乡派出所数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>治安派出所数</td>
    <td class="xl23" width="56" style='width:42.00pt;'>水上派出所数</td>
    <td class="xl23" width="56" style='width:42.00pt;'>一级派出所数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>二级派出所数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>三级派出所数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>四级派出所数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>五级派出所数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>副科级以下</td>
    <td class="xl23" width="56" style='width:42.00pt;'>副科级</td>
    <td class="xl23" width="56" style='width:42.00pt;'>正科级</td>
    <td class="xl23" width="56" style='width:42.00pt;'>副处级</td>
    <td class="xl23" width="56" style='width:42.00pt;'>副处级以上</td>
    <td class="xl23" width="56" style='width:42.00pt;'>汽车（辆）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>无车派出所数</td>
    <td class="xl23" width="70" style='width:52.50pt;'>计算机（台）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>无电脑派出所数</td>
    <td class="xl23" width="56" style='width:42.00pt;'>所长数</td>
    <td class="xl23" width="73" style='width:54.75pt;'>防弹头盔（顶）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>未装备防弹头盔的派出所数</td>
    <td class="xl23" width="56" style='width:42.00pt;'>防弹背心（件）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>未装备防弹背心的派出所数</td>
    <td class="xl23" width="56" style='width:42.00pt;'>防刺背心（件）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>未装备防刺背心的派出所数</td>
    <td class="xl23" width="56" style='width:42.00pt;'>已建社区警务室数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>社区民警（人）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>社区民警中专职社区民警数</td>
    <td class="xl23" width="56" style='width:42.00pt;'>社区数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>已建农村警务室数（个）</td>
    <td class="xl23" width="56" style='width:42.00pt;'>驻村民警</td>
    <td class="xl23" width="56" style='width:42.00pt;'>驻村民警中专职驻村民警数</td>
    <td class="xl23" width="56" style='width:42.00pt;'>行政村数（个）</td>
    <td class="xl23" width="73" style='width:54.75pt;'>警务区数（个）</td>
   </tr>
   <c:forEach items="${pcsjbqkhzList}" var="bean" varStatus="st">
	   <tr height="19" style='height:14.25pt;'>
	    <td class="xl24" height="19" style='height:14.25pt;' x:num>${st.index + 1}</td>
	    <td class="xl24">${bean.orgname }</td>
	    <td class="xl24">${bean.syrs }</td>
	    <td class="xl24">${bean.xjgajgzjls }</td>
	    <td class="xl24">${bean.syjlzxjlbl }</td>
	    <td class="xl24">${bean.cjpxmjs }</td>
	    <td class="xl24">${bean.pcss }</td>
	    <td class="xl24">${bean.cqhjs }</td>
	    <td class="xl24">${bean.cqs }</td>
	    <td class="xl24">${bean.zpcs1 }</td>
	    <td class="xl24">${bean.zpcs2 }</td>
	    <td class="xl24">${bean.xpcs }</td>
	    <td class="xl24">${bean.xpcs2 }</td>
	    <td class="xl24">${bean.zas }</td>
	    <td class="xl24">${bean.sss }</td>
	    <td class="xl24">${bean.yijs }</td>
	    <td class="xl24">${bean.erjs }</td>
	    <td class="xl24">${bean.sanjs }</td>
	    <td class="xl24">${bean.sijs }</td>
	    <td class="xl24">${bean.wujs }</td>
	    <td class="xl24">${bean.fkjyx }</td>
	    <td class="xl24">${bean.fkj }</td>
	    <td class="xl24">${bean.zkj }</td>
	    <td class="xl24">${bean.fcj }</td>
	    <td class="xl24">${bean.fcjys }</td>
	    <td class="xl24">${bean.qcs }</td>
	    <td class="xl24">${bean.wcpcs }</td>
	    <td class="xl24">${bean.jsjs }</td>
	    <td class="xl24">${bean.wjsjs }</td>
	    <td class="xl24">${bean.szs }</td>
	    <td class="xl24">${bean.fdtks }</td>
	    <td class="xl24">${bean.wfdtkpcss }</td>
	    <td class="xl24">${bean.fdbxs }</td>
	    <td class="xl24">${bean.wfdbxpcss }</td>
	    <td class="xl24">${bean.fcbxs }</td>
	    <td class="xl24">${bean.wfcbxpcss }</td>
	    <td class="xl24">${bean.jljwqs }</td>
	    <td class="xl24">${bean.sqmjs }</td>
	    <td class="xl24">${bean.zzmjs }</td>
	    <td class="xl24">${bean.sqs }</td>
	    <td class="xl24">${bean.ncjwss }</td>
	    <td class="xl24">${bean.zcmjs }</td>
	    <td class="xl24">${bean.zczzmjs }</td>
	    <td class="xl24">${bean.xzcs }</td>
	    <td class="xl24">${bean.jwqs }</td>
	   </tr>
   </c:forEach>
  </table>
 </body>
</html>
