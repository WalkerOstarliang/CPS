<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="警务区选择">
	<creator:Script src="/jsp/common/js/jwsqselect.js"></creator:Script>
	 <cps:table>
	 	<cps:row>
			<cps:tdLabel width="12%">市局：</cps:tdLabel>
			<cps:tdContent width="22%">
				<s:select id="citygajgjgdm" list="cityGajgjgList"
							name="queryBean.citygajgjgdm" listKey="dm" listValue="jc"
							headerKey="" headerValue="--请选择--" cssClass="cps-select"
							onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
				</s:select>
			</cps:tdContent>
			<cps:tdLabel width="12%">县区局：</cps:tdLabel>
			<cps:tdContent width="22%">
				<s:select id="countrygajgjgdm" list="countryGajgjgList"
							name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc"
							headerKey="" headerValue="--请选择--" cssClass="cps-select"
							onchange="doublePcsGajgjg(this.value,'pcsdm')">
				</s:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel width="12%">派出所：</cps:tdLabel>
			<cps:tdContent>
				<s:select id="pcsdm" list="pcsGajgjgList" name="queryBean.pcsdm"
					listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--"
					cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')">
				</s:select>
			</cps:tdContent>
			<cps:tdLabel width="8%">警务区/室：</cps:tdLabel>
			<cps:tdContent>
				<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgname" headerKey="" headerValue="" cssClass="cps-select"></s:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdContent colspan="4" align="center">
				<cps:button value="确定" onclick="returnSelectedJwq()"></cps:button>
				<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
			</cps:tdContent>
		</cps:row>
	 </cps:table>
</creator:view>
