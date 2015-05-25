<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="卡口巡逻高级查询">
		<creator:panel id="gjafglkkxlxxdj" title="卡口巡逻高级查询">
			<form id="gjsearchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm"
										name="kkxlxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryKkxlxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="kkxlxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect"
										name="kkxlxxQuery.citydm" listKey="dm" listValue="mc"
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
										name="kkxlxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryKkxlxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkxlxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="kkxlxxQuery.countrydm" listKey="dm" listValue="mc"
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
										name="kkxlxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryKkxlxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkxlxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="kkxlxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>卡口名称：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="kkbh" name="kkxlxxQuery.kkbh"/>
							<cps:textfield id="kkmc" name="kkxlxxQuery.kkmc"
								cssStyle="width:40%" ondblclick="selectKkxx('kkxlxxQuery','1')"></cps:textfield>
							<cps:button value="选择" onclick="selectKkxx('kkxlxxQuery','1')"></cps:button>
						</cps:tdContent>
						<cps:tdLabel>巡逻时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="xlkssj" name="kkxlxxQuery.xlkssj"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%"></cps:date>
					至
					<cps:date id="xljssj" name="kkxlxxQuery.xljssj"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>巡逻民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="xlmj" name="kkxlxxQuery.xlmj"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>登记人：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="djrxm" name="kkxlxxQuery.djrxm"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_from" name="kkxlxxQuery.djsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%"></cps:date>
					至
					<cps:date id="djsj_to" name="kkxlxxQuery.djsj_to"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>
					&nbsp;
				</cps:tdContent>
					</cps:row> 
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="清空" type="reset"></cps:button>
							<cps:button value="确定" onclick="gjQueryKkxlxx()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/kkxlxx.js"></script>
</creator:view>