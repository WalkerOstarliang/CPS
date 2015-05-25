<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="治保会信息高级查询">
		<creator:panel id="afglzbhgjcx" title="治保会信息高级查询">
			<form id="gjsearchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="zbhxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryZbhxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="zbhxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="zbhxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">县/区：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="zbhxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryZbhxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="zbhxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="zbhxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">派出所：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="zbhxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryZbhxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="zbhxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="zbhxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">治保会名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="zbhmc" name="zbhxxQuery.zbhmc"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">治保会责任人：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="zbhfzrxm" name="zbhxxQuery.zbhfzrxm"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">登记人：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djrxm" name="zbhxxQuery.djrxm"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">注消时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="zxsj_from" name="zbhxxQuery.zxsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
					至
					<cps:date id="zxsj_to" name="zbhxxQuery.zxsj_to"
								dateFmt="yyyy-MM-dd HH:mm:ss " cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
						</cps:tdContent>
						<cps:tdLabel width="12%">创建日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="cjsj_from" name="zbhxxQuery.cjsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
					至
					<cps:date id="cjsj_to" name="zbhxxQuery.cjsj_to"
								dateFmt="yyyy-MM-dd HH:mm:ss " cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
						</cps:tdContent>
						
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="djsj_from" name="zbhxxQuery.djsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
					至
					<cps:date id="djsj_to" name="zbhxxQuery.djsj_to"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
						</cps:tdContent>
					</cps:row> 
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="确定" onclick="gjQueryZbhxx()"></cps:button>
							<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/zbhxx.js"></script>
</creator:view>