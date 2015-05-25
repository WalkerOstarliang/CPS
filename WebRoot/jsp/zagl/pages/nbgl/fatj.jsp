<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询"></cps:button>
		</cps:tbar>

		<cps:panel title="统计条件">
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
								<input type="hidden" name="dwcx.citygajgjgdm"
									value="${dwcx.citygajgjgdm}" />
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
								<input type="hidden" name="dwcx.countrygajgjgdm"
									value="${dwcx.countrygajgjgdm}" />
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
								<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm"
									onchange="doubleSelectJWS(this.value,'jwsselect')" listKey="dm"
									listValue="jc" headerKey="" headerValue="--请选择--"
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
								<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm"
									listKey="orgcode" listValue="orgjc" headerKey=""
									headerValue=" " cssClass="cps-select"
									onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="dwcx.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm"
									listKey="orgcode" listValue="orgjc" headerKey=""
									headerValue=" " cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">社区：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="sqdm" list="sqJbxxList" name="dwcx.sqdm"
							listKey="sqbh" listValue="jc" headerKey="" headerValue=" "
							cssClass="cps-select"></s:select>
					</cps:tdContent>
					<cps:tdLabel>重点级别：</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="dwcx.zdjb" zdlb="ZAGL_ZDDJ" headerKey=""
							headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>

				<cps:row>
					<cps:tdLabel>统计时间：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:date dateFmt="yyyy-MM-dd" cssStyle="width:180px;"></cps:date>&nbsp;至&nbsp;
						<cps:date dateFmt="yyyy-MM-dd" cssStyle="width:180px;"></cps:date>
					</cps:tdContent>
					
					<cps:tdLabel>损失财产：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:panel>
	</cps:PanelView>
	
	<cps:panel title="统计结果">
		<cps:table>
			<cps:row>
				<cps:tdLabel cssStyle="text-align:center;" rowspan="2">单位</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="3">发案</cps:tdLabel>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="text-align:center;">本期</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">环比</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">同比</cps:tdLabel>
			</cps:row>
			
			<cps:row>
				<cps:tdContent>望城区局</cps:tdContent>
				<cps:tdContent>31</cps:tdContent>
				<cps:tdContent>83%</cps:tdContent>
				<cps:tdContent>26%</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent>高新分局</cps:tdContent>
				<cps:tdContent>16</cps:tdContent>
				<cps:tdContent>24%</cps:tdContent>
				<cps:tdContent>13%</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent>宁乡县局</cps:tdContent>
				<cps:tdContent>85</cps:tdContent>
				<cps:tdContent>120%</cps:tdContent>
				<cps:tdContent>103%</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent>雨花分局</cps:tdContent>
				<cps:tdContent>96</cps:tdContent>
				<cps:tdContent>134%</cps:tdContent>
				<cps:tdContent>175%</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent>芙蓉分局</cps:tdContent>
				<cps:tdContent>66</cps:tdContent>
				<cps:tdContent>68%</cps:tdContent>
				<cps:tdContent>45%</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent>岳麓分局</cps:tdContent>
				<cps:tdContent>90</cps:tdContent>
				<cps:tdContent>106%</cps:tdContent>
				<cps:tdContent>130%</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent>开福分局</cps:tdContent>
				<cps:tdContent>66</cps:tdContent>
				<cps:tdContent>13%</cps:tdContent>
				<cps:tdContent>6%</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent>长沙县局</cps:tdContent>
				<cps:tdContent>65</cps:tdContent>
				<cps:tdContent>46%</cps:tdContent>
				<cps:tdContent>36%</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent>浏阳市局</cps:tdContent>
				<cps:tdContent>79</cps:tdContent>
				<cps:tdContent>48%</cps:tdContent>
				<cps:tdContent>87%</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent>天心分局</cps:tdContent>
				<cps:tdContent>62</cps:tdContent>
				<cps:tdContent>86%</cps:tdContent>
				<cps:tdContent>55%</cps:tdContent>
			</cps:row>
		</cps:table>
	</cps:panel>

</creator:view>