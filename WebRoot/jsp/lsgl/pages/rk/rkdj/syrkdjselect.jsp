<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
	<script type="text/javascript">
		function openRkDjSelectFwPage()
		{
			var zjhm = $("#zjhm").val();
			var presfzh = $("#prequerysfzh").val();
			if (zjhm != presfzh)
			{
				alert("请先进行查询");
			}
			else
			{
				$.openWindow({
					url : contextPath + "/lsgl/rk/toSyrkInfoPage.action",
					data : {
						"operType" : "add",
						"queryBean.fwid" : $("#fwid").val(),
						"queryBean.sfzh" : $("#zjhm").val()
					},
					width:1000,
					height:700
				})
			}
		}
		
		function openJwrkDjPageInfo()
		{
			$.openWindow({
				url : contextPath + "/lsgl/rk/toRkInfoPage.action?a=b&operType=add&=4&=19739759&queryBean.sfzh=&t=1395993588281",
				data : {
					"operType" : "add",
					"queryBean.rylb" : "4",
					"queryBean.fwid" : $("#fwid").val()
				},
				width:1000,
				height:700
			});
		}
		
		function queryRkListBySfzh()
		{
			var zjhm = $("#zjhm").val();
			if (zjhm != null && zjhm != "")
			{
				$("#rktablegrid").query("F","queryForm",function(){
					$("#prequerysfzh").val(zjhm);
				});
			}
			else
			{
				alert("请输入身份证号码查询。");
			}
		}
	</script>
	<creator:box>
		<form id="queryForm">
			<input type="hidden" id="prequerysfzh" value=""/>
			<cps:PanelView>
				<cps:tbar>
					<cps:button value="查询" onclick="queryRkListBySfzh()"></cps:button>
					<cps:button value="重置" onclick="reset()"></cps:button>
					<cps:button value="实有人口登记" onclick="openRkDjSelectFwPage()"></cps:button>
					<cps:button value="境外人口登记" onclick="openJwrkDjPageInfo()"></cps:button>
				</cps:tbar>
				<cps:panel id="fwquerypanel" title="实有人口登记之人员查找" >
					<input type="hidden" id="fwid" name="queryBean.fwid" value="${queryBean.fwid}">					 
					<cps:table>
						<cps:row>
							<cps:tdLabel width="10%">证件种类：</cps:tdLabel>
							<cps:tdContent width="25%">
								 <cps:select zdlb="GB_ZJZL" id="zjzl" name="queryBean.zjzl" value="111" ></cps:select>
							</cps:tdContent>
							<cps:tdLabel width="10%">证件号码：</cps:tdLabel>
							<cps:tdContent width="25%">
								 <cps:textfield id="zjhm" name="queryBean.zjhm"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
							<cps:tdContent >
								&nbsp;
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:panel>
			</cps:PanelView>
		</form>
		<cps:tableGrid id="rktablegrid"  
				title="实有人口查询列表"
				url="/lsgl/rk/queryRkInfoBySfzh.action" 
				searchform="queryForm"
				mutilSelect="false"
				autoload="false"
				width="99.8%">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="xm" title="姓名" ></cps:column>
			<cps:column field="sfzh" title="身份证号"></cps:column>
			<cps:column field="xbms" title="性别"></cps:column>
			<cps:column field="csrq" title="出生日期"></cps:column>
			<cps:column field="hjdqhmc" title="户籍地区划"  align="left" maxlength="5"></cps:column>
			<cps:column field="hjdxz" title="户籍地详址" align="left" maxlength="8"></cps:column>
			<cps:column field="xzzxz" title="现住地" align="left" maxlength="8"></cps:column>
			<cps:column field="lxdh" title="联系电话"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>