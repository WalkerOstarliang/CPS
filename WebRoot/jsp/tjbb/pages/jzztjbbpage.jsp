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
		function(orgbeans){
			if (orgbeans != null) 
			{
				$("#orgcode").val(orgbeans.id);
				$("#orgname").val(orgbeans.name);
				$("#leve").val(orgbeans.leve);
			}
		});
}

function queryJzztjbbPage()
{
	var orgcode = $("#orgcode").val();
	var tjqsrq  = $("#tjqsrq").val();
	var tjjzrq = $("#tjjzrq").val();
	if (!$.isBlank(orgcode))
	{
		if (!$.isBlank(tjqsrq) && !$.isBlank(tjjzrq))
		{
			layer.load(0);
			$("#queryParam").attr("action",contextPath + "/tjbb/toJzztjbbPage.action");
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

function exportJzztjbb()
{
	var orgcode = $("#orgcode").val();
	var tjqsrq  = $("#tjqsrq").val();
	var tjjzrq = $("#tjjzrq").val();
	if (!$.isBlank(orgcode))
	{
		if (!$.isBlank(tjqsrq) && !$.isBlank(tjjzrq))
		{
			$("#queryParam").attr("target","_blank");
			$("#queryParam").attr("action",contextPath + "/tjbb/exportJzztjbbPage.action");
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
				<cps:button value="查询" onclick="queryJzztjbbPage()"></cps:button>
				<cps:button value="重置" type="reset"></cps:button>
				<cps:button value="导出" onclick="exportJzztjbb()"></cps:button>
			</cps:tbar>
			<cps:panel title="居住证统计报表">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>统计单位：</cps:tdLabel>
						<cps:tdContent width="35%">
							<input type="hidden" name="jzztjbbBean.orgcode" id="orgcode" value="${jzztjbbBean.orgcode }"/>
							<input type="hidden" name="jzztjbbBean.leve" id="leve" value="${jzztjbbBean.leve}" />
							<cps:textfield id="orgname" name="jzztjbbBean.orgname" value="${jzztjbbBean.orgname}" onclick="orgSelect()" required="true" appendPopuBtn="true"/>&nbsp;
						</cps:tdContent>
						<cps:tdLabel  width="12%"><font color="red">*</font>统计时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="tjqsrq" name="jzztjbbBean.tjqsrq" dateFmt="yyyyMMdd" value="${jzztjbbBean.tjqsrq}" cssStyle="width:40%" minDate="2011-08-01"></cps:date>
							至
							<cps:date id="tjjzrq" name="jzztjbbBean.tjjzrq" dateFmt="yyyyMMdd" value="${jzztjbbBean.tjjzrq}" cssStyle="width:40%" maxDate="$"></cps:date>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
			</cps:panel>
		</cps:PanelView>
		<creator:panel id="gabtjbb" title="居住证统计报表">
			<table class="cps_exportxls" width="100%" border="0" cellpadding="0" cellspacing="0">
			   <tr>
			   		<th rowspan="2" width="30px">序<br/>号</th>
				    <th rowspan="2" width="120px">单位</th>
				    <th colspan="5">居住证办证数（不包含废证数）</th>
				    <th colspan="2">废证</th>
				    <th colspan="2">遗失补领</th>
				    <th rowspan="2" width="80px">办证率</th>
			   </tr>
			   <tr height="19">
				    <th>总数</th>
				    <th>本省人数</th>
				    <th>外省人数</th>
				    <th>男</th>
				    <th>女</th>
				    <th>废证数</th>
				    <th>废证率</th>
				    <th>补领数</th>
				    <th>补领率</th>
			   </tr>
			   <c:forEach items="${jzztjbbBeans}" var="bean" varStatus="st">
				   <tr>
				   		<td>${st.index + 1 }</td>
					    <td>${bean.orgname }</td>
					    <td>${bean.zbzs}</td>
					    <td>${bean.bsbzrs}</td>
					    <td>${bean.wsbzrs}</td>
					    <td>${bean.nanbzrs}</td>
					    <td>${bean.nvbzrs}</td>
					    <td>${bean.fzs}</td>
					    <td>${bean.fzl}</td>
					    <td>${bean.ysbls}</td>
					    <td>${bean.ysbll}</td>
					    <td>${bean.bzl}</td>
				   </tr>
			   </c:forEach>
			    <tr height="100">
			   		<td colspan="12" align="left" style="color: red">
			   			<div style="text-align: left;padding-left: 2px">
						说明：<br/>
						1：居住证办证数(不包含废证) :是指统计时段内所登记的流动人口，在统计时段内办理了多少居住证(只要办理就算);<br/>
						2：废证率：指统计时段内 错证重打/所有打证数。<br/>
						3：遗失补领率：统计时段内 遗失补证/所有打证数。<br/>
						4、办证率：统计时候内 办证数（登记数）/ 流口数。<br/>
						5、统计时间最早只能从2014-08-01开始 <br/>
						</div>
			   		</td>
			   </tr>
			</table>
		</creator:panel>
	</form>	
</creator:box>
</creator:view>