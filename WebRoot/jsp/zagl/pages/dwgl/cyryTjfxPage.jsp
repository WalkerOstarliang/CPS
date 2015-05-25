<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view title="从业人员统计分析">
	<creator:Script src="/jsp/zagl/js/cyrytjfx.js"></creator:Script>
	<creator:box>
	<!-- 从业人员信息 -->
		<creator:panel id="search" title="从业人员统计条件" tbarId="cyryquerytbar">
			<form id="queryCyrytjForm">
				<input type="hidden" name="cyrycx.sfabry" value="${cyrycx.sfabry}" />
				<input type="hidden" name="cyrycx.zwlb" value="${cyrycx.zwlb}" />
			
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="cyrycx.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="cyrycx.citygajgjgdm" value="${cyrycx.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="cyrycx.citygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">县区局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										name="cyrycx.countrygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="cyrycx.countrygajgjgdm" value="${cyrycx.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="cyrycx.countrygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList" name="cyrycx.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')"
										listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="cyrycx.pcsdm" value="${cyrycx.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList" name="cyrycx.pcsdm"
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
										<s:select list="jwsqOrgList" id="jwsselect" name="cyrycx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--"  cssClass="cps-select" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="cyrycx.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="cyrycx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel>证件号码：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="cyrycx.zjhm"/>
						</cps:tdContent>
						<cps:tdLabel>数据来源：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="sfjwtdj" name="cyrycx.sfjwtdj" zdlb="ZA_SJLY" headerValue="--所有数据--"></cps:select>
						</cps:tdContent>
					</cps:row>					
					<cps:row>
						<cps:tdLabel width="10%">中文姓名：</cps:tdLabel>
						<cps:tdContent width="15%">
							<cps:textfield name="cyrycx.xm" />
						</cps:tdContent>
						
						<cps:tdLabel width="10%">英文姓：</cps:tdLabel>
						<cps:tdContent width="15%">
							<cps:textfield name="cyrycx.ywx" />
						</cps:tdContent>
						<cps:tdLabel width="10%">英文名：</cps:tdLabel>
						<cps:tdContent width="15%">
							<cps:textfield name="cyrycx.ywm" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>单位名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="cyrycx.jgmc" />
						</cps:tdContent>
						 <cps:tdLabel>登记时间</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="cyrycx.djsj_start" dateFmt="yyyy-MM-dd" cssStyle="width:40%" value="${cyrycx.djsj_start}"/>
							至 
							<cps:date name="cyrycx.djsj_end" dateFmt="yyyy-MM-dd" cssStyle="width:40%" value="${cyrycx.djsj_end}"/>
						</cps:tdContent>
						<cps:tdLabel>是否注销：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="zxbs" name="cyrycx.zxbs" zdlb="ZDY_ZXBS" headerKey="" headerValue=" " value="0" ></cps:select>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<creator:tbar id="cyrytjquerytbar">
			<cps:button id="cyrytjQueryButton" value="统计" onclick="queryCyrytj()"></cps:button>
			<cps:button value="导出" onclick="toExportExcelCyrytj()"></cps:button>
		</creator:tbar>
		<creator:panel id="jgpanel" title="统计结果" tbarId="cyrytjquerytbar">
			<input type="hidden" id="snum" name="snum" value="0"/>
			<div id="tjjgdiv" class="cps-panel-content" style="width: 99.8%;">
				
			</div>
		</creator:panel>
		
	</creator:box>
	<div style="display:none">
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
</creator:view>