<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<%@include file="/template/fusion.inc" %>
	<script type="text/javascript">
		/** 机构选择* */
		function openSelectOrg(orgcode, hiddenfield, showfield) {
			if (orgcode) {
				openDwSelect2({
					rootOrgCode : orgcode.substr(0,4) + "00000000",
					mutilSelect : false,
					nodeSelectedType : "ps",
					nodeNotSelectedType : "ps"
					}, 
					function(orgbeans) {
						if (orgbeans != null) 
						{
							$("#" + hiddenfield).val(orgbeans.id);
							$("#" + showfield).val(orgbeans.name);
						}
					});
			} else {
				alert("无效的机构代码")
			}
		}
		function queryList()
		{
			var orgcode = $("#orgcode").val();
			var tjyf = $("#tjyf").val()
			var orgname = $("#orgname").val();
			if (!$.isBlank(orgcode) && !$.isBlank(tjyf))
			{
				loadFaqkChars();
				$("#pcstablegrid").query("F","queryForm");
				$("#yeartablegrid").query("F","queryForm");
			}
			else
			{
				alert("请选择统计单位及统计月份。");
			}
		}
		
		function exportPcsjbqkList()
		{
			$("#queryForm").attr("target","_blank");
			$("#queryForm").attr("action",contextPath + "/tjbb/exportFaqkPage.action");
			$("#queryForm").submit();
		}
	</script>
	 <script type="text/javascript">
		 	function loadFaqkChars()
		 	{
		 		 var orgcode = $("#orgcode").val();
			  	 var tjyf = $("#tjyf").val()
			  	 var orgname = $("#orgname").val();
		  	 	 var chart = new FusionCharts(contextPath + "/FusionCharts/Charts/FCF_MSLine.swf", "ChartId", "800", "250");
		   	 	 chart.setDataURL(escape(contextPath + "/tjbb/loadFaqkXmlData.action?queryBean.tjyf=" + tjyf + "&queryBean.orgcode=" + orgcode + "&queryBean.orgname=" + orgname));		   
		   	 	 chart.setTransparent(true);
		   	 	 chart.render("chartdiv");
		 	}
	</script>
	<creator:box>
		<form id="queryForm" method="post">
			<cps:PanelView>
				<cps:tbar>
					<cps:button value="查询" onclick="queryList();"></cps:button>
					<cps:button value="导出" onclick="exportPcsjbqkList()"></cps:button>
				</cps:tbar>
				<cps:panel title="派出所情况查询">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="15%">统计单位：</cps:tdLabel>
							<cps:tdContent width="35%">
								<input type="hidden" id="orgcode" name="queryBean.orgcode"> 
								<cps:textfield id="orgname" name="queryBean.orgname" onclick="openSelectOrg('430000000000','orgcode','orgname')" appendPopuBtn="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="15%">统计月份：</cps:tdLabel>
							<cps:tdContent width="35%">
								<cps:date id="tjyf" name="queryBean.tjyf" dateFmt="yyyyMM" maxDate="$"></cps:date>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:panel>
			</cps:PanelView>
		</form>
		<div id="chartdiv" align="center"></div>
		<cps:tableGrid id="yeartablegrid" title="统计单位年度汇总"  width="100%"
				url="/tjbb/queryFaqkYearTjbb.action" 
				searchform="queryForm"
				mutilSelect="false"
				pageSize="20"
				autoload="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="tjyf" title="发案月份"></cps:column>
			<cps:column field="xsaj" title="刑事案件"></cps:column>
			<cps:column field="zaaj" title="行政案件"></cps:column>
			<cps:column field="qjajs" title="抢劫案"></cps:column>
			<cps:column field="qdajs" title="抢夺案"></cps:column>
			<cps:column field="rsdqaj" title="入室盗窃案"></cps:column>
			<cps:column field="dqjdclaj" title="盗抢机动车"></cps:column>
		</cps:tableGrid>
		<cps:tableGrid id="pcstablegrid" title="统计单位辖区汇总"  width="100%"
				url="/tjbb/queryFaqkPageResult.action" 
				searchform="queryForm"
				mutilSelect="false"
				pageSize="20"
				autoload="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="orgname" title="单位名称" maxlength="15" width="120"></cps:column>
			<cps:column field="xsaj" title="刑事案件"></cps:column>
			<cps:column field="zaaj" title="行政案件"></cps:column>
			<cps:column field="qjajs" title="抢劫案"></cps:column>
			<cps:column field="qdajs" title="抢夺案"></cps:column>
			<cps:column field="rsdqaj" title="入室盗窃案"></cps:column>
			<cps:column field="dqjdclaj" title="盗抢机动车"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>