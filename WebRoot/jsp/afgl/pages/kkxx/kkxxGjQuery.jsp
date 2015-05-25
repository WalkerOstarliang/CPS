<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="卡口信息高级查询">
		<creator:panel id="afglkkxxgjcx" title="卡口信息高级查询">
			<form id="gjsearchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="kkxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryKkxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="kkxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="kkxxQuery.citydm" listKey="dm" listValue="mc"
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
										name="kkxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryKkxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="kkxxQuery.countrydm" listKey="dm" listValue="mc"
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
										name="kkxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryKkxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="kkxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">卡口名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="kkmc" name="kkxxQuery.kkmc"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">卡口位置：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="kkwz" name="kkxxQuery.kkwz"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">建立日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="kkcjsj_from" name="kkxxQuery.kkcjsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
					至
					<cps:date id="kkcjsj_to" name="kkxxQuery.kkcjsj_to"
								dateFmt="yyyy-MM-dd HH:mm:ss " cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">所属责任区：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="sszrqdm" name="kkxxQuery.sszrqdm" />
							<cps:textfield id="sszrqmc" name="" cssStyle="width:50%"
								ondblclick="selectDw('${loginInfo.orgcode }','sszrqdm','sszrqmc')"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode }','sszrqdm','sszrqmc')"></cps:button>
						</cps:tdContent>
						<cps:tdLabel width="12%">登记人：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djrxm" name="kkxxBean.djrxm"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="djsj_from" name="kkxxQuery.djsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
					至
					<cps:date id="djsj_to" name="kkxxQuery.djsj_to"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="确定" onclick="gjQueryKkxx()"></cps:button>
							<cps:button value="清空" type="reset"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/kkxx.js"></script>
</creator:view>