<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="纠纷调解登记">
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/jftj.js"></script>
<form id="jftjForm" action="<c:url value='/qzgl/jftjgl/saveJftjdjxx.action'/>" method="post">
	<input type="hidden" id="bh" name="jftjBean.bh" value="${jftjBean.bh}">
	<input type="hidden" name="operType">
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="保&nbsp;存" onclick="savefjtj()" display="${operType != 'detail'}" ></cps:button>
			<cps:button value="重&nbsp;置" onclick="resetjftj()" display="${operType != 'detail'}"></cps:button>
		</cps:tbar>
		<cps:panel id="jftjpanel" title="纠纷调解" mode="${operType == 'detail'?'view' : ''}">
			<cps:table>
				 <cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>调解类型：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <s:select id="zatjlx" list="#{'1':'治安调解','2':'现场治安调解'}" name="jftjBean.zatjlx" cssClass="validate[required] cps-select" headerKey="" headerValue=" "></s:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>纠纷类型：</cps:tdLabel>
					<cps:tdContent>
						 <s:select list="jflxList" id="jflx" name="jftjBean.jflx" listKey="dm" listValue="mc" headerKey="" headerValue=" " cssClass="validate[required] cps-select" ></s:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>是否司法鉴定：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:select id="issfjd" list="#{'0':'否','1':'是'}" name="jftjBean.sfsfjd" cssClass="validate[required] cps-select" headerKey="" headerValue=" "></s:select>
					</cps:tdContent>
				</cps:row>
				 <cps:row>
					<cps:tdLabel width="10%">主持人：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <cps:textfield id="zcrxm" name="jftjBean.zcrxm" value="${jftjBean.zcrxm}" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">单位及职务：</cps:tdLabel>
					<cps:tdContent>
						  <cps:textfield id="zcrdwjzw" name="jftjBean.zcrdwjzw" value="${jftjBean.zcrdwjzw}" maxlength="60"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">调解地点：</cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="tjdd" name="jftjBean.tjdd" value="${jftjBean.tjdd}" maxlength="60"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel width="10%">见证人姓名：</cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="tjjzrxm" name="jftjBean.tjjzrxm" value="${jftjBean.tjjzrxm}" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">家庭住址：</cps:tdLabel>
					<cps:tdContent>
						  <cps:textfield id="tjjzrjtzz" name="jftjBean.tjjzrjtzz" value="${jftjBean.tjjzrjtzz}" maxlength="60"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">联系方式：</cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="tjjzrlxfs" name="jftjBean.tjjzrlxfs" value="${jftjBean.tjjzrlxfs}" maxlength="20"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6"><hr/></cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*当事人一：</font></cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="dsryxm" name="jftjBean.dsryxm" maxlength="15" value="${jftjBean.dsryxm}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>性别：</cps:tdLabel>
					<cps:tdContent>
						  <cps:select zdlb="GB_XB" id="dsryxb" name="jftjBean.dsryxb" headerKey=" " headerValue=" " value="${jftjBean.dsryxb}" required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>年龄：</cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="dsrynl" name="jftjBean.dsrynl" inputType="number" maxlength="2" value="${jftjBean.dsrynl}" required="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>身份证号：</cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="dsrysfhm" name="jftjBean.dsrysfhm" maxlength="18" isSfzh="true" value="${jftjBean.dsrysfhm}" required="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>工作单位及职业：</cps:tdLabel>
					<cps:tdContent>
						  <cps:textfield id="dsrygzdwjzy" name="jftjBean.dsrygzdwjzy" maxlength="60" value="${jftjBean.dsrygzdwjzy}" required="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>家庭住址：</cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="dsryjtzz" name="jftjBean.dsryjtzz" maxlength="60" value="${jftjBean.dsryjtzz}" required="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6"><hr/></cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*当事人二：</font></cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="dsrexm" name="jftjBean.dsrexm" maxlength="15" value="${jftjBean.dsrexm}" required="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>性别：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_XB" id="dsrexb" name="jftjBean.dsrexb" headerKey=" " headerValue=" " value="${jftjBean.dsrexb}" required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>年龄：</cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="dsrenl" name="jftjBean.dsrenl" inputType="number" maxlength="2" value="${jftjBean.dsrenl}" required="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>身份证号：</cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="dsresfhm" name="jftjBean.dsresfhm" isSfzh="true" maxlength="18" value="${jftjBean.dsresfhm}" required="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>工作单位及职业：</cps:tdLabel>
					<cps:tdContent>
						  <cps:textfield id="dsregzdwjzy" name="jftjBean.dsregzdwjzy" maxlength="60" value="${jftjBean.dsregzdwjzy}" required="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>家庭住址：</cps:tdLabel>
					<cps:tdContent width="25%">
						  <cps:textfield id="dsrejtzz" name="jftjBean.dsrejtzz" maxlength="60" value="${jftjBean.dsrejtzz}" required="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6"><hr/></cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>调解时间</cps:tdLabel>
					<cps:tdContent colspan="6">
						<cps:date id="tjsj" name="jftjBean.tjsj" value="${jftjBean.tjsj}" dateFmt="yyyy-MM-dd" cssStyle="width:24%" required="true"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6" align="left">
						<span>&nbsp;<font color="red">*</font>主要事实（包括案件发生时间、地点、人员、起因、经过、情节、结果等）：</span>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6">
						<s:textarea id="zyss" name="jftjBean.zyss" cssStyle="width:100%;height:120px;" cssClass="validate[required]"></s:textarea>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6" align="left">
						<span>&nbsp;<font color="red">*</font>经调解，双方自愿达成如下协议（包括协议内容、履行方式和期限等）：</span>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6">
						<s:textarea id="dcxynr" name="jftjBean.dcxynr" cssStyle="width:100%;height:120px;" cssClass="validate[required]"></s:textarea>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:panel>
	</cps:PanelView>
</form>
</creator:view>