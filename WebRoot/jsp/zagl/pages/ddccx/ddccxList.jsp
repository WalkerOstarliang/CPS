<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view title="电动车列表">
	<!-- 电动车列表 -->
	<creator:box>
		<creator:Script src="/jsp/zagl/pages/ddccx/js/ddccxList.js"></creator:Script>
		<creator:tbar id="op">
			<cps:button value="查询" type="button" onclick="query()"></cps:button>
			 
			<cps:button value="导出" onclick="downloadDdcExcel()"></cps:button>
			
		</creator:tbar>
		<creator:panel id="cxtjpanel" title="查询条件" tbarId="op">
			<form id="ddccx">
				<cps:table> 	
				<input type="hidden" id="v_car_id" name="v_car_id"/> 
					<cps:row>
						<cps:tdLabel width="10%">品牌型号：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="car_brand" name="ddcjjquerybean.car_brand"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">拥有人：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="car_holder" name="ddcjjquerybean.car_holder"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
						<cps:tdContent width="25%">
								<cps:textfield id="car_telephone" name="ddcjjquerybean.car_telephone"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel width="10%">车牌号：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="car_num" name="ddcjjquerybean.car_num"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel width="10%">住址：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="car_addr" name="ddcjjquerybean.car_addr"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel width="10%">档案编号：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="car_record" name="ddcjjquerybean.car_record"></cps:textfield>
						</cps:tdContent>
						
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">车架号：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="car_motor" name="ddcjjquerybean.car_motor"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">经办人：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="car_agent" name="ddcjjquerybean.car_agent"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">审核人：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="car_audit" name="ddcjjquerybean.car_audit"></cps:textfield>
						</cps:tdContent>
						
					</cps:row>
					<cps:row>
						
						<cps:tdLabel width="10%">所属区域：</cps:tdLabel>
						<cps:tdContent width="25%">
						<cps:select id="car_isomux"  zdlb="GA_CAR_ISOMUXDM" name="ddcjjquerybean.car_isomux"  headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel>经办日期：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:date id="xssj_start"  dateFmt="yyyy-MM-dd" name="ddcjjquerybean.xssj_start" cssStyle="width:180px" maxDate="sysdate"  /> -
							<cps:date id="xssj_end"  dateFmt="yyyy-MM-dd" name="ddcjjquerybean.xssj_end" minDateDepend="xssj_start" cssStyle="width:180px" maxDate="sysdate"/>
						</cps:tdContent>
					</cps:row>
					
				</cps:table>
			</form>
		</creator:panel>

		<cps:tableGrid url="/zagl/ddccx/queryBeanList.action" title="查询结果--(不勾选默认导出查询的全部记录)"
			id="ddccxList" autoload="false" pageSize="10" width="99.8%"
			usepager="true" searchform="ddccx" autothead="false" mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="操作" field="cz" expand="false"  align="left" ></cps:column>
			<cps:column title="品牌型号" field="car_brand" align="left"  maxlength="15"></cps:column>
			<cps:column title="车牌号" field="car_num" align="left"  maxlength="15"></cps:column>
			<cps:column title="车架号" field="car_motor" align="left" maxlength="17"></cps:column>
			<cps:column title="档案编号" field="car_record" align="center"></cps:column>
			<cps:column title="拥有人" field="car_holder" ></cps:column>
			<cps:column title="住址" field="car_addr" align="left"></cps:column>
			<cps:column title="所属区域" field="car_isomuxms" align="left"></cps:column>
		</cps:tableGrid>
	</creator:box>
	
	<div style="display:none">
		<form id="exportform" target="exportiframe" method="post">
			
		</form>
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
</creator:view>

