<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/afgl/js/sqjbqk.js"></creator:Script>
	<form id="xqQueryForm">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%">市局：</cps:tdLabel>
				<cps:tdContent width="22%">
					<c:choose>
						<c:when test="${empty loginInfo.citygajgdm}">
							<s:select id="citygajgjgdm" list="cityGajgjgList"
								name="queryBean.citygajgjgdm" listKey="dm" listValue="jc"
								headerKey="" headerValue="--请选择--" cssClass="cps-select"
								onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryXqqk)">
							</s:select>
						</c:when>
						<c:otherwise>
							<s:select id="citygajgjgdm" list="cityGajgjgList"
								disabled="true" name="queryBean.citygajgjgdm" listKey="dm"
								listValue="jc" headerKey="" headerValue="--请选择--"
								cssClass="cps-select"
								onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryXqqk)">
							</s:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="12%">县区局：</cps:tdLabel>
				<cps:tdContent width="22%">
					<c:choose>
						<c:when test="${empty loginInfo.countrygajgdm}">
							<s:select id="countrygajgjgdm" list="countryGajgjgList"
								name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc"
								headerKey="" headerValue="--请选择--" cssClass="cps-select"
								onchange="doublePcsGajgjg(this.value,'pcsdm',queryXqqk)"></s:select>
						</c:when>
						<c:otherwise>
							<s:select id="countrygajgjgdm" list="countryGajgjgList"
								disabled="true" name="queryBean.countrygajgjgdm" listKey="dm"
								listValue="jc" headerKey="" headerValue="--请选择--"
								cssClass="cps-select"
								onchange="doublePcsGajgjg(this.value,'pcsdm',queryXqqk)"></s:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="12%">派出所：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty loginInfo.pcsdm}">
							<s:select id="pcsdm" list="pcsGajgjgList" name="queryBean.pcsdm"
								listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--"
								cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect',queryXqqk)"></s:select>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="queryBean.pcsdm" value="${queryBean.pcsdm}" />
							
							<s:select id="pcsdm" list="pcsGajgjgList" name="queryBean.pcsdm"
								disabled="true" listKey="dm" listValue="jc" headerKey=""
								headerValue="--请选择--" cssClass="cps-select"  onchange="doubleSelectJWS(this.value,'jwsselect',queryXqqk)"></s:select>
						</c:otherwise>
					</c:choose>

				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="8%">警务区/室：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty loginInfo.jwsqdm}">
							<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgname" headerKey="" headerValue="" cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdmselect')"></s:select>
						</c:when>
						<c:otherwise>
							<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
							<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm"  listKey="orgcode" listValue="orgname" disabled="true" cssClass="cps-select"></s:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="8%">社区/村：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty loginInfo.jwsqdm}">
							<s:select list="sqJbxxList" id="sqdmselect" name="queryBean.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange=""></s:select>
						</c:when>
						<c:otherwise>
							<s:hidden id="sqdm" name="queryBean.sqdm"></s:hidden>
							<s:select list="sqJbxxList" id="sqdmselect" name="queryBean.sqdm"  listKey="sqbh" listValue="jc" disabled="true" cssClass="cps-select"></s:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="8%">&nbsp;</cps:tdLabel>
				<cps:tdContent>
					<cps:button value="查询" onclick="queryXqqk()"></cps:button>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
	<div id="sqjbqkpanel" style="text-align: center;">
	<creator:panel id="sqjbqkcreatorpanel" title="辖区情况统计">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%" cssClass="changetablebgcolor">常住人口：</cps:tdLabel>
				<cps:tdContent width="15%"><span id="czrk"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel width="10%" cssClass="changetablebgcolor">流动人口：</cps:tdLabel>
				<cps:tdContent width="15%"><span id="ldrk"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel width="10%" cssClass="changetablebgcolor">寄住人口：</cps:tdLabel>
				<cps:tdContent width="15%"><span id="jzrk"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel width="10%" cssClass="changetablebgcolor">境外人口：</cps:tdLabel>
				<cps:tdContent width="15%"><span id="jwrk"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssClass="changetablebgcolor">重点人口：</cps:tdLabel>
				<cps:tdContent><span id="zdrk"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">在逃人数：</cps:tdLabel>
				<cps:tdContent><span id="ztry"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">吸毒人口：</cps:tdLabel>
				<cps:tdContent><span id="xdry"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">精神病人：</cps:tdLabel>
				<cps:tdContent><span id="jsbr"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
			</cps:row>
		 	<cps:row>
				<cps:tdLabel cssClass="changetablebgcolor">特种行业：</cps:tdLabel>
				<cps:tdContent><span id="tzhy"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">公共场所：</cps:tdLabel>
				<cps:tdContent><span id="ggcs"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">娱乐场所：</cps:tdLabel>
				<cps:tdContent><span id="ylcs"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">企事业单位：</cps:tdLabel>
				<cps:tdContent><span id="qsydw"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssClass="changetablebgcolor">危险品单位：</cps:tdLabel>
				<cps:tdContent><span id="wxwp"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">重点单位数：</cps:tdLabel>
				<cps:tdContent><span id="zddws"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">学校：</cps:tdLabel>
				<cps:tdContent><span id="xx"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">幼儿园：</cps:tdLabel>
				<cps:tdContent><span id="yey"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssClass="changetablebgcolor">旅馆数：</cps:tdLabel>
				<cps:tdContent><span id="lg"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">网吧数：</cps:tdLabel>
				<cps:tdContent><span id="wb"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">房屋数：</cps:tdLabel>
				<cps:tdContent><span id="fw"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">出租房屋数：</cps:tdLabel>
				<cps:tdContent><span id="czw"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssClass="changetablebgcolor">社区/村</cps:tdLabel>
				<cps:tdContent><span id="sq"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">治保会：</cps:tdLabel>
				<cps:tdContent><span id="zbh"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">社区干部：</cps:tdLabel>
				<cps:tdContent><span id="sqgb"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">巡逻队数：</cps:tdLabel>
				<cps:tdContent><span id="xld"><img src="<c:url value='/template/cps/images/someloading.gif'/>"></span></cps:tdContent>
			</cps:row>
		</cps:table>
		</creator:panel>
	</div>
</creator:view>