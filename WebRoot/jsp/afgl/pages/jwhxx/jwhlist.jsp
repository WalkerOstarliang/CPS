<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/afgl/js/jwhlist.js"></creator:Script>
<creator:box>
	<creator:tbar id="jwhtbar">
		<cps:button value="查&nbsp;询" onclick="jxQuery()"></cps:button>
		<%--<cps:button value="重&nbsp;置" onclick="openGjQueryXldxx()"></cps:button>--%>
		<cps:button value="新&nbsp;增" onclick="openJwhInfoWin('add')"></cps:button>
		<cps:button value="批量删除" onclick="batchDeleteSqjwhxx()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldcx" title="居/村委会管理" tbarId="jwhtbar">
		<form id="xldqueryform" >
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citydm}">
								<s:select list="cityXzqhList" id="citydm" name="queryBean.citydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="doubleSelectCountry(this.value,'countrydmselect',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="citydm" name="queryBean.citydm"></s:hidden>
								<s:select list="cityXzqhList" id="citydmselect" name="queryBean.citydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrydm}">
								<s:select  list="countryXzqhList" id="countrydmselect" name="queryBean.countrydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="doubleSelectPcs(this.value,'pcsdm',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.countrydm"></s:hidden>
								<s:select list="countryXzqhList" id="countrydmselect" name="queryBean.countrydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select list="pcsOrgList" id="pcsdm"  name="queryBean.pcsdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="doubleSelectJWS(this.value,'jwsselect',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="pcsdm" name="queryBean.pcsdm"></s:hidden>
								<s:select list="pcsOrgList" id="pcsdm" name="queryBean.pcsdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>警务区：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.jwsqdm}">
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--选择--" cssStyle="width:70%" cssClass="cps-input" onchange="doubleSelectSqxxByJwsdm(this.value,'sqbhselect',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm"  listKey="orgcode" listValue="orgjc" disabled="true" cssStyle="width:70%" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>社区：</cps:tdLabel>
					<cps:tdContent>
						<select id="sqbhselect" name="queryBean.sssqbh" class="cps-input" onchange="jxQuery()">
							<option value="">请选择</option>
						</select>
					</cps:tdContent>
					<cps:tdLabel>类型：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="jwhlx" name="queryBean.jwhlx" zdlb="JWHLX" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="jxQuery()"></cps:select>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	
	
	<cps:tableGrid id="xldquerylist" 
				mutilSelect="true"
				url="/afgl/jwhgl/queryJwhPageResultList.action" 
				searchform="xldqueryform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="jwhmc" title="居/村委会"></cps:column>
		<cps:column field="jwhfzrxm" title="负责人"></cps:column>
		<cps:column field="sssqmc" title="所在社区" maxlength="10"></cps:column>
		<cps:column field="ssxzqhmc" title="所属行政区划" maxlength="10"></cps:column>
		<cps:column field="jwhgbrs" title="干部人数" rowcallback="jwhgbrsRowCallback"></cps:column>
		<cps:column field="djdwmc" title="登记单位" maxlength="10"></cps:column>
		<cps:column field="zxbs" title="状态" rowcallback="zxbsRowCallback"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="czRowCallback"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>