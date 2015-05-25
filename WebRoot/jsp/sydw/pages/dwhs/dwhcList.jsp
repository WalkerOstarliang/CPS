<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<!-- 单位通用查询页面 -->
	<creator:box>
		<creator:Script src="/jsp/sydw/js/dwhclist.js"></creator:Script>
		<creator:tbar id="dwlisttbar">
			<cps:button value="查询" type="button" onclick="query()"></cps:button>
			<cps:button value="单位核签" onclick="opernDwhcWin()"></cps:button>
		</creator:tbar>
		<creator:panel id="cxtj" title="查询条件" tbarId="dwlisttbar">
			<form id="dwcxform">
				<input type="hidden" name="dwcx.glbm" value="${dwcx.glbm}"  id="glbm"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="dwcx.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.citygajgjgdm" value="${dwcx.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="dwcx.citygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="11%">县区局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										name="dwcx.countrygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.countrygajgjgdm" value="${dwcx.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="dwcx.countrygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="11%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')"
										listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.pcsdm" value="${dwcx.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm"
										disabled="true" listKey="dm" listValue="jc" headerKey=""
										headerValue="--请选择--" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
								<c:choose>
									<c:when test="${empty loginInfo.jwsqdm}">
										<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="dwcx.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="dwcx.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel>实体名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.stmc"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">单位属性：</cps:tdLabel>
						<cps:tdContent width="21%">
							<s:if test="dwcx.hylb != null">
								<cps:select headerValue="--请选择--" headerKey="" zdlb="ZDY_HYLB"
									disabled="true" value="${dwcx.hylb}" />
								<input type="hidden" name="dwcx.hylb" value="${dwcx.hylb}" />
							</s:if>
							<s:else>
								<cps:select headerValue="--请选择--" headerKey="" zdlb="ZDY_HYLB" name="dwcx.hylb" value="${dwcx.hylb}"/>
							</s:else>
						</cps:tdContent>
						<cps:tdLabel width="12%">组织机构代码：</cps:tdLabel>
						<cps:tdContent width="21%">
							<cps:textfield name="dwcx.dwdm"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>营业执照号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.yyzzh"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">单位名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.dwmc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>法人代表：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.frdb"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>法人身份证：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.frsfzhm" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date id="djsjstart" dateFmt="yyyy-MM-dd" name="dwcx.djsjstart" cssStyle="width:39%" maxDate="${currentSystemDate}"/> -
								<cps:date id="djsjend" dateFmt="yyyy-MM-dd" name="dwcx.djsjend" minDateDepend="djsjstart" cssStyle="width:39%" maxDate="${currentSystemDate}"/>
							</cps:tdContent>
							<cps:tdLabel>单位类别：</cps:tdLabel>
							<cps:tdContent>
								<cps:select zdlb="JG_DWLB" name="dwcx.dwlb" optgroup="true" headerKey="" headerValue=" "></cps:select>
							</cps:tdContent>
							<cps:tdLabel>是否注销：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="zxbs" name="dwcx.zxbs" zdlb="ZDY_ZXBS" headerKey="" headerValue=" " value="0" ></cps:select>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
			</form>
		</creator:panel>

		<cps:tableGrid url="/zagl/dw/queryDwjbxxPageResultInfoByJgbh.action" title="单位列表"
				id="cxjgList" autoload="false" pageSize="10" width="99.8%"
				usepager="true" searchform="dwcxform" autothead="false" mutilSelect="false">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true" expand="false"></cps:column>
				<cps:column title="单位名称" field="dwmc" align="left"  maxlength="15"></cps:column>
				<cps:column title="单位属性" field="hylbmc" align="left" maxlength="10"></cps:column>
				<cps:column title="法人代表" field="frdb" align="left"></cps:column>
				<cps:column title="法人身份证" field="frsfzhm" ></cps:column>
				<cps:column title="单位地址" field="dwdz" align="left"></cps:column>
				<cps:column title="登记时间" field="djsj" align="left"></cps:column>
				<cps:column title="注销标识" field="zxbsmc" align="left" ></cps:column>
		</cps:tableGrid>
	</creator:box>
	<div style="display:none">
		<form id="exportform" target="exportiframe" method="post">
			<input type="hidden" id="jgbhs" name="jgbhs"/>
		</form>
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
</creator:view>

