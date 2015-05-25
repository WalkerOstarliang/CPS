<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="派出所基本情况统计分析">
	<script type="text/javascript">
		function exportPcsJbqk()
		{
			var orgcode = $("#queryBeanorgcode").val();
			window.open(contextPath + "/tjbb/exportPcsJbqkTjPage.action?queryBean.orgcode=" + orgcode);
		}
		function printPcsJbqk()
		{
			var orgcode = $("#queryBeanorgcode").val();
			window.open(contextPath + "/tjbb/printPcsJbqk.action?queryBean.orgcode=" + orgcode);
		}
	</script>
	<creator:box>
		<form id="exportform">
			<input type="hidden" id="queryBeanorgcode" name="queryBean.orgcode" value="${pcsqkBean.orgcode}">
		</form>
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="导出" onclick="exportPcsJbqk()"></cps:button>
				<cps:button value="返回" onclick="history.go(-1)"></cps:button>
			</cps:tbar>
			<cps:panel title="派出所基本情况统计分析" height="auto">
				<cps:table>
					<cps:row>
						<cps:tdContent align="left">
							<font color="red">
								注意：如果社区驻村民警总数 != 社区民警数 + 驻村民警 ，原因是警务室基本信息没有全部完善。 
							</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent align="center">
							<h3><span style="color:red">${pcsqkBean.orgname}</span>派出所基础情况统计表</h3>
						</cps:tdContent>
					</cps:row>
				</cps:table>
				<cps:table width="1400">
					<cps:row>
						<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="20">序号</cps:tdLabel>
						<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="100">单<br/>位<br/>名<br/>称</cps:tdLabel>
						<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="30">总<br/>警<br/>力</cps:tdLabel>
						<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="50">派<br/>出<br/>所<br/>总<br/>数</cps:tdLabel>
						<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="50">派<br/>出<br/>所<br/>警<br/>力<br/>数</cps:tdLabel>
						<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="50">派出<br/>所警<br/>力占<br/>总警<br/>力数<br/>比</cps:tdLabel>
						
						<cps:tdLabel colspan="4" cssStyle="text-align:center">派出所辅助人员</cps:tdLabel>
						<cps:tdLabel colspan="4" cssStyle="text-align:center">警务区辅助人员</cps:tdLabel>
						<cps:tdLabel colspan="7" cssStyle="text-align:center">警务区/室</cps:tdLabel>
						
						<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="30">社区<br/>(驻村)<br/>民警<br/>占派<br/>出所<br/>警力<br/>比</cps:tdLabel>
						<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="30">警务<br/>室联<br/>公安<br/>内网<br/>数</cps:tdLabel>
						<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="30">社区<br/>警务<br/>室联<br/>网数</cps:tdLabel>
						<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="30">农村<br/>警务<br/>室联<br/>网数</cps:tdLabel>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:center" width="60" valign="top">总<br/>数</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center" width="60" valign="top">辅<br/>警<br/>数</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center" width="60" valign="top">流<br/>口<br/>协<br/>管<br/>员<br/>数</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center" width="60" valign="top">巡<br/>防<br/>队<br/>员<br/>数</cps:tdLabel>
						
						<cps:tdLabel cssStyle="text-align:center" width="60" valign="top">总<br/>数</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center" width="60" valign="top">辅<br/>警<br/>数</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center" width="60" valign="top">流<br/>口<br/>协<br/>管<br/>员<br/>数</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center" width="60" valign="top">巡<br/>防<br/>队<br/>员<br/>数</cps:tdLabel>
						
						<cps:tdLabel  cssStyle="text-align:center" width="30">警<br/>务<br/>区<br/>总<br/>数</cps:tdLabel>
						<cps:tdLabel  cssStyle="text-align:center" width="30">警<br/>务<br/>室<br/>总<br/>数</cps:tdLabel>
						<cps:tdLabel  cssStyle="text-align:center" width="30">社<br/>区<br/>警<br/>务<br/>室<br/>数</cps:tdLabel>
						<cps:tdLabel  cssStyle="text-align:center" width="30">农<br/>村<br/>警<br/>务<br/>室<br/>数</cps:tdLabel>
						<cps:tdLabel  cssStyle="text-align:center" width="30">社区<br/>(驻村)<br/>民<br/>警<br/>总<br/>数</cps:tdLabel>
						<cps:tdLabel  cssStyle="text-align:center" width="30">社<br/>区<br/>民<br/>警<br/>数</cps:tdLabel>
						<cps:tdLabel  cssStyle="text-align:center" width="30">驻<br/>村<br/>民<br/>警<br/>数</cps:tdLabel>
						
					</cps:row>
					<c:forEach items="${pcsqkBean.pcsJbqkList}" var="jbqkBean" varStatus="st">
						<cps:row>
							<cps:tdContent cssStyle="text-align:center">${st.index + 1}</cps:tdContent>
							<c:choose>
								<c:when test="${jbqkBean.leve=='4' || jbqkBean.orgcode == '999999999999'}">
									<cps:tdContent cssStyle="text-align:left;">&nbsp;${jbqkBean.orgname}</cps:tdContent>
								</c:when>
								<c:otherwise>
									<cps:tdContent cssStyle="text-align:left;">&nbsp;<a href="<c:url value='/tjbb/toPcsJbqkTjPage.action'/>?queryBean.orgcode=${jbqkBean.orgcode }" style="color:blue">${jbqkBean.orgname}</a></cps:tdContent>
								</c:otherwise>
							</c:choose>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.zjls}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.pcszs}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.pcsjls}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.pcsjlszzjlsb}</cps:tdContent>
							
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.pcszfjs}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.pcszfbzfjs}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.pcsldrkxgys}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.pcsxfdys}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.sqjwsfjs}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.sqjwspbzfbzfjs}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.sqjwspblkxgys}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.sqjwspbxfdys}</cps:tdContent>
							
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.sqjwss}</cps:tdContent>
							
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.jwszs}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.jsqjwss}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.ncjwss}</cps:tdContent>
							
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.sqzcmjzs}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.sqmjs}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.zcmjs}</cps:tdContent>
							
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.zcmjzpcsjlb}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${jbqkBean.jwslganws}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">&nbsp;${jbqkBean.sqjwslws}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">&nbsp;${jbqkBean.ncjwslws}</cps:tdContent>
						</cps:row>
					</c:forEach>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</creator:box>
</creator:view>