<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/dzgl/js/dzxx.js"></creator:Script>
	<script type="text/javascript">
		MapServicesUrl = "${mapServicesUrl}";
		$(function(){
			$.maxWindow();
			//var countrydm = $("#countrydm").val();
			//if (!$.isBlank(countrydm))
			//{
			//	doubleSelectJdxz(countrydm + "","jdxzdm");
			//}
			
			var docheight = $(document).height();
			$("#MainMap").height(docheight - $("#stxxquerypanel").height() - $("#datagridList").height() - 40);
		});
	</script>
	<creator:tbar id="rwtbar">
		<cps:button value="查&nbsp;询" onclick="clickQuery();"></cps:button> 
		<cps:button value="重&nbsp;置" type="reset"></cps:button>
		<cps:button value="新增实体" onclick="openStxxDetailInfoPage('add')"></cps:button> 
		<%--
		<cps:button value="新增地址" onclick="openDzxxDetailInfo('add')"></cps:button> 
		 --%>
		<cps:button value="新增房屋" onclick="openAddFwInfoWin('add')"></cps:button> 
		<cps:button value="选择房屋" onclick="openSelectFwInfoWin('add')"></cps:button>
	</creator:tbar>
	<creator:box>
		<form method="post" id="searchform">
		<input type="hidden" id="executequery" value="false">
		<creator:panel id="stxxquerypanel" title="实体查询111" tbarId="rwtbar">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:select id="citydm" 
										list="${cityXzqhList}" 
										name="queryBean.citydm" 
										value="${queryBean.citydm}" 
										listKey="dm" 
										disabled="${queryBean.citydisabled}" 
										listValue="mc" 
										hideValue="true"
										headerKey="" headerValue=" " 
										onchange="doubleSelectCountry(this.value,'countrydm',queryTableGrid);return false;">
							</cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">县/区：</cps:tdLabel>
						<cps:tdContent width="22%">
							 <cps:select id="countrydm" 
							 			list="${countryXzqhList}" 
							 			name="queryBean.countrydm" 
							 			value="${queryBean.countrydm}" 
							 			hideValue="true" 
							 			disabled="${queryBean.countrydisabled}" 
							 			listKey="dm" 
							 			listValue="mc" 
							 			headerKey="" 
							 			headerValue=" " 
							 			onchange="doubleSelectJdxz(this.value,'jdxzdm',queryTableGrid)">
							 </cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">街道/乡镇：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select id="jdxzdm" 
							 			list="${xzjdqhList}"  
							 			name="queryBean.jdxzdm" 
							 			value="${queryBean.jdxzdm}" 
							 			listKey="dm" 
							 			listValue="jc" 
							 			headerKey="" 
							 			headerValue=" " 
							 			onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',queryTableGrid)" >
							 </cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">社区/村：</cps:tdLabel>
						<cps:tdContent width="22%">
							 <cps:select id="sqdm" 
							 			list="${sqJbxxList}"  
							 			name="queryBean.sqdm" 
							 			value="${queryBean.sqdm}" 
							 			listKey="dm" 
							 			listValue="jc" 
							 			headerKey="" 
							 			headerValue=" " 
							 			onchange="queryTableGrid()" >
							 </cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">街路巷：</cps:tdLabel>
						<cps:tdContent width="22%">
							 <input type="hidden" id="jlxdm" name="queryBean.jlxdm"/>
							 <cps:textfield id="jlxmc" appendPopuBtn="true" readonly="true" onclick="openJlxSelect(setSelectJlxValue)"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">实体名称：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="stmc" name="queryBean.stmc" onblur="queryTableGrid()"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					 
					<cps:row>
						<cps:tdLabel>门牌号：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="mph" name="queryBean.mph"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>小区(组)：</cps:tdLabel>
						<cps:tdContent>
							  <cps:textfield id="xqz" name="queryBean.xqz"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>楼栋详址：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="ldxz" name="queryBean.ldxz"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
		</form>
		<creator:panel id="dtbzpanel" title="地图展示">
			<div style="float:left;width:55%;">
					<iframe id="MainMap" src="${pgisiframeurl}" width="100%" scrolling="no" frameborder="0" ></iframe>
			</div>
			<div style="float:right;width:44%;">
				<cps:tableGrid url="/dzgl/dzxx/queryStxxBeansPageResult.action" 
							id="datagridList"
							autoload="true"
							mutilSelect="false"
							click="clickRowCallback"
							searchform="searchform" 
							width="99.8%" pageSize="20">
					<cps:column isNumber="true" title="序号" ></cps:column>
					<cps:column isCheckbox="true"></cps:column>
					 
					<cps:column field="cz" title="操作" align="left"></cps:column>
					 
					<cps:column field="stmc" title="实体名称" align="left" maxlength="15"></cps:column>
					<%-- 
					<cps:column field="xzqhmc" title="行政区划" align="left"></cps:column>
					<cps:column field="jdxzmc" title="乡镇街道" align="left"></cps:column>
					<cps:column field="sqmc" title="社区村" align="left"></cps:column>
					<cps:column field="jlxmc" title="街路巷" align="left"></cps:column>
					<cps:column field="mph" title="门牌号" align="left"></cps:column>
					<cps:column field="xqz" title="小区组" align="left" maxlength="10"></cps:column>
					--%>
					<cps:column field="ldxz" title="楼栋详址" align="left" maxlength="10"></cps:column>
					
				</cps:tableGrid>
			</div>
		</creator:panel>
	</creator:box>
</creator:view>