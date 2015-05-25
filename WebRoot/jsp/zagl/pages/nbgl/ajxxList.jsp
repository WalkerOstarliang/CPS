<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/zagl/pages/nbgl/js/nbtj.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="导出" onclick="expAjxx()"></cps:button>
			<cps:button value="关闭" onclick="window.close()"></cps:button>
		</cps:tbar>
		<cps:panel title="案件信息">
			<form id="queryForm" method="post" target="ajxxFrame">
				<input type="hidden" name="query.orgcode" value="${query.orgcode}" />
				<input type="hidden" name="query.id" value="${query.id}" />
				<input type="hidden" name="query.dwfl" value="${query.dwfl}" />
				<input type="hidden" name="query.tjrq" value="${query.tjrq}" />
				<input type="hidden" name="query.tjsj_start" value="${query.tjsj_start}" />
				<input type="hidden" name="query.tjsj_end" value="${query.tjsj_end}" />
				<input type="hidden" name="query.lx" value="${query.lx}" />
				<input type="hidden" name="query.ajlx" value="${query.ajlx}" />
			</form>
			<cps:tableGrid  list="${ajxxList}"
							id="ajlist" isAsynch="false"
							autoload="true" 
							pageSize="30" 
							width="99.8%" 
							usepager="false" 
							searchform="queryForm" 
							autothead="false" 
							mutilSelect="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column field="ajbh" title="案件编号"></cps:column>
				<cps:column field="bjrq" title="报警时间"></cps:column>
				<cps:column field="faqy" title="案发区域"></cps:column>
				<cps:column field="faxz" title="案发地点" maxlength="15"></cps:column>
				<cps:column field="dl" title="案件类别"></cps:column>
				<cps:column field="xl" title="案件细类"></cps:column>
				<cps:column field="lxdh" title="电话"></cps:column>
				<cps:column field="gxdw" title="管辖单位" maxlength="15"></cps:column>
				<cps:column field="jyaq" title="主要内容" maxlength="15"></cps:column>
			</cps:tableGrid>	
		</cps:panel>
	</cps:PanelView>
	<iframe name="ajxxFrame" id="ajxxFrame" style="display: none" ></iframe> 
</creator:view>