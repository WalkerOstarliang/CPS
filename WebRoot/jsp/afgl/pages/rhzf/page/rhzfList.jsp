<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 入户走访列表 --%>
<creator:view>
	<creator:Script src="/jsp/afgl/pages/rhzf/js/rhzflist.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryRhzf()"></cps:button>
			<cps:button value="重置" onclick="resetSearchForm()"></cps:button>
			<cps:button value="导出" onclick="expRhzf()"></cps:button>
			<cps:button value="新增" onclick="openRhzfWin(null,'add')" display="${displayAddBtn}"></cps:button>
		</cps:tbar>
		
		<cps:panel title="查询条件">
			<form id="searchform" target="hiddeniframe" method="post">
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
						
						<cps:tdLabel>走访人：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.zfrxm"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>走访类型：</cps:tdLabel>
						<cps:tdContent>
							<cps:select name="query.zflx" zdlb="ZDY_ZFLX" headerKey="" headerValue="--请选择--"></cps:select>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>走访时间：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:date dateFmt="yyyy-MM-dd" name="query.zfsj_s" cssStyle="width:180px;"></cps:date>&nbsp;至
							<cps:date dateFmt="yyyy-MM-dd" name="query.zfsj_e" cssStyle="width:180px;"></cps:date>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	
	<cps:tableGrid url="/rhzf/queryRhzfList.action" 
						title="入户走访列表"
						id="rhzfList" 
						autoload="false" 
						pageSize="10" 
						width="99.8%" 
						usepager="true" 
						searchform="searchform" 
						autothead="false" 
						mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" field="cz" align="center"></cps:column>
			<cps:column title="走访地址" field="dzmc" align="left" maxlength="15"></cps:column>
			<cps:column title="居住人数" field="jzrs" align="center"></cps:column>
			<cps:column title="走访时间" field="zfsj" align="center"></cps:column>
			<cps:column title="走访类型" field="zflxmc" align="left"></cps:column>
			<cps:column title="走访人" field="zfrxm" align="left"></cps:column>
			<cps:column title="走访单位" field="djdwmc" align="left" maxlength="15"></cps:column>
		</cps:tableGrid>
		
		<iframe name="hiddeniframe" src="" height="0" width="0"></iframe>
</creator:view>