<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<creator:box>
		<creator:Script src="/jsp/lsgl/pages/zdry/zdryqs/js/zdryqslist.js"></creator:Script>
		<creator:tbar id="op">
			<cps:button value="查询" type="button" onclick="query()"></cps:button>
		</creator:tbar>
		<creator:panel id="cxtj" title="查询条件" tbarId="op">
			<form id="queryForm" method="post">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="15%">市局：</cps:tdLabel>
						<cps:tdContent width="18%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="query.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue=" " cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.citygajgjgdm" value="${query.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="query.citygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="15%">县区局：</cps:tdLabel>
						<cps:tdContent width="18%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										name="query.countrygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue=" " cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.countrygajgjgdm" value="${query.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="query.countrygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="15%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList" name="query.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')"
										listKey="dm" listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.pcsdm" value="${query.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList" name="query.pcsdm"
										disabled="true" listKey="dm" listValue="jc" headerKey=""
										headerValue=" " cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>姓名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.xm"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>性别：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="GB_XB" name="query.xb" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel>身份证号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.sfzh"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>四类人员类别：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="ZDY_ZDRY_RYLB_FLAG" name="query.zdrylb" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel>案件名称：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="query.ajmc" cssStyle="width:95%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>

		<cps:tableGrid url="/zdry/zdryqs/queryZdryqsList.action" title="重点人员"
			id="zdryList" autoload="false" pageSize="10" width="99.8%"
			usepager="true" searchform="queryForm" autothead="false" mutilSelect="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true" expand="false"></cps:column>
			<cps:column title="操作" field="cz" align="center"></cps:column>
			<cps:column title="姓名" field="xingming" align="left"></cps:column>
			<cps:column title="性别" field="xbmc" align="left"></cps:column>
			<cps:column title="身份证号" field="shenfenzhenghao" align="left"></cps:column>
			<cps:column title="四类人员类别" field="rylxmc" align="left"></cps:column>
			<cps:column title="案件名称" field="anjianmingcheng" align="left" maxlength="20"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
