<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/dzgl/js/dz.js"></creator:Script>
<creator:Script src="/jsp/dzgl/js/gis.js"></creator:Script>
<script type="text/javascript">
	var operType = "${operType}";
	MapServicesUrl = "${mapServicesUrl}";
	
	function callbackSqSelect()
	{
		//callbackDzmc();
		autoMapDw();
	}
	
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
	<cps:button value="保存" onclick="saveStxxBean()"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="dzpanel" tbarId="dztbarpanel" title="实体信息">
	<input type="hidden" id="djdwdm" value="${loginInfo.orgcode }">
	<input type="hidden" id="djdwmc" value="${loginInfo.orgname }">
	<input type="hidden" id="operType" value="${operType}">
	
	<%--地址信息--%>
	<form id="stxxform">
		<input type="hidden" id="stid" name="stxxBean.id" value="${stxxBean.id}"/>
		<input type="hidden" id="stbm" name="stxxBean.stbm" value="${stxxBean.stbm}"/>
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>实体名称：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield id="stmc" name="stxxBean.stmc" value="${stxxBean.stmc}" required="true" cssStyle="width:88%" maxlength="60" readonly="${operType=='update' ? false : true}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>实体分类：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="stfl" name="stxxBean.stfl" zdlb="ZDY_STFL" value="${stxxBean.stfl}" required="true" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%"><font color="red">*</font>市：</cps:tdLabel>
				<cps:tdContent width="25%">
					<input type="hidden" name = "stxxBean.sjxzqh" value="${stxxBean.sjxzqh}" />
					<cps:select id="sjxzqh" list="${cityXzqhList}"  value="${stxxBean.sjxzqh}" listKey="dm" listValue="mc" headerKey="" headerValue=" " onchange="doubleSelectCountry(this.value,'xzqh');return false;" disabled="true" ></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>县/区：</cps:tdLabel>
				<cps:tdContent width="25%">
					<input type="hidden" name="stxxBean.xzqh" value="${stxxBean.xzqh}" />
					<cps:select id="xzqh" list="${countryXzqhList}" value="${stxxBean.xzqh}" listKey="dm" listValue="mc" headerKey="" headerValue=" " onchange="doubleSelectJdxz(this.value,'jdxzdm',callbackDzmc)" disabled="true" ></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>街道/乡镇：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="jdxzdm" list="${xzjdqhList}"  name="stxxBean.jdxzdm" value="${stxxBean.jdxzdm}" listKey="dm" listValue="mc" headerKey="" headerValue=" " onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',callbackDzmc)" ></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>社区/村：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="sqdm" list="${sqJbxxList}"  name="stxxBean.sqdm" value="${stxxBean.sqdm}" required="true" listKey="dm" listValue="mc" headerKey="" headerValue=" " onchange="callbackDzmc();" ></cps:select>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>街路巷：</cps:tdLabel>
				<cps:tdContent >
					<input type="hidden" id="jlxdm" name="stxxBean.jlxdm" value="${stxxBean.jlxdm}">
					<cps:textfield id="jlxmc" name="stxxBean.jlxmc" value="${stxxBean.jlxmc}"  onblur="callbackDzmc()" appendPopuBtn="true"  onclick="openJlxSelectWinxx('jlxdm','jlxmc');" readonly="true" required="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>门牌号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="mph" name="stxxBean.mph" value="${stxxBean.mph}" onblur="callbackDzmc()" inputType="Integer"></cps:textfield><font color="black">(号)</font>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>小区(组)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="xqmc" name="stxxBean.xqz" value="${stxxBean.xqz}" onblur="callbackDzmc()"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>楼栋详址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="ldxz" name="stxxBean.ldxz" value="${stxxBean.ldxz}"  onblur="callbackDzmc()"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>消防等级：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZAGL_XFDJ" id="xfdj" name="stxxBean.xfdj" value="${stxxBean.xfdj}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>地上层数：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="dmcs" name="stxxBean.dmcs" inputType="integer" required="true" maxlength="3"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>地下层数：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="dxcs" name="stxxBean.dxcs" value="${stxxBean.dxcs}" inputType="integer" maxlength="2"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>建筑结构：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_JZJG" id="jzjg" name="stxxBean.jzjg" value="${stxxBean.jzjg}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>开发商：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="kfs" name="stxxBean.kfs" value="${stxxBean.kfs}" maxlength="50"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>物业单位：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="wygldw" name="stxxBean.wygldw" value="${stxxBean.wygldw}" maxlength="50"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>治保单位：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zbdw" name="stxxBean.zbdw" value="${stxxBean.zbdw}" maxlength="50"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>合并地址：</cps:tdLabel>
				<cps:tdContent colspan="5">
					 <cps:textfield id="dzmc" readonly="true" cssStyle="width:93%"></cps:textfield>
				</cps:tdContent>
			</cps:row> 
			<cps:row>
				<cps:tdLabel>经纬度：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="xzb" name="stxxBean.x" value="${stxxBean.x}" readonly="true" inputType="number" cssStyle="width:15%"></cps:textfield>
					<cps:textfield id="yzb" name="stxxBean.y" value="${stxxBean.y}" readonly="true" inputType="number" cssStyle="width:15%"></cps:textfield>
					<cps:button value="地图标注" onclick="mapBjdw()"></cps:button>
					<cps:button value="获取坐标" onclick="getYX()"></cps:button>
					<cps:button value="显示位置" onclick="callbackSqSelect()"></cps:button>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>登记人：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty stxxBean.djrjh}">
							<input type="hidden" id="djrjh" name="stxxBean.djrjh" value="${loginInfo.username}">
				   			<cps:textfield id="djrxm" name="stxxBean.djrxm"  value="${loginInfo.realname}"></cps:textfield>
						</c:when>
						<c:otherwise>
							 <input type="hidden" id="djrjh" name="stxxBean.djrjh" value="${stxxBean.djrjh}">
				   			 <cps:textfield id="djrxm" name="stxxBean.djrxm"  value="${stxxBean.djrxm}"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty stxxBean.djdwdm}">
							<input type="hidden" id="djdwdm" name="stxxBean.djdwdm" value="${loginInfo.orgcode}">
				   			<cps:textfield id="djdwmc" name="stxxBean.djdwmc"  value="${loginInfo.orgname}"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="djdwdm" name="stxxBean.djdwdm" value="${stxxBean.djdwdm}">
				   			<cps:textfield id="djdwmc" name="stxxBean.djdwmc"  value="${stxxBean.djdwmc}"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
				    <cps:date id="djsj" name="stxxBean.djsj"  value="${stxxBean.djsj}" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
<creator:panel id="mappanel" height="auto" title="地图标注">
	<iframe id="MainMap" src="${pgisiframeurl}" width="100%" scrolling="no" frameborder="0" ></iframe>
</creator:panel>
</creator:view>
