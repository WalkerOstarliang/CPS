<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/afgl/js/sqjbxxlist.js"></creator:Script>
<script type="text/javascript">
	function qyCzRowCallback(tdObj,rowdata)
	{
		var html = "";
		html += "<span style=\"color:green\" onclick=\"openSqJbxxInfo('detail','" + rowdata["sqbh"] + "')\" class=\"cps_span_href\">详情</span>&nbsp;";
		return html;
	}
	
	function openSelectJwqWin()
	{
		openJwsqSelectWin(function(jwqobj){
			$("#tojwqdm").val(jwqobj["dm"]);
			$("#tojwqmc").val(jwqobj["mc"])
		});
	}
	
	function xzqhBgQy()
	{
		var tosqmc = $("#tosqmc").val();
		var tosqdm = $("#tosqdm").val();
		var tojwqdm	= $("#tojwqdm").val();
		if (tosqdm != null && tosqdm != "")
		{
			var selecteds = $("#datagridList").getSelected();
			if (selecteds.length > 0 && selecteds.length<=10)
			{
				if (confirm("你确定要把选中的实体迁移到" + tosqmc +"吗?"))
				{
					var stids = [];
					$.each(selecteds,function(i,selected){
						stids.push(selected["id"]);
					});
					$.ajax({
						type : "post",
						url : contextPath + "/xtgl/stxx/executeStxxChange.action",
						data : "stids="+stids.join(",") + "&toSqdm=" + tosqdm + "&tojwqdm=" + tojwqdm,
						dataType : "json",
						timeout : 1200000,
						success : function(result)
						{
							if (result == true)
							{
								alert("实体迁移成功.");
								$("#datagridList").query("F","searchform");
							}
						}
					});
					
				}
			}
			else if (selecteds.length >= 10)
			{
				alert("一次最多只能迁移10条记录.");
			}
			else 
			{
				alert("请选择要迁出的实体记录");
			}
		}
		else
		{
			alert("请选择要迁入的社区.");
		}
	}
	
</script>
<creator:box>
	<form id="xldqueryform">
		<creator:tbar id="sqxxdj">
			<cps:button value="查&nbsp;询" onclick="jxQuery()"></cps:button>
			<cps:button value="重&nbsp;置" type="reset"></cps:button>
			<cps:button value="迁移" onclick="xzqhBgQy()"></cps:button>
		</creator:tbar>
		<creator:panel id="xldcx" title="社区信息登记" tbarId="sqxxdj">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="25%">
							<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQuery)"></s:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">县区局：</cps:tdLabel>
						<cps:tdContent width="25%">
							<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxQuery)"></s:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">派出所：</cps:tdLabel>
						<cps:tdContent width="25%">
							<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="jxQuery()"></s:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
						</cps:tdContent>
						<cps:tdLabel>社区名称：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="sqmc" name="queryBean.sqmc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>&nbsp;</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
	</form>
 	<creator:tbar id="xzqhqytbar">
 		<label>迁入警务区:</label>
 		<input type="hidden" id="tojwqdm"/>
 		<cps:textfield id="tojwqmc" value="请选择迁入警务区" appendPopuBtn="true" cssStyle="width:200px" onclick="openSelectJwqWin()"  onfocus="if(this.value == '请选择迁入警务区') this.value=''" onblur="if(this.value == null || this.value == '') this.value='请选择迁入警务区'" ></cps:textfield>
 	</creator:tbar>
	<cps:tableGrid id="xldquerylist" title="社区列表"
				mutilSelect="true" 
				tbarId="xzqhqytbar"
				width="99.8%"
				url="/afgl/sqjbgl/querySqJbxxBeanList.action" 
				searchform="xldqueryform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="qyCzRowCallback" align="left"></cps:column>
		<cps:column field="jc" title="社区名称"></cps:column>
		<cps:column field="sspcsmc" title="所属派出所" align="left" maxlength="7"></cps:column>
		<cps:column field="gxsqjwsmc" title="所属警务区" align="left" maxlength="15"></cps:column>
		<cps:column field="sqmjxm" title="社区民警" maxlength="3"></cps:column>
		<cps:column field="zxbs" title="状态" rowcallback="zxztRowCallback"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>