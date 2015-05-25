<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/dzgl/js/dzxx.js"></creator:Script>
	<script type="text/javascript">
		function callbackczdetail(tdObj,rowdata)
		{
			var html = "";
			html += "<span class=\"cps_span_href\" onclick=\"openStxxDetailInfoPage('detail','" + rowdata["id"] + "')\">详情</span>&nbsp;";
			return html;
		}
		//选择社区
		function openSqxxSelectWin(){
			$.openDialogWindow({
				url : contextPath + "/afgl/sqjbgl/toOpenSqListSelectWin.action",
				width : 900,
				height : 500,
				data : {
					t: new Date().getTime()
				},
				callback : function(sqjbxxBean)
				{
					if (sqjbxxBean)
					{
						$("#tojwqdm").val(sqjbxxBean.gxsqjwsdm)
						$("#tosqdm").val(sqjbxxBean.sqbh);
						$("#tosqmc").val(sqjbxxBean.sqmc);
					}
				}
			});
		}
		
		function QyStSelectSqWin()
		{
			var tosqmc = $("#tosqmc").val();
			var tosqdm = $("#tosqdm").val();
			var tojwqdm	= $("#tojwqdm").val();
			if (tosqdm != null && tosqdm != "")
			{
				var selecteds = $("#datagridList").getSelected();
				if (selecteds.length > 0 && selecteds.length<=100)
				{
					if (confirm("你确定要把选中的实体迁移到" + tosqmc +"吗?"))
					{
						var stids = [];
						$.each(selecteds,function(i,selected){
							stids.push(selected["id"]);
						});
						$.ajax({
							type : "post",
							url : contextPath + "/xtgl/stxx/executeStxxChange.action",
							data : "stids="+stids.join(",") + "&toSqdm=" + tosqdm + "&tojwqdm=" + tojwqdm,
							dataType : "json",
							timeout : 1200000,
							success : function(result)
							{
								if (result == true)
								{
									alert("实体迁移成功.");
									$("#datagridList").query("F","searchform");
								}
							}
						});
						
					}
				}
				else if (selecteds.length >= 100)
				{
					alert("一次最多只能迁移100条记录.");
				}
				else 
				{
					alert("请选择要迁出的实体记录");
				}
			}
			else
			{
				alert("请选择要迁入的社区.");
			}
		}
	</script>
	<creator:tbar id="rwtbar">
		<cps:button value="查&nbsp;询" onclick="clickQuery();"></cps:button> 
		<cps:button value="重&nbsp;置" type="reset"></cps:button>
		<cps:button value="迁移" onclick="QyStSelectSqWin()"></cps:button>
	</creator:tbar>
	<creator:box>
		<form method="post" id="searchform">
		<input type="hidden" id="executequerystr" value="">
		<input type="hidden" id="executequery" value="false">
		<creator:panel id="stxxquerypanel" title="实体查询" tbarId="rwtbar" help="true" helpclick="openStxxHelp()">
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
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" disabled="true"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel  width="10%">区县局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="countrygajgjgdm"></s:hidden>
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" disabled="true" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
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
							 <cps:textfield id="jlxmc" readonly="true" appendPopuBtn="true" onclick="openJlxSelect(setSelectJlxValue)"></cps:textfield>
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
						<cps:tdLabel width="10%">实体名称：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="stmc" name="queryBean.stmc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>是否标注：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="sfbz" list="#{'1':'是','0' : '否'}" name="queryBean.sfbz" cssClass="cps-select" headerKey="" headerValue=" "/>
						</cps:tdContent>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_STXX_ZXBS" id="zxbs" name="queryBean.zxbs" headerKey="" headerValue=" " value="1"></cps:select>
						</cps:tdContent>
						
					</cps:row>
					<cps:row>
						<cps:tdLabel >登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" cssStyle="width:40%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>-
							<cps:date id="djsj_end"   cssStyle="width:40%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
						<cps:tdLabel >&nbsp;</cps:tdLabel>
						<cps:tdContent>
							&nbsp;
						</cps:tdContent>
						<cps:tdLabel >&nbsp;</cps:tdLabel>
						<cps:tdContent>
							&nbsp;
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
		</form>
		<div>
			<creator:tbar id="stqytbar">
				<input type="hidden" id="tosqdm" value=""/>
				<input type="hidden" id="tojwqdm" value=""/>
				<label>迁入社区：</label>
				<cps:textfield id="tosqmc" value="请选择迁入社区" onclick="openSqxxSelectWin()" cssStyle="width:200px"  onfocus="if(this.value == '请选择迁入社区') this.value=''" onblur="if(this.value == null || this.value == '') this.value='请选择迁入社区'" appendPopuBtn="true"></cps:textfield>
			</creator:tbar>
			<cps:tableGrid url="/dzgl/dzxx/queryStxxBeansPageResult.action" 
						id="datagridList"
						autoload="false"
						tbarId="stqytbar"
						mutilSelect="true"
						searchform="searchform" 
						width="99.8%">
				<cps:column isNumber="true" title="序号" ></cps:column>
				<cps:column isCheckbox="true"></cps:column>
				<cps:column field="czdetail" title="操作" rowcallback="callbackczdetail"></cps:column>
				<cps:column field="stmc" title="实体名称" align="left" maxlength="8"></cps:column>
				<cps:column field="jdxzmc" title="乡镇街道" align="left" maxlength="5"></cps:column>
				<cps:column field="sqmc" title="社区村" align="left"></cps:column>
				<cps:column field="jlxmc" title="街路巷" align="left"></cps:column>
				<cps:column field="mph" title="门牌号" align="left"></cps:column>
				<cps:column field="xqz" title="小区组" align="left" maxlength="10"></cps:column>
				<cps:column field="ldxz" title="楼栋详址" align="left" maxlength="10"></cps:column>
				<cps:column field="djsj" title="登记时间" maxlength="15"></cps:column>
				<cps:column field="zxbsms" title="注销状态" maxlength="15"></cps:column>
			</cps:tableGrid>
		</div>
	</creator:box>
</creator:view>