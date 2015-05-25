<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:box>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/xgdyxx.js"></script>
		<creator:tbar id="tbar">
			<cps:button value="查询" onclick="queryXgdyxx()"></cps:button>
			<cps:button value="新&nbsp;增" onclick="openAddXgdyxx()"></cps:button>
		</creator:tbar>
		<creator:panel id="afglxgdygldj" title="协管队员管理" tbarId="tbar">
			<form id="searchform">
				<cps:table>
					<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="xgdyxxQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryXgdyxx)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="xgdyxxQuery.citygajgjgdm" value="${xgdyxxQuery.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="xgdyxxQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryXgdyxx)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="xgdyxxQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryXgdyxx)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="xgdyxxQuery.countrygajgjgdm" value="${xgdyxxQuery.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="xgdyxxQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryXgdyxx)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="xgdyxxQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryXgdyxx()"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="xgdyxxQuery.pcsdm" value="${xgdyxxQuery.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="xgdyxxQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryXgdyxx()" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
				</cps:row>
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect" name="xgdyxxQuery.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="xgdyxxQuery.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="xgdyxxQuery.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">队员姓名：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="dyxm" name="xgdyxxQuery.dyxm" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">队员身份证号：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="dysfzh" name="xgdyxxQuery.dysfzh" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						
						<cps:tdLabel width="13%">上岗时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="sgrq_from" name="xgdyxxQuery.sgrq_from"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:30%;">
							</cps:date>
							至
							<cps:date id="sgrq_to" name="xgdyxxQuery.sgrq_to"
										dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:30%;">
							</cps:date>
						</cps:tdContent>
						<cps:tdLabel width="12%">离岗时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="lgrq_from" name="xgdyxxQuery.lgrq_from"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:30%;">
							</cps:date>
							至
							<cps:date id="lgrq_to" name="xgdyxxQuery.lgrq_to"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:30%;">
							</cps:date>
						</cps:tdContent>
						<cps:tdLabel width="12%">注销标识：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select zdlb="ZDY_ZXBS" id="zxbs" name="xgdyxxQuery.zxbs" headerKey="" headerValue=" " value="0"></cps:select>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="xgdyxxList" 
			title="协管员列表"
			width="99.8%"
			searchform="searchform" 
			url="/xgdyxx/xgdyxxList.action">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" field="cz" align="left" rowcallback="xgdyxxlistCzRowCallback"></cps:column>
			<cps:column title="协管员姓名" field="dyxm"></cps:column>
			<cps:column title="身份证号" field="dysfzh"></cps:column>
			<cps:column title="联系电话" field="dylxdh"></cps:column>
			<cps:column title="性别" field="dyxbmc"></cps:column>
			<cps:column title="文化程度" field="whcdmc"></cps:column>
			<cps:column title="注消标识" field="zxbsmc"></cps:column>
			
		</cps:tableGrid>
		
	</creator:box>
</creator:view>