<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:box>
	<creator:Script src="/jsp/tjbb/js/jdtb.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryJdTb()"></cps:button>
			<cps:button value="导出" onclick="exportTjbb()"></cps:button>
			<cps:button value="重置" onclick=""></cps:button>
		</cps:tbar>
		<cps:panel title="统计条件" id="search_panel">
			<form id="searchForm" action="<c:url value='/tjbb/toJdTbDataPage.action'/>" target="dataArea">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>单位：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:textfield id="dwmc" appendPopuBtn="true" readonly="true" onclick="orgSelect()" required="true"></cps:textfield>
							<input type="hidden" name="jdtbQuery.dwdm" id="dwdm"/>
							<input type="hidden" name="jdtbQuery.dwleve" id="dwleve"/>
						</cps:tdContent>
						
						<cps:tdLabel width="10%"><font color="red">*</font>年份：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:date dateFmt="yyyy" name="jdtbQuery.tjnf" minDate="sysdate" required="true" id="tjnf"></cps:date>
						</cps:tdContent>
						
						<cps:tdLabel width="10%"><font color="red">*</font>季度：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'1':'第一季度','2':'第二季度','3':'第三季度','4':'第四季度'}" name="jdtbQuery.jds" id="jds" cssClass="vildate[required],cps-select"></s:select>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
		<div>
			<iframe id="dataArea" name="dataArea" src="" frameborder="0" style="overflow-y:auto;overflow-x:hidden" width="100%"></iframe>
		</div>
	</cps:PanelView>
	</creator:box>
</creator:view>