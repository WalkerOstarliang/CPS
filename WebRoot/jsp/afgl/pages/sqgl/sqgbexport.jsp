<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("社区基干登记表.xls", "UTF-8");
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
     <o:LastSaved>2015-03-26T10:34:34</o:LastSaved>
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
.font1
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font2
	{color:#000000;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font3
	{color:#000000;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"楷体_GB2312";
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
	font-size:10.0pt;}
.xl23
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-size:10.0pt;
	border:.5pt solid #000000;}
.xl24
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-size:10.0pt;
	border-top:.5pt solid #000000;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-size:10.0pt;
	border-top:.5pt solid #000000;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	color:#000000;
	font-size:10.0pt;
	border-left:.5pt solid #000000;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl27
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	color:#000000;
	font-size:10.0pt;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl28
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	color:#000000;
	font-size:10.0pt;
	font-family:楷体_GB2312, monospace;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl29
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	color:#000000;
	font-size:10.0pt;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl30
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-size:10.0pt;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
.xl31
	{mso-style-parent:style0;
	text-align:center;
	font-size:10.0pt;
	border-right:.5pt solid #000000;
	border-bottom:.5pt solid #000000;}
 -->  </style>
  <!--[if gte mso 9]>
   <xml>
    <x:ExcelWorkbook>
     <x:ExcelWorksheets>
      <x:ExcelWorksheet>
       <x:Name>Sheet1</x:Name>
       <x:WorksheetOptions>
        <x:DefaultRowHeight>240</x:DefaultRowHeight>
        <x:Selected/>
        <x:Panes>
         <x:Pane>
          <x:Number>3</x:Number>
          <x:ActiveCol>11</x:ActiveCol>
          <x:ActiveRow>17</x:ActiveRow>
          <x:RangeSelection>L18</x:RangeSelection>
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
     <x:WindowHeight>9740</x:WindowHeight>
     <x:WindowWidth>21480</x:WindowWidth>
    </x:ExcelWorkbook>
    <x:SupBook>
     <x:Path>D:\Documents\Desktop\</x:Path>
    </x:SupBook>
   </xml>
  <![endif]-->
 </head>
 <body link="blue" vlink="purple" class="xl22">
  <table width="894" border="0" cellpadding="0" cellspacing="0" style='width:670.50pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="37" class="xl22" style='mso-width-source:userset;mso-width-alt:1184;'/>
   <col width="47" class="xl22" style='mso-width-source:userset;mso-width-alt:1504;'/>
   <col width="35" class="xl22" style='mso-width-source:userset;mso-width-alt:1120;'/>
   <col width="132" class="xl22" style='mso-width-source:userset;mso-width-alt:4224;'/>
   <col width="59" class="xl22" style='mso-width-source:userset;mso-width-alt:1888;'/>
   <col width="80" class="xl22" style='mso-width-source:userset;mso-width-alt:2560;'/>
   <col width="197" class="xl22" style='mso-width-source:userset;mso-width-alt:6304;'/>
   <col width="80" class="xl22" style='mso-width-source:userset;mso-width-alt:2560;'/>
   <col width="64" class="xl22" style='mso-width-source:userset;mso-width-alt:2048;'/>
   <col width="88" class="xl22" style='mso-width-source:userset;mso-width-alt:2816;'/>
   <col width="75" class="xl22" style='mso-width-source:userset;mso-width-alt:2400;'/>
   <col width="72" span="245" class="xl22" style='width:54.00pt;'/>
   <tr height="16" style='height:12.00pt;'>
    <td class="xl23" height="16" width="37" style='height:12.00pt;width:27.75pt;' x:str>序号</td>
    <td class="xl24" width="47" style='width:35.25pt;' x:str>姓<span style='mso-spacerun:yes;'>&nbsp; </span>名</td>
    <td class="xl24" width="35" style='width:26.25pt;' x:str>性别</td>
    <td class="xl24" width="132" style='width:99.00pt;' x:str>身 份 证 号</td>
    <td class="xl25" width="59" style='width:44.25pt;' x:str>学历</td>
    <td class="xl24" width="80" style='width:60.00pt;' x:str>工作岗位</td>
    <td class="xl25" width="197" style='width:147.75pt;' x:str>家庭祥址</td>
    <td class="xl25" width="80" style='width:60.00pt;' x:str>所属社区</td>
    <td class="xl25" width="64" style='width:48.00pt;' x:str>社区电话</td>
    <td class="xl24" width="88" style='width:66.00pt;' x:str>联系电话</td>
    <td class="xl25" width="75" style='width:56.25pt;' x:str>备注</td>
   </tr>
   <c:forEach items="${sqgbList}" var="bean" varStatus="st">
	   <tr height="64" style='height:48.00pt;'>
	    <td class="xl26" height="64" style='height:48.00pt;' x:num>${st.index + 1 }</td>
	    <td class="xl27" x:str>${bean.gbxm }</td>
	    <td class="xl27" x:str>${bean.gbxbmc }</td>
	    <td class="xl27" x:str>${bean.gbsfzh }</td>
	    <td class="xl27" x:str>${bean.whcdms }</td>
	    <td class="xl27" x:str>${bean.gbzwmc }</td>
	    <td class="xl27" x:str>${bean.gbxzdxz }</td>
	    <td class="xl27" x:str>${bean.sssqmc }</td>
	    <td class="xl27" x:str>${bean.sqlxdh }</td>
	    <td class="xl27" x:num>${bean.gblxdh }</td>
	    <td class="xl28" x:str>${bean.bz }</td>
	   </tr>
   </c:forEach>
  </table>
 </body>
</html>
