<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="从业人员登记查询">
<creator:Script src="/jsp/sydw/js/cyrydjpage.js"></creator:Script>
<creator:box>
	<form id="queryCyryForm">
		<input type="hidden" name="cyrycx.zxbs" value="0"/>
		<input type="hidden" name="cyrycx.jwsqdm" value="${loginInfo.orgcode }"/>
		<input type="hidden" id="jgbh" name="cyrycx.jgbh" value="${cyrycx.jgbh }"/>
		<input type="hidden" id="oldrylb">
		<input type="hidden" id="oldzjzl">
		<input type="hidden" id="oldzjhm">
		<input type="hidden" id="oldgj">
		<input type="hidden" id="oldywx">
		<input type="hidden" id="oldywm">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" onclick="clickQueryBtn()"></cps:button>
				<cps:button value="登记" onclick="clickCyryDjBtn('add')"></cps:button>
				<cps:button value="返回" onclick="history.go(-1)"></cps:button>
			</cps:tbar>
			<cps:panel id="cyryquery" title="从业人员登记查询">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">人员类别：</cps:tdLabel>
						<cps:tdContent width="22%">
							<s:select id="rylb" list="#{'0':'境内人员','1':'境外人员'}" name="cyrycx.sfjwry" cssClass="cps-select" onchange="changeRylb(value)"></s:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">证件类型：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:select id="zjzl" zdlb="GB_ZJZL" name="cyrycx.zjzl" value="111"></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">证件号码：</cps:tdLabel>
						<cps:tdContent>
						  	<cps:textfield id="zjhm" name="cyrycx.zjhm"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row id="otherrow" cssStyle="display:none">
						<cps:tdLabel width="10%">国籍：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:select id="gj" zdlb="GB_GJ" name="cyrycx.gj" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">英文姓：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:textfield id="ywx" name="cyrycx.ywx" />
						</cps:tdContent>
						<cps:tdLabel width="10%">英文名：</cps:tdLabel>
						<cps:tdContent>
						  	<cps:textfield id="ywm" name="cyrycx.ywm"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6">
							<font color="red">
								注意：当前从业人员只能查询到本辖区内的从业人员，输入条件进行查询，如果已经查询到了从业人员则将不能进行再次登记。
							</font>
						</cps:tdContent>
					</cps:row>
				</cps:table>
				<cps:tableGrid id="cyryList" title="从业人员列表"
					url="/zagl/dw/queryCyryPageResultInfo.action"
					autoload="false"
					isAsynch="true"
					width="99.8%"
					searchform="queryCyryForm"
					pageSize="10" 
					usepager="true" mutilSelect="false"
					autothead="false">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true" expand="false"></cps:column>
				<cps:column title="操作" field="cyrydjcz" align="left"></cps:column>
				<cps:column title="国籍" field="gjms"></cps:column>
				<cps:column title="证件类型" field="zjzlms"></cps:column>
				<cps:column title="证件号码" field="zjhm"></cps:column>
				<cps:column title="姓名" field="xmms" align="left"></cps:column>
				<cps:column title="性别" field="xbmc" align="left"></cps:column>
				<cps:column title="工作单位" field="dwmc" align="left" maxlength="10"></cps:column>
				<cps:column title="登记时间" field="djsj" maxlength="8"></cps:column>
				<cps:column title="注销标识" field="zxbs_mc" align="left"></cps:column>
			</cps:tableGrid>
			</cps:panel>
		</cps:PanelView>
	</form>
</creator:box> 
</creator:view>