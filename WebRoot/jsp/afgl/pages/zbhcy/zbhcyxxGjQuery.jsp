<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="治保会成员信息高级查询">
		<creator:panel id="afglzbhgcyjcx" title="治保会成员信息高级查询">
			<form id="gjsearchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="zbhcyxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryZbhcyxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="zbhxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="zbhcyxxQuery.citydm" listKey="dm" listValue="mc"
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
										name="zbhcyxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryZbhcyxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="zbhcyxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="zbhcyxxQuery.countrydm" listKey="dm" listValue="mc"
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
										name="zbhcyxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryZbhcyxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="zbhcyxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="zbhcyxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">治保会名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="zbhbh" name="zbhcyxxQuery.zbhbh" value="${zbhcyxxQuery.zbhbh }"/>
							<cps:textfield id="zbhmc" name="zbhcyxxQuery.zbhmc" value="${zbhcyxxQuery.zbhmc }"
								cssStyle="width:50%" ondblclick="selectZbhxx('1')"></cps:textfield>
							<cps:button value="选择" onclick="selectZbhxx('1')"></cps:button>
						</cps:tdContent>
						<cps:tdLabel width="12%">姓名：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xm" name="zbhcyxxQuery.xm"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">身份证号：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="sfzh" name="zbhcyxxQuery.sfzh" cssStyle="width:80%;">
							</cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">文化程度：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:select id="whcd" name="zbhcyxxQuery.whcd"
										 zdlb="AF_WHCD" cssStyle="width:80%" headerKey="" headerValue="--选择--"></cps:select>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">工作表现：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:select id="gzbx" name="zbhcyxxQuery.gzbx" 
										 zdlb="AF_GZBX" cssStyle="width:80%" headerKey="" headerValue="--选择--"></cps:select>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">参加日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="cjrq_from" name="zbhcyxxQuery.cjrq_from" dateFmt="yyyy-MM-dd HH:mm:ss"  
								cssClass="cps-input" cssStyle="width:40%" ></cps:date>
							至
							<cps:date id="cjrq_to" name="zbhcyxxQuery.cjrq_to" dateFmt="yyyy-MM-dd HH:mm:ss" 
								cssClass="cps-input" cssStyle="width:40%" ></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="确定" onclick="gjQueryZbhcyxx()"></cps:button>
							<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/zbhcyxx.js"></script>
</creator:view>