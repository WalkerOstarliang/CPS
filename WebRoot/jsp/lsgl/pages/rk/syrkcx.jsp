<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
	<creator:panel id="fwquerypanel" title="房屋查询条件">
		<form id="queryForm">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">身份证号：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield name="queryBean.sfzh"></cps:textfield>
					</cps:tdContent>
				</cps:row>

				<cps:row>
					<cps:tdContent colspan="2">
						<fieldset>
							<legend>
								人员类别
							</legend>
							<input type="radio" name="queryBean.rylb" value="1" id="czrk" />
							<label for="czrk">
								常住人口
							</label>
							<input type="radio" name="queryBean.rylb" value="2" id="ldrk" />
							<label for="ldrk">
								流动人口
							</label>
							<input type="radio" name="queryBean.rylb" value="3" id="wlhczrk" />
							<label for="wlhczrk">
								未落户常住人员
							</label>
							<input type="radio" name="queryBean.rylb" value="5" id="jzrk" />
							<label for="jzrk">
								寄住人口
							</label>
						</fieldset>
					</cps:tdContent>
				</cps:row>

				<cps:row>
					<cps:tdContent colspan="2" align="center">
						<cps:button value="查询" onclick="queryList();"></cps:button>
						<cps:button type="reset" value="重置"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>

	<creator:tbar id="fwtooltbar">
		<cps:button value="新增" onclick="openRkInfo('add')"></cps:button>
	</creator:tbar>
	
	<cps:tableGrid id="rktablegrid" title="常住人口列表信息"
		url="/lsgl/rk/queryRkPageResultInfo.action" tbarId="fwtooltbar"
		searchform="queryForm" mutilSelect="false" autoload="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="xbms" title="性别"></cps:column>
		<cps:column field="csrq" title="出生日期"></cps:column>
		<cps:column field="hjdqhmc" title="户籍地区划"></cps:column>
		<cps:column field="hjdxz" title="户籍地详址" maxlength="10"></cps:column>
		<cps:column field="djrxm" title="登记人"></cps:column>
		<cps:column field="djsj" title="登记时间"></cps:column>
		<cps:column field="cz" title="操作"></cps:column>
	</cps:tableGrid>
	
	<div id="syrk_div">
		<%@include file="/jsp/lsgl/pages/rk/rkjbxx.jsp"%>
	</div>
</creator:view>