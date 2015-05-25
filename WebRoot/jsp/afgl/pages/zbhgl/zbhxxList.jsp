<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/zbhxx.js"></script>
	<creator:box>
		<creator:tbar id="tbar">
			<cps:button value="查&nbsp;询" onclick="queryZbhxx()"></cps:button>
			<cps:button value="新&nbsp;增" onclick="openAddZbhxx()"></cps:button>
			<%--<cps:button value="批量撤销" onclick="toBatchDeleteZbhxx()"></cps:button>--%>
		</creator:tbar>
		<creator:panel id="afglzbhgldj" title="治保会管理" tbarId="tbar">
			<form id="searchform">
				<cps:table>
					<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="zbhxxQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryZbhxx)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="zbhxxQuery.citygajgjgdm" value="${zbhxxQuery.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="zbhxxQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryZbhxx)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="zbhxxQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryZbhxx)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="zbhxxQuery.countrygajgjgdm" value="${zbhxxQuery.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="zbhxxQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryZbhxx)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="zbhxxQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="zbhxxQuery.pcsdm" value="${zbhxxQuery.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="zbhxxQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>警务区：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.jwsqdm}">
								<s:select list="jwsqOrgList" id="jwsselect" name="zbhxxQuery.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="zbhxxQuery.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="zbhxxQuery.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">治保会名称：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="zbhmc" name="zbhxxQuery.zbhmc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">注销标识：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:select id ="zxbs" name="zbhxxQuery.zxbs" headerKey="" headerValue=" " value="0" zdlb="ZDY_ZXBS"></cps:select>
						</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
		</creator:panel>
		
		<cps:tableGrid id="zbhxxList" title="治保会列表"
			usepager="true" 
			width="99.8%"
			searchform="searchform"
			autothead="false"
			url="/zbhxx/zbhxxList.action"
			mutilSelect="true" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="zbhxxlistCzRowCallback" align="left"></cps:column>
			<cps:column title="治保会名称" field="zbhmc" align="left"></cps:column>
			<cps:column title="所在社区" field="sssqmc"></cps:column>
			<cps:column title="建立日期" field="cjsj"></cps:column>
			<cps:column title="责任人" field="zbhfzrxm"></cps:column>
			<cps:column title="联系电话" field="zbhfzrlxdh"></cps:column>
			<cps:column title="注消标识" field="zxbsmc"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>