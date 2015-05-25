<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("实有人口导入重点人员.xls", "UTF-8");
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
     <o:LastSaved>2015-01-06T15:22:23</o:LastSaved>
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
	{color:#000000;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font2
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
	text-align:center;}
.xl23
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	border:.5pt solid windowtext;}
.xl24
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	color:#000000;
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	mso-number-format:"yyyy/m/d\;\@";
	text-align:center;
	color:#000000;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	text-align:center;
	color:#000000;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	mso-number-format:"\@";
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
	mso-number-format:"yyyy/m/d\;\@";
	color:#000000;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	text-align:left;}
.xl32
	{mso-style-parent:style0;
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
        <x:FreezePanes/>
        <x:FrozenNoSplit/>
        <x:SplitHorizontal>1</x:SplitHorizontal>
        <x:TopRowBottomPane>1</x:TopRowBottomPane>
        <x:ActivePane>2</x:ActivePane>
        <x:Panes>
         <x:Pane>
          <x:Number>2</x:Number>
          <x:ActiveCol>3</x:ActiveCol>
          <x:ActiveRow>13</x:ActiveRow>
          <x:RangeSelection>D14</x:RangeSelection>
         </x:Pane>
         <x:Pane>
          <x:Number>3</x:Number>
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
       <x:DataValidation>
        <x:Range>$G$8:G65536</x:Range>
       </x:DataValidation>
       <x:DataValidation>
        <x:Range>$H$2:H7</x:Range>
        <x:Type>List</x:Type>
        <x:CellRangeList/>
        <x:Value>&quot;01-雇员与员工,02-承租人,03-亲属,04-非亲属,101-本人,102-户主,120-子,111-夫,112-妻,130-女,150-父母,170-兄弟姐妹,99-其他&quot;</x:Value>
       </x:DataValidation>
       <x:DataValidation>
        <x:Range>$G$2:G7</x:Range>
        <x:Type>List</x:Type>
        <x:CellRangeList/>
        <x:Value>&quot;00-暂住处所不详,01-宾馆,02-公寓,03-旅馆,04-旅店,05-招待所,11-医院,12-疗养院,13-康复中心,21-机关,22-团体,23-部队,24-学校,25-企事业单位内部,26-宗教场所,27-外地常驻机构,31-居民家中,32-自建房屋,33-购买房屋,34-租赁房屋,41-流动性施工单位,42-临时工棚,43-水上船舶,51-个体摊点,61-收容站,62-遣送站,99-其他暂住处所&quot;</x:Value>
       </x:DataValidation>
       <x:DataValidation>
        <x:Range>$F$2:F7</x:Range>
        <x:Type>List</x:Type>
        <x:CellRangeList/>
        <x:Value>&quot;00-事由不详,01-内部单位合同工,02-企事业雇用临时工,03-建筑民工,04-装卸运输工,05-办厂,06-务农,07-养殖,09-其他劳务,11-单位经商,12-个体户经商,19-其他经营,37-保姆,39-其他服务,49-其他经济型,53-寄读、借读,57-婚入,80-夫妻投靠,81-子女投靠父母,82-父母投靠子女,83-其他投靠亲友,100-房屋拆迁,400-投靠亲友,500-分配调动工作,600-分换房屋&quot;</x:Value>
       </x:DataValidation>
       <x:DataValidation>
        <x:Range>$I$2:I7</x:Range>
        <x:Type>List</x:Type>
        <x:CellRangeList/>
        <x:Value>&quot;1-一个月,2-三个月,3-六个月,4-一年,5-两年,6-三年&quot;</x:Value>
       </x:DataValidation>
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
  <table width="1164" border="0" cellpadding="0" cellspacing="0" style='width:873.00pt;border-collapse:collapse;table-layout:fixed;'>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl23" height="19" width="45" style='height:14.25pt;width:33.75pt;'>序号</td>
    <td class="xl23" width="56" style='width:42.00pt;'>姓名</td>
    <td class="xl24" width="163" style='width:122.25pt;'>身份证号码</td>
    <td class="xl23" width="101" style='width:75.75pt;'>电话号码</td>
    <td class="xl25" width="79" style='width:59.25pt;'>居住时间</td>
    <td class="xl23" width="147" style='width:110.25pt;'>居住事由</td>
    <td class="xl23" width="130" style='width:97.50pt;'>居住处所</td>
    <td class="xl23" width="98" style='width:73.50pt;'>与户主关系</td>
    <td class="xl23" width="103" style='width:77.25pt;'>拟居住期限</td>
    <td class="xl23" width="87" style='width:65.25pt;'>备注</td>
    <td class="xl23" width="155" style='width:116.25pt;'>重点人员类别标示</td>
   </tr>
   <c:forEach items="${syrkZdryBeans}" var="bean" varStatus="st">
	   <tr height="19" style='height:14.25pt;'>
	    <td class="xl26" height="19" style='height:14.25pt;'>${st.index + 1 }</td>
	    <td class="xl27">${bean.xm }</td>
	    <td class="xl28">${bean.sfzh }</td>
	    <td class="xl29">${bean.lxdh }</td>
	    <td class="xl30">${bean.jzsj }</td>
	    <td class="xl29">${bean.jzsy }</td>
	    <td class="xl29">${bean.jzcs }</td>
	    <td class="xl29">${bean.yhzgx }</td>
	    <td class="xl29">${bean.njzqx }</td>
	    <td class="xl29">${bean.bz }</td>
	    <td class="xl32">${bean.zdrylbms }</td>
	   </tr>
   </c:forEach>
  </table>
 </body>
</html>
