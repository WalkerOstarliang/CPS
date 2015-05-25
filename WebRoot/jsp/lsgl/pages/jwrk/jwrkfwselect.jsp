<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%" title="地址选择窗口">
	<creator:Script src="/jsp/lsgl/js/fwlist.js"></creator:Script>
	<script type="text/javascript">
		function clickNextBtn()
		{
			var selectes = $("#fwtablegrid").getSelected();
			if (selectes.length > 0)
			{
				layer.load(0);
				var fwid = selectes[0]["fwid"];
				var gj = $("#gj").val();
				var zjzl = $("#zjzl").val();
				var zjhm = $("#zjhm").val();
				var ywm =$("#ywm").val();
				var ywx = $("#ywx").val();
				var xb = $("#xb").val();
				var cyrybh = $("#cyrybh").val();
				var url = contextPath + "/lsgl/jwrk/toJwrkQueryPage.action?queryBean.cyrybh=" + cyrybh + "&queryBean.fwid=" + fwid + "&queryBean.gj=" + gj + "&queryBean.zjzl="+zjzl + "&queryBean.zjhm=" + zjhm + "&queryBean.ywm=" + ywm + "&queryBean.ywx=" + ywx + "&queryBean.xb=" + xb;
				document.location.href= url;
			}
			else
			{
				alert("请先选择一条地址信息.");
			}
		}
	</script>
 	<form id="queryForm">
	<creator:tbar id="querytbar">
		<cps:button value="查询" onclick="queryList()"></cps:button>
		<cps:button value="重置" type="reset"></cps:button>
		<cps:button value="下一步" onclick="clickNextBtn()"></cps:button>
		<cps:button value="返回" onclick="history.go(-1)"></cps:button>
	</creator:tbar>
	<creator:panel id="fwquerypanel" title="境外人口登记之房屋选择" tbarId="querytbar">
			<s:hidden id="czType" name="queryBean.czType"></s:hidden>
			<s:hidden id="sfzh" name="queryBean.sfzh"></s:hidden>
			<s:hidden id="stid" name="queryBean.stid"></s:hidden>
			<s:hidden id="gj" name="queryBean.gj"></s:hidden>
			<s:hidden id="zjzl" name="queryBean.zjzl"></s:hidden>
			<s:hidden id="zjhm" name="queryBean.zjhm"></s:hidden>
			<s:hidden id="ywm" name="queryBean.ywm"></s:hidden>
			<s:hidden id="ywx" name="queryBean.ywx"></s:hidden>
			<s:hidden id="xb" name="queryBean.xb"></s:hidden>
			<s:hidden id="cyrybh" name="queryBean.cyrybh"></s:hidden>
			<cps:table>
			<cps:row>
				<cps:tdLabel  width="9%">市局：</cps:tdLabel>
				<cps:tdContent  width="25%">
					<c:choose>
						<c:when test="${empty loginInfo.citygajgdm}">
							<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
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
							<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
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
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
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
				<cps:tdLabel>社区：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="sqdm" list="sqJbxxList"  name="queryBean.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
				</cps:tdContent>
				<cps:tdLabel width="10%">街路巷：</cps:tdLabel>
				<cps:tdContent width="22%">
					 <input type="hidden" id="jlxdm" name="queryBean.jlxdm"/>
					 <cps:textfield id="jlxmc" readonly="true" onclick="openJlxSelect(setSelectJlxValue)" appendPopuBtn="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			 
			<cps:row>
				<cps:tdLabel>门牌号：</cps:tdLabel>
				<cps:tdContent>
					 <cps:textfield id="mph" name="queryBean.mph"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>小区(组)：</cps:tdLabel>
				<cps:tdContent>
					  <cps:textfield id="xqz" name="queryBean.xqz"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>楼栋详址：</cps:tdLabel>
				<cps:tdContent>
					 <cps:textfield id="ldxz" name="queryBean.ldxz"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			 <cps:row>
				<cps:tdLabel>单元号：</cps:tdLabel>
				<cps:tdContent>
					 <cps:select id="dyh" zdlb="ZDY_DYH" name="queryBean.dyh" headerKey="" headerValue=" " onchange="queryTableGrid()"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>楼层号：</cps:tdLabel>
				<cps:tdContent>
					  <cps:textfield id="lch" name="queryBean.lch"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>房间号：</cps:tdLabel>
				<cps:tdContent>
					 <cps:textfield id="fjh" name="queryBean.fjh"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%">实体名称：</cps:tdLabel>
				<cps:tdContent>
					 <cps:textfield id="stmc" name="queryBean.stmc" onblur="queryTableGrid()" disabled="${queryBean.stid != '' && queryBean.stid != null ? true : false}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>是否出租屋：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="sfczw" name="queryBean.sfczw" zdlb="ZDY_ZDSF" headerKey="" headerValue=" " ></cps:select>
				</cps:tdContent>
				<cps:tdLabel>注销状态：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="zxbs" name="queryBean.zxbs" zdlb="ZDY_ZXBS" headerKey="" headerValue=" " value="0" disabled="true" enableEdit="true"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent colspan="6">
					<font color="red">
						注意：在登记境外人口之前先进行房屋选择，选择好房屋后在点击“境外人口登记”.只有社区民警才具有境外人口登记的权限。 
					</font>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
	</form>
	<creator:tbar id="jwrktbar">
		<cps:button value="新增房屋" onclick="openFwInfo('add','','${queryBean.sfczw}')" display="${displayAddBtn}"></cps:button>
	</creator:tbar>
	 <cps:tableGrid id="fwtablegrid" title="房屋选择列表" tbarId="jwrktbar"
		url="/lsgl/fw/queryFwPageResult.action" 
		searchform="queryForm"
		dblclick="rowdblClickReturn"
		mutilSelect="false"
		width="99.8%"
		autoload="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="dzmc" title="房屋地址" align="left" ></cps:column>
	</cps:tableGrid>
</creator:view>