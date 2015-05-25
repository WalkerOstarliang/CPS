<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="批量拆除技防物防信息">
			<creator:panel id="head_batchdeletexqjfwfssxx" title="批量拆除技防物防信息">
			<form id="batchdelete_xqjfwfssxx_form" action="${contextPath}/xqjfwfssxx/batchDeleteXqjfwfssxxBySsbhs.action" method="post">
				<cps:table>
					<thead>
						<cps:row>
							<td align="center" width="10%">序号</td>
							<td align="center" width="10%">设施名称</td>
							<td align="center" width="20%">安装时间</td>
							<td align="center" width="30%">安装位置</td>	
							<td align="center" width="10%">设施类型</td>
							<td align="center" width="10%">登记人</td>
							<td align="center" width="10%">登记日期</td>
						</cps:row>
					</thead>
					<tbody id="xqjfwfssxxlist">
						<c:forEach items="${xqjfwfssxxList}" var="xqjfwfssxx" varStatus="st">
						 	<cps:row>
						 		<cps:tdContent align="center">
						 			${st.index + 1}
						 			<input type="hidden" id="ssbh_${st.index}" name="xqjfwfssxxList[${st.index}].ssbh" value="${xqjfwfssxx.ssbh}">
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqjfwfssxx.ssmc}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqjfwfssxx.azsj}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqjfwfssxx.azwz}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqjfwfssxx.sslxmc}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqjfwfssxx.djrxm}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqjfwfssxx.djsj}
						 		</cps:tdContent>
						 	</cps:row>
						 </c:forEach>
				</tbody>
				</cps:table>
				<cps:table>
						<cps:row>
						 	<cps:tdLabel width="12%">拆除时间：</cps:tdLabel>
						 	<cps:tdContent width="20%">
						 		<cps:date id="ccsj" name="xqjfwfssxx.ccsj" dateFmt="yyyy-MM-dd"  
						 			value="<%=new SimpleDateFormat(\"yyyy-MM-dd\").format(new Date()) %>"
									cssClass="cps-input validate[required]"></cps:date>
								<font color="red">*</font>
						 	</cps:tdContent>
						 	<cps:tdLabel width="12%">拆除原因：</cps:tdLabel>
						 	<cps:tdContent width="52%">
						 		<cps:textfield id="ccyy" name="xqjfwfssxx.ccyy" cssClass="validate[required]"></cps:textfield>
						 		<font color="red">*</font>
						 	</cps:tdContent>
						</cps:row>
						 <cps:row>
						<cps:tdContent colspan="4" align="center">
							<cps:button value="拆除" onclick="batchDeleteXqjfwfssxx();"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/xqjfwfssxx.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>