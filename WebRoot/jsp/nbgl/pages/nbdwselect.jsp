<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view title="内保单位查询">
	<creator:box>
		<creator:Script src="/jsp/nbgl/js/nbdwselect.js"></creator:Script>
		<creator:tbar id="dwlisttbar">
			<cps:button value="查询" type="button" onclick="dwcx()"></cps:button>
			<cps:button value="关闭" onclick="window.close()" ></cps:button>
		</creator:tbar>
		<creator:panel id="cxtj" title="内保单位查询" tbarId="dwlisttbar">
			<form id="dwcx">
				<input type="hidden" name="dwcx.sfnbgl" value="1" />
				<input type="hidden" name="dwcx.zxbs" value="0" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<s:select id="citygajgjgdm" list="cityGajgjgList" value="dwcx.citygajgjgdm"
								name="dwcx.citygajgjgdm" listKey="dm" listValue="jc"
								headerKey="" headerValue="--请选择--" cssClass="cps-select"
								onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
							</s:select>
						</cps:tdContent>
						<cps:tdLabel width="11%">县区局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<s:select id="countrygajgjgdm" list="countryGajgjgList" value="dwcx.countrygajgjgdm"
								name="dwcx.countrygajgjgdm" listKey="dm" listValue="jc"
								headerKey="" headerValue="--请选择--" cssClass="cps-select"
								onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
						</cps:tdContent>
						<cps:tdLabel width="11%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')" value="dwcx.pcsdm"
								listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--"
								cssClass="cps-select"></s:select>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
								<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm" value="dwcx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="dwcx.sqdm" value="dwcx.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						
						<cps:tdLabel width="12%">单位名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.dwmc"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>法人身份证：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.frsfzhm" />
						</cps:tdContent>
						<cps:tdLabel>法人代表：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.frdb"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsjstart" dateFmt="yyyy-MM-dd" name="dwcx.djsjstart" cssStyle="width:39%" value="${dwcx.djsjstart}"/> -
							<cps:date id="djsjend" dateFmt="yyyy-MM-dd" name="dwcx.djsjend" minDateDepend="djsjstart" cssStyle="width:39%" value="${dwcx.djsjend}"/>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>

		<cps:tableGrid url="/zagl/dw/queryNbdwPageResultInfo.action" title="内保单位列表"
			id="cxjgList" autoload="true" pageSize="10" width="99.8%" dblclick="dbRowBack"
			usepager="true" searchform="dwcx" autothead="false" mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" rowcallback="czRowBack"></cps:column>
			<cps:column title="单位名称" field="dwmc" align="left"  maxlength="10"></cps:column>
			<cps:column title="单位类别" field="dwflmc" align="left" maxlength="5"></cps:column>
			<cps:column title="重点单位标识" field="zddwbsmc" align="left" maxlength="5" ></cps:column>
			<cps:column title="单位地址" field="dwdz" align="left" maxlength="25"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>

