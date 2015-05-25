<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
	<creator:tbar id="tbarLogout">
		<c:if test="${operType != 'detail'}">
			<cps:button value="保存" onclick="savaRkjhsy();"></cps:button>
			<cps:button value="关闭" onclick="window.close();"></cps:button>
		</c:if>
	</creator:tbar>
	<creator:panel id="jhsypanel" title="计划生育填写" tbarId="tbarLogout">
		<form id="jhsyform">
			<input id="id" name="jhsyBean.id" value="${jhsyBean.id }"
				type="hidden">
			<input id="rybh" name="jhsyBean.rybh" value="${jhsyBean.rybh }"
				type="hidden">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">记录编号：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="jlbh" name="jhsyBean.jlbh"
							value="${jhsyBean.jlbh}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">计划生育孕情：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:select id="jhsyyq" name="jhsyBean.jhsyyq"
							value="${jhsyBean.jhsyyq}" zdlb="ZDY_JHSYYQ" headerKey=""
							headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">
						<font color="red">*</font>计生证号码：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="jszhm" name="jhsyBean.jszhm"
							value="${jhsyBean.jszhm}" required="true" maxlength="16"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">发证日期：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:date id="fzrq" name="jhsyBean.fzrq" value="${jhsyBean.fzrq}"></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="10%">子女情况：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:select id="znqk" name="jhsyBean.znqk"
							value="${jhsyBean.znqk}" zdlb="ZDY_ZDSF" headerKey=""
							headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">避孕节育措施：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:select id="byjycs" name="jhsyBean.byjycs"
							value="${jhsyBean.byjycs}" zdlb="ZDY_BYJYCS" headerKey=""
							headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">登记人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input id="djrjh" name="jhsyBean.djrjh" value="${jhsyBean.djrjh}"
							type="hidden">
						<cps:textfield id="djrxm" name="jhsyBean.djrxm"
							value="${jhsyBean.djrxm}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input id="djdwdm" name="jhsyBean.djdwdm"
							value="${jhsyBean.djdwdm }" type="hidden">
						<cps:textfield id="djdwmc" name="jhsyBean.djdwmc"
							value="${jhsyBean.djdwmc}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="djsj" name="jhsyBean.djsj"
							value="${jhsyBean.djsj}"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
</creator:view>