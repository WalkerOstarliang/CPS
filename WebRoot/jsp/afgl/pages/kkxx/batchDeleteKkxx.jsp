<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="批量注销卡口">
			<creator:panel id="head_batchdeletekkxx" title="批量注销卡口">
			<form id="batchdelete_kkxx_form" action="${contextPath}/kkxx/batchDeleteKkxxByKkbhs.action" method="post">
				<cps:table>
					<thead>
						<cps:row>
							<td align="center" width="5%">序号</td>
							<td align="center" width="10%">卡口名称</td>
							<td align="center" width="10%">卡口位置</td>
							<td align="center" width="25%">警务责任区</td>	
							<td align="center" width="15%">建立日期</td>
							<td align="center" width="10%">注销标识</td>
							<td align="center" width="10%">登记人</td>
							<td align="center" width="15%">登记日期</td>
						</cps:row>
					</thead>
					<tbody id="kkxxlist">
						<c:forEach items="${kkxxList}" var="kkxx" varStatus="st">
						 	<cps:row>
						 		<cps:tdContent align="center">
						 			${st.index + 1}
						 			<input type="hidden" id="kkbh_${st.index}" name="kkxxList[${st.index}].kkbh" value="${kkxx.kkbh}">
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${kkxx.kkmc}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${kkxx.kkwz}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${kkxx.sszrqmc}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${kkxx.kkcjsj}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${kkxx.zxbsmc}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${kkxx.djrxm}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${kkxx.djsj}
						 		</cps:tdContent>
						 	</cps:row>
						 </c:forEach>
				</tbody>
				</cps:table>
				<cps:table>
						<cps:row>
						 	<cps:tdLabel width="12%">撤销时间：</cps:tdLabel>
						 	<cps:tdContent width="20%">
						 		<cps:date id="zxrq" name="kkxxBean.zxrq" dateFmt="yyyy-MM-dd HH:mm:ss"  
						 			value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>"
									cssClass="validate[required] cps-input" cssStyle="width:80%"></cps:date>
								<font color="red">*</font>
						 	</cps:tdContent>
						 	<cps:tdLabel width="12%">撤销原因：</cps:tdLabel>
						 	<cps:tdContent width="52%">
						 		<cps:textfield id="zxyy" cssClass="validate[required]" cssStyle="width:93%" name="kkxxBean.zxyy"></cps:textfield>
						 		<font color="red">*</font>
						 	</cps:tdContent>
						</cps:row>
						 <cps:row>
						<cps:tdContent colspan="4" align="center">
							<cps:button value="撤消" onclick="batchDeleteKkxx();"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/kkxx.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>