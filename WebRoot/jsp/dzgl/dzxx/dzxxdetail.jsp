<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/dzgl/js/dz.js"></creator:Script>
<script type="text/javascript">
	var operType = "${operType}";
	$(function(){
		var sjxzqh = $("#sjxzqh").attr("initValue");
		var xzqh = $("#xzqh").attr("initValue");
		var jdxz = $("#jdxzdm").attr("initValue");
		var sqdm = $("#sqdm").attr("initValue");
		if (sjxzqh != null && sjxzqh != "")
		{
			doubleSelectCountry(sjxzqh,'xzqh',callbackDzmc,xzqh);
		}
		if (xzqh != null && xzqh != "")
		{
			doubleSelectJdxz(xzqh,'jdxzdm',callbackDzmc,jdxz)
		}
		if (jdxz != null && jdxz != "")
		{
			doubleSelectSqByJdxzdm(jdxz,'sqdm',callbackDzmc,sqdm);
		}
		var docheight = $(document).height();
		var pheight = $("#dzpanel").height();
		$("#MainMap").height(docheight - pheight - 40);
	});
</script>
<creator:tbar id="dztbarpanel">
	<cps:button value="保存" onclick="saveDzBean()"></cps:button>
	<cps:button value="新增房屋"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="dzpanel" tbarId="dztbarpanel" title="地址信息">
	<%--地址信息--%>
	<form id="dzxxform">
		<input type="hidden" id="dzid" name="dzxxBean.dzid" value="${dzxxBean.dzid}"/>
		<input type="hidden" id="stid" name="stxxBean.id" value="${stxxBean.id}"/>
		<input type="hidden" id="stbm" name="stxxBean.stbm" value="${stxxBean.stbm}"/>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%">实体名称：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="stmc" name="stxxBean.stmc" value="${stxxBean.stmc}" required="true" cssStyle="width:93%" maxlength="60" readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%"><font color="red">*</font>市：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="sjxzqh" list="${cityXzqhList}" name="stxxBean.sjxzqh" value="${stxxBean.sjxzqh}" listKey="dm" listValue="mc" disabled="true" headerKey="" headerValue=" " onchange="doubleSelectCountry(this.value,'xzqh');return false;"></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>县/区：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="xzqh" list="${countryXzqhList}" name="stxxBean.xzqh" value="${stxxBean.xzqh}" listKey="dm" listValue="mc" disabled="true" headerKey="" headerValue=" " onchange="doubleSelectJdxz(this.value,'jdxzdm',callbackDzmc)"></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>街道/乡镇：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="jdxzdm" list="${xzjdqhList}"  name="stxxBean.jdxzdm" value="${stxxBean.jdxzdm}" listKey="dm" listValue="mc" disabled="true" headerKey="" headerValue=" " onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',callbackDzmc)" ></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>社区/村：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="sqdm" list="${xzjdqhList}" name="stxxBean.sqdm" value="${stxxBean.sqdm}" listKey="dm" listValue="mc" disabled="true" headerKey="" headerValue=" " onchange="callbackDzmc()" ></cps:select>
				</cps:tdContent>
				<cps:tdLabel>街路巷：</cps:tdLabel>
				<cps:tdContent >
					<input type="hidden" id="jlxdm" name="stxxBean.jlxdm" value="${stxxBean.jlxdm}">
					<cps:textfield id="jlxmc" name="stxxBean.jlxmc" value="${stxxBean.jlxmc}" disabled="true"  onblur="callbackDzmc()"  ondblclick="openJlxSelectWinxx('jlxdm','jlxmc');" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>门牌号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="mph" name="stxxBean.mph" value="${stxxBean.mph}" disabled="true" onblur="callbackDzmc()"></cps:textfield><font color="black">(号)</font>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>小区(组)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="xqmc" name="stxxBean.xqz" value="${stxxBean.xqz}" disabled="true" onblur="callbackDzmc()"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>楼栋详址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="ldxz" name="stxxBean.ldxz" value="${stxxBean.ldxz}" disabled="true" onblur="callbackDzmc()"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>单元号：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_DYH" id="dyh" name="dzxxBean.dyh" value="${dzxxBean.dyh}" headerKey="" headerValue=" " onchange="callbackDzmc()"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>楼层号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="lch" name="dzxxBean.lch" value="${dzxxBean.lch}" maxlength="10" cssStyle="width:40%" onblur="callbackDzmc()"></cps:textfield>
					<cps:select zdlb="ZDY_LCHZ" id="lchz" name="dzxxBean.lchz" value="${dzxxBean.lchz}" cssStyle="width:70px" onchange="callbackDzmc()"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>房间：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fjh" name="dzxxBean.fjh" value="${dzxxBean.fjh}" inputType="integer" maxlength="10" cssStyle="width:40%" onblur="callbackDzmc()"></cps:textfield>
					<cps:select zdlb="ZDY_SHHZ" id="shhz" name="dzxxBean.shhz" value="${dzxxBean.shhz}" cssStyle="width:70px" onchange="callbackDzmc()"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>附属地址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fsdz" name="dzxxBean.fsdz" value="${dzxxBean.fsdz}" maxlength="100" onblur="callbackDzmc()"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>合并地址：</cps:tdLabel>
				<cps:tdContent colspan="3">
					 <cps:textfield id="dzmc" readonly="true" cssStyle="width:88%"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>经纬度：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dzxxBean.x" value="${stxxBean.x}" readonly="true" inputType="number" cssStyle="width:32%"></cps:textfield>
					<cps:textfield name="dzxxBean.y" value="${stxxBean.y}" readonly="true" inputType="number" cssStyle="width:32%"></cps:textfield>
				</cps:tdContent>
			</cps:row> 
		</cps:table>
	</form>
</creator:panel>
<creator:panel id="mappanel" height="auto" title="地图标注">
	<iframe id="MainMap" src="${pgisiframeurl}" width="100%" scrolling="no" frameborder="0" ></iframe>
</creator:panel>
</creator:view>
