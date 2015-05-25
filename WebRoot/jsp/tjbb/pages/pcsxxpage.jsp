<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript">
		function loadPcsInfoPage()
		{
			var url = contextPath + "/tjbb/loadPcsInfoPage.action"
			$.post(url,$("#pcsinfoform").serialize(),function(html){
				$("#body_contentdiv").html(html);
			})
		}
		function exportPcsxxPage()
		{
			$("#pcsinfoform").attr("target","_blank");
			$("#pcsinfoform").attr("action",contextPath + "/tjbb/exportPcsxxPage.action");
			$("#pcsinfoform").submit();
			$("#pcsinfoform").removeAttr("target");
			$("#pcsinfoform").removeAttr("action");
		}
	</script>
	<creator:box>
		<form id="pcsinfoform" method="post">
			<cps:PanelView>
				<cps:tbar>
					<cps:button value="查询" onclick="loadPcsInfoPage()"></cps:button>
					<cps:button value="导出" onclick="exportPcsxxPage()"></cps:button>
				</cps:tbar>
				<cps:panel id="pcsxxquery" title="警务区信息查询">
					<cps:table>
					<cps:row>
						<cps:tdLabel  width="9%">市局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="pcstjQueryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="pcstjQueryBean.citygajgjgdm"></s:hidden>
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="pcstjQueryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel  width="10%">县区局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="pcstjQueryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
						</cps:tdContent>
						<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="pcsdm" list="pcsGajgjgList"  name="pcstjQueryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
						</cps:tdContent>
					</cps:row>
				</cps:table>
				</cps:panel>
			</cps:PanelView>
		</form>
		<creator:panel id="contentdiv" title="警务区基本情况">
		</creator:panel>
   </creator:box>
</creator:view>