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
<script type="text/javascript">
	var operType = "${operType}";
	MapServicesUrl = "${mapServicesUrl}";
	//document.oncontextmenu = function(){return false};
	function callbackSqSelect()
	{
		//callbackDzmc();
		//autoMapDw();
		var x = $("#xzb").val();
   	 	var y = $("#yzb").val();
   	 	
   	 	var sqdm = $("#sqdm").attr("initValue");
   	 	if (sqdm != null && sqdm !="")
   	 	{
   	 		showMapService(sqdm);
		}
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
		}
	}
	
	function showMapService(sqdm)
	{
		if (sqdm != null && sqdm != "")
		{
			var leve = $("#leve").val();
			if (leve != "5")
			{
				$.ajax({
					type : "post",
					url : contextPath + "/pgis/queryPgisdmBySqdm.action?queryBean.sqdm=" + sqdm,
					dataType : "json",
					success : function(result)
					{
						document.getElementById("MainMap").contentWindow.reloadSqObject(result);
					}
				});
			}
		}
	}
	
	//刷新列表
	function queryList()
	{	    
		$("#fwtablegrid").query("F","stxxform");
	}
	
	function queryListByQueryBean()
	{
		$("#stid_hidden").val($("#stid").val());
		$("#fwtablegrid").query("F","queryform");
	}
	
	function iframeQpxs(btn)
	{
		if ($(btn).val()== "恢复显示")
		{
			$("#toppanel").show();
			$("#MainMap").removeAttr("height");
			//$(btn).attr("value","全屏显示")
		}
		else
		{
			$("#toppanel").hide();
			$("#MainMap").height($(window).height()-30);
			//$(btn).attr("value","恢复显示");
		}
		
	}
	
	$(function(){
		//窗口最大化
		window.moveTo(0,0) ;
		window.resizeTo(screen.availWidth,screen.availHeight); 
			
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
		var docheight = $(document).height();
		var pheight = $("#dzpanel").height();
		$("#MainMap").height(docheight - pheight - 40);
		
		setTimeout("callbackSqSelect()",2000);
	});
</script>
<div id="toppanel" >
<creator:tbar id="dztbarpanel">
	<cps:button value="保存" onclick="saveStxxBean()" display="${operType == 'detail' ? false : true}"></cps:button>
	<cps:button value="新增房屋" onclick="openAddFwInfoWin('add')" display="${operType == 'detail' ? false : true}"></cps:button>
	<cps:button value="出租屋登记" onclick="openDjfwForCzfwInfo()" display="${operType == 'detail' ? false : true}"></cps:button>
	<cps:button value="实有人口登记" onclick="openSyrkRkInfo('add','')" display="${operType == 'detail' ? false : true}"></cps:button>
	<cps:button value="境外人口登记" onclick="openSyrkRkInfo('add','4')" display="${operType == 'detail' ? false : true}"></cps:button>
	<cps:button value="实有单位登记" onclick="openSydw()" display="${operType == 'detail' ? false : true}"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="dzpanel" tbarId="dztbarpanel" title="实体信息">
	<input type="hidden" id="djdwdm" value="${loginInfo.orgcode }">
	<input type="hidden" id="djdwmc" value="${loginInfo.orgname }">
	<input type="hidden" id="operType" value="${operType}">
	<input type="hidden" id="leve" value="${loginInfo.leve}">
	
	<%--地址信息--%>

		<cps:table>
			<cps:row>
				<cps:tdContent width="50%">
					<form id="stxxform">
						<input type="hidden" id="stid" name="stxxBean.id" value="${stxxBean.id}"/>
						<input type="hidden" id="stbm" name="stxxBean.stbm" value="${stxxBean.stbm}"/>
						<cps:table width="100%">
							<cps:row>
								<cps:tdLabel width="12%"><font color="red">*</font>实体名称：</cps:tdLabel>
								<cps:tdContent colspan="3">
									<cps:textfield id="stmc" name="stxxBean.stmc" value="${stxxBean.stmc}" required="true" cssStyle="width:92%" maxlength="60" readonly="${operType=='update' ? false : true}"></cps:textfield>
								</cps:tdContent>
							</cps:row>
							 
							<cps:row>
								<cps:tdLabel width="12%"><font color="red">*</font>实体分类：</cps:tdLabel>
								<cps:tdContent width="30%">
									<cps:select id="stfl" name="stxxBean.stfl" zdlb="ZDY_STFL" value="${stxxBean.stfl}" required="true" headerKey="" headerValue=" "></cps:select>
								</cps:tdContent>
								<cps:tdLabel width="12%"><font color="red">*</font>市：</cps:tdLabel>
								<cps:tdContent>
									<input type="hidden" name="stxxBean.sjxzqh" value="${stxxBean.sjxzqh}" />
									<cps:select id="sjxzqh" list="${cityXzqhList}" value="${stxxBean.sjxzqh}" listKey="dm" listValue="mc" headerKey="" headerValue=" " onchange="doubleSelectCountry(this.value,'xzqh');return false;" disabled="true" ></cps:select>
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel><font color="red">*</font>县/区：</cps:tdLabel>
								<cps:tdContent>
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
								<cps:tdLabel width="10%"><font color="red">*</font>街道/乡镇：</cps:tdLabel>
								<cps:tdContent>
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
							</cps:row>
							
							<cps:row>
								<cps:tdLabel>门牌号：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="mph" name="stxxBean.mph" value="${stxxBean.mph}" onblur="callbackDzmc()" inputType="Integer"></cps:textfield><font color="black">(号)</font>
								</cps:tdContent>
								
								<cps:tdLabel>小区(组)：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="xqmc" name="stxxBean.xqz" value="${stxxBean.xqz}" onblur="callbackDzmc()" appendPopuBtn="true" onclick="openXqzSelectWin()"></cps:textfield>
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>楼栋详址：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="ldxz" name="stxxBean.ldxz" value="${stxxBean.ldxz}"  onblur="callbackDzmc()"></cps:textfield>
								</cps:tdContent>
								<cps:tdLabel>消防等级：</cps:tdLabel>
								<cps:tdContent>
									<cps:select zdlb="ZAGL_XFDJ" id="xfdj" name="stxxBean.xfdj" value="${stxxBean.xfdj}" headerKey="" headerValue=" "></cps:select>
								</cps:tdContent>
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
							</cps:row>
							<cps:row>
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
							</cps:row>
							<cps:row>
								<cps:tdLabel>合并地址：</cps:tdLabel>
								<cps:tdContent colspan="3">
									 <cps:textfield id="dzmc" readonly="true" cssStyle="width:88%"></cps:textfield>
								</cps:tdContent>
							</cps:row> 
							<cps:row>
								<cps:tdLabel>经纬度：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield id="xzb" name="stxxBean.x" value="${stxxBean.x}" readonly="true" inputType="number" cssStyle="width:40%"></cps:textfield>
									<cps:textfield id="yzb" name="stxxBean.y" value="${stxxBean.y}" readonly="true" inputType="number" cssStyle="width:40%"></cps:textfield>
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
							</cps:row>
							<cps:row>
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
						</cps:table>
					</form>
				</cps:tdContent>
				<cps:tdContent width="50%" valign="top">
					<creator:tbar id="fwquerytbar">
						<cps:button id="querybtn" value="查询" onclick="$('#fwtablegrid').query('F','stxxform')"></cps:button>
					</creator:tbar>
					<c:if test="${operType != 'detail'}">
						<cps:tableGrid id="fwtablegrid" title="房屋列表" tbarId="fwquerytbar"
										url="/lsgl/fw/queryFwPageResultByStid.action" 
										searchform="stxxform"	
										mutilSelect="false"
										autoload="true">
								<cps:column isNumber="true" title="序号"></cps:column>
								<cps:column isCheckbox="true"></cps:column>
								<cps:column field="cz" title="操作" align="left"></cps:column>
								<cps:column field="dzmc" title="地址" maxlength="10" align="left"></cps:column>
								<cps:column field="dyhmc" title="单元号"></cps:column>
								<cps:column field="lchmc" title="楼层号"></cps:column>
								<cps:column field="fjhmc" title="房间号"></cps:column>
								<cps:column field="fsdz" title="附属地址"></cps:column>
								<cps:column field="sfczwms" title="出租屋"></cps:column>
								<cps:column field="cqlxmc" title="产权类型"></cps:column>
						</cps:tableGrid>
					</c:if>
					<c:if test="${operType == 'detail'}">
						<cps:tableGrid id="fwtablegrid"  title="房屋列表" tbarId="fwquerytbar"
										url="/lsgl/fw/queryFwPageResultByStid.action" 
										searchform="stxxform"	
										mutilSelect="false"
										autoload="true">
								<cps:column isNumber="true" title="序号"></cps:column>
								<cps:column isCheckbox="true"></cps:column>
								<cps:column rowcallback="czCallbackfw" title="操作" align="left"></cps:column>
								<cps:column field="dzmc" title="地址" maxlength="10" align="left"></cps:column>
								<cps:column field="dyhmc" title="单元号"></cps:column>
								<cps:column field="lchmc" title="楼层号"></cps:column>
								<cps:column field="fjhmc" title="房间号"></cps:column>
								<cps:column field="fsdz" title="附属地址"></cps:column>
						</cps:tableGrid>
					</c:if>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent colspan="2">
					<font color="red">
						注意：关于实体信息的录入必须严格按照地址的规范进行录入，即录入的 合并地址 信息必须规范不能出现重复的名称。录入完实体信息后需要录入具体的房屋信息，如果对于抽象地址没有具体的单元房间号等，可以录入一个空房屋信息。
							但前提是必须保证地址的完整与正确性。实体与房屋的关系：实体我们可以看成是楼栋,而房屋就是楼栋里面的具体房间号。
					</font>
				</cps:tdContent>
			</cps:row>
		</cps:table>
</creator:panel>
</div>
<div id="bottompanel">
	<creator:tbar  id="gistbar">
		<c:if test="${operType != 'detail'}">
			<cps:button value="实体标注" onclick="bzjwdMap()"></cps:button>
		</c:if>
		<cps:button value="显示位置" onclick="callbackSqSelect()"></cps:button>
		<%-- 
		<cps:button id="showcontrolbtn" value="全屏显示/恢复" onclick="iframeQpxs(this)"></cps:button>
		--%>
	</creator:tbar>
	<creator:panel id="mappanel" height="auto" tbarId="gistbar" title="地图展示" >
		<iframe id="MainMap" src="${mapServicesUrl}?sqdm=${loginInfo.pgis_sqdm}&jzdm=${loginInfo.jzdm}" width="100%" scrolling="no" frameborder="0" ></iframe>
	</creator:panel>
</div>
</creator:view>
