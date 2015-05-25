<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	 <%@include file="/template/fusion.inc" %>
	 <div id="chartdiv"></div>
    <script type="text/javascript">
	    var chart = new FusionCharts(contextPath + "/FusionCharts/Charts/Column3D.swf", "chartdiv", 750, 250);
		chart.setDataURL(escape(contextPath + "/outsite/loadXqtjXml.action?a=b&leve=${leve}&orgcode=${orgcode}"));
		chart.setTransparent(true);
		chart.render("chartdiv");
	</script>
	<hr/>
     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_box">
       <tr>
         <th rowspan="2">单位名称</th>
         <th colspan="5">人口</th>
         <th colspan="2">房屋</th>
         <th colspan="6">重点人员</th>
         <th rowspan="2">单位<br/>总数</th>
       </tr>
       <tr>
         	<th>常<br/>口</th>
         	<th>流<br/>口</th>
         	<th>寄<br/>口</th>
         	<th>境<br/>外</th>
         	<th>从<br/>业</th>
         	
         	
         	<th>总<br/>数</th>
         	<th>出租<br/>屋</th>
         	<th>总<br/>数</th>
         	 <%-- 
         	<th>涉<br/>恐<br/>人<br/>员</th>
         	--%>
         	<th>涉<br/>毒</th>
         	<th>涉<br/>稳</th>
         	<th>在<br/>逃</th>
         	<th title="精神病人">精<br/>神</th>
         	<th title="刑事犯罪前科">刑<br/>事</th>
         	 <%-- 
         	<th>上<br/>访<br/>人<br/>员</th>
         	
          	<th>特<br/>种</th>
          	<th>内<br/>保</th>
          	<th>公<br/>共</th>
          	<th>网<br/>吧</th>
          	<th>危<br/>险</th>
          	<th>涉<br/>外</th>
          	--%>
       </tr>
       <c:if test="${not empty xqqktjBeans}">
        <c:forEach items="${xqqktjBeans}" var="bean">
         <tr>
           <td width="120px">
           		<c:choose>
	           		<c:when test="${queryBean.leve==7 or bean.dm=='999999999999'}">
	           			<span style="color:black;font-size:16">${bean.mc}</span>&nbsp;
	           		</c:when>
	           		<c:otherwise>
	           			<a href="<c:url value='/outsite/toXxcjtjPage.action'/>?queryBean.parent_dm=${bean.dm}&queryBean.leve=${queryBean.leve}" style="color: blue;cursor: pointer;">${bean.mc}</a>&nbsp;
	           		</c:otherwise>
           		</c:choose>
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
           <td>${bean.skrys}</td>
           --%>
           <td>${bean.xdrys}</td>
           <td>${bean.swrys}</td>
           <td>${bean.ztrys}</td>
           <td>${bean.jsbrs}</td>
           <td>${bean.xsfzrys}</td>
            <%-- 
           <td>${bean.sfrys}</td>
           
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
</creator:view>