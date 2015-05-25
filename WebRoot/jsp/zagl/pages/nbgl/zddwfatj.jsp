<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 重点单位发案统计 --%>
<creator:view>
	<creator:box>
		<creator:Script src="/jsp/zagl/pages/nbgl/js/nbtj.js"></creator:Script>
		<script type="text/javascript">
			$(function(){
				var height = $("#mainiframe",parent.document).height();
				var panel_H = $("#cxtj").height();
				$("#zddwfatjFrame").height(height - panel_H - 35 );
			});
			
			function clearform(){
				$("#start").val("");
				$("#end").val("");
				
				$("#dwmc").val("");
			}
		</script>
		
		<creator:tbar id="op">
			<cps:button value="重置" type="button" onclick="clearform()"></cps:button>
			<cps:button value="查询" type="button" onclick="zddwfatjQuery()"></cps:button>
			<cps:button value="导出" type="button" onclick="expZddwfa()"></cps:button>
		</creator:tbar>
		
		<creator:panel id="cxtj" title="查询条件" tbarId="op">
			<form id="nbdwfatjForm" method="post" target="expZddfaFrame">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="20%">统计日期：</cps:tdLabel>
						<cps:tdContent width="30%">
							<cps:date name="query.tjsj_start" value="${query.tjsj_start}" dateFmt="yyyy-MM-dd" cssStyle="width:40%;" id="start" maxDateDepend="end" />至
							<cps:date name="query.tjsj_end" value="${query.tjsj_end}" dateFmt="yyyy-MM-dd" cssStyle="width:40%;" maxDate="sysdate" minDateDepend="start" id="end" />
						</cps:tdContent>
						
						<cps:tdLabel width="20%">单位名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.dwmc" id="dwmc"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:panel title="市级治安保卫重点单位发案情况明细表">
			<iframe id="zddwfatjFrame" frameborder="0" scrolling="auto" width="100%" src="nbgl/toZddwfaPage.action?query.tjsj_start=${query.tjsj_start}&query.tjsj_end=${query.tjsj_end}"></iframe>
		</cps:panel>
			<iframe id="expZddfaFrame" name="expZddfaFrame" style="display: none;"></iframe>
	</creator:box>
</creator:view>

