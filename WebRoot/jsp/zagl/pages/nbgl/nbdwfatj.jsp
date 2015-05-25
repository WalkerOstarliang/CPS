<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 内保单位发案统计 --%>
<creator:view>
	<creator:box>
		<creator:Script src="/jsp/zagl/pages/nbgl/js/nbtj.js"></creator:Script>
		<script type="text/javascript">
			$(function(){
				var height = $("#mainiframe",parent.document).height();
				var panel_H = $("#cxtj").height();
				$("#nbdwfatjFrame").height(height - panel_H - 35 );
			});
			
			function clearform(){
				$("#orgcode").val("");
				$("#orgname").val("");
				$("#start").val("");
				$("#end").val("");
			}
		</script>
		
		<creator:tbar id="op">
			<%--
				<cps:button value="重置" type="button" onclick="clearform()"></cps:button>
			--%>
			<cps:button value="查询" type="button" onclick="nbdwfatjQuery()"></cps:button>
			<cps:button value="导出" type="button" onclick="expnbdwfa()"></cps:button>
		</creator:tbar>
		
		<creator:panel id="cxtj" title="查询条件" tbarId="op">
			<form id="nbdwfatjForm" method="post" target="expnbdwfatjFrame">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="20%"><font color="red">*</font>统计单位：</cps:tdLabel>
						<cps:tdContent width="30%">
							<input type="hidden" name="query.orgcode" value="${query.orgcode}" id="orgcode"/>
							<cps:textfield value="${query.orgname}" appendPopuBtn="true" id="orgname" onclick="dwselect('${loginInfo.rootOrgCode}')" required="true"></cps:textfield>
						</cps:tdContent>
					
						<cps:tdLabel width="20%">统计日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="query.tjsj_start" value="${query.tjsj_start}" dateFmt="yyyy-MM-dd" cssStyle="width:40%;" id="start" maxDateDepend="end"  />至
							<cps:date name="query.tjsj_end" value="${query.tjsj_end}" dateFmt="yyyy-MM-dd" cssStyle="width:40%;" maxDate="sysdate" minDateDepend="start" id="end" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="20%">重点单位标识：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:select zdlb="ZAGL_ZDDJ" name="query.zddwbz" headerKey="" headerValue=" " cssStyle="width:210px"></cps:select>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:panel title="全市市级治安保卫重点单位刑事案件情况统计表">
			<iframe id="nbdwfatjFrame" frameborder="0" scrolling="no" width="100%" style="overflow-y:auto" src="nbtj/toNbdwFaPage.action"></iframe>
		</cps:panel>
		
		<iframe id="expnbdwfatjFrame" name="expnbdwfatjFrame" height="0" width="0" src=""></iframe>
	</creator:box>
</creator:view>

