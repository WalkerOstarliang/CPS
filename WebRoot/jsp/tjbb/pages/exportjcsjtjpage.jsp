<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("基础数据统计情况报表.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName);   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head>
<creator:Style href="/template/cps/css/xls.css"></creator:Style>
</head>
<body>
	<table class="cps_exportxls" border="1" cellpadding="0" cellspacing="0" style='width:535.50pt;border-collapse:collapse;table-layout:fixed;'>
	    <tr>
	         <th rowspan="2">单位名称</th>
	         <th colspan="5">人口</th>
	         <th colspan="2">房屋</th>
	         <th colspan="6">重点人员</th>
	         <th rowspan="2">单位<br/>总数</th>
       </tr>
       <tr>
         	<th>常<br/>住<br/>人<br/>口</th>
         	<th>暂<br/>住<br/>人<br/>口</th>
         	<th>寄<br/>住<br/>人<br/>口</th>
         	<th>境<br/>外<br/>人<br/>口</th>
         	<th>从<br/>业<br/>人<br/>员</th>
         	
         	<th>总<br/>数</th>
         	<th>出<br/>租<br/>屋</th>
         	<th>总<br/>数</th>
         	 <%-- 
         	<th>涉<br/>恐<br/>人<br/>员</th>
         	--%>
         	<th>涉<br/>毒<br/>人<br/>员</th>
         	<th>涉<br/>稳<br/>人<br/>员</th>
         	<th>在<br/>逃<br/>人<br/>员</th>
         	<th>精<br/>神<br/>病<br/>人</th>
         	<th>刑<br/>事<br/>犯<br/>罪</th>
         	 <%-- 
         	<th>上<br/>访<br/>人<br/>员</th>
         	
          	<th>特<br/>种<br/>行<br/>业</th>
          	<th>内<br/>保<br/>单<br/>位</th>
          	<th>公<br/>共<br/>场<br/>所</th>
          	<th>上<br/>网<br/>场<br/>所</th>
          	<th>危<br/>险<br/>品<br/>单<br/>位</th>
          	<th>涉<br/>外<br/>单<br/>位</th>
          	--%>
       </tr>
       <c:if test="${not empty xqqktjBeans}">
        <c:forEach items="${xqqktjBeans}" var="bean">
         <tr>
           <td width="120px">
           		${bean.mc}
           </td>
           <td>${bean.czrks}</td>
           <td>${bean.ldrks}</td>
           <td>${bean.jzrks}</td>
           <td>${bean.jwrks}</td>
           <td>${bean.cyrys}</td>
           
           <td>${bean.fws}</td>
           <td>${bean.czfws}</td>
           <td>${bean.zddxs}</td>
           <%-- 
           <td>${bean.skrys}&nbsp;</td>
           --%>
           <td>${bean.xdrys}</td>
           <td>${bean.swrys}</td>
           <td>${bean.ztrys}</td>
           <td>${bean.jsbrs}</td>
           <td>${bean.xsfzrys}</td>
            <%-- 
           <td>${bean.sfrys}&nbsp;</td>
          
           <td>${bean.tzhys}</td>
           <td>${bean.nbdws}</td>
           <td>${bean.ggcss}</td>
           <td>${bean.swcss}</td>
           <td>${bean.wxpdws}</td>
           <td>${bean.swdws}</td>
            --%>
            <td>${bean.dwzs}</td>
         </tr>
        </c:forEach>
       </c:if>
     </table>
</body>
</html>