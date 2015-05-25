<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/lsgl/js/rytg.js"></creator:Script>
<creator:tbar id="op">
	<c:if test="${operType != 'detail'}">
		<cps:button value="托管" onclick="rytg()"></cps:button>
	</c:if>
	<cps:button value="关闭" onclick="window.close()"></cps:button>
</creator:tbar>
<creator:panel id="ryjbxx" title="重点人员信息" tbarId="op">
	<%@include file="/jsp/lsgl/pages/zdry/rkjbxx.jsp"%>
</creator:panel>
<creator:panel id="zdry" title="重点人员信息">
	<%@include file="/jsp/lsgl/pages/zdry/zdryDetail.jsp"%>
</creator:panel>
<creator:panel id="pfxx" title="托管信息">
	<form id="tgxx_form">
		<input type="hidden" name="zdryBean.sfzh" value="${rkBean.jbxxBean.sfzh}"/>
		<input type="hidden" name="zdryBean.tgxx.id" value="${zdryBean.tgxx.id}"/>
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>接管单位：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield name="zdryBean.tgxx.xzsqmc" value="${zdryBean.tgxx.xzsqmc}" cssStyle="width:96%"  id="xzsqmc" readonly="true" appendPopuBtn="true" 
						onclick="openSqxxSelectWin('${loginInfo.pcsdm}','xzsqdm','jgdwdm','jgdwmc','xzsqmc')" required="true"></cps:textfield>
					<input type="hidden" name="zdryBean.tgxx.xzsqdm" value="${zdryBean.tgxx.xzsqdm}" id="xzsqdm"/>
					<input type="hidden" name="zdryBean.tgxx.jgdwdm" value="${zdryBean.tgxx.jgdwdm}" id="jgdwdm"/>
					<input type="hidden" name="zdryBean.tgxx.jgdwmc" value="${zdryBean.tgxx.jgdwmc}" id="jgdwmc"/>
				</cps:tdContent>
			</cps:row>
		
			<cps:row>
				<cps:tdLabel><font color="red">*</font>托管原因：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" id="wtyy" name="zdryBean.tgxx.wtyy" cssStyle="height:40px;width:96%" value="${zdryBean.tgxx.wtyy}" maxlength="200" required="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		
			<cps:row>
				<cps:tdLabel width="12%">托管人：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield name="zdryBean.tgxx.wtrxm"  value="${zdryBean.tgxx.wtrxm}" id="wtrxm" readonly="true"></cps:textfield>
					<input type="hidden" name="zdryBean.tgxx.wtrjh" value="${zdryBean.tgxx.wtrjh}" id="wtrjh" />
				</cps:tdContent>
				
				<cps:tdLabel width="12%"><font color="red">*</font>托管人联系方式</cps:tdLabel>
				<cps:tdContent width="20%"> 
					<cps:textfield name="zdryBean.tgxx.wtrlxfs" value="${zdryBean.tgxx.wtrlxfs}" id="wtrlxfs" isPhone="true" maxlength="20" minlength="7" required="true"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel width="12%">托管时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="zdryBean.tgxx.wtsj" value="${zdryBean.tgxx.wtsj}" readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="12%">托管单位：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<input type="hidden" name="zdryBean.tgxx.wtdwdm" value="${zdryBean.tgxx.wtdwdm}" id="wtdwdm"  />
					<cps:textfield name="zdryBean.tgxx.wtdwmc" value="${zdryBean.tgxx.wtdwmc}" id="wtdwmc" cssStyle="width:96%" />
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
</creator:view>