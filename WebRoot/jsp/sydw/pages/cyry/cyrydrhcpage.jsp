<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view title="从业人员查询">
	<script type="text/javascript">
		function queryImportCyry()
		{
			$("#importcyrylist").query("F","queryCyryForm");
		}
		
		function exportHcCyryListPage()
		{
			$("#queryCyryForm").attr("action",contextPath + "/zagl/cyry/exportHcCyryListPage.action");
			$("#queryCyryForm").attr("target","_blank");
			$("#queryCyryForm").submit();
		}
		
		function execbsRowBack(tdObj,rowdata)
		{
			var vhtml = "";
			var execbs = rowdata["execbs"];
			if (execbs == "0")
			{
				vhtml = "待执行";
			}
			else if (execbs == "1")
			{
				vhtml = "执行成功";
			}
			else if (execbs == "2")
			{
				vhtml = "执行发生错误";
			}
			return vhtml;
		}
	</script>
	<creator:box>
		<cps:PanelView>
			<cps:tbar>
				<cps:button id="cyryQueryButton" value="查询" onclick="queryImportCyry()"/>
				<cps:button value="导出" onclick="exportHcCyryListPage()"></cps:button>
			</cps:tbar>
			<cps:panel title="导入从业人员查询">
				<form id="queryCyryForm">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="12%">从业单位名称：</cps:tdLabel>
							<cps:tdContent width="22%">
								<cps:textfield name="cyryImportBean.dwmc"/>
							</cps:tdContent>
							<cps:tdLabel width="12%">错误标示：</cps:tdLabel>
							<cps:tdContent width="22%">
								<s:select list="#{'0':'未验证','1':'验证错误','2':'验证成功'}" id="errorbs" name="cyryImportBean.errorbs" cssClass="cps-select" headerKey="" headerValue=" "></s:select>
							</cps:tdContent>
							<cps:tdLabel width="12%">执行标示：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'0':'待执行','1':'执行成功','2':'执行错误'}" id="execbs" name="cyryImportBean.execbs" cssClass="cps-select"  headerKey="" headerValue=" "></s:select>
							</cps:tdContent>
						</cps:row>					
						<cps:row>
							<cps:tdLabel>导入日期：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<cps:date id="drsjstart" name="cyryImportBean.drsjstart" dateFmt="yyyy-MM-dd" cssStyle="width:15%"></cps:date>
								-
								<cps:date id="drsjend" name="cyryImportBean.drsjend" dateFmt="yyyy-MM-dd" cssStyle="width:15%"></cps:date>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent colspan="6">
								<font color="red">
									说明：此功能是对批量导入的从业人员信息进行核查，查看是否验证成功，是否成功执行，并导出错误记录再次重新导入。<br/>
									功能：从业人员批量导入功能入口，实有单位管理-->单位选择-->从业人员导入(按钮点击)或者进入“单位基本信息修改”页面也可以导入<br/>
								</font>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</form>
			</cps:panel>
		</cps:PanelView>
		<cps:tableGrid id="importcyrylist"
				url="/zagl/cyry/queryHcImportCyryList.action" 
				autoload="false" 
				width="99.9%"
				title="导入从业人员列表"
				searchform="queryCyryForm">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="dwmc" title="单位名称"></cps:column>
			<cps:column field="xm" title="姓名"></cps:column>
			<cps:column field="sfzh" title="身份证号码"></cps:column>
			<cps:column field="lxdh" title="电话号码"></cps:column>
			<cps:column field="zw" title="职务"></cps:column>
			<cps:column field="jzdz" title="居住居住地址"></cps:column>
			<cps:column field="execbs" title="执行状态" rowcallback="execbsRowBack"></cps:column>
			<cps:column field="errorInfo" title="错误信息"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>