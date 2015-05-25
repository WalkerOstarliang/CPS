<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="批量注销小区信息">
			<creator:panel id="head_batchdeletexqxx" title="批量注销小区信息">
			<form id="batchdelete_xqxx_form" action="${contextPath}/xqxx/batchDeleteXqxxByXqbhs.action" method="post">
				<cps:table>
					<thead>
						<cps:row>
							<td align="center" width="10%">序号</td>
							<td align="center" width="10%">小区名称</td>
							<td align="center" width="10%">所属警务区</td>
							<td align="center" width="15%">所属居委会</td>
							<td align="center" width="15%">物业公司</td>
							<td align="center" width="15%">小区地址</td>
							<td align="center" width="15%">建立日期</td>
							<td align="center" width="10%">注销标识</td>
						</cps:row>
					</thead>
					<tbody id="xqxxlist">
						<c:forEach items="${xqxxList}" var="xqxx" varStatus="st">
						 	<cps:row>
						 		<cps:tdContent align="center">
						 			${st.index + 1}&nbsp;
						 			<input type="hidden" id="xqbh_${st.index}" name="xqxxList[${st.index}].xqbh" value="${xqxx.xqbh}">
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqxx.xqmc}&nbsp;
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqxx.ssjwsmc}&nbsp;
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqxx.ssjwhmc}&nbsp;
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqxx.wygsmc}&nbsp;
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqxx.xqdz}&nbsp;
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqxx.jlrq}&nbsp;
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${xqxx.cxbsmc}&nbsp;
						 		</cps:tdContent>
						 	</cps:row>
						 </c:forEach>
				</tbody>
				</cps:table>
				<cps:table>
						<cps:row>
						 	<cps:tdLabel width="12%">注消时间：</cps:tdLabel>
						 	<cps:tdContent width="20%">
						 		<cps:date id="cxrq" name="xqxxBean.cxrq" dateFmt="yyyy-MM-dd"  
						 			value="<%=new SimpleDateFormat(\"yyyy-MM-dd\").format(new Date()) %>"
									cssClass="validate[required] cps-input" cssStyle="width:80%"></cps:date>
								<font color="red">*</font>
						 	</cps:tdContent>
						 	<cps:tdLabel width="12%">注消原因：</cps:tdLabel>
						 	<cps:tdContent width="56%">
						 		<cps:textfield id="cxyy"  cssStyle="width:95%" name="xqxxBean.cxyy" cssClass="validate[required]"></cps:textfield>
						 		<font color="red">*</font>
						 	</cps:tdContent>
						</cps:row>
						 <cps:row>
						<cps:tdContent colspan="4" align="center">
							<cps:button value="撤消" onclick="batchDeleteXqxx();"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/xqxx.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>