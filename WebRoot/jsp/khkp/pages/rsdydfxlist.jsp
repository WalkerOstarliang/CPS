<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%">
	<script type="text/javascript">
		function selectOrg(orgcode) {
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
							$("#orgcode").val(orgbeans.id);
							$("#orgname").val(orgbeans.name);
							$("#leve").val(orgbeans.leve);
						}
					});
			} else {
				alert("无效的机构代码")
			}
		}
		function clickQueryBtn()
		{
			var url = contextPath + "/khkp/rsdfx/loadRsdydfxList.action";
			$.post(url,$("#queryForm").serialize(),function(html){
				$("#fxlist").html(html);
			});
		}
		function clickExportXls()
		{
			var leve = $("#leve").val();
			var orgcode = $("#orgcode").val();
			window.open(contextPath + "/khkp/rsdfx/exportRsdydfxxls.action?queryBean.leve=" + leve + "&queryBean.orgcode=" + orgcode);
		}
		function clickDwHref(orgcode,orgname,leve)
		{
			//alert(orgcode + "==" + orgname + "==" + leve);
			$("#orgcode").val(orgcode);
			$("#orgname").val(orgname);
			$("#leve").val(leve);
			clickQueryBtn()
		}
	</script>
	<creator:box>
		<form id="queryForm" target="exportiframe">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" id="querybtn" onclick="clickQueryBtn()"></cps:button>
				<cps:button value="重置" type="reset"></cps:button>
				<cps:button value="导出" onclick="clickExportXls()"></cps:button>
			</cps:tbar>
			<cps:panel id="fwquerypanel" title="入室盗窃数据查询" >
				<cps:table>
					<cps:row>
						<cps:tdLabel width="15%"><font color='red'>*</font>分析单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="queryBean.leve" id="leve" value="2" />
							<input type="hidden" name="queryBean.orgcode" id="orgcode" value="430100000000" />
							<cps:textfield id="orgname" value="长沙市公安局" onclick="selectOrg('${currentXzqh}00000000')" required="true" appendPopuBtn="true"/>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
		<creator:panel id="rsdyfxpanel" title="入室盗窃数据查询结果">
			 <div class="cps-panel-content" id="fxlist">
			 	<table width="99.8%" class="cps-tablegrid" id="table_cxjgList" border="0" cellSpacing="0" cellPadding="0">
					<tr>
						<th>序号</th>
						<th>单位名称</th>
						<c:forEach items="${columns}" var="column">
							<th id="${column.key}">${column.value}</th>
						</c:forEach>
					</tr>
				</table>
			 </div>
		</creator:panel>
	</creator:box>
</creator:view>