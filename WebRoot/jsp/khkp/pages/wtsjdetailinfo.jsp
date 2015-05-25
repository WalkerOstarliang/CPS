<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%">
	<script type="text/javascript">
		function exportWtsjDetail()
		{
			$("#exportform").submit();
		}
	</script>
	<form id="exportform" action="<c:url value='/xtgl/khkp/toOpenWtsjInfoPage.action'/>" target="exportiframe" method="post">
		<input type="hidden" name="queryBean.orgcode" value="${queryBean.orgcode }">
		<input type="hidden" name="queryBean.sjtype" value="${queryBean.sjtype }">
		<input type="hidden" name="queryBean.tjqssj" value="${queryBean.tjqssj }">
		<input type="hidden" name="queryBean.tjjzsj" value="${queryBean.tjjzsj }">
		<input type="hidden" name="queryBean.tjrq" value="${queryBean.tjrq}">
		<input type="hidden" name="queryBean.export" value="true">
	 	<cps:PanelView>
	 		<cps:tbar>
	 			<cps:button value="导出" onclick="exportWtsjDetail()"></cps:button>
	 		</cps:tbar>
	 		<cps:panel title="问题数据明细">
	 			<table width="99.6%" class="cps-tablegrid" id="table_wtsjtablegrid" style="width: 99%;" border="0" cellSpacing="0" cellPadding="0">
	 				<tr>
	 					<th>序号</th>
	 					<c:forEach items="${tableContentMap.fieldnames}" var="fieldname">
	 						<th>${fieldname}</th>
	 					</c:forEach>
	 				</tr>
	 				<tr>
	 					<c:forEach items="${tableContentMap.rows}" var="row" varStatus="st">
	 						<tr>
	 							<td>${st.index+1 }</td>
	 							<c:forEach items="${tableContentMap.fields}" var="field">
	 								<td>&nbsp;${row[field]}</td>
	 							</c:forEach>
	 						</tr>
	 					</c:forEach>
	 				</tr>
	 			</table>
	 		</cps:panel>
	 	</cps:PanelView>
	 </form>
 	<iframe id="exportiframe" width="0" height="0"></iframe>
</creator:view>