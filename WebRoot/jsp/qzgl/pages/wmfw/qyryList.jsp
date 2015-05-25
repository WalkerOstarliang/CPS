<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js"></script>
<creator:view>
	<creator:box>
		<creator:tbar id="wmfwgl">
			<cps:button value="查&nbsp;询" onclick="qyryquery()"></cps:button>&nbsp;
			<cps:button value="重&nbsp;置" onclick="qyryclearQuery()"></cps:button>
			<cps:button value="新&nbsp;增" onclick="addQyry()" display="${displayAddBtn}"></cps:button>
			<cps:button value="修&nbsp;改" onclick="xgQyry()" display="${displayAddBtn}"></cps:button>
			<cps:button value="删&nbsp;除" onclick="deleteQyry()" display="${displayAddBtn}"></cps:button>
			<cps:button value="弃婴移送信息" onclick="queryQyryYsxx()"></cps:button>
		</creator:tbar>
		<creator:panel id="wmfwgl" title="为民服务>弃婴信息" tbarId="wmfwgl" width="99.8%">
			<form id="qyryqueryform">
					<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">录入市州：</cps:tdLabel>
						<cps:tdContent width="24%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm"
										name="qyryquery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectCountry(this.value,'countrydmselect',qyryquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="qyryquery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect"
										name="qyryquery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">录入县区：</cps:tdLabel>
						<cps:tdContent width="24%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect"
										name="qyryquery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectPcs(this.value,'pcsdm',qyryquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="qyryquery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="qyryquery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">录入派出所：</cps:tdLabel>
						<cps:tdContent width="28%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdm" name="qyryquery.pcsdm"
										listKey="orgcode" listValue="orgjc" headerKey=""
										headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectJWS(this.value,'jwsselect',qyryquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="pcsdm" name="qyryquery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdm" name="qyryquery.pcsdm"
										listKey="orgcode" listValue="orgjc" headerKey=""
										headerValue="--请选择--" disabled="true" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">录入警务区：</cps:tdLabel>
						<cps:tdContent width="24%">
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect"
										name="qyryquery.jwsqdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--选择--" cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="qyryquery.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect"
										name="qyryquery.jwsqdm" listKey="orgcode" listValue="orgjc"
										disabled="true" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>

						<cps:tdLabel width="10%">姓名：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:textfield id="qyryxm" name="qyryquery.qyryxm"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>

						<cps:tdLabel width="10%">发现时间：</cps:tdLabel>
						<cps:tdContent width="28%">
							<cps:date id="fxstartDate" name="qyryquery.fxstartDate"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
							-
							<cps:date id="fxendDate" name="qyryquery.fxendDate"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">来源：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:textfield id="qyryly" name="qyryquery.qyryly"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">发现人姓名：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:textfield id="qyryfxrxm" name="qyryquery.qyryfxrxm"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">到所时间：</cps:tdLabel>
						<cps:tdContent width="28%">
							<cps:date id="dsstartDate" name="qyryquery.dsstartDate"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
							-
							<cps:date id="dsendDate" name="qyryquery.dsendDate"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="qyryquerylist" 
				mutilSelect="true"
				url="/qzgl/wmfwgl/queryQyryListAction.action" >
			<cps:column isCheckbox="true" title="选择" ></cps:column>	
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="djdwmc" title="录入单位" maxlength="10"></cps:column>
			<cps:column field="qyryxm" title="姓名" rowcallback="qyryxmrowcallback" maxlength="20"></cps:column>
			<cps:column field="qyryly" title="来源" maxlength="10"></cps:column>
			<cps:column field="qyrybfxsj" title="发现时间" maxlength="10"></cps:column>
			<cps:column field="qyrydssj" title="到所时间" maxlength="10"></cps:column>
			<cps:column field="qyryfxrxm" title="发现人姓名" maxlength="10"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>