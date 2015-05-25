<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:box>
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

function queryList()
{
	var orgcode = $("#orgcode").val();
	if (orgcode == null || orgcode == "")
	{
		alert("请选择统计单位.");
		return false;
	}
	var tjrq  = $("#tjrq").val();
	if (tjrq == null || tjrq == "")
	{
		alert("请选择统计时间");
		return false;
	}
	var tjlb = $("#tjlb").val();
	if (tjlb == null || tjlb == "")
	{
		alert("请现在统计类别");
		return false;
	}
	$.post(contextPath + "/tjbb/loadWeekTablePage.action",$("#queryParam").serialize(),function(datahtml){
		$("#weektjbbdiv").html(datahtml);
	});
}

function exporttjbb()
{
	$("#queryParam").attr("target","_blank");
	$("#queryParam").attr("action",contextPath + "/tjbb/toExportWeektjqkPage.action");
	$("#queryParam").submit();
	$("#queryParam").removeAttr("target");
	$("#queryParam").removeAttr("action");
}

</script>
 	<creator:Style href="/jsp/tjbb/css/weekqktj.css"></creator:Style>
	<form id="queryParam" method="post">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" onclick="queryList()"></cps:button>
				<cps:button value="重置" type="reset"></cps:button>
				<cps:button value="导出" onclick="exporttjbb()"></cps:button>
			</cps:tbar>
			<cps:panel title="数据采集周未完成统计查询">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>统计单位：</cps:tdLabel>
						<cps:tdContent width="22%">
							<input type="hidden" name="weekBean.tjdwdm" id="orgcode"/>
							<input type="hidden" name="weekBean.leve" id="leve" />
							<cps:textfield id="orgname" onclick="orgSelect()" required="true" appendPopuBtn="true"/>&nbsp;
						</cps:tdContent>
						<cps:tdLabel width="12%"><font color="red">*</font>统计月份：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:date id="tjrq" name="weekBean.tjrq" dateFmt="yyyyMM" minDate="20150101" maxDate="$"></cps:date>
						</cps:tdContent>
						<cps:tdLabel width="12%">统计类别：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="tjlb" list="#{'2':'市州','3':'区县','4':'派出所','5':'警务区'}" name="weekBean.tjlb" cssClass="cps-select"></s:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6">
							<font color="red">
							说明：统计规则：<br/>
								1、每月按日历显示的星期日至星期六（即周日，周一，周二，周三，周四，周五，周六）计算，至查询月的最后一天止；<br>
								2、把每月分为4-6周不等，从本月的第一天算起到本月的第一个星期六为第一周，第一个星期六加一天到本月第二个星期六为第二周，其他依次类推；<br/>
								3、有效周是指大于4天（含）的周期，也就是说一周内必须有至少三个工作日，才算有效周。无效周内未采集数据的不会纳入周未完成任务数；<br/>
							</font>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
		
	</form>	
	<div id="weektjbb" class="creatorpanel" tbarId="" width="" height="" style="display:block;">
		<div id="head_gabtjbb" class="cps-box-title" style="text-align: left;">
			<div style="float:left">
				<span>
					&nbsp;数据周采集情况统计 
				</span>
			</div>
			<div id="tbar_gabtjbb" style="float:right;padding-right: 5px;">
			</div>
		</div>
		<div id="weektjbbdiv" class="creatorpanelcontent" style="overflow-x:auto;overflow-y:hidden;">
		</div>
	</div>
</creator:box>
</creator:view>