<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("数据录入排名统计表.xls", "UTF-8");
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
     <o:LastSaved>2015-01-21T17:11:40</o:LastSaved>
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
	{mso-style-parent:style0;}
.xl23
	{mso-style-parent:style0;
	text-align:center;}
.xl24
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	mso-pattern:#FFFF99;
	mso-background-source:auto;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	text-align:left;
	white-space:normal;
	mso-pattern:#FFFF99;
	mso-background-source:auto;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	text-align:left;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	border:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	text-align:left;
	white-space:normal;
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
          <x:ActiveCol>4</x:ActiveCol>
          <x:ActiveRow>14</x:ActiveRow>
          <x:RangeSelection>E15</x:RangeSelection>
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
      <x:ExcelWorksheet>
       <x:Name>Sheet2</x:Name>
       <x:WorksheetOptions>
        <x:DefaultRowHeight>285</x:DefaultRowHeight>
        <x:Panes>
         <x:Pane>
          <x:Number>3</x:Number>
          <x:ActiveCol>0</x:ActiveCol>
          <x:ActiveRow>0</x:ActiveRow>
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
      <x:ExcelWorksheet>
       <x:Name>Sheet3</x:Name>
       <x:WorksheetOptions>
        <x:DefaultRowHeight>285</x:DefaultRowHeight>
        <x:Panes>
         <x:Pane>
          <x:Number>3</x:Number>
          <x:ActiveCol>0</x:ActiveCol>
          <x:ActiveRow>0</x:ActiveRow>
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
  <table width="966" border="0" cellpadding="0" cellspacing="0" style='width:724.50pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="39" class="xl23" style='mso-width-source:userset;mso-width-alt:1248;'/>
   <col width="357" style='mso-width-source:userset;mso-width-alt:11424;'/>
   <col width="53" style='mso-width-source:userset;mso-width-alt:1696;'/>
   <col width="56" span="2" style='mso-width-source:userset;mso-width-alt:1792;'/>
   <col width="53" style='mso-width-source:userset;mso-width-alt:1696;'/>
   <col width="69" style='mso-width-source:userset;mso-width-alt:2208;'/>
   <col width="85" style='mso-width-source:userset;mso-width-alt:2720;'/>
   <col width="53" span="3" style='mso-width-source:userset;mso-width-alt:1696;'/>
   <col width="39" style='mso-width-source:userset;mso-width-alt:1248;'/>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl24" height="19" width="39" style='height:14.25pt;width:29.25pt;' x:str>序号</td>
    <td class="xl24" width="357" style='width:267.75pt;' x:str>单位名称</td>
    <td class="xl24" width="53" style='width:39.75pt;' x:str>总数</td>
    <td class="xl24" width="56" style='width:42.00pt;' x:str>常口数</td>
    <td class="xl24" width="56" style='width:42.00pt;' x:str>流口数</td>
    <td class="xl24" width="53" style='width:39.75pt;' x:str>寄口数</td>
    <td class="xl24" width="69" style='width:51.75pt;' x:str>未落户数</td>
    <td class="xl24" width="85" style='width:63.75pt;' x:str>从业人员数</td>
    <td class="xl24" width="53" style='width:39.75pt;' x:str>单位数</td>
    <td class="xl24" width="53" style='width:39.75pt;' x:str>实体数</td>
    <td class="xl24" width="53" style='width:39.75pt;' x:str>房屋数</td>
    <td class="xl24" width="39" style='width:29.25pt;' x:str>排名</td>
   </tr>
   <c:forEach items="${datalrtjList}" var="bean" varStatus="st">
	   <tr height="19" class="xl22" style='height:14.25pt;'>
		    <td class="xl25" height="19" style='height:14.25pt;' x:num>${st.index + 1 }</td>
		    <td class="xl26" x:str>${bean.orgname }</td>
		    <td class="xl25" x:str>${bean.zs }</td>
		    <td class="xl25" x:str>${czrks }</td>
		    <td class="xl25" x:str>${bean.ldrks }</td>
		    <td class="xl25" x:str>${bean.jzrks }</td>
		    <td class="xl25" x:str>${bean.wlhrks }</td>
		    <td class="xl25" x:str>${bean.cyrys }</td>
		    <td class="xl25" x:str>${bean.sydws }</td>
		    <td class="xl25" x:str>${bean.stxxs }</td>
		    <td class="xl25" x:str>${bean.fwxxs }</td>
		    <td class="xl25" x:str>${bean.sort }</td>
	   </tr>
   </c:forEach>
  </table>
 </body>
</html>
