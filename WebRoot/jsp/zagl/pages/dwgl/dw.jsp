<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<creator:view>
	<creator:Script src="/jsp/zagl/js/dw.js"></creator:Script>
	<creator:tbar id="operBar">
		<c:if test="${!(dw.opertype eq 'detail')}">
			<cps:button value="保存" onclick="save('dwform')"></cps:button>
		</c:if>
		<cps:button value="关闭" onclick="window.close();"></cps:button>
	</creator:tbar>
	<form id="dwform" action="${contextPath}/zagl/dw/saveDw.action"
		method="post">
		<creator:panel id="tzhyxx" title="${dwcx.hylbmc}" tbarId="operBar">
			<input type="hidden" name="modename" value="${dwcx.hylbmc}" />
			<input type="hidden" name="opertype" value="${dw.opertype}" />

			<input type="hidden" id="opertype" name="dw.opertype"
				value="${dw.opertype}" />
			<div style="width: 99%" id="dwdz_div">
				<div style="width: 86%; float: left;">
					<fieldset>
						<legend>
							单位地址信息
						</legend>
						<s:hidden id="dzid" name="dw.dwdz.dzid"></s:hidden>
						<s:hidden id="dzbm" name="dw.dwdz.dzbm"></s:hidden>
						<cps:table>
							<cps:row>
								<cps:tdLabel width="10%">
									<font color="red">*</font>市：</cps:tdLabel>
								<cps:tdContent width="25%">
									<input type="hidden" id="sjxzqhhidden"
										value="${dw.dwdz.sjxzqh}" />
									<s:select id="sjxzqh" list="cityXzqhList" name="dw.dwdz.sjxzqh"
										listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
										onchange="doubleSelectCountry(this.value,'xjxzqh');return false;"
										cssClass="validate[required] cps-select" cssStyle="width:95%"></s:select>
								</cps:tdContent>
								<cps:tdLabel width="10%">
									<font color="red">*</font>县/区：</cps:tdLabel>
								<cps:tdContent width="25%">
									<input type="hidden" id="xjxzqhhidden"
										value="${dw.dwdz.ssxqdm}" />
									<s:select id="xjxzqh" list="countryXzqhList"
										name="dw.dwdz.ssxqdm" listKey="dm" listValue="mc" headerKey=""
										headerValue="--请选择--"
										onchange="doubleSelectJdxz(this.value,'jdxzdm',callbackDzmc)"
										cssClass="validate[required] cps-select" cssStyle="width:95%"></s:select>
								</cps:tdContent>
								<cps:tdLabel width="10%">
									<font color="red">*</font>街道/乡镇：</cps:tdLabel>
								<cps:tdContent>
									<input type="hidden" id="jdxzdmhidden"
										value="${dw.dwdz.jdxzdm}" />
									<s:select id="jdxzdm" list="xzjdqhList" name="dw.dwdz.jdxzdm"
										listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
										onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',callbackDzmc)"
										cssClass="validate[required] cps-select" cssStyle="width:95%"></s:select>
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>
									<font color="red">*</font>社区/村：</cps:tdLabel>
								<cps:tdContent>
									<input type="hidden" id="sqdmhidden" value="${dw.dwdz.sqdm}" />
									<s:select id="sqdm" list="xzjdqhList" name="dw.dwdz.sqdm"
										listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="validate[required] cps-select" cssStyle="width:95%"
										onchange="callbackDzmc()"></s:select>
								</cps:tdContent>
								<cps:tdLabel>街路巷：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="jlxmc" name="dw.dwdz.jlxdm"
										value="${dw.dwdz.jlxdm}" cssStyle="width:95%"
										onblur="callbackDzmc()"></cps:textfield>
								</cps:tdContent>
								<cps:tdLabel>门牌号：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="mph" name="dw.dwdz.mph"
										value="${dw.dwdz.mph}" cssStyle="width:65%"
										onblur="callbackDzmc()"></cps:textfield>
									<font color="red">(号)</font>
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>小区(组)：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="xqmc" name="dw.dwdz.xqz"
										value="${dw.dwdz.xqz}" cssStyle="width:95%"
										onblur="callbackDzmc()"></cps:textfield>
								</cps:tdContent>
								<cps:tdLabel>楼栋号：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="ldh" name="dw.dwdz.ldh"
										value="${dw.dwdz.ldh}" cssStyle="width:75%"
										onblur="callbackDzmc()"></cps:textfield>
									<font color="red">(栋)</font>
								</cps:tdContent>
								<cps:tdLabel>单元号：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="dyh" name="dw.dwdz.dyh"
										value="${dw.dwdz.dyh}" cssStyle="width:65%"
										onblur="callbackDzmc()"></cps:textfield>
									<font color="red">(单元)</font>
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>楼层：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="lc" name="dw.dwdz.lch"
										value="${dw.dwdz.lch}" cssStyle="width:75%"
										onblur="callbackDzmc()"></cps:textfield>
									<font color="red">(楼)</font>
								</cps:tdContent>
								<cps:tdLabel>房间号：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="fjh" name="dw.dwdz.fjh"
										value="${dw.dwdz.fjh}" cssStyle="width:75%"
										onblur="callbackDzmc()"></cps:textfield>
									<font color="red">(室)</font>
								</cps:tdContent>
								<cps:tdLabel></cps:tdLabel>
								<cps:tdContent>
									&nbsp;
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>
									<font color="red">*</font>合并地址：</cps:tdLabel>
								<cps:tdContent colspan="5">
									<cps:textfield id="dzmc" name="dw.dwdz.dzmc"
										value="${dw.dwdz.dzmc}" cssClass="validate[required]"
										cssStyle="width:90%" readonly="true"></cps:textfield>
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>经纬度：</cps:tdLabel>
								<cps:tdContent colspan="5">
									经纬度：（<cps:textfield name="dw.dwdz.dzjd" value="${dw.dwdz.dzjd}"
										inputType="number" readonly="true" cssStyle="width:15%"></cps:textfield>
									<cps:textfield name="dw.dwdz.dzwd" value="${dw.dwdz.dzwd}"
										inputType="number" readonly="true" cssStyle="width:15%"></cps:textfield>）
									坐标：（<cps:textfield name="dw.dwdz.dzxzb"
										value="${dw.dwdz.dzxzb}" readonly="true" cssStyle="width:15%"></cps:textfield>
									<cps:textfield name="dw.dwdz.dzyzb" value="${dw.dwdz.dzyzb}"
										readonly="true" cssStyle="width:15%"></cps:textfield>）
									<cps:button value="定位" onclick="callPgisDw()"></cps:button>
								</cps:tdContent>

							</cps:row>
						</cps:table>
					</fieldset>
				</div>

				<div style="width: 13%; float: right;">
					<fieldset>
						<legend>
							单位照片信息
						</legend>
						<creator:imageSwitch id="imageswitch">
							<c:forEach items="${dw.dwzpList}" var="zp" varStatus="st">
								<img
									src="<c:url value='/zagl/dw.dwjbxx/showDwzp.action'/>?zpId=${zp.id}"
									width="120px" height="100px" />
							</c:forEach>
						</creator:imageSwitch>
						<div>
							<cps:button value="上传照片" onclick="openFileUploadWin()"></cps:button>
						</div>
					</fieldset>
				</div>
			</div>
		</creator:panel>
		<cps:tabPanel id="dwTab" width="100%" height="auto">
			<cps:tabItem id="dw.dwjbxx" title="单位基本信息" display="true">
				<%@include file="/jsp/zagl/pages/dwgl/dwjbxx.jsp"%>
			</cps:tabItem>

			<c:if test="${hylb eq '01'}">
				<cps:tabItem id="tzhy" title="特种行业">
					<%@include file="/jsp/zagl/pages/dwgl/tzhy.jsp" %>
				</cps:tabItem>
			</c:if>
			
			<c:if test="${hylb eq '02'}">
				<cps:tabItem id="ggcs" title="公共场所">
					<%@include file="/jsp/zagl/pages/dwgl/ggcs.jsp" %>
				</cps:tabItem>
			</c:if>
			
			<c:if test="${hylb eq '03'}">
				<cps:tabItem id="nbdw" title="内保单位">
					<%@include file="/jsp/zagl/pages/dwgl/nbdw.jsp" %>
				</cps:tabItem>
			</c:if>
			
			<c:if test="${hylb eq '05'}">
				<cps:tabItem id="swfwcs" title="上网服务场所">
					<%@include file="/jsp/zagl/pages/dwgl/swfwcs.jsp" %>
				</cps:tabItem>
			</c:if>
		</cps:tabPanel>
	</form>
</creator:view>
