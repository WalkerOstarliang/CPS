<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view title="从业人员查询">
	<script type="text/javascript">
		function queryImportCyry()
		{
			$("#importsyrklist").query("F","queryCyryForm");
		}
		
		function exportHcCyryListPage()
		{
			$("#queryCyryForm").attr("action",contextPath + "/lsgl/rkdr/exportSyrkImportHcPage.action");
			$("#queryCyryForm").attr("target","_blank");
			$("#queryCyryForm").submit();
		}
		
		function openSelectFwxx()
		{
			$.openDialogWindow({
				url : contextPath + "/lsgl/fw/toSelectFwWin.action",
				width:900,
				height:650,
				data : {
					"queryBean.rylb":"2",
					"queryBean.selectType" : "select", 
					t: new Date().getTime()
				},
				callback : function(resultObj)
				{
					if (resultObj)
					{
						var fwxxBean = resultObj["fwxxBean"];
						$("#fwid").val(fwxxBean["fwid"]);
						$("#dzmc").val(fwxxBean["dzmc"]);
					}
				}
			});
		}
		
		function execbsRowBack(tdObj,rowdata)
		{
			var vhtml = "";
			var execbs = rowdata["execbs"];
			if (execbs == "0")
			{
				vhtml = "待执行";
			}
			else if (execbs == "1")
			{
				vhtml = "已执行";
			}
			else if (execbs == "2")
			{
				vhtml = "执行发生错误";
			}
			return vhtml;
		}
	</script>
	<creator:box>
		<cps:PanelView>
			<cps:tbar>
				<cps:button id="cyryQueryButton" value="查询" onclick="queryImportCyry()"/>
				<cps:button value="导出" onclick="exportHcCyryListPage()"></cps:button>
			</cps:tbar>
			<cps:panel title="导入实有人口查询">
				<form id="queryCyryForm">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="12%">房屋地址：</cps:tdLabel>
							<cps:tdContent width="22%">
								<input type="hidden" id="fwid" name="syrkImportBean.fwid"/>
								<cps:textfield id="dzmc" name="syrkImportBean.dzmc" value="" onclick="openSelectFwxx()" appendPopuBtn="true"/>
							</cps:tdContent>
							<cps:tdLabel width="12%">错误标示：</cps:tdLabel>
							<cps:tdContent width="22%">
								<s:select list="#{'0':'未验证','1':'验证错误','2':'验证成功'}" id="errorbs" name="syrkImportBean.errorbs" cssClass="cps-select" headerKey="" headerValue=" "></s:select>
							</cps:tdContent>
							<cps:tdLabel width="12%">执行标示：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'0':'待执行','1':'已执行','2':'执行错误'}" id="execbs" name="syrkImportBean.execbs" cssClass="cps-select"  headerKey="" headerValue=" "></s:select>
							</cps:tdContent>
						</cps:row>					
						<cps:row>
							<cps:tdLabel>导入日期：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<cps:date id="drsjstart" name="syrkImportBean.drsjstart" dateFmt="yyyy-MM-dd" cssStyle="width:15%"></cps:date>
								-
								<cps:date id="drsjend" name="syrkImportBean.drsjend" dateFmt="yyyy-MM-dd" cssStyle="width:15%"></cps:date>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent colspan="6">
								<font color="red">
									说明：此功能是对批量导入的实有人口信息进行核查，查看是否验证成功，是否成功执行，并导出错误记录再次重新导入。<br/>
									功能：实有人口批量导入功能入口，实有人口登记-->实有人口导入(按钮点击)-->查找房屋地址-->批量导入人口(按钮点击) <br/>
									或者  房屋信息管理-->选择房屋地址-->实有人口导入(按钮点击)
								</font>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</form>
			</cps:panel>
		</cps:PanelView>
		<cps:tableGrid id="importsyrklist"
				url="/lsgl/rkdr/querySyrkImportHcPageResult.action" 
				autoload="false" 
				width="99.9%"
				title="导入的实有人口列表"
				searchform="queryCyryForm">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="dzmc" title="房屋地址" maxlength="15"></cps:column>
			<cps:column field="xm" title="姓名"></cps:column>
			<cps:column field="sfzh" title="身份证号码"></cps:column>
			<cps:column field="lxdh" title="电话号码"></cps:column>
			<cps:column field="jzsj" title="居住时间"></cps:column>
			<cps:column field="jzsy" title="居住事由"></cps:column>
			<cps:column field="jzcs" title="居住处所"></cps:column>
			<cps:column field="yhzgx" title="与户主关系"></cps:column>
			<cps:column field="njzqx" title="拟居住期限"></cps:column>
			<cps:column field="execbs" title="执行状态" rowcallback="execbsRowBack"></cps:column>
			<cps:column field="errorInfo" title="错误信息"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>