<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("安全检查统计表报.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName);   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="ProgId" content="Excel.Sheet"/>
  <meta name="Generator" content="WPS Office ET"/>
  <!--[if gte mso 9]>
   <xml>
    <o:DocumentProperties>
     <o:Author>Administrator</o:Author>
     <o:Created>2012-06-06T09:30:27</o:Created>
     <o:LastSaved>2015-01-29T14:55:34</o:LastSaved>
    </o:DocumentProperties>
    <o:CustomDocumentProperties>
     <o:KSOProductBuildVer dt:dt="string">2052-9.1.0.4468</o:KSOProductBuildVer>
    </o:CustomDocumentProperties>
   </xml>
  <![endif]-->
  <style>
<!-- @page
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
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;}
.xl23
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;}
.xl24
	{mso-style-parent:style0;
	mso-number-format:"\@";
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	mso-number-format:"\@";
	border:.5pt solid windowtext;}
 -->  </style>
  <!--[if gte mso 9]>
   <xml>
    <x:ExcelWorkbook>
     <x:ExcelWorksheets>
      <x:ExcelWorksheet>
       <x:Name>Sheet1</x:Name>
       <x:WorksheetOptions>
        <x:DefaultRowHeight>285</x:DefaultRowHeight>
        <x:Selected/>
        <x:Panes>
         <x:Pane>
          <x:Number>3</x:Number>
          <x:ActiveCol>15</x:ActiveCol>
          <x:ActiveRow>19</x:ActiveRow>
          <x:RangeSelection>P20</x:RangeSelection>
         </x:Pane>
        </x:Panes>
        <x:ProtectContents>False</x:ProtectContents>
        <x:ProtectObjects>False</x:ProtectObjects>
        <x:ProtectScenarios>False</x:ProtectScenarios>
        <x:PageBreakZoom>100</x:PageBreakZoom>
        <x:Print>
         <x:ValidPrinterInfo/>
         <x:PaperSizeIndex>9</x:PaperSizeIndex>
        </x:Print>
       </x:WorksheetOptions>
      </x:ExcelWorksheet>
     </x:ExcelWorksheets>
     <x:ProtectStructure>False</x:ProtectStructure>
     <x:ProtectWindows>False</x:ProtectWindows>
     <x:WindowHeight>10180</x:WindowHeight>
     <x:WindowWidth>21600</x:WindowWidth>
    </x:ExcelWorkbook>
   </xml>
  <![endif]-->
 </head>
 <body link="blue" vlink="purple">
  <table width="1290" border="0" cellpadding="0" cellspacing="0" style='width:967.50pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="72" style='width:54.00pt;'/>
   <col width="43" span="4" style='mso-width-source:userset;mso-width-alt:1376;'/>
   <col width="59" style='mso-width-source:userset;mso-width-alt:1888;'/>
   <col width="43" span="3" style='mso-width-source:userset;mso-width-alt:1376;'/>
   <col width="59" style='mso-width-source:userset;mso-width-alt:1888;'/>
   <col width="43" span="3" style='mso-width-source:userset;mso-width-alt:1376;'/>
   <col width="72" style='width:54.00pt;'/>
   <col width="75" span="2" style='mso-width-source:userset;mso-width-alt:2400;'/>
   <col width="72" span="2" style='width:54.00pt;'/>
   <col width="53" style='mso-width-source:userset;mso-width-alt:1696;'/>
   <col width="43" span="2" style='mso-width-source:userset;mso-width-alt:1376;'/>
   <col width="69" style='mso-width-source:userset;mso-width-alt:2208;'/>
   <col width="53" style='mso-width-source:userset;mso-width-alt:1696;'/>
   <col width="43" style='mso-width-source:userset;mso-width-alt:1376;'/>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl22" height="38" width="72" rowspan="2" style='height:28.50pt;width:54.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>单位</td>
    <td class="xl22" width="43" rowspan="2" style='width:32.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>总数</td>
    <td class="xl22" width="505" colspan="11" style='width:378.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>行业类别</td>
    <td class="xl22" width="222" colspan="3" style='width:166.50pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>检查类别</td>
    <td class="xl22" width="144" colspan="2" style='width:108.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>整改情况</td>
    <td class="xl25" width="53" rowspan="2" style='width:39.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>发现<br/>问题数</td>
    <td class="xl22" width="43" rowspan="2" style='width:32.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>警告</td>
    <td class="xl22" width="43" rowspan="2" style='width:32.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>罚款</td>
    <td class="xl25" width="69" rowspan="2" style='width:51.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>下发隐<br/>患通知书</td>
    <td class="xl25" width="53" rowspan="2" style='width:39.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>吊销<br/>许可证</td>
    <td class="xl26" width="43" rowspan="2" style='width:32.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>其他</td>
   </tr>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl23">特行</td>
    <td class="xl23">公场</td>
    <td class="xl23">内保</td>
    <td class="xl23">危险品</td>
    <td class="xl23">网吧</td>
    <td class="xl23">涉外</td>
    <td class="xl23">旅馆</td>
    <td class="xl23">开锁</td>
    <td class="xl23">商铺</td>
    <td class="xl23">物流</td>
    <td class="xl23">其他</td>
    <td class="xl22">总数</td>
    <td class="xl22">消防检查</td>
    <td class="xl22">安全检查</td>
    <td class="xl22">已整改</td>
    <td class="xl22">未整改</td>
   </tr>
   <c:if test="${not empty aqjctjBeans}">
		<c:forEach items="${aqjctjBeans}" var="bean" varStatus="st">
			<tr height="19" style='height:14.25pt;'>
				<td class="xl22" height="19" style='height:14.25pt;'>${bean.orgname }</td>
				<td class="xl24">${bean.zs }</td>
				<td class="xl24">${bean.thjcs }</td>
				<td class="xl24">${bean.gcjcs }</td>
				<td class="xl24">${bean.nbjcs }</td>
				<td class="xl24">${bean.wxpjcs }</td>
				<td class="xl24">${bean.wbjcs }</td>
				<td class="xl24">${bean.swjcs }</td>
				<td class="xl24">${bean.lgjcs }</td>
				<td class="xl24">${bean.ksjcs }</td>
				<td class="xl24">${bean.spjcs }</td>
				<td class="xl24">${bean.wljcs }</td>
				<td class="xl24">${bean.qtjcs }</td>
				<td class="xl24">${bean.jclbzjcs }</td>
				<td class="xl24">${bean.xfjcs }</td>
				<td class="xl24">${bean.aqjcs }</td>
				<td class="xl24">${bean.yzgqks }</td>
				<td class="xl24">${bean.wzgqks }</td>
				<td class="xl24">${bean.fxwts }</td>
				<td class="xl24">${bean.jgs }</td>
				<td class="xl24">${bean.fks }</td>
				<td class="xl24">${bean.xfyhtzs }</td>
				<td class="xl24">${bean.dxxkzs }</td>
				<td class="xl24">${bean.qts }</td>
			</tr>
		</c:forEach>
	</c:if>
  </table>
 </body>
</html>
