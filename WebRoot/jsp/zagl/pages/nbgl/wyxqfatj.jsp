<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 物业小区发案统计 --%>
<creator:view title="">
	<creator:box>
		<creator:Script src="/jsp/zagl/pages/nbgl/js/nbtj.js"></creator:Script>
		<script type="text/javascript">
			$(function(){
				var height = $("#mainiframe",parent.document).height();
				var panel_H = $("#cxtj").height();
				$("#wyxqfatjFrame").height(height - panel_H - 35 );
			});
			
			function clearform(){
				$("#orgcode").val("");
				$("#orgname").val("");
				$("#tjrq").val("");
			}
		</script>
		<creator:tbar id="op">
			<cps:button value="重置" type="button" onclick="clearform()"></cps:button>
			<cps:button value="查询" type="button" onclick="wyxqfatjQuery()"></cps:button>
			<cps:button value="导出" type="button" onclick="expWyxqfa()"></cps:button>
		</creator:tbar>
		<creator:panel id="cxtj" title="查询条件" tbarId="op">
			<form id="wyxqfatjQuery" method="post" target="wyxqfaFrame">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="20%"><font color="red">*</font>统计单位：</cps:tdLabel>
						<cps:tdContent width="30%">
							<input type="hidden" name="query.orgcode" value="${query.orgcode}" id="orgcode"/>
							<cps:textfield value="${query.orgname}" appendPopuBtn="true" id="orgname" onclick="dwselect('${loginInfo.rootOrgCode}')" required="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="20%"><font color="red">*</font>统计时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="query.tjrq" value="${query.tjrq}" id="tjrq"  dateFmt="yyyy-MM" maxDate="sysdate" required="true"/>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:panel title="全市物业小区侵财案件发案情况统计表">
			<iframe id="wyxqfatjFrame" frameborder="0" scrolling="no" width="100%" style="overflow-y:auto" src="nbtj/toWyxqFaPage.action"></iframe>
		</cps:panel>
		
		<iframe id="wyxqfaFrame" name="wyxqfaFrame"  style="display: none"></iframe>
	</creator:box>
</creator:view>

