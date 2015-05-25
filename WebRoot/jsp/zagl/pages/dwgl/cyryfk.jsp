<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view title="从业人员提醒反馈">
	<creator:Script src="/jsp/zagl/js/cyryfk.js"></creator:Script>
	<creator:tbar id="cyryfktbar">
		<cps:button id="savebtn" value="保存" onclick="saveCyryBean()"></cps:button>
		<cps:button id="closebtn" value="关闭" onclick="parent.closeLayer()"></cps:button>
	</creator:tbar>
	<creator:panel id="cyryfk" title="从业人员提醒反馈" tbarId="cyryfktbar">
		<form id="cyryform" method="post">
			<input type="hidden" id="cyrybh" name="cyryBean.cyrybh" value="${cyryBean.cyrybh }"/>
			<cps:table>
				<cps:row>
					<cps:tdLabel>反馈内容：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" id="fknr" name="cyryBean.fknr"  cssStyle="width:95%;height:60px" required="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="11%">反馈人：</cps:tdLabel>
					<cps:tdContent width="22%">
						<input type="hidden" id="fkrjh" name="cyryBean.fkrjh" value="${loginInfo.username}">
						<cps:textfield id="fkrxm" name="cyryBean.fkrxm" value="${loginInfo.realname}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="11%">反馈单位：</cps:tdLabel>
					<cps:tdContent width="22%">
						<input type="hidden" id="fkdwdm" name="cyryBean.fkdwdm" value="${loginInfo.orgcode}"/>
						<cps:textfield id="fkdwmc" name="cyryBean.fkdwmc" value="${loginInfo.orgname}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="11%">反馈时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="fksj" name="cyryBean.fksj" defaultSystemDate="true"></cps:date>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
</creator:view>