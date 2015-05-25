<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="非卡口盘查高级查询">
		<creator:panel id="notgjafglkkpcxx" title="非卡口盘查高级查询">
			<form id="notgjsearchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm"
										name="kkpcxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryKkpcxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="kkpcxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect"
										name="kkpcxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">县/区：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect"
										name="kkpcxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryKkpcxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkpcxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="kkpcxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">派出所：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="kkpcxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryKkpcxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkpcxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="kkpcxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>盘查原因：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="pcyy" name="kkpcxxQuery.pcyy"  cssStyle="width:80%" 
										zdlb="AF_PCYY" headerValue="--选择--" headerKey=""></cps:select>
						</cps:tdContent>
						<cps:tdLabel>盘查时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="pcsj_from" name="kkpcxxQuery.pcsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input"
								cssStyle="width:40%"></cps:date>
					至
					<cps:date id="pcsj_to" name="kkpcxxQuery.pcsj_to"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input"
								cssStyle="width:40%"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>盘查民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="pcmjxm" name="kkpcxxQuery.pcmjxm"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>登记人：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="djrxm" name="kkpcxxQuery.djrxm"></cps:textfield>
						</cps:tdContent>

						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_from" name="kkpcxxQuery.djsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssStyle="width:40%"
								cssClass="cps-input"></cps:date>
					至
					<cps:date id="djsj_to" name="kkpcxxQuery.djsj_to"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input"
								cssStyle="width:40%"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>
					&nbsp;
				</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="确定"  onclick="notgjQueryKkpcxx();"></cps:button>
							<cps:button value="清空" type="reset"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/kkpcxx.js"></script>
</creator:view>