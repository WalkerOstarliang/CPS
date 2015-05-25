<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%-- 
<creator:panel id="thlgpanel" title="开锁业信息">
--%>
<input type="hidden" id="thksjgbh" name="dw.thksyBean.jgbh"
	value="${dw.thksyBean.jgbh}" />
<input type="hidden" id="ksbh" name="dw.thksyBean.ksbh"
	value="${dw.thksyBean.ksbh}" />
<input type="hidden" id="thksjgmc" name="dw.thksyBean.jgmc"
	value="${dw.thksyBean.jgmc}" />
<cps:table>
	<cps:row>
		<cps:tdLabel>开锁类型：</cps:tdLabel>
		<cps:tdContent colspan="5">
			<input type="hidden" id="kslx" name="dw.thksyBean.kslx"
				value="${dw.thksyBean.kslx}" />
				 &nbsp;<s:checkboxlist list="kslxList" id="kslxchk" name="kslx"
				listKey="dm" listValue="mc" onclick="changeKslx(this)"></s:checkboxlist>
		</cps:tdContent>
	</cps:row>

	<cps:row>
		<cps:tdLabel>开业时间：</cps:tdLabel>
		<cps:tdContent>
			<cps:date id="ksy_kysj" name="dw.thksyBean.kysj"
				value="${dw.thksyBean.kysj}" dateFmt="yyyy-MM-dd" />
		</cps:tdContent>
		<cps:tdLabel>服务区域：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.thksyBean.fwqy" value="${dw.thksyBean.fwqy}"
				id="fwqy" maxlength="60"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>主管公司：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.thksyBean.zggs" value="${dw.thksyBean.zggs}"
				id="fwqy" maxlength="60"></cps:textfield>
		</cps:tdContent>
	</cps:row>

	<cps:row>
		<cps:tdLabel>备注职工数：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.thksyBean.bdzgs"
				value="${dw.thksyBean.bdzgs}" inputType="integer" id="bdzgs"
				maxlength="4"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>外地职工数：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.thksyBean.wdzgs"
				value="${dw.thksyBean.bdzgs}" inputType="integer" id="wdzgs"
				maxlength="4"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>&nbsp;</cps:tdLabel>
		<cps:tdContent>
				&nbsp;
			</cps:tdContent>
	</cps:row>

	<cps:row>
		<cps:tdLabel>备注：</cps:tdLabel>
		<cps:tdContent colspan="5">
			<cps:textfield type="textarea" id="bz" name="dw.thksyBean.bz"
				value="${dw.thksyBean.bz}" cssStyle="width:94%;height:50px"></cps:textfield>
		</cps:tdContent>
	</cps:row>
</cps:table>
<%-- 	
</creator:panel>
--%>
