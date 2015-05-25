<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="实体信息维护">
<creator:Script src="/jsp/lsgl/js/fwlist.js"></creator:Script>
<creator:Script src="/jsp/dzgl/js/dz.js"></creator:Script>
<creator:Script src="/jsp/lsgl/js/lsglcollect.js"></creator:Script>
<creator:Script src="/jsp/dzgl/js/gis.js"></creator:Script>
<creator:Script src="/jsp/PGIS/js/giscommon.js"></creator:Script>
<creator:Script src="/jsp/dzgl/js/fwjg.js"></creator:Script>
<creator:Style href="/jsp/dzgl/css/fw.css"></creator:Style>
<script type="text/javascript">
	var operType = "${operType}";
	var mapServicesUrl = "${mapServicesUrl}?sqdm=${loginInfo.pgis_sqdm}&jzdm=${loginInfo.jzdm}";
	function callbackSqSelect()
	{
		var x = $("#xzb").val();
   	 	var y = $("#yzb").val();
   	 	var sqdm = $("#sqdm").attr("initValue");
   	 	//if (sqdm != null && sqdm !="")
   	 	//{
   	 	//	showMapService(sqdm);
		//}
		document.getElementById("MainMap").contentWindow.localAtCent('',x,y,18);
	}
	function bzjwdMap()
	{
		document.getElementById("MainMap").contentWindow.mapEditMarkPoint();
	}
	function finishUpdatePoint(point)
	{
		if (point && point != null)
		{
			$("#xzb").val(point.x);
			$("#yzb").val(point.y);
			if (confirm("经纬度标注成功,是否关闭窗口？"))
			{
				layer.close(layeri);
			}
		}
	}
	function showMapService(sqdm)
	{
		document.getElementById("MainMap").contentWindow.reloadSqObject(sqdm);
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
			doubleSelectJdxz(xzqh,'jdxzdm',callbackDzmc,jdxz);
		}
		if (jdxz != null && jdxz != "")
		{
			doubleSelectSqByJdxzdm(jdxz,'sqdm',callbackDzmc,sqdm);
		}
		
		//退格键事件
		$("#jlxmc").keydown(function(e){
			var event = window.event||e;
			var code = event.keyCode||event.which;
			if (code == 8)
			{
				$("#jlxdm").val("");
				$("#jlxmc").val("");
			}
		});
		//退格键事件
		$("#xqmc").keydown(function(e){
			var event = window.event||e;
			var code = event.keyCode||event.which;
			if (code == 8)
			{
				$("#xqmc").val("");
			}
		});
		
		//加载房屋结构
		loadFwjgPage();
	});
</script>
<div id="toppanel">
	<creator:tbar id="dztbarpanel">
		<input type="button" name="button2" id="button2" value="保&nbsp;存" class="fw_submit_b" onclick="saveStxxBean()" style="display: ${operType=='detail'?'none':'inline' }"/>
 		<input type="button" name="button2" id="button2" value="打开地图" class="fw_submit_a" onclick="clickStxxBz('${mapServicesUrl}?sqdm=${loginInfo.pgis_sqdm}&jzdm=${loginInfo.jzdm}')"/>
		<input type="button" name="button2" id="button2" value="关&nbsp;闭" class="fw_submit_b" onclick="$.closeWindow()"/>
	</creator:tbar>
	<creator:panel id="dzpanel" tbarId="dztbarpanel" title="实体信息">
		<input type="hidden" id="djdwdm" value="${loginInfo.orgcode }">
		<input type="hidden" id="djdwmc" value="${loginInfo.orgname }">
		<input type="hidden" id="operType" value="${operType}">
		<input type="hidden" id="leve" value="${loginInfo.leve}">
		<%--地址信息--%>
	 
		<form id="stxxform">
			<input type="hidden" id="stid" name="stxxBean.id" value="${stxxBean.id}"/>
			<input type="hidden" id="stbm" name="stxxBean.stbm" value="${stxxBean.stbm}"/>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="8%"><font color="red">*</font>实体名称：</cps:tdLabel>
					<cps:tdContent width="11%">
						<cps:textfield id="stmc" name="stxxBean.stmc" value="${stxxBean.stmc}" required="true" maxlength="60"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="8%"><font color="red">*</font>实体分类：</cps:tdLabel>
					<cps:tdContent width="11%">
						<cps:select id="stfl" name="stxxBean.stfl" zdlb="ZDY_STFL" value="${stxxBean.stfl}" required="true" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="8%"><font color="red">*</font>市：</cps:tdLabel>
					<cps:tdContent width="11%">
						<input type="hidden" name="stxxBean.sjxzqh" value="${stxxBean.sjxzqh}" />
						<cps:select id="sjxzqh" list="${cityXzqhList}" value="${stxxBean.sjxzqh}" listKey="dm" listValue="mc" headerKey="" headerValue=" " onchange="doubleSelectCountry(this.value,'xzqh');return false;" disabled="true" ></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="8%"><font color="red">*</font>县/区：</cps:tdLabel>
					<cps:tdContent width="11%">
						<c:choose>
							<%-- 市局用户或者为高新区开发经济区用户--%>
							<c:when test="${loginInfo.leve <= 2 || loginInfo.isGxdz == true}">
								<cps:select id="xzqh" list="${countryXzqhList}" name="stxxBean.xzqh" value="${stxxBean.xzqh}" listKey="dm" listValue="mc" headerKey="" headerValue=" " onchange="doubleSelectJdxz(this.value,'jdxzdm',callbackDzmc)" ></cps:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="stxxBean.xzqh" value="${stxxBean.xzqh}" />
								<cps:select id="xzqh" list="${countryXzqhList}" value="${stxxBean.xzqh}" listKey="dm" listValue="mc" headerKey="" headerValue=" " onchange="doubleSelectJdxz(this.value,'jdxzdm',callbackDzmc)" disabled="true" ></cps:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="8%"><font color="red">*</font>街道/乡镇：</cps:tdLabel>
					<cps:tdContent >
						<cps:select id="jdxzdm" list="${xzjdqhList}"  name="stxxBean.jdxzdm" value="${stxxBean.jdxzdm}" listKey="dm" listValue="mc" headerKey="" headerValue=" " onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',callbackDzmc)" ></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>社区/村：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="sqdm" list="${sqJbxxList}"  name="stxxBean.sqdm" value="${stxxBean.sqdm}" required="true" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " onchange="callbackDzmc();showMapService(this.value);" ></cps:select>
					</cps:tdContent>
					<cps:tdLabel>街路巷：</cps:tdLabel>
					<cps:tdContent >
						<input type="hidden" id="jlxdm" name="stxxBean.jlxdm" value="${stxxBean.jlxdm}">
						<cps:textfield id="jlxmc" name="stxxBean.jlxmc" value="${stxxBean.jlxmc}"  onblur="callbackDzmc()" appendPopuBtn="true"  onclick="openJlxSelect(setSelectJlxValue)" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>门牌号<font color="black">(号)</font>：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="mph" name="stxxBean.mph" value="${stxxBean.mph}" onblur="callbackDzmc()" inputType="Integer"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel>小区(组)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xqmc" name="stxxBean.xqz" value="${stxxBean.xqz}" onblur="callbackDzmc()" appendPopuBtn="true" onclick="openXqzSelectWin()"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>楼栋详址：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="ldxz" name="stxxBean.ldxz" value="${stxxBean.ldxz}"  onblur="callbackDzmc()"></cps:textfield>
					</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdLabel>消防等级：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZAGL_XFDJ" id="xfdj" name="stxxBean.xfdj" value="${stxxBean.xfdj}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
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
					<cps:tdLabel>开发商：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="kfs" name="stxxBean.kfs" value="${stxxBean.kfs}" maxlength="50"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>物业单位：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="wygldw" name="stxxBean.wygldw" value="${stxxBean.wygldw}" maxlength="50"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>治保单位：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zbdw" name="stxxBean.zbdw" value="${stxxBean.zbdw}" maxlength="50"></cps:textfield>
					</cps:tdContent>
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
						<c:if test="${operType == 'add'}">
							 <cps:date id="djsj" name="stxxBean.djsj" dateFmt="yyyy-MM-dd HH:mm:ss" defaultSystemDate="true"></cps:date>
						</c:if>
						<c:if test="${operType != 'add'}">
							 <cps:date id="djsj" name="stxxBean.djsj"  value="${stxxBean.djsj}" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
						</c:if>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>合并地址：</cps:tdLabel>
					<cps:tdContent colspan="7">
						 <cps:textfield id="dzmc" readonly="true" cssStyle="width:98%"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>经纬度：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xzb" name="stxxBean.x" value="${stxxBean.x}" readonly="true" inputType="number" cssStyle="width:40%" onclick="clickStxxBz('${mapServicesUrl}?sqdm=${loginInfo.pgis_sqdm}&jzdm=${loginInfo.jzdm}')"></cps:textfield>
						<cps:textfield id="yzb" name="stxxBean.y" value="${stxxBean.y}" readonly="true" inputType="number" cssStyle="width:40%" onclick="clickStxxBz('${mapServicesUrl}?sqdm=${loginInfo.pgis_sqdm}&jzdm=${loginInfo.jzdm}')"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
</div>
<div id="dzpanel" class="creatorpanel" tbarId="dztbarpanel" width="" height="" style="display:block;">
	<div id="head_dzpanel" class="cps-box-title" style="text-align: left;">
		<div style="float:left">
			<span>
				&nbsp;房屋楼层结构
			</span>
		</div>
		<div id="tbar_dzpanel" style="float:right;padding-right: 5px;">
			<input type="button" name="button2" id="button2" value="添加楼层" class="fw_submit_b" onclick="openNewFwlc()" style="display:${operType=='detail'?'none':'inline' }"/>
        	<input type="button" name="button" id="button" value="刷新楼层" class="fw_submit_a" onclick="loadFwjgList()"/>
		</div>
	</div>
	<div id="dyxxdiv" class="fw_nr_b">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="80%">
	         	&nbsp;&nbsp;<s:radio list="fwjgDetail.dyhList" name="fwjgdyh" listKey="dm" listValue="mc" onclick="loadFwjgPage(this.value)"></s:radio>
	        </td>
	        <td align="right">
	        </td>
	      </tr>
    	</table>
	</div>
</div>
<%--显示楼层结构信息 --%>
<div id="lcxxdiv" class="fw_nr_c">
</div>
</div>
<div id="pleaselchwin" style="display: none">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="30%">&nbsp;&nbsp;&nbsp;请输入楼层号：</td>
			<td width="70%">
				<cps:textfield id="layerlch" maxlength="3"></cps:textfield>&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" name="button2" id="button2" value="确定" class="fw_submit_b" onclick="addFwlc()"/>
				<input type="button" name="button" id="button" value="取消" class="fw_submit_a" onclick="closeLchWin()"/>
			</td>
		</tr>
	</table>
</div>
<div id="mapdiv" style="display:none;">
	<div id="tbar_dzpanel" style="float:right;padding-right: 5px;">
		<input type="button" name="button2" id="button2" value="实体标注" class="fw_submit_b" onclick="bzjwdMap()" style="display: ${operType=='detail'?'none':'inline' }"/>
       	<input type="button" name="button" id="button" value="显示位置" class="fw_submit_a" onclick="callbackSqSelect()"/>
	</div>
	<div>
		<iframe id="MainMap" src="" width="980px" height="650px" scrolling="no" frameborder="0" ></iframe>
	</div>
</div>
</creator:view>
