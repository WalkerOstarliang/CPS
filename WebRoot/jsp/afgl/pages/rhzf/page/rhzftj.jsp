<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/afgl/pages/rhzf/js/rhzftj.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryRhzfTj()"></cps:button>
			<cps:button value="重置" onclick="clearSearhForm()"></cps:button>
			<cps:button value="导出" onclick="expRhzfTj()"></cps:button>
		</cps:tbar>
		<cps:panel title="查询条件" width="99.8%">
			<form id="searchForm" action="rhzftj/toRhzfTjData.action" target="dataArea" >
				<input type="hidden" id="parent_dm" name="query.parent_dm" value="430100000000" />
				<input type="hidden" id="dwleve" name="query.orgleve" value="3" />
				<input type="hidden" id="isExp" name="isExp" value="false" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="15%">统计时间：</cps:tdLabel>
						<cps:tdContent width="35%">
							<cps:date id="tjsj_start" name="query.tjsj_start" dateFmt="yyyy-MM-dd" cssStyle="width:40%"></cps:date>&nbsp;至
							<cps:date id="tjsj_end" name="query.tjsj_end" dateFmt="yyyy-MM-dd" cssStyle="width:40%"></cps:date>
						</cps:tdContent>
						<cps:tdContent colspan="2">
							&nbsp;
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	<div>
		<iframe name="dataArea" src="" style="width:99%;height:600px" scrolling="auto" frameborder="0"></iframe>
	</div>
	
	<div>
		<iframe name="expFrame" src="" style="display: none;"></iframe>
	</div>
</creator:view>