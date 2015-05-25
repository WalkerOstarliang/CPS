<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/jzzxx.js"></creator:Script>
	<creator:box>
	<div class="Noprint">
		<form id="queryForm">
			<creator:panel id="jzzxxquerypanel" title="居住证信息查询" tbarId="jzztooltbar">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">身份证号码：</cps:tdLabel>
						<cps:tdContent width="50%">
							 <cps:textfield id="jzzsfzh" name="queryBean.jzzsfzh" cssStyle="width:100%"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent>
							<cps:button value="查询" onclick="queryJzzxxhcList();"></cps:button>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="3">
							<font color="red">
								注意：判断是否办理居住的条件为：查询后居住证信息列表中能找到居住证记录，并且其打印状态为“已制证”，才表示该人员已经办理居住证.
							</font>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</creator:panel>
		</form>
		<cps:tableGrid id="jzztablegrid"  
				title="居住证信息列表"
				url="/lsgl/jzzxx/queryLdrkJzzxxBeanPageInfo.action" 
				searchform="queryForm"
				mutilSelect="true"
				autoload="false"
				width="99.8%">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="jzzhccz" title="操作"></cps:column>
			<cps:column field="xm" title="姓名"></cps:column>
			<cps:column field="sfzh" title="身份证号码"></cps:column>
			<cps:column field="xbms" title="性别"></cps:column>
			<cps:column field="xzzxz" title="人员现住地详址" maxlength="5"></cps:column>
			<cps:column field="hjdxz" title="户籍详址" maxlength="5"></cps:column>
			<cps:column field="yxqxms" title="有效期(年)"></cps:column>
			<cps:column field="jzzdyztms" title="打印状态"></cps:column>
			<cps:column field="jzzzxbsms" title="注销标识"></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
		</cps:tableGrid>
		</div>
	</creator:box>
</creator:view>