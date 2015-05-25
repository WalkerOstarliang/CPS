<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="wxwpdw_div">
	<%-- 
	<creator:tbar id="dw_op">
		<cps:button value="保存" onclick="saveWxwpdwBean()"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="swfwcs_panel" title="危险品单位" tbarId="dw_op" height="window">
	--%>	
		<input type="hidden" name="dw.wxwpdwBean.jlbh" id="wxwpdw_jlbh" value="${dw.wxwpdwBean.jlbh}" />
		<input type="hidden" name="dw.wxwpdwBean.jgbh" value="${dw.wxwpdwBean.jgbh}" />
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>货物类别：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select zdlb="ZDY_HWLB" id="hwlb" name="dw.wxwpdwBean.hwlb" value="${dw.wxwpdwBean.hwlb}" required="true" headerKey="" headerValue="--请选择--"></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="12%"><font color="red">*</font>单位分类：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<input type="hidden" id="wxwp_dwfl" name="dw.wxwpdwBean.dwfl" value="${dw.wxwpdwBean.dwfl}">
					&nbsp;<s:checkboxlist list="wxpdwflList" id="dwflchk" name="dwfl" listKey="dm" listValue="mc" required="true" onchange="changeWxwpdwfl(this)"></s:checkboxlist>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>生产地址：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="scdz" name="dw.wxwpdwBean.scdz" value="${dw.wxwpdwBean.scdz}"  maxlength="60" cssStyle="width: 93%;"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>储存设备：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="cssb" name="dw.wxwpdwBean.cssb" value="${dw.wxwpdwBean.cssb}"  maxlength="100" cssStyle="width: 93%;"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>副本许可范围：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="fbxkfw" type="textarea" name="dw.wxwpdwBean.fbxkfw" value="${dw.wxwpdwBean.fbxkfw}" maxlength="250"  cssStyle="width: 93%; height: 60px;"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="bz" type="textarea" name="dw.wxwpdwBean.bz" value="${dw.wxwpdwBean.bz}" maxlength="150" cssStyle="width: 93%; height: 60px;"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	<%-- 
	</creator:panel>
	--%>	
</div>