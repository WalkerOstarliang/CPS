<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
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

function orgnameRowCallback(tdObj,rowdata)
{
	var html = "";
	if (rowdata["leve"] != "5" && rowdata["orgcode"] != "999999999999")
	{
		html += "<span class=\"cps_span_href\" onclick=\"clickOrgName('" + rowdata["orgcode"] + "','" + rowdata["orgname"] + "','" + rowdata["leve"] + "')\">" + rowdata["orgname"] + "</span>";
	}
	else
	{
		html += "<span>" +  rowdata["orgname"] + "</span>";
	}
	return html;	
}

function clickOrgName(orgcode,orgname,leve)
{
	$("#orgcode").val(orgcode);
	$("#orgname").val(orgname);
	$("#leve").val(leve);
	$("#dwlx").val(parseInt(leve) + 1);
	queryList();
}

function queryList()
{
	var orgcode = $("#orgcode").val();
	if (orgcode == null || orgcode == "")
	{
		alert("请选择统计单位.");
		return false;
	}
	var tjqsrq  = $("#tjqsrq").val();
	var tjjzrq = $("#tjjzrq").val();
	if (tjqsrq == null || tjqsrq == "" || tjjzrq == null || tjjzrq == "")
	{
		alert("请选择统计时间");
		return false;
	}
	var dwlx = $("#dwlx").val();
	if (dwlx == null || dwlx == "")
	{
		alert("请现在统计类别");
		return false;
	}
	$("#datatjtablegrid").query("F","queryParam");
}

function exporttjbb()
{
	$("#queryParam").attr("target","_blank");
	$("#queryParam").attr("action",contextPath + "/tjbb/exportDataLrtjPage.action");
	$("#queryParam").submit();
	$("#queryParam").removeAttr("target");
	$("#queryParam").removeAttr("action");
}

</script>
<creator:box>
	<form id="queryParam" method="post">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" onclick="queryList()"></cps:button>
				<cps:button value="重置" type="reset"></cps:button>
				<cps:button value="导出" onclick="exporttjbb()"></cps:button>
			</cps:tbar>
			<cps:panel title="数据录入统计查询">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>统计单位：</cps:tdLabel>
						<cps:tdContent width="22%">
							<input type="hidden" name="dataQueryBean.orgcode" id="orgcode" />
							<input type="hidden" name="dataQueryBean.leve" id="leve" />
							<cps:textfield id="orgname" name="dataQueryBean.orgname" onclick="orgSelect()" required="true" appendPopuBtn="true"/>&nbsp;
						</cps:tdContent>
						<cps:tdLabel width="12%"><font color="red">*</font>统计时间：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:date id="tjqsrq" name="dataQueryBean.tjqsrq" dateFmt="yyyyMMdd" value="" cssStyle="width:40%" minDate="2015-01-01"></cps:date>
							至
							<cps:date id="tjjzrq" name="dataQueryBean.tjjzrq" dateFmt="yyyyMMdd" cssStyle="width:40%" maxDate="$"></cps:date>
						</cps:tdContent>
						<cps:tdLabel width="12%">统计类别：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="dwlx" list="#{'2':'市州','3':'区县','4':'派出所','5':'警务区'}" name="dataQueryBean.dwlx" cssClass="cps-select"></s:select>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
			</cps:panel>
		</cps:PanelView>
		<cps:tableGrid id="datatjtablegrid" 
						url="/tjbb/queryDataLrtjPageResult.action" 
						pageSize="15" 
						autoload="false" 
						usepager="true" 
						searchform="queryParam">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="orgname" title="单位名称" align="left"></cps:column>
			<cps:column field="zs" title="总数"></cps:column>
			<cps:column field="czrks" title="常口数"></cps:column>
			<cps:column field="ldrks" title="流口数"></cps:column>
			<cps:column field="jzrks" title="寄口数"></cps:column>
			<cps:column field="wlhrks" title="未落户数"></cps:column>
			<cps:column field="cyrys" title="从业人员数"></cps:column>
			<cps:column field="sydws" title="单位数"></cps:column>
			<cps:column field="stxxs" title="实体数"></cps:column>
			<cps:column field="fwxxs" title="房屋数"></cps:column>
			<cps:column field="sort" title="排名"></cps:column>
		</cps:tableGrid>
	</form>	
</creator:box>
</creator:view>