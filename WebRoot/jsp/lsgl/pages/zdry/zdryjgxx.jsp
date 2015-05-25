<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/lsgl/js/ryjg.js"></creator:Script>
<creator:tbar id="op">
	<c:if test="${operType != 'detail' && operType != 'thhjd'}">
		<cps:button value="接管" onclick="ryjg()"></cps:button>
		<cps:button value="退回托管" onclick="tgth()"></cps:button>
	</c:if>
	<c:if test="${operType == 'thhjd'}">
		<cps:button value="退回户籍地" onclick="tgth()"></cps:button>
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
		<input type="hidden" name="modename" value="重点人员接管" />
		<input type="hidden" name="operType" value="${operType}" id="opertype" />
		<input type="hidden" name="zdryBean.sfzh" value="${rkBean.jbxxBean.sfzh}"/>
		<input type="hidden" name="zdryBean.tgxx.id" value="${zdryBean.tgxx.id}"/>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%">托管人：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield name="zdryBean.tgxx.wtrxm"  value="${zdryBean.tgxx.wtrxm}" id="wtrxm" readonly="true"></cps:textfield>
					<input type="hidden" name="zdryBean.tgxx.wtrjh" value="${zdryBean.tgxx.wtrjh}" id="wtrjh" />
				</cps:tdContent>
				
				<cps:tdLabel width="12%">托管人联系方式：</cps:tdLabel>
				<cps:tdContent width="20%"> 
					<cps:textfield name="zdryBean.tgxx.wtrlxfs" value="${zdryBean.tgxx.wtrlxfs}" id="wtrlxfs" isPhone="true" maxlength="20" minlength="7" readonly="true"></cps:textfield>
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
					<cps:textfield name="zdryBean.tgxx.wtdwmc" value="${zdryBean.tgxx.wtdwmc}" id="wtdwmc" readonly="true" cssStyle="width:96%" />
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>托管原因：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" readonly="true"  id="wtyy" name="zdryBean.tgxx.wtyy" cssStyle="height:40px;width:96%" value="${zdryBean.tgxx.wtyy}" maxlength="200" ></cps:textfield>
				</cps:tdContent>
			</cps:row>
		
			<cps:row>
				<cps:tdLabel width="12%">接管人：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield name="zdryBean.tgxx.jgrxm"  value="${zdryBean.tgxx.jgrxm}" id="jgrxm" readonly="true"></cps:textfield>
					<input type="hidden" name="zdryBean.tgxx.jgrjh" value="${zdryBean.tgxx.jgrjh}" id="jgrjh" />
				</cps:tdContent>
				
				<cps:tdLabel width="12%"><font color="red">*</font>接管人联系方式：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield name="zdryBean.tgxx.jgrlxfs" value="${zdryBean.tgxx.jgrlxfs}" id="jgrlxfs" maxlength="20" isPhone="true" minlength="7" required="true"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel width="12%">接管时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="zdryBean.tgxx.jgsj" value="${zdryBean.tgxx.jgsj}" readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="12%">接管单位：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<input type="hidden" name="zdryBean.tgxx.jgdwdm" value="${zdryBean.tgxx.jgdwdm}" id="jgdwdm" />
					<cps:textfield name="zdryBean.tgxx.jgdwmc" id="jgdwmc" readonly="true" cssStyle="width:96%"/>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>退回原因：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" name="zdryBean.tgxx.thyy" id="thyy" cssStyle="height:40px;width:96%" value="${zdryBean.tgxx.thyy}" maxlength="200"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
</creator:view>