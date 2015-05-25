<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/afgl/js/sqjbxxlist.js"></creator:Script>
	<creator:Script src="/jsp/afgl/js/sqselectwin.js"></creator:Script>
	<creator:tbar id="sqselect">
		<cps:button value="查&nbsp;询" onclick="jxQuery()"></cps:button>
		<cps:button value="重&nbsp;置" type="reset"></cps:button>
	</creator:tbar>
	<creator:panel id="xldcx" title="社区选择" tbarId="sqselect">
		<form id="xldqueryform">
			<input type="hidden" name="queryBean.sqleve" value="${queryBean.sqleve}" />		
			<c:choose>
				<c:when test="${queryBean.sqleve == 4}">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="20%">街道名称：</cps:tdLabel>
							<cps:tdContent width="40%">
								<input type="hidden" name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm }" />
								<cps:textfield id="sqmc" name="queryBean.sqmc"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="20%">注销标识：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="zxbs" name="queryBean.zxbs" zdlb="ZXBS"
									headerKey="" headerValue="--请选择--" cssClass="cps-input"
									onchange="jxQuery()" value="1"></cps:select>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</c:when>
				<c:otherwise>
					<cps:table>
						<cps:row>
							<cps:tdLabel width="12%">市局：</cps:tdLabel>
							<cps:tdContent width="21%">
								<c:choose>
									<c:when test="${empty loginInfo.citygajgdm}">
										<s:select id="citygajgjgdm" list="cityGajgjgList"
											name="queryBean.citygajgjgdm" listKey="dm" listValue="jc"
											headerKey="" headerValue="--请选择--" cssClass="cps-select"
											onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQuery)"></s:select>
									</c:when>
									<c:otherwise>
										<input type="hidden" name="queryBean.citygajgjgdm"
											value="${queryBean.citygajgjgdm }" />
										<s:select id="citygajgjgdm" list="cityGajgjgList"
											disabled="true" name="queryBean.citygajgjgdm" listKey="dm"
											listValue="jc" headerKey="" headerValue="--请选择--"
											cssClass="cps-select"
											onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQuery)"></s:select>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
		
							<cps:tdLabel width="12%">县区局：</cps:tdLabel>
							<cps:tdContent width="21%">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"
											name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc"
											headerKey="" headerValue="--请选择--" cssClass="cps-select"
											onchange="doublePcsGajgjg(this.value,'pcsdmselect',jxQuery)"></s:select>
							</cps:tdContent>
		
							<cps:tdLabel width="12%">派出所：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="pcsGajgjgList" id="pcsdmselect"
											name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey=""
											headerValue="--请选择--" cssClass="cps-select"
											onchange="doubleSelectJWS(this.value,'jwsselect',jxQuery)"></s:select>
							</cps:tdContent>
						</cps:row>
		
						<cps:row>
							<cps:tdLabel>警务区：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="jwsqOrgList" id="jwsselect"
									name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc"
									headerKey="" headerValue="--选择--" cssClass="cps-select"
									onchange="jxQuery()"></s:select>
							<!-- 
								<c:choose>
									<c:when test="${empty loginInfo.jwsqdm}">
										<s:select list="jwsqOrgList" id="jwsselect"
											name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc"
											headerKey="" headerValue="--选择--" cssClass="cps-select"
											onchange="jxQuery()"></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect"
											name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc"
											 cssClass="cps-select"></s:select>
									</c:otherwise>
								</c:choose>
							 -->	
							</cps:tdContent>
		
							<cps:tdLabel>社区名称：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="sqmc" name="queryBean.sqmc"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>注销标识：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="zxbs" name="queryBean.zxbs" zdlb="ZXBS"
									headerKey="" headerValue="--请选择--" cssClass="cps-input"
									onchange="jxQuery()" value="1"></cps:select>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</c:otherwise>
			</c:choose>
		</form>
	</creator:panel>

	<cps:tableGrid id="xldquerylist" mutilSelect="false" title="社区列表"
		url="/afgl/sqjbgl/querySqJbxxBeanList.action" dblclick="rowdblclick"
		searchform="xldqueryform"
		width="99.6%">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="jc" title="简称" align="left"></cps:column>
			<cps:column field="ssjdxzmc" title="所在街道/乡镇" align="left"></cps:column>
			<c:if test="${queryBean.sqleve != 4}">
				<cps:column field="sspcsmc" title="所属派出所" maxlength="10" align="left"></cps:column>
				<cps:column field="sqmjxm" title="社区民警" align="left"></cps:column>
			</c:if>
		<cps:column field="zxbs" title="状态" rowcallback="zxztRowCallback" align="left"></cps:column>
	</cps:tableGrid>
</creator:view>