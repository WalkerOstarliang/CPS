<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%--危爆单位审核列表--%>
<creator:view>
	<creator:Script src="/jsp/dwdj/js/wbdwshlist.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryWbdwshList()"></cps:button>
			<cps:button value="重置"></cps:button>
		</cps:tbar>
		<cps:panel title="查询条件">
			<form id="wbdwShQuery">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="wbdwshQuery.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue=" " cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="wbdwshQuery.citygajgjgdm"
										value="${wbdwshQuery.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="wbdwshQuery.citygajgjgdm" listKey="dm"
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
										name="wbdwshQuery.countrygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue=" " cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="wbdwshQuery.countrygajgjgdm"
										value="${wbdwshQuery.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="wbdwshQuery.countrygajgjgdm" listKey="dm"
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
									<s:select id="pcsdm" list="pcsGajgjgList" name="wbdwshQuery.pcsdm"
										onchange="doubleSelectJWS(this.value,'jwsselect')"
										listKey="dm" listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="wbdwshQuery.pcsdm" value="${wbdwshQuery.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList" name="wbdwshQuery.pcsdm"
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
									<s:select list="jwsqOrgList" id="jwsselect" name="wbdwshQuery.jwsqdm"
										listKey="orgcode" listValue="orgjc" headerKey=""
										headerValue=" " cssClass="cps-select"
										onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="wbdwshQuery.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="wbdwshQuery.jwsqdm"
										listKey="orgcode" listValue="orgjc" headerKey=""
										headerValue=" " cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						
						<cps:tdLabel>单位名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="wbdwshQuery.dwmc"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>操作状态：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'1':'新增','4':'注销','5':'恢复'}" name="wbdwshQuery.czzt"
							cssClass="cps-select" headerKey="" headerValue=" "></s:select>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>审核状态：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'0':'未审核','1':'审核通过','2':'审核未通过'}" name="wbdwshQuery.shzt"
								cssClass="cps-select" headerKey="" headerValue=" "></s:select>
						</cps:tdContent>
						
						<cps:tdLabel>提交时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date cssStyle="width:40%" name="wbdwshQuery.tjsj_start" dateFmt="yyyy-MM-dd"></cps:date> - 
							<cps:date cssStyle="width:40%" name="wbdwshQuery.tjsj_end" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
						
						<cps:tdLabel>审核时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date cssStyle="width:40%" name="wbdwshQuery.shsj_start" dateFmt="yyyy-MM-dd"></cps:date> - 
							<cps:date cssStyle="width:40%" name="wbdwshQuery.shsj_end" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	<cps:tableGrid url="/sydw/wbdwgl/queryWbDwShList.action" 
						title="危爆单位审核"
						id="wbdwshList" 
						autoload="false" 
						pageSize="10" 
						width="99.8%" 
						usepager="true" 
						searchform="wbdwShQuery" 
						autothead="false" 
						mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" field="cz" align="center"></cps:column>
			<cps:column title="单位名称" field="dwmc" align="left"></cps:column>
			<cps:column title="操作类型" field="czlxmc" align="left"></cps:column>
			<cps:column title="提交人" field="tjrxm" align="left"></cps:column>
			<cps:column title="提交时间" field="tjsj" align="center"></cps:column>
			<cps:column title="审核状态" field="shztmc" align="left"></cps:column>
		</cps:tableGrid>
</creator:view>
