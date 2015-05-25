<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript">
		function exportJcsjtjbb()
		{
			window.open(contextPath + "/tjbb/exportJcsjtjPage.action?queryBean.parent_dm=${queryBean.parent_dm}&queryBean.leve=${queryBean.leve}");
		}
	</script>
	<creator:box>
		<creator:tbar id="tbar">
			<cps:button value="导出" onclick="exportJcsjtjbb()"></cps:button>
			<cps:button value="返回" onclick="history.go(-1)"></cps:button>
		</creator:tbar>
		<creator:panel id="jcsjtjbb" title="基础数据统计报表" tbarId="tbar">
		     <table  width="100%" border="0" cellspacing="0" cellpadding="1" class="table_box">
				<tr>
			     	 <td colspan="20">
			     	 	<h3><font color="red">${orgname}基础数据统计分析表</font></h3>
			     	 	<hr/>
			     	 </td>
			    </tr>
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
		         	<th>精<br/>神</th>
		         	<th>刑<br/>事</th>
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
			           			<a href="<c:url value='/tjbb/toJcsjtjtjPage.action'/>?queryBean.parent_dm=${bean.dm}&queryBean.leve=${queryBean.leve}" style="color: blue;cursor: pointer;">${bean.mc}</a>&nbsp;
			           		</c:otherwise>
		           		</c:choose>
		           </td>
		           <td>${bean.czrks}&nbsp;</td>
		           <td>${bean.ldrks}&nbsp;</td>
		           <td>${bean.jzrks}&nbsp;</td>
		           <td>${bean.jwrks}&nbsp;</td>
		           <td>${bean.cyrys}&nbsp;</td>
		           
		           
		           <td>${bean.fws}&nbsp;</td>
		           <td>${bean.czfws}&nbsp;</td>
		           <td>${bean.zddxs}&nbsp;</td>
		           <%-- 
		           <td>${bean.skrys}&nbsp;</td>
		           --%>
		           <td>${bean.xdrys}&nbsp;</td>
		           <td>${bean.swrys}&nbsp;</td>
		           <td>${bean.ztrys}&nbsp;</td>
		           <td>${bean.jsbrs}&nbsp;</td>
		           <td>${bean.xsfzrys}&nbsp;</td>
		            <%-- 
		           <td>${bean.sfrys}&nbsp;</td>
		           <td>${bean.tzhys}&nbsp;</td>
		           <td>${bean.nbdws}&nbsp;</td>
		           <td>${bean.ggcss}&nbsp;</td>
		           <td>${bean.swcss}&nbsp;</td>
		           <td>${bean.wxpdws}&nbsp;</td>
		           <td>${bean.swdws}&nbsp;</td>
		           --%>
		           <td>${bean.dwzs }</td>
		         </tr>
		        </c:forEach>
		       </c:if>
		     </table>
	    </creator:panel>
   </creator:box>
</creator:view>