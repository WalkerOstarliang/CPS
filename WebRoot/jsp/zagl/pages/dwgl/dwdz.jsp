<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div style="width: 99%" id="dwdz_div">
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
					<input type="hidden" id="sjxzqhhidden" value="${dw.dwdz.sjxzqh}" />
					<s:select id="sjxzqh" list="cityXzqhList" name="dw.dwdz.sjxzqh"
						listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
						onchange="doubleSelectCountry(this.value,'xjxzqh');return false;"
						cssClass="validate[required] cps-select" ></s:select>
				</cps:tdContent>
				<cps:tdLabel width="10%">
					<font color="red">*</font>县/区：</cps:tdLabel>
				<cps:tdContent width="25%">
					<input type="hidden" id="xjxzqhhidden" value="${dw.dwdz.ssxqdm}" />
					<s:select id="xjxzqh" list="countryXzqhList" name="dw.dwdz.ssxqdm"
						listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
						onchange="doubleSelectJdxz(this.value,'jdxzdm',callbackDzmc)"
						cssClass="validate[required] cps-select" ></s:select>
				</cps:tdContent>
				<cps:tdLabel width="10%">
					<font color="red">*</font>街道/乡镇：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="jdxzdmhidden" value="${dw.dwdz.jdxzdm}" />
					<s:select id="jdxzdm" list="xzjdqhList" name="dw.dwdz.jdxzdm"
						listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
						onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',callbackDzmc)"
						cssClass="validate[required] cps-select" ></s:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>
					<font color="red">*</font>社区/村：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="sqdmhidden" value="${dw.dwdz.sqdm}" />
					<s:select id="sqdm" list="xzjdqhList" name="dw.dwdz.sqdm"
						listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--"
						cssClass="validate[required] cps-select"
						onchange="callbackDzmc()"></s:select>
				</cps:tdContent>
				<cps:tdLabel>街路巷：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="jlxmc" name="dw.dwdz.jlxdm"
						value="${dw.dwdz.jlxdm}"
						onblur="callbackDzmc()"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>门牌号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="mph" name="dw.dwdz.mph" value="${dw.dwdz.mph}" onblur="callbackDzmc()"></cps:textfield>
					<font color="red">(号)</font>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>小区(组)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="xqmc" name="dw.dwdz.xqz" value="${dw.dwdz.xqz}"
						 onblur="callbackDzmc()"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>楼栋号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="ldh" name="dw.dwdz.ldh" value="${dw.dwdz.ldh}"
						 onblur="callbackDzmc()"></cps:textfield>
					<font color="red">(栋)</font>
				</cps:tdContent>
				<cps:tdLabel>单元号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="dyh" name="dw.dwdz.dyh" value="${dw.dwdz.dyh}"
						 onblur="callbackDzmc()"></cps:textfield>
					<font color="red">(单元)</font>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>楼层：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="lc" name="dw.dwdz.lch" value="${dw.dwdz.lch}"
						 onblur="callbackDzmc()"></cps:textfield>
					<font color="red">(楼)</font>
				</cps:tdContent>
				<cps:tdLabel>房间号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fjh" name="dw.dwdz.fjh" value="${dw.dwdz.fjh}"
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
						cssStyle="width:93%" readonly="true"></cps:textfield>
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