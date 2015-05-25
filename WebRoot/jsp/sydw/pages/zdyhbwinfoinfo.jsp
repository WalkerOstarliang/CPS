<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="重点要害部位信息">
<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
<creator:Script src="/jsp/zagl/js/zdyhbw.js"></creator:Script>
<form id="dw_form">
<creator:tbar id="zdyhbw_op">
	<cps:button value="保存" onclick="saveZdyhbwBean()" />
	<cps:button value="关闭" type="button" onclick="window.close();" />
</creator:tbar>
<creator:panel id="zdyhbw_panel" title="重点要害部位" tbarId="zdyhbw_op">
	<div id="zdyhbw_div">
		<input type="hidden" name="dw.zdyhbw.yhbwbh" id="yhbwbh" value="${dw.zdyhbw.yhbwbh}" />
		<input type="hidden" id="jgbh" name="dw.zdyhbw.jgbh" value="${dwBean.dwjbxx.jgbh}" />
		<input type="hidden" name="dw.dwjbxx.jgbh" id="jgbh" value="${dwBean.dwjbxx.jgbh}" />
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%"> <font color="red">*</font>要害部位名称：</cps:tdLabel>
				<cps:tdContent width="20%" colspan="5">
					<cps:textfield name="dw.zdyhbw.bwmc" id="bwmc" value="${dw.zdyhbw.bwmc}" required="true" maxlength="25" cssStyle="width:97%;"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"> <font color="red">*</font>责任人身份证：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield id="zrrsfzh" name="dw.zdyhbw.zrrsfzh" value="${dw.zdyhbw.zrrsfzh}" isSfzh="true" required="true" onblur="queryRyBysfz(this.value,'zrr','zrrlxfs','')" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%"><font color="red">*</font>部位责任人姓名：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield name="dw.zdyhbw.zrr" id="zrr" required="true" value="${dw.zdyhbw.zrr}" maxlength="15" />
				</cps:tdContent>
				<cps:tdLabel width="12%">联系电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.zdyhbw.zrrlxfs" id="zrrlxfs"  value="${dw.zdyhbw.zrrlxfs}" maxlength="20" isPhone="true" minlength="7"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>要害部位方位：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" name="dw.zdyhbw.fw" id="fw" value="${dw.zdyhbw.fw}" required="true" maxlength="25" cssStyle="width:97%;height:30px;"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>列入要害理由：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" name="dw.zdyhbw.lryhbwly" id="lryhbwly" value="${dw.zdyhbw.lryhbwly}" maxlength="25" cssStyle="width:97%;height:30px;"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>重要设备数量<font color="green">(台)</font>：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.zdyhbw.zysb" id="zysb" value="${dw.zdyhbw.zysb}" maxlength="4" inputType="integer" />
					
				</cps:tdContent>
				<cps:tdLabel>工作人员数<font color="green">(人)</font>：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.zdyhbw.gzrs" id="gzrs" inputType="integer" value="${dw.zdyhbw.gzrs}" maxlength="4"/>
					
				</cps:tdContent>
				<cps:tdLabel>经济价值<font color='green'>(万元)</font>：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.zdyhbw.jjjz" id="jjjz" maxlength="10" inputType="number" value="${dw.zdyhbw.jjjz}" />
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>武警人数<font color="green">(人)</font>：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.zdyhbw.wjrs" id="wjrs" value="${dw.zdyhbw.wjrs}" inputType="integer" maxlength="4"/>
					
				</cps:tdContent>

				<cps:tdLabel>保安人数<font color="green">(人)</font>：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.zdyhbw.bars" id="bars" inputType="integer" value="${dw.zdyhbw.bars}" maxlength="4"/>
					
				</cps:tdContent>
				<cps:tdLabel>护卫队人数<font color="green">(人)</font>：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.zdyhbw.hwdrs" id="hwdrs" inputType="integer" value="${dw.zdyhbw.hwdrs}" maxlength="4"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>人防措施：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield type="textarea" name="dw.zdyhbw.rfcs" id="rfcs" value="${dw.zdyhbw.rfcs}" maxlength="100" cssStyle="height:40px;"/>
				</cps:tdContent>
				<cps:tdLabel>物防措施：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield type="textarea" name="dw.zdyhbw.wfcs" id="wfcs" value="${dw.zdyhbw.wfcs}" maxlength="100" cssStyle="height:40px;"/>
				</cps:tdContent>
				<cps:tdLabel>技防措施：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield type="textarea" name="dw.zdyhbw.jfcs" id="jfcs" value="${dw.zdyhbw.jfcs}" maxlength="100" cssStyle="height:40px;"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>犬防措施：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield type="textarea" name="dw.zdyhbw.qfcs" id="qfcs" value="${dw.zdyhbw.qfcs}" maxlength="100" cssStyle="height:40px;"/>
				</cps:tdContent>
				<cps:tdLabel>安全防范标准：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield type="textarea" name="dw.zdyhbw.aqffbz" id="aqffbz" value="${dw.zdyhbw.aqffbz}" maxlength="100" cssStyle="height:40px;"/>
				</cps:tdContent>
				<cps:tdLabel>保卫制度建立情况：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield type="textarea" name="dw.zdyhbw.bwzdjlqk" id="bwzdjlqk" value="${dw.zdyhbw.bwzdjlqk}" maxlength="100" cssStyle="height:40px;"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield name="dw.zdyhbw.bz" id="bz" value="${dw.zdyhbw.bz}" cssStyle="width:97%;" maxlength="150" />
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>登记人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.zdyhbw.djrxm" value="${loginInfo.realname}" id="djrxm" readonly="true" />
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.zdyhbw.djsj" id="djsj" readonly="true" value="${currentSystemDate}"/>
				</cps:tdContent>
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.zdyhbw.djdwmc" value="${loginInfo.orgname}" id="djdwmc" readonly="true" />
					<input type="hidden" name="dw.zdyhbw.djdwdm" value="${loginInfo.orgcode}" id="djdwdm" />
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</div>
</creator:panel>
</form>
<form id="zdyhbwqueryform">
	<input type="hidden" name="dwcx.jgbh" value="${dwBean.dwjbxx.jgbh}"/>
</form>
<creator:panel id="zdrybwlistpanel" title="重点要害部位列表">
	<cps:tableGrid   
			id="zdyhbwList" 
			url="/zagl/dw/queryZdyhbwBeans.action"
			autoload="true"
			searchform="zdyhbwqueryform"
			width="99.5%" 
			click="zdyhbwClickRowCallback"
			pageSize="10" 
			usepager="true"  
	  		mutilSelect="false">
		<cps:column isNumber="true" title="序号" width="5%"></cps:column>
		<cps:column title="要害名称" field="bwmc"></cps:column>
		<cps:column title="责任人" field="zrr"></cps:column>
		<cps:column title="联系电话" field="zrrlxfs"></cps:column>
		<cps:column title="经济价值(万元)" field="jjjz"></cps:column>
		<cps:column title="保安人数" field="bars"></cps:column>
		<cps:column title="武警人数" field="wjrs"></cps:column>
		<cps:column title="操作" field="cz" rowcallback="zdyhbwCzCallbacl"></cps:column>
	</cps:tableGrid>
</creator:panel>
</creator:view>