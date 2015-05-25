<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/tjbb/js/dwtj.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryDwtj()"></cps:button>
			<cps:button value="重置" type="reset"></cps:button>
			<cps:button value="导出" onclick="clickExportXls()"></cps:button>
		</cps:tbar>
		<cps:panel title="查询条件">
			<form id="dwqueryform" method="post" target="hiddeniframe">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%">统计单位：</cps:tdLabel>
						<cps:tdContent width="48%">
							<input type="hidden" id="dwdm" name="dwQuery.dwdm" value="${dwQuery.dwdm}"/>
							<cps:textfield id="dwmc" value="${dwQuery.dwmc}" appendPopuBtn="true" onclick="dwSelect('${loginInfo.orgcode}')"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">统计时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="dwQuery.tjsj_start" id="tjsj_start" dateFmt="yyyy-MM-dd" minDate="2015-01-30" cssStyle="width:40%"></cps:date>&nbsp;-&nbsp;
							<cps:date name="dwQuery.tjsj_end" id="tjsj_end" dateFmt="yyyy-MM-dd" minDate="2015-01-30" cssStyle="width:40%"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	<cps:panel title="单位统计">
		<div id="dataArea">
			<%@include file="dwinfo.jsp" %>
		</div>
	</cps:panel>
	<iframe name="hiddeniframe" src="" height="0" width="0"></iframe>
</creator:view>