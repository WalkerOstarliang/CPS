<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="swfwcs_div">
	<%-- 
	<creator:tbar id="dw_op">
		<cps:button value="保存" onclick="saveSwfwcsBean()"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="swfwcs_panel" title="上网服务场所信息" tbarId="dw_op" height="window">
	--%>	
		<input type="hidden" name="dw.swfwcs.jlbh" id="swfwcs_jlbh" value="${dw.swfwcs.jlbh}" />
		<cps:table>
			<cps:row>
				<cps:tdLabel>网吧编号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="wbbh" name="dw.swfwcs.wbbh" value="${dw.swfwcs.wbbh}" maxlength="25"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>宽带接入服务商：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fws" name="dw.swfwcs.kdjrfws" value="${dw.swfwcs.kdjrfws}"  maxlength="60"/>
				</cps:tdContent>
				<cps:tdLabel>接入方式：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="jrfs" zdlb="ZDY_JRFS" headerKey="" headerValue="--请选择--" name="dw.swfwcs.jrfs" value="${dw.swfwcs.jrfs}" />
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="16%">网络文化经营许可证号：</cps:tdLabel>
				<cps:tdContent width="20%">
					<input type="hidden" name="dw.swfwcs.jgbh" value="${dw.swfwcs.jgbh}" />
					<cps:textfield id="hkzh" name="dw.swfwcs.wlwhxkzh" value="${dw.swfwcs.wlwhxkzh}" inputType="onlychar" maxlength="50" />
				</cps:tdContent>
				
				<cps:tdLabel width="12%">电脑台数：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield id="dnts" name="dw.swfwcs.dnts" value="${dw.swfwcs.dnts}" inputType="integer"  maxlength="4"/>
					<font color='green'>(台)</font>
				</cps:tdContent>
				
				<cps:tdLabel width="12%">临时上网卡数量：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="lsswksl" name="dw.swfwcs.lsswksl" inputType="number" value="${dw.swfwcs.lsswksl}"  maxlength="4"/>
					<font color="green">(块)</font>
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>网络安全审核意见书号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="wlaqyjsh" name="dw.swfwcs.wlaqshyjsh" value="${dw.swfwcs.wlaqshyjsh}" inputType="onlychar"  maxlength="60" />
				</cps:tdContent>
				<cps:tdLabel>营业面积：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="yymj" name="dw.swfwcs.yymj" value="${dw.swfwcs.yymj}" inputType="number" maxlength="7"/>
					<font color="green">(㎡)</font>
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					 &nbsp;
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>消防审核意见书号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield  id="xfyjsh"  name="dw.swfwcs.xfshyjsh" value="${dw.swfwcs.xfshyjsh}" inputType="onlychar" cssClass="validate[maxSize[60]]" />
				</cps:tdContent>
				<cps:tdLabel >现使用IP：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield id="xsyip"  name="dw.swfwcs.xsyip" value="${dw.swfwcs.xsyip}" inputType="onlychar"  maxlength="150" cssStyle="width:89%"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="bz" type="textarea" name="dw.swfwcs.bz" value="${dw.swfwcs.bz}" maxlength="250" cssStyle="width: 93%; height: 60px;"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	<%-- 
	</creator:panel>
	--%>
</div>