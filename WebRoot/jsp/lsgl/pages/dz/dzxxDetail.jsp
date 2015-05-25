<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/lsgl/js/dz.js"></creator:Script>
<creator:tbar id="dztbarpanel">
	<c:if test="${operType!='detail'}">
	<cps:button value="保存" onclick="saveDzBean();"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</c:if>
</creator:tbar>
<creator:panel id="dzpanel" tbarId="dztbarpanel" title="房屋地址信息">
 	<%--地址信息--%>
<form id="dzxxform"  >
	<s:hidden id="dzid" name="dzxx.dzid"></s:hidden>
 	<div style="width: 100%">

			<c:if test="${operType=='add' or operType=='update'}">
					
			<cps:table>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>实体名称：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="stmc" name="dzxx.stmc" value="${dzxx.stmc}" cssStyle="width:93%" cssClass="validate[required]" maxlength="60" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>市：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input type="hidden" id="sjxzqhhidden" value="${dzxx.sjxzqh}"/>
						<s:select id="sjxzqh" list="cityXzqhList" name="dzxx.sjxzqh" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" onchange="doubleSelectCountry(this.value,'xjxzqh');return false;" cssClass="validate[required] cps-select" ></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>县/区：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input type="hidden" id="xjxzqhhidden"  value="${dzxx.ssxqdm}"/>
						<s:select id="xjxzqh" list="countryXzqhList" name="dzxx.ssxqdm"  listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" onchange="doubleSelectJdxz(this.value,'jdxzdm',callbackDzmc)" cssClass="validate[required] cps-select" ></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>街道/乡镇：</cps:tdLabel>
					<cps:tdContent >
						<input type="hidden" id="jdxzdmhidden" value="${dzxx.jdxzdm}"/>
						<s:select id="jdxzdm" list="xzjdqhList" name="dzxx.jdxzdm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',callbackDzmc)" cssClass="validate[required] cps-select" ></s:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>社区/村：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="sqdmhidden" value="${dzxx.sqdm}"/>
						<s:select id="sqdm" list="xzjdqhList" name="dzxx.sqdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="validate[required] cps-select" onchange="callbackDzmc()"></s:select>
					</cps:tdContent>
					<cps:tdLabel>街路巷：</cps:tdLabel>
					<cps:tdContent >
						<input type="hidden" id="jlxdm" name="dzxx.jlxdm" value="${dzxx.jlxdm}">
						<cps:textfield id="jlxmc" name="dzxx.jlxmc" value="${dzxx.jlxmc}"  onblur="callbackDzmc()"  ondblclick="openJlxSelectWinxx('jlxdm','jlxmc');" readonly="true"></cps:textfield>
						<cps:button value="选择" onclick="openJlxSelectWinxx('jlxdm','jlxmc');"></cps:button>
					</cps:tdContent>
					
					<cps:tdLabel>门牌号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="mph" name="dzxx.mph" value="${dzxx.mph}" onblur="callbackDzmc()"></cps:textfield><font color="red">(号)</font>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>小区(组)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xqmc" name="dzxx.xqz" value="${dzxx.xqz}" onblur="callbackDzmc()"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>楼栋号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="ldh" name="dzxx.ldh" value="${dzxx.ldh}"  onblur="callbackDzmc()"></cps:textfield><font color="red">(栋)</font>
					</cps:tdContent>
					<cps:tdLabel>单元号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="dyh" name="dzxx.dyh" value="${dzxx.dyh}" onblur="callbackDzmc()"></cps:textfield><font color="red">(单元)</font>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>楼层：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="lc" name="dzxx.lch" value="${dzxx.lch}" onblur="callbackDzmc()"></cps:textfield><font color="red">(楼)</font>
					</cps:tdContent>
					<cps:tdLabel>房间号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="fjh" name="dzxx.fjh" value="${dzxx.fjh}" onblur="callbackDzmc()"></cps:textfield><font color="red">(室)</font>
					</cps:tdContent>
					<cps:tdLabel></cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>合并地址：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="dzmc" name="dzxx.dzmc" value="${dzxx.dzmc}" cssStyle="width:93%" cssClass="validate[required]" readonly="true"></cps:textfield>
					</cps:tdContent>
					<input  type="hidden" id="dzdjrxm" name="dzxx.djrxm"  value="${loginInfo.realname }"/>
					<input  type="hidden" id="dzdjrdwdm" name="dzxx.djrdwdm"  value="${loginInfo.orgcode}"/>
					<input  type="hidden" id="dzdjrdwmc" name="dzxx.djrdwmc"  value="${loginInfo.orgname }" />
				</cps:row>
				<cps:row>
					<cps:tdLabel>经纬度：</cps:tdLabel>
					<cps:tdContent colspan="5">
						经纬度：（<cps:textfield name="dzxx.dzjd" value="${dzxx.dzjd}" inputType="number" readonly="true"  cssStyle="width:15%"></cps:textfield><cps:textfield name="dzxx.dzwd" value="${dzxx.dzwd}"  inputType="number" readonly="true" cssStyle="width:15%"></cps:textfield>）
						坐标：（<cps:textfield name="dzxx.dzxzb" value="${dzxx.dzxzb}" readonly="true" cssStyle="width:15%"></cps:textfield><cps:textfield name="dzxx.dzyzb" value="${dzxx.dzyzb}" readonly="true" cssStyle="width:15%"></cps:textfield>）
						<cps:button value="定位" onclick="alert('该功能未开发');"></cps:button>
					</cps:tdContent>
				</cps:row> 
			</cps:table>
			</c:if>
			<c:if test="${operType=='detail'}">
				<cps:table>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>实体名称：</cps:tdLabel>
					<cps:tdContent colspan="5">
						${dzxx.stmc}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>市：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input type="hidden" id="sjxzqhhidden" value="${dzxx.sjxzqh}"/>
						<s:select id="sjxzqh" list="cityXzqhList" name="dzxx.sjxzqh" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" onchange="doubleSelectCountry(this.value,'xjxzqh');return false;" cssClass="validate[required] cps-select" disabled="true" ></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>县/区：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input type="hidden" id="xjxzqhhidden"  value="${dzxx.ssxqdm}"/>
						<s:select id="xjxzqh" list="countryXzqhList" name="dzxx.ssxqdm"  listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" onchange="doubleSelectJdxz(this.value,'jdxzdm',callbackDzmc)" cssClass="validate[required] cps-select" disabled="true" ></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>街道/乡镇：</cps:tdLabel>
					<cps:tdContent >
						<input type="hidden" id="jdxzdmhidden" value="${dzxx.jdxzdm}"/>
						<s:select id="jdxzdm" list="xzjdqhList" name="dzxx.jdxzdm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',callbackDzmc)" cssClass="validate[required] cps-select"  disabled="true"></s:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>社区/村：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="sqdmhidden" value="${dzxx.sqdm}"/>
						<s:select id="sqdm" list="xzjdqhList" name="dzxx.sqdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="validate[required] cps-select" onchange="callbackDzmc()" disabled="true"></s:select>
					</cps:tdContent>
					<cps:tdLabel>街路巷：</cps:tdLabel>
					<cps:tdContent >
						<input type="hidden" id="jlxdm" name="dzxx.jlxdm" value="${dzxx.jlxdm}">
						${dzxx.jlxmc}
					</cps:tdContent>	
					<cps:tdLabel>门牌号：</cps:tdLabel>
					<cps:tdContent>
						${dzxx.mph}<font color="red">(号)</font>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>小区(组)：</cps:tdLabel>
					<cps:tdContent>
						${dzxx.xqz}
					</cps:tdContent>
					<cps:tdLabel>楼栋号：</cps:tdLabel>
					<cps:tdContent>
						${dzxx.ldh}<font color="red">(栋)</font>
					</cps:tdContent>
					<cps:tdLabel>单元号：</cps:tdLabel>
					<cps:tdContent>
						${dzxx.dyh}<font color="red">(单元)</font>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>楼层：</cps:tdLabel>
					<cps:tdContent>
						${dzxx.lch}<font color="red">(楼)</font>
					</cps:tdContent>
					<cps:tdLabel>房间号：</cps:tdLabel>
					<cps:tdContent>
						${dzxx.fjh}<font color="red">(室)</font>
					</cps:tdContent>
					<cps:tdLabel></cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>合并地址：</cps:tdLabel>
					<cps:tdContent colspan="5">
						${dzxx.dzmc}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>经纬度：</cps:tdLabel>
					<cps:tdContent colspan="5">
						经纬度：（${dzxx.dzjd},${dzxx.dzwd}）
						坐标：（${dzxx.dzxzb},${dzxx.dzyzb}）
					</cps:tdContent>
				</cps:row> 
			</cps:table>
			</c:if>
		</div>
	</form>
 	</creator:panel>
 	<creator:panel id="mappanel">
 		<iframe id="MainMap" height=600px width=800px scrolling="no" frameborder="0" src="http://10.143.1.122:91/Map_Entity/index.jsp"></iframe>
 	</creator:panel>
</creator:view>
