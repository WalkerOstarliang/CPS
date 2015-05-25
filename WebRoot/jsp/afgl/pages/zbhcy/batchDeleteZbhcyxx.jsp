<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="批量注销成员">
			<creator:panel id="head_batchdeletezbhcyxx" title="批量注销成员">
			<form id="batchdelete_zbhcyxx_form" action="${contextPath}/zbhcyxx/batchDeleteZbhcyxxByZbhcybhs.action" method="post">
				<cps:table>
					<thead>
						<cps:row>
							<td align="center" width="10%">序号</td>
							<td align="center" width="10%">姓名</td>
							<td align="center" width="10%">性别</td>
							<td align="center" width="20%">身份证号</td>	
							<td align="center" width="20%">治保会</td>
							<td align="center" width="20%">参加日期</td>
							<td align="center" width="10%">注消标识</td>
						</cps:row>
					</thead>
					<tbody id="zbhcyxxlist">
						<c:forEach items="${zbhcyxxList}" var="zbhcyxx" varStatus="st">
						 	<cps:row>
						 		<cps:tdContent align="center">
						 			${st.index + 1}
						 			<input type="hidden" id="zbhcybh_${st.index}" name="zbhcyxxList[${st.index}].zbhcybh" value="${zbhcyxx.zbhcybh}">
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhcyxx.xm}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhcyxx.xbmc}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhcyxx.sfzh}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhcyxx.zbhmc}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhcyxx.cjrq}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhcyxx.tcbsmc}
						 		</cps:tdContent>
						 	</cps:row>
						 </c:forEach>
				</tbody>
				</cps:table>
				<cps:table>
						<cps:row>
						 	<cps:tdLabel width="12%">注消时间：</cps:tdLabel>
						 	<cps:tdContent width="20%">
						 		<cps:date id="tcrq" name="zbhcyxxBean.tcrq" dateFmt="yyyy-MM-dd HH:mm:ss"  
						 			value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>"
									cssClass="cps-input validate[required]"></cps:date>
								<font color="red">*</font>
						 	</cps:tdContent>
						 	<cps:tdLabel width="12%">注消原因：</cps:tdLabel>
						 	<cps:tdContent width="52%">
						 		<cps:textfield id="tcyy" name="zbhcyxxBean.tcyy" cssClass="validate[required]"></cps:textfield>
						 		<font color="red">*</font>
						 	</cps:tdContent>
						</cps:row>
						 <cps:row>
						<cps:tdContent colspan="4" align="center">
							<cps:button value="撤消" onclick="batchDeleteZbhcyxx();"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/zbhcyxx.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>