<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="批量注销治保会">
			<creator:tbar id="batchDeleteZbhxxtbar">
							<cps:button value="撤消" onclick="batchDeleteZbhxx();"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
					</creator:tbar>
			<creator:panel id="head_batchdeletezbhxx" title="批量注销治保会" tbarId="batchDeleteZbhxxtbar">
			<form id="batchdelete_zbhxx_form" action="${contextPath}/zbhxx/batchDeleteZbhxxByZbhbhs.action" method="post">
				<cps:table>
					<thead>
						<cps:row>
							<td align="center" width="10%">序号</td>
							<td align="center" width="10%">治保会名称</td>
							<td align="center" width="10%">负责人</td>
							<td align="center" width="10%">负责人电话</td>	
							<td align="center" width="20%">建立日期</td>
							<td align="center" width="10%">注销标识</td>
							<td align="center" width="10%">登记人</td>
							<td align="center" width="20%">登记日期</td>
						</cps:row>
					</thead>
					<tbody id="zbhxxlist">
						<c:forEach items="${zbhxxList}" var="zbhxx" varStatus="st">
						 	<cps:row>
						 		<cps:tdContent align="center">
						 			${st.index + 1}
						 			<input type="hidden" id="zbhbh_${st.index}" name="zbhxxList[${st.index}].zbhbh" value="${zbhxx.zbhbh}">
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhxx.zbhmc}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhxx.zbhfzrxm}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhxx.zbhfzrlxdh}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhxx.cjsj}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhxx.zxbsmc}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhxx.djrxm}
						 		</cps:tdContent>
						 		<cps:tdContent align="center">
						 			${zbhxx.djsj}
						 		</cps:tdContent>
						 	</cps:row>
						 </c:forEach>
				</tbody>
				</cps:table>
				<cps:table>
						<cps:row>
						 	<cps:tdLabel width="12%"><font color="red">*</font>注消时间：</cps:tdLabel>
						 	<cps:tdContent width="20%">
						 		<cps:date id="zxsj" name="zbhxxBean.zxsj" dateFmt="yyyy-MM-dd HH:mm:ss"  
						 			value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>"
									cssClass="validate[required] cps-input" cssStyle="width:80%"></cps:date>
						 	</cps:tdContent>
						 	<cps:tdLabel width="12%"><font color="red">*</font>注消原因：</cps:tdLabel>
						 	<cps:tdContent width="56%">
						 		<cps:textfield id="zxyy"  cssStyle="width:98%" name="zbhxxBean.zxyy" cssClass="validate[required]"></cps:textfield>
						 	</cps:tdContent>
						</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/zbhxx.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>