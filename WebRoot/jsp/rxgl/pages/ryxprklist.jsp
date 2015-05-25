<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
	<creator:box>
	<form id="queryForm">
	<creator:tbar id="fwtooltbar">
		<cps:button value="查询" onclick="queryList()"></cps:button>
		<cps:button value="重置" onclick="reset()"></cps:button>
	</creator:tbar>
	<creator:panel id="fwquerypanel" title="人员相片管理" tbarId="fwtooltbar">
			<input type="hidden" name="operType" value="select">
			<input type="hidden" name="modename" value="${modename}">
			<input type="hidden" name="queryBean.rylb" value="${queryBean.rylb}">
			<cps:table height="100%">
				<input type="hidden" name="queryBean.leve" value="${loginInfo.leve}">
				<input type="hidden" name="queryBean.orgcode" value="${loginInfo.orgcode}">
				<cps:row>
					<cps:tdLabel  width="9%">市局：</cps:tdLabel>
					<cps:tdContent  width="25%">
							<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel  width="10%">县区局：</cps:tdLabel>
					<cps:tdContent  width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.pcsdm"></s:hidden>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
				 	<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="9%">证件种类：</cps:tdLabel>
						<cps:tdContent width="25%">
							 <cps:select zdlb="GB_ZJZL"  id="zjzl" name="queryBean.zjzl" value="111" ></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">证件号码：</cps:tdLabel>
						<cps:tdContent width="25%">
							 <cps:textfield id="zjhm" name="queryBean.zjhm"></cps:textfield>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<c:if test="${queryBean.rylb != '4'}">
						<cps:tdLabel width="10%">姓名：</cps:tdLabel>
					</c:if>
					<c:if test="${queryBean.rylb == '4'}">
						<cps:tdLabel width="10%">英文名：</cps:tdLabel>
					</c:if>
					<cps:tdContent >
						<cps:textfield id="xm" name="queryBean.xm"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>性别：</cps:tdLabel>
					<cps:tdContent >
						 <cps:select zdlb="GB_XB" id="xb" name="queryBean.xb" value="${queryBean.xb}"  headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel >出生日期：
					</cps:tdLabel>
					<cps:tdContent id="birthContent">
						<cps:date id="csrq_start" cssStyle="width:40%" name="queryBean.csrq_start" dateFmt="yyyy-MM-dd"></cps:date>-
						<cps:date id="csrq_end"   cssStyle="width:40%" name="queryBean.csrq_end" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel >年龄段：</cps:tdLabel>
					<cps:tdContent id="ageContent"  >
						<cps:textfield id="age_start" cssStyle="width:40%" name="queryBean.age_start"  inputType="integer" onblur="minAge(this.value)" maxlength="2"></cps:textfield>-
						<cps:textfield id="age_end"   cssStyle="width:40%" name="queryBean.age_end" inputType="integer" onblur="maxAge(this.value)" maxlength="3"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="djsj_start" cssStyle="width:40%" name="queryBean.djsj_start" readOnly="true" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>-
						<cps:date id="djsj_end"   cssStyle="width:40%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>有无照片：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="ywzp" list="#{'0':'无照片','1' : '有照片'}" name="queryBean.ywzp" cssClass="cps-select"/>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
	</form>
	<cps:tableGrid id="rktablegrid"  
				title="人员列表"
				url="/lsgl/rk/queryRkZpSyrkPageResultInfo.action" 
				searchform="queryForm"
				mutilSelect="false"
				autoload="false"
				width="99.8%">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="zpcz" title="操作" rowcallback="callbackRyzpcz" align="left"></cps:column>
		<cps:column field="xm" title="姓名" ></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="xbms" title="性别"></cps:column>
		<cps:column field="lxdh" title="联系电话"></cps:column>
		<cps:column field="hjdqhmc" title="户籍地区划"  align="left"></cps:column>
		<cps:column field="hjdxz" title="户籍地详址" align="left" maxlength="8"></cps:column>
		<cps:column field="xzzxz" title="现住地" align="left" maxlength="8"></cps:column>
	</cps:tableGrid>
	</creator:box>
</creator:view>