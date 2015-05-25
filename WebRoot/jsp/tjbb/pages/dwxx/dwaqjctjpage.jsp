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
 

function queryList()
{
	var orgcode = $("#orgcode").val();
	if (orgcode == null || orgcode == "")
	{
		alert("请选择统计单位.");
		return false;
	}
	$("#queryParam").removeAttr("target");
	$("#queryParam").attr("action",contextPath + "/tjbb/toDwAqjctjbbPage.action")
	$("#queryParam").submit();
}

function exporttjbb()
{
	var orgcode = $("#orgcode").val();
	if (orgcode == null || orgcode == "")
	{
		alert("请选择统计单位.");
		return false;
	}
	$("#queryParam").attr("target","_blank");
	$("#queryParam").attr("action",contextPath + "/tjbb/exportDwAqjcPage.action");
	$("#queryParam").submit();
}

</script>
<creator:box>
	<form id="queryParam" method="post" action="<c:url value='/tjbb/toDwAqjctjbbPage.action'/>">
		<cps:PanelView>
			<cps:panel title="数据录入统计查询">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>统计单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="aqjctjBean.orgcode" id="orgcode" value="${aqjctjBean.orgcode }"/>
							<input type="hidden" name="aqjctjBean.leve" id="leve" value="${aqjctjBean.leve }"/>
							<cps:textfield id="orgname" name="aqjctjBean.orgname" value="${aqjctjBean.orgname}" onclick="orgSelect()" required="true" appendPopuBtn="true"/>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="2" align="center">
							<cps:button value="查询" onclick="queryList()"></cps:button>
							<cps:button value="重置" type="reset"></cps:button>
							<cps:button value="导出" onclick="exporttjbb()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
	<cps:PanelView>
	<cps:panel title="单位安全检查统计表">
		<div class="cps-panel-content" id="datatjtablegrid" style="width: 100%;">
			<table width="100%" class="cps-tablegrid" id="table_datatjtablegrid" border="0" cellSpacing="0" cellPadding="0">
				<tr>
					<th rowspan="2">序号</th>
					<th rowspan="2">单位名称</th>
					<th rowspan="2">总数</th>
					<th colspan="11">特种行业</th>
					<th colspan="3">检查类别</th>
					<th colspan="2">整改情况</th>
					<th rowspan="2">发现<br/>问题数</th>
					<th rowspan="2">警<br/>告</th>
					<th rowspan="2">罚<br/>款</th>
					<th rowspan="2">下发<br/>隐患<br/>通知书</th>
					<th rowspan="2">吊销<br/>许可证</th>
					<th rowspan="2">其<br/>他</th>
				</tr>
				<tr>
					<th>特行</th>
					<th>公场</th>
					<th>内保</th>
					<th>危险品</th>
					<th>网吧</th>
					<th>涉外</th>
					<th>旅馆</th>
					<th>开锁</th>
					<th>商铺</th>
					<th>物流</th>
					<th>其他</th>
					
					<th>总数</th>
					<th>消防</th>
					<th>治安</th>
					
					<th>已整改</th>
					<th>未整改</th>
				</tr>
				<c:if test="${not empty aqjctjBeans}">
					<c:forEach items="${aqjctjBeans}" var="bean" varStatus="st">
						<tr>
							<td>${st.index + 1}</td>
							<td align="left">${bean.orgname }</td>
							<td>${bean.zs }</td>
							<td>${bean.thjcs }</td>
							<td>${bean.gcjcs }</td>
							<td>${bean.nbjcs }</td>
							<td>${bean.wxpjcs }</td>
							<td>${bean.wbjcs }</td>
							<td>${bean.swjcs }</td>
							<td>${bean.lgjcs }</td>
							<td>${bean.ksjcs }</td>
							<td>${bean.spjcs }</td>
							<td>${bean.wljcs }</td>
							<td>${bean.qtjcs }</td>
							<td>${bean.jclbzjcs }</td>
							<td>${bean.xfjcs }</td>
							<td>${bean.aqjcs }</td>
							<td>${bean.yzgqks }</td>
							<td>${bean.wzgqks }</td>
							<td>${bean.fxwts }</td>
							<td>${bean.jgs }</td>
							<td>${bean.fks }</td>
							<td>${bean.xfyhtzs }</td>
							<td>${bean.dxxkzs }</td>
							<td>${bean.qts }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</cps:panel>
	</cps:PanelView>
	 
</creator:box>
</creator:view>