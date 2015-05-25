<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/qbxs/js/qbxslist.js"></creator:Script>
		<form id="queryform" >
		<cps:PanelView>
	 		<cps:tbar>
				<cps:button value="查&nbsp;询" onclick="qbxsQuery()"></cps:button>
				<cps:button value="重置" type="reset"></cps:button>
				<cps:button value="新增情报线索" onclick="openQbxsWin('add')"></cps:button>
			</cps:tbar>
	 		<cps:panel title="情报线索管理">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm}"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm}"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBean.pcsdm" value="${queryBean.pcsdm}"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>警务区：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.jwsqdm}">
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>表现形式：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="bxxs" name="queryBean.bxxs" headerKey="" headerValue=" " zdlb="QBXS_BXXS"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>标题：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="bt" name="queryBean.bt" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">关键词：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="gjc" name="queryBean.gjc" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">线索来源：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:select id="xsxxly" name="queryBean.xsxxly" headerKey="" headerValue=" " zdlb="QBXS_XXLY"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">发生状态：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="fszt" name="queryBean.fszt" headerKey="" headerValue=" " zdlb="QBXS_FSZT"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>紧急程度：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="jjcd" name="queryBean.jjcd" headerKey="" headerValue=" " zdlb="QBXS_JJCD"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>涉事类别：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="sslb1" name="queryBean.sslb1" headerKey="" headerValue=" " zdlb="QBXS_SSLB"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>涉及敏感时点：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="sjmgsd" name="queryBean.sjmgsd" headerKey="" headerValue=" " zdlb="QBXS_SJMGSD"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>涉及重大活动：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="sjzdhd" name="queryBean.sjzdhd" headerKey="" headerValue=" " zdlb="QBXS_ZDHD"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>涉及人数规模：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="sjrsgm" name="queryBean.sjrsgm" headerKey="" headerValue=" " zdlb="QBXS_SJRSGM"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>涉及财产损毁规模：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="sjccssgm" name="queryBean.sjccssgm" headerKey="" headerValue=" " zdlb="QBXS_SSGM"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>涉事诱因：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="ssyy" name="queryBean.ssyy" headerKey="" headerValue=" " zdlb="QBXS_SSYY"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="cjsj_start" cssStyle="width:40%" name="queryBean.cjsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>-
						<cps:date id="cjsj_end"   cssStyle="width:40%" minDateDepend="cjsj_start" name="queryBean.cjsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
					&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
			</cps:panel>
	 	</cps:PanelView>
		</form>
	<cps:tableGrid id="qbxslist" title="情报线索列表"
				mutilSelect="false"
				url="/qbxs/queryQbxxSjxxListPage.action" 
				searchform="queryform"
				autoload="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" align="left" width="10%"></cps:column>
		<cps:column field="bt" title="标题"></cps:column>
		<cps:column field="gjc" title="关键词"></cps:column>
		<cps:column field="jjcdmc" title="紧急程度"></cps:column>
		<cps:column field="fsztmc" title="发生状态"></cps:column>
		<cps:column field="xsxxlymc" title="线索信息来源"></cps:column>
		<cps:column field="cjdw" title="采集单位" align="left" maxlength="15"></cps:column>
		<cps:column field="rksj" title="登记时间"></cps:column>
	</cps:tableGrid>
</creator:view>