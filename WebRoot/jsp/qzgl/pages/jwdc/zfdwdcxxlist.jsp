<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/qzgl/js/zfdwdcxx.js"></creator:Script>
<creator:Script src="/jsp/afgl/js/af.js"></creator:Script>
<creator:box>
	<creator:tbar id="zfdwdc">
		<cps:button value="查&nbsp;询" onclick="jxQuery()"></cps:button>&nbsp;
	</creator:tbar>
	<creator:panel id="xldcx" title="走访管理>走访单位调查" tbarId="zfdwdc"> 
		<form id="xldqueryform">
			<cps:table>
					<cps:row>
					<cps:tdLabel width="10%">市/州：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citydm}">
								<s:select list="cityXzqhList" id="citydm" name="queryBean.citydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" cssClass="cps-select"  onchange="doubleSelectCountry(this.value,'countrydmselect',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="citydm" name="queryBean.citydm"></s:hidden>
								<s:select list="cityXzqhList" id="citydmselect" name="queryBean.citydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-select" ></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县/区：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrydm}">
								<s:select  list="countryXzqhList" id="countrydmselect" name="queryBean.countrydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" cssClass="cps-select"  onchange="doubleSelectPcs(this.value,'pcsdmselect',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.countrydm"></s:hidden>
								<s:select list="countryXzqhList" id="countrydmselect" name="queryBean.countrydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-select"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select list="pcsOrgList" id="pcsdmselect"  name="queryBean.pcsdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect',jxQuery)" ></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.pcsdm"></s:hidden>
								<s:select list="pcsOrgList" id="pcsdmselect" name="queryBean.pcsdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-select"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">警务区：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.jwsqdm}">
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--"  cssClass="cps-select" onchange="jxQuery()"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm"  listKey="orgcode" listValue="orgjc" disabled="true"  cssClass="cps-select"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				
					<cps:tdLabel>调查状态：</cps:tdLabel>
					<cps:tdContent>
						 <cps:select id="sfjwdc" name="queryBean.sfjwdc" zdlb="QZGL_DCZT"  headerKey="" headerValue="--请选择--"  cssClass="cps-select"  onchange="jxQuery()"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>信息真伪：</cps:tdLabel>
					<cps:tdContent>
						 <cps:select id="xxsfss" name="queryBean.xxsfss" zdlb="QZGL_XXZW"  headerKey="" headerValue="--请选择--"  cssClass="cps-select"  onchange="jxQuery()"></cps:select>
					</cps:tdContent>
					</cps:row>
					
					<cps:row>
					<cps:tdLabel>单位名称：</cps:tdLabel>
					<cps:tdContent>
						 <cps:textfield id="zfdwmc" name="queryBean.zfdwmc" ></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel>走访民警：</cps:tdLabel>
					<cps:tdContent>
						  <input type="hidden" id="zfmjjh" name="queryBean.zfmjjh"  value="${queryBean.zfmjjh}"/>
							<input type="hidden" id="zfmjdwdm"   />
							<input type="hidden" id="zfmjdwmc"  />
							
							<cps:textfield id="zfmjxm" name="queryBean.zfmjxm" value="${queryBean.zfmjxm}"   readonly="true"
								 ondblclick="selectDwryTree('${log.orgcode }','zfmjjh','zfmjxm','zfmjdwdm','zfmjdwmc')" cssClass="cps-input"></cps:textfield>
							<cps:button value="选择" onclick="selectDwryTree('${log.orgcode }','zfmjjh','zfmjxm','zfmjdwdm','zfmjdwmc')"></cps:button>
					</cps:tdContent>
					
					
					
					<cps:tdLabel width="10%" >走访时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:date id="zfsj_from" name="queryBean.zfsj_from" dateFmt="yyyy-MM-dd"  cssStyle="width:31%;" cssClass="cps-date"></cps:date>
						-
						<cps:date id="zfsj_to" name="queryBean.zfsj_to" dateFmt="yyyy-MM-dd"  cssStyle="width:31%;" cssClass="cps-date"></cps:date>

					</cps:tdContent>	
					</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	

	<cps:tableGrid id="xldquerylist" 
				mutilSelect="true"
				url="/qzgl/zfdwdj/queryZfdwdjBeanList.action" 
				searchform="xldqueryform" >
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="zfdwmc" title="单位名称"></cps:column>
		<cps:column field="zfdwfrxm" title="法人代表"></cps:column>
		<cps:column field="zfsj" title="走访时间" maxlength="10"></cps:column>
		<cps:column field="zfsymc" title="走访事由" maxlength="10"></cps:column>
		<cps:column field="sfjwdcmc" title="调查状态"></cps:column>
		<cps:column field="xxsfssmc" title="信息真伪" maxlength="10"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="czRowCallback"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>