<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Style href="/template/cps/css/xls.css"></creator:Style>
<script type="text/javascript">
	
//单位选择
function orgSelect(){
	openDwSelect2({
		rootOrgCode : '430000000000',
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
}

function queryGabldrkPage()
{
	var orgcode = $("#orgcode").val();
	var tjyf  = $("#tjyf").val();
	if (orgcode != null && orgcode != "")
	{
		if (tjyf != null && tjyf != "")
		{
			layer.load(0);
			$("#queryParam").attr("action",contextPath + "/tjbb/toGabzzrktjbbPage.action");
			$("#queryParam").submit();
		}
		else
		{
			alert("请选择统计时间");
		}
	}
	else
	{
		alert("请选择统计单位.");
	}
}

function exportCzfwtjbb()
{
	var orgcode = $("#orgcode").val();
	var tjyf  = $("#tjyf").val();
	if (orgcode != null && orgcode != "")
	{
		if (tjyf != null && tjyf != "")
		{
			$("#queryParam").attr("target","_blank");
			$("#queryParam").attr("action",contextPath + "/tjbb/exportGabzzrktjbbPage.action");
			$("#queryParam").submit();
			$("#queryParam").removeAttr("target");
			$("#queryParam").removeAttr("action");
		}
		else
		{
			alert("请选择统计时间");
		}
	}
	else
	{
		alert("请选择统计单位.");
	}
	
}

</script>
<creator:box>
	<form id="queryParam" method="post">
		<input type="hidden" name="exeucte" value="1">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" onclick="queryGabldrkPage()"></cps:button>
				<cps:button value="重置" type="reset"></cps:button>
				<cps:button value="导出" onclick="exportCzfwtjbb()"></cps:button>
			</cps:tbar>
			<cps:panel title="公安部流口统计报表">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>统计单位：</cps:tdLabel>
						<cps:tdContent width="35%">
							<input type="hidden" name="zzrktjbbBean.orgcode" value="${zzrktjbbBean.orgcode }" id="orgcode" />
							<input type="hidden" name="zzrktjbbBean.leve" id="leve" value="${zzrktjbbBean.leve }"/>
							<cps:textfield id="orgname" name="zzrktjbbBean.orgname" value="${zzrktjbbBean.orgname}" onclick="orgSelect()" required="true" appendPopuBtn="true"/>&nbsp;
						</cps:tdContent>
						<cps:tdLabel  width="12%"><font color="red">*</font>统计时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="tjyf" name="zzrktjbbBean.tjyf" value="${zzrktjbbBean.tjyf}" dateFmt="yyyyMM" cssStyle="width:40%" minDate="2014-12-01"></cps:date>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
			</cps:panel>
		</cps:PanelView>
		<creator:panel id="gabtjbb" title="公安部流口统计报表列表">
			<cps:table >
				<cps:row>
					<cps:tdLabel rowspan="3" cssStyle="text-align:center" width="20">序<br/>号</cps:tdLabel>
					<cps:tdLabel rowspan="3" cssStyle="text-align:center" width="50">分类</cps:tdLabel>
					<cps:tdLabel rowspan="3" cssStyle="text-align:center">合计</cps:tdLabel>
					<cps:tdLabel colspan="2" cssStyle="text-align:center">性 别</cps:tdLabel>
					<cps:tdLabel colspan="3" cssStyle="text-align:center">暂 住 时 间</cps:tdLabel>
					<cps:tdLabel colspan="6" cssStyle="text-align:center">来 自 地 区</cps:tdLabel>
					<cps:tdLabel colspan="6" cssStyle="text-align:center">居 住 处 所</cps:tdLabel>
				</cps:row>
				<cps:row>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">男</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">女</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">半以<br/>年下</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">半年<br/>至<br/>五年</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">五以<br/>年上</cps:tdLabel>
					<cps:tdLabel colspan="2" cssStyle="text-align:center">省内</cps:tdLabel>
					<cps:tdLabel colspan="2" cssStyle="text-align:center">省外</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">港<br/>澳<br/>台</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">国<br/>外</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">旅<br/>居</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">居<br/>民<br/>家<br/>中</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">单<br/>位<br/>内<br/>保</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">工<br/>地<br/>现<br/>场</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">租<br/>赁<br/>房<br/>屋</cps:tdLabel>
					<cps:tdLabel rowspan="2" cssStyle="text-align:center">其<br/>他</cps:tdLabel>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="text-align:center">市</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">县</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">市</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">县</cps:tdLabel>
				</cps:row>
				<c:forEach items="${zzrktjbbBeans}" var="bean" varStatus="st">
					<cps:row>
						<cps:tdContent cssStyle="text-align:center">${st.index + 1}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.jzsymc}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.hj}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.xbmnum}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.xbwnum}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.njzqxbnyxnum}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.njzqxbnzwnnum}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.njzqxwnys}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.hjdlxsns}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.hjdlxsnx}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.hjdlxsws}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.hjdlxswx}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.hjdlxgat}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.hjdlxgw}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.zzcslj}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.zzcsjmjz}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.zzcsdwnb}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.zzcsgdxc}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.zzcszlfw}</cps:tdContent>
						<cps:tdContent>&nbsp;${bean.zzcsqt}</cps:tdContent>
					</cps:row>
				</c:forEach>
			</cps:table>
		</creator:panel>
	</form>	
</creator:box>
</creator:view>