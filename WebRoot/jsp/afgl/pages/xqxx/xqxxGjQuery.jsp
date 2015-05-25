<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
		<creator:panel id="afglxqgldjgj" title="小区信息高级查询">
			<form id="gjsearchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="xqxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryXqxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="xqxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="xqxxQuery.citydm" listKey="dm" listValue="mc"
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
										name="xqxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryXqxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="xqxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="xqxxQuery.countrydm" listKey="dm" listValue="mc"
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
										name="xqxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryXqxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="xqxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="xqxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>所属警务区：</cps:tdLabel>
						<cps:tdContent>
								<c:choose>
									<c:when test="${empty loginInfo.jwsqdm}">
										<s:select list="jwsqOrgList" id="ssjwsbh" name="xqxxQuery.ssjwsbh" listKey="orgcode" 
											listValue="orgjc" headerKey="" headerValue="--选择--" cssStyle="width:80%" 
											cssClass="cps-input"></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="ssjwsbh" name="xqxxQuery.ssjwsbh"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="xqxxQuery.jwsqdm"  listKey="orgcode" 
										listValue="orgjc" disabled="true" cssStyle="width:80%" cssClass="cps-input"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						
						<cps:tdLabel width="12%">所属居委会：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="ssjwhbh" name="xqxxQuery.ssjwhbh"/>
							<cps:textfield id="ssjwhmc" name="xqxxQuery.ssjwhmc" cssStyle="width:50%" 
								disabled="true" ondblclick="selectJwh('xqxxQuery','0')">
							</cps:textfield>
							<cps:button value="选择" onclick="selectJwh('xqxxQuery','0')"></cps:button>
						</cps:tdContent>
						<cps:tdLabel width="12%">小区名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xqmc" name="xqxxQuery.xqmc"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">小区负责人：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xqfzrxm" name="xqxxQuery.xqfzrxm"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">物业公司：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wygsmc" name="xqxxQuery.wygsmc"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">物业公司负责人：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wygsfzr" name="xqxxQuery.wygsfzr"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">管理模式：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="glms" name="xqxxQuery.glms" zdlb="AF_GLMS" headerKey="" 
									headerValue="--请选择--"cssStyle="width:80%"></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="12%">建立日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="jlrq_from" name="xqxxQuery.jlrq_from"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
							至
							<cps:date id="jlrq_to" name="xqxxQuery.jlrq_to"
										dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:40%;">
									</cps:date>
						</cps:tdContent>
						<cps:tdLabel width="12%">撤消日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="cxrq_from" name="xqxxQuery.cxrq_from"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
							至
							<cps:date id="cxrq_to" name="xqxxQuery.cxrq_to"
										dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:40%;">
									</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="确定" onclick="gjQueryXqxx()"></cps:button>
							<cps:button value="关闭" onclick="window.close()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/xqxx.js"></script>
</creator:view>