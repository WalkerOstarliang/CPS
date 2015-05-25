<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view title="电动车信息">
	<creator:box>
		<div id="ddc_div">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="关闭" onclick="window.close();"></cps:button>
			</cps:tbar>
			<cps:panel title="电动车信息">
				<form id="ddcform">
					<input type="hidden" name="ddcjjbean.car_id" value="${ddcjjbean.car_id}" id="car_id" />
					<cps:table>
						<cps:row>
							<cps:tdLabel width="13%">电动车拥有人：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%--
								<cps:textfield id="car_holder" name="ddcjjbean.car_holder" value="${ddcjjbean.car_holder}" disabled="true"></cps:textfield>
							 --%>
							 	${ddcjjbean.car_holder}
							</cps:tdContent>
							<cps:tdLabel width="13%">号牌号码：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_num" name="ddcjjbean.car_num" value="${ddcjjbean.car_num}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_num}
							</cps:tdContent>
							<cps:tdLabel width="13%">品牌型号：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_brand" name="ddcjjbean.car_brand" value="${ddcjjbean.car_brand}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_brand}
							</cps:tdContent>
							
						</cps:row>	
						<cps:row>
							<cps:tdLabel width="13%">车架号：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_motor" name="ddcjjbean.car_motor" value="${ddcjjbean.car_motor}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_motor}
							</cps:tdContent>
							<cps:tdLabel width="13%">住址：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_addr" name="ddcjjbean.car_addr" value="${ddcjjbean.car_addr}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_addr}
							</cps:tdContent>
							<cps:tdLabel width="13%">联系电话：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_telephone" name="ddcjjbean.car_telephone" value="${ddcjjbean.car_telephone}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_telephone}
							</cps:tdContent>
							
						</cps:row>	
						<cps:row>
							<cps:tdLabel width="13%">档案编号：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_record" name="ddcjjbean.car_record" value="${ddcjjbean.car_record}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_record}
							</cps:tdContent>
							<cps:tdLabel width="13%">操作员：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_opername" name="ddcjjbean.car_opername" value="${ddcjjbean.car_opername}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_opername}
							</cps:tdContent>
							<cps:tdLabel width="13%">经办人：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_agent" name="ddcjjbean.car_agent" value="${ddcjjbean.car_agent}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_agent}
							</cps:tdContent>
							
						</cps:row>
						<cps:row>
							<cps:tdLabel width="13%">审核人：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_audit" name="ddcjjbean.car_audit" value="${ddcjjbean.car_audit}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_audit}
							</cps:tdContent>
							<cps:tdLabel width="13%">经办日期：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_agentdate" name="ddcjjbean.car_agentdate" value="${ddcjjbean.car_agentdate}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_agentdate}
							</cps:tdContent>
							<cps:tdLabel width="13%">所属区域：</cps:tdLabel>
							<cps:tdContent width="20%">
							<%-- 
								<cps:textfield id="car_isomuxms" name="ddcjjbean.car_isomuxms" value="${ddcjjbean.car_isomuxms}" disabled="true"></cps:textfield>
							--%>
								${ddcjjbean.car_isomuxms}
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</form>
			</cps:panel>
		</cps:PanelView>
		</div>
	</creator:box>
</creator:view>	