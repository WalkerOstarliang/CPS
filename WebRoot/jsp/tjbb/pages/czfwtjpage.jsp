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
	queryList();
}

function queryList()
{
	var orgcode = $("#orgcode").val();
	var tjqsrq  = $("#tjqsrq").val();
	var tjjzrq = $("#tjjzrq").val();
	if (orgcode != null && orgcode != "")
	{
		if (tjqsrq != null && tjqsrq != "" && tjjzrq != null && tjjzrq != "")
		{
			$("#czfwtjbbtablegrid").query("F","queryParam");
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
	$("#queryParam").attr("target","_blank");
	$("#queryParam").attr("action",contextPath + "/tjbb/exportCzfwTjbbPage.action");
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
				<cps:button value="导出" onclick="exportCzfwtjbb()"></cps:button>
			</cps:tbar>
			<cps:panel title="出租房屋屋统计报表">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>统计单位：</cps:tdLabel>
						<cps:tdContent width="35%">
							<input type="hidden" name="czfwtjbean.orgcode" id="orgcode" />
							<input type="hidden" name="czfwtjbean.leve" id="leve" />
							<cps:textfield id="orgname" name="czfwtjbean.orgname" onclick="orgSelect()" required="true" appendPopuBtn="true"/>&nbsp;
						</cps:tdContent>
						<cps:tdLabel  width="12%"><font color="red">*</font>统计时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="tjqsrq" name="czfwtjbean.tjqsrq" dateFmt="yyyyMMdd" value="20110920" cssStyle="width:40%" minDate="2011-09-20"></cps:date>
							至
							<cps:date id="tjjzrq" name="czfwtjbean.tjjzrq" dateFmt="yyyyMMdd" cssStyle="width:40%" maxDate="$"></cps:date>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
			</cps:panel>
		</cps:PanelView>
		<cps:tableGrid id="czfwtjbbtablegrid" url="/tjbb/queryCzfwtjbbPageResult.action" 
						pageSize="100" autoload="false" usepager="true" searchform="queryParam">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="orgname" title="单位名称" rowcallback="orgnameRowCallback" align="left"></cps:column>
			<cps:column field="czfzs" title="总数"></cps:column>
			<cps:column field="czwgfs" title="公房"></cps:column>
			<cps:column field="czwsfs" title="私房"></cps:column>
			<cps:column field="yczfs" title="已租房数"></cps:column>
			<cps:column field="qdzazrzs" title="签定治安责任状数"></cps:column>
			<cps:column field="ybazs" title="有备案证数"></cps:column>
			<cps:column field="ycqzs" title="有产权证数"></cps:column>
		</cps:tableGrid>
	</form>	
</creator:box>
</creator:view>