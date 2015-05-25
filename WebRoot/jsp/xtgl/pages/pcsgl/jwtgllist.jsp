<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%">
	<script type="text/javascript">
		function queryList()
		{
			$("#fwtablegrid").query("F","queryForm");
		}
		
		function toJwtglInfoPage(operType,id)
		{
			$.openWindow({
				name : "infoWin",
				url : contextPath + "/xtgl/pcs/toJwtglInfoPage.action",
				width:1000,
				height : 400,
				data : {
					"operType" : operType,
					"queryBean.id" : id
				}
			})
		}
		
		function zxJwtpz(jwtid)
		{
			if (confirm("你确定要注销该警务通的配置吗？"))
			{
				$.ajax({
					type : "post",
					url : contextPath + "/xtgl/pcs/zxJwtglPzBean.action",
					data : {
						"queryBean.id" : jwtid,
						"queryBean.yxx" : "1"
					},
					dataType : "json",
					success : function(result)
					{
						if (result==true)
						{
							alert("注销成功。");
							queryList();
						}
						else
						{
							alert("注销失败，请稍后再试。")
						}
					}
				});
			}
		}
		
		function czRowBackcallback(tdObj,rowdata)
		{
			var html = "";
			html += "<span class=\"cps_span_href\" onclick=\"toJwtglInfoPage('update','" + rowdata["id"] + "')\">修改</span>&nbsp;";
			html += "<span class=\"cps_span_href\" onclick=\"zxJwtpz('" + rowdata["id"] + "')\">注销</span>";
			return html;
		}
	</script>
	<creator:box>
		<form id="queryForm">
		<creator:tbar id="fwtooltbar">
			<cps:button value="查询" id="querybtn" onclick="queryList();"></cps:button>
			<cps:button value="新增" id="addbtn" onclick="toJwtglInfoPage('add')"></cps:button>
			<cps:button value="重置" type="reset"></cps:button>
		</creator:tbar>
		<creator:panel id="fwquerypanel" title="警务通管理查询条件" tbarId="fwtooltbar">
			<input type="hidden" name="operType" value="select">
			<input type="hidden" name="modename" value="警务通查询">
			<cps:table>
				<cps:row>
					<cps:tdLabel  width="12%">市局：</cps:tdLabel>
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
						<cps:tdLabel>采集人警号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="stmc" name="queryBean.jh"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>采集人：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="stmc" name="queryBean.xm"></cps:textfield>
						</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
		</form>
		<cps:tableGrid id="fwtablegrid"  title="警务通管理列表"
				url="/xtgl/pcs/queryJwtBeansPageResult.action" 
				searchform="queryForm"	
				width="99.6%"
				mutilSelect="false"
				autoload="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz" title="操作" rowcallback="czRowBackcallback"></cps:column>
			<cps:column field="kc_jwqmc" title="单位名称" align="left"></cps:column>
			<cps:column field="jh" title="采集人警号"></cps:column>
			<cps:column field="xm" title="采集人"></cps:column>
			<cps:column field="jwthm" title="警务通号码"></cps:column>
			<cps:column field="cjrdwmc" title="采集人单位" maxlength="10"></cps:column>
			<cps:column field="czsj" title="更新时间"></cps:column>
			<cps:column field="yxxms" title="有效性"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>