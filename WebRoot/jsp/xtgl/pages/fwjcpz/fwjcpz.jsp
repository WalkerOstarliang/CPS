<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view>
	<creator:Script src="/jsp/xtgl/js/fwjcpz.js"></creator:Script>
	<creator:tbar id="fwjcpz_op">
		<c:if test="${operType != 'detail'}">
			<cps:button value="保存" type="button" onclick="saveInfo()"></cps:button>
		</c:if>
		<cps:button value="关闭" type="button"  onclick="window.close()"></cps:button>
	</creator:tbar>
	
	<creator:panel id="fwjcpc_panel" title="单位检查周期配置" tbarId="fwjcpz_op"></creator:panel>
	<div id="fwjcpz_div">
		<form id="fwjcpzpz_form"
			>
			<input type="hidden" id="operType" name="operType" value="${operType}" />
			<input type="hidden" id="id" name="fwjcpzBean.id" value="${fwjcpzBean.id}">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%">房屋管理类别：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select id="fwzdlb" name="fwjcpzBean.fwzdlb" value="${fwjcpzBean.fwzdlb}" zdlb="ZDY_FWZDGLLB" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>检查周期：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield name="fwjcpzBean.jczq" value="${fwjcpzBean.jczq}" id="jczq" required="true" inputType="integer"  />天
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>提前检查天数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="fwjcpzBean.tqtxts" value="${fwjcpzBean.tqtxts}" id="tqtxts" required="true" inputType="integer"  />天
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="fwjcpzBean.djrxm" value="${fwjcpzBean.djrxm} "
							readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="fwjcpzBean.djdwmc" value="${fwjcpzBean.djdwmc}"
							readonly="true"></cps:textfield>
						<input type="hidden" name="fwjcpzBean.djdwdm" value="${fwjcpzBean.djdwdm}" />
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="djrq" name="fwjcpzBean.djrq" dateFmt="yyyy-MM-dd HH:mm:ss" value="${fwjcpzBean.djrq}"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>操作人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="fwjcpzBean.czrxm" value="${loginInfo.realname}"
							readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>操作单位：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="fwjcpzBean.czdwmc" value="${loginInfo.orgname}"
							readonly="true"></cps:textfield>
						<input type="hidden" name="fwjcpzBean.czdwdm" value="${loginInfo.orgcode}" />
					</cps:tdContent>
					<cps:tdLabel>操作时间：</cps:tdLabel>
					<cps:tdContent>
						  <cps:date id="czsj" name="fwjcpzBean.czsj" defaultSystemDate="true" value="${fwjcpzBean.czsj}"></cps:date>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</div>
</creator:view>