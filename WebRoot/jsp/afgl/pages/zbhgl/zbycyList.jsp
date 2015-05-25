<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<creator:Script src="/jsp/afgl/js/zbhcylist.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryZbhCy()"></cps:button>
			<cps:button value="重置" onclick="resetForm('zbhcySearchForm')"></cps:button>
			<cps:button value="新增" onclick="openAddZbhcyxx()" display="${displayAddBtn}"></cps:button>
		</cps:tbar>
		
		<cps:panel title="查询条件">
			<form id="zbhcySearchForm">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
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
						<cps:tdLabel width="11%">县区局：</cps:tdLabel>
						<cps:tdContent width="22%">
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
						<cps:tdLabel width="11%">派出所：</cps:tdLabel>
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
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
								<c:choose>
									<c:when test="${empty loginInfo.jwsqdm}">
										<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="query.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="query.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						
						<cps:tdLabel>姓名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.xm" id="xm"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>身份证号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.sfzh" id="sfzh"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>职务：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="ZDY_ZBHCYZW" name="query.zbhzw" headerKey="" headerValue="--请选择--"></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel>参加日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date dateFmt="yyyy-MM-dd" name="query.cjrq_from" cssStyle="width:40%"></cps:date>至
							<cps:date dateFmt="yyyy-MM-dd" name="query.cjrq_to" cssStyle="width:40%"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	<cps:tableGrid id="zbhcyxxList" title="治保会成员列表" pageSize="10"
		usepager="true" searchform="zbhcySearchForm"
		autothead="false" url="/zbhxx/zbhcyxxList.action" mutilSelect="true"
		autoload="true" width="99.8%">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" field="cz" rowcallback="zbhcyczrowcallback"></cps:column>
		<cps:column title="姓名" field="xm"></cps:column>
		<cps:column title="性别" field="xbmc"></cps:column>
		<cps:column title="身份证号" field="sfzh"></cps:column>
		<cps:column title="职务" field="zbhzwmc"></cps:column>
		<cps:column title="所属社区" field="sssqmc"></cps:column>
		<cps:column title="参加日期" field="cjrq"></cps:column>
	</cps:tableGrid>
</creator:view>
