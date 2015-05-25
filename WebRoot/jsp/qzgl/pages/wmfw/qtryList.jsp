<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js"></script>
<creator:view>
	<creator:box>
		<creator:tbar id="wmfwgl">
			<cps:button value="查&nbsp;询" onclick="qtryquery()"></cps:button>&nbsp;
			<cps:button value="重&nbsp;置" onclick="qtryclearQuery()"></cps:button>
			<cps:button value="新&nbsp;增" onclick="addQtry()" display="${displayAddBtn}"></cps:button>
			<cps:button value="修&nbsp;改" onclick="xgQtry()" display="${displayAddBtn}"></cps:button>
			<cps:button value="删&nbsp;除" onclick="deleteQtry()" display="${displayAddBtn}"></cps:button>
			<cps:button value="移送" onclick="queryQtryYsxx()"></cps:button>
		</creator:tbar>
		<creator:panel id="wmfwgl" title="为民服务>流浪乞讨人员" tbarId="wmfwgl" width="99.8%">
			<form id="qtryqueryform">
					<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">录入市州：</cps:tdLabel>
						<cps:tdContent width="24%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm"
										name="qtryquery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectCountry(this.value,'countrydmselect',qtryquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="qtryquery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect"
										name="qtryquery.citydm" listKey="dm" listValue="mc"
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
										name="qtryquery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectPcs(this.value,'pcsdm',qtryquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="qtryquery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="qtryquery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">录入派出所：</cps:tdLabel>
						<cps:tdContent width="28%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdm" name="qtryquery.pcsdm"
										listKey="orgcode" listValue="orgjc" headerKey=""
										headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectJWS(this.value,'jwsselect',qtryquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="pcsdm" name="qtryquery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdm" name="qtryquery.pcsdm"
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
										name="qtryquery.jwsqdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--选择--" cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="qtryquery.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect"
										name="qtryquery.jwsqdm" listKey="orgcode" listValue="orgjc"
										disabled="true" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">姓名：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:textfield id="qtryxm" name="qtryquery.qtryxm"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">性别：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:select id="qtryxb" name="qtryquery.qtryxb" zdlb="GB_XB" headerKey="" headerValue="--请选择--"></cps:select>		
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">籍贯：</cps:tdLabel>
						<cps:tdContent width="24%">
							<input type="hidden" id="qtryjg" name="qtryquery.qtryjg">
								<cps:textfield id="qtryjgmc" appendPopuBtn="true" onclick="openSelectXzqh('0',callbackHjdqh)"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">人员类别：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:select id="qtrylb" name="qtryquery.qtrylb" zdlb="ZDY_RYLB" headerKey="" headerValue="--请选择--"></cps:select>		
						</cps:tdContent>
						<cps:tdLabel width="10%">发现时间：</cps:tdLabel>
						<cps:tdContent width="28%">
							<cps:date id="startbfxsj" name="qyryquery.startbfxsj"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
							-
							<cps:date id="endbfxsj" name="qyryquery.endbfxsj"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">发现地点：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:textfield id="qtrybfxdd" name="qtryquery.qtrybfxdd"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid id="qtryquerylist" 
				mutilSelect="true"
				url="/qzgl/wmfwgl/queryQtryListAction.action" >
			<cps:column isCheckbox="true" title="选择" ></cps:column>	
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="djdwmc" title="录入单位" maxlength="10"></cps:column>
			<cps:column field="qtryxm" title="姓名" rowcallback="qtryxmrowcallback" maxlength="20"></cps:column>
			<cps:column field="qtryxbms" title="性别" maxlength="10"></cps:column>
			<cps:column field="qtryjgms" title="籍贯" maxlength="10"></cps:column>
			<cps:column field="qtrylbms" title="人员类别" maxlength="10"></cps:column>
			<cps:column field="qtrybfxsj" title="发现时间" maxlength="10"></cps:column>
			<cps:column field="qtrybfxdd" title="发现地点" maxlength="10"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>