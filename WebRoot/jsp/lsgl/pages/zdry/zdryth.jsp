<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/lsgl/js/rypf.js"></creator:Script>
	<creator:tbar id="op">
		<c:if test="${operType != 'detail'}">
			<cps:button value="重点人员退回" onclick="ryth()"></cps:button>
		</c:if>
		<cps:button value="关闭" onclick="window.close()"></cps:button>
	</creator:tbar>
	<creator:panel id="ryjbxx" title="重点人员信息" tbarId="op">
		<%@include file="/jsp/lsgl/pages/zdry/rkjbxx.jsp"%>
	</creator:panel>
	<creator:panel id="zdry" title="重点人员信息">
		<%@include file="/jsp/lsgl/pages/zdry/zdryDetail.jsp"%>
	</creator:panel>
	<creator:panel id="thxx" title="重点人员退回">
		<form id="pfth_form">
			<input type="hidden" name="zdryBean.sfzh" value="${rkBean.jbxxBean.sfzh}"/>
			<input type="hidden" name="zdryBean.thxx.id" value="${zdryBean.thxx.id}" />
			<input type="hidden" name="zdryBean.thxx.zdrybh" value="${zdryBean.zdrybh}" />
			
			<input type="hidden" name="operType" value="${operType}" />
			<input type="hidden" name="modename" value="重点人员退回" />
			<cps:table>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>退回原因:</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="zdryBean.thxx.thyy" value="${zdryBean.thxx.thyy}" id="thyy" maxlength="100" cssStyle="width:96.5%;height:40px;" required="true" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel width="15%">退回人：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:textfield name="zdryBean.thxx.thrxm" id="thrxm" value="${zdryBean.thxx.thrxm}" readonly="true"></cps:textfield>
						<input type="hidden" name="zdryBean.thxx.thrjh" value="${zdryBean.thxx.thrjh}" />
					</cps:tdContent>
					
					<cps:tdLabel width="15%">退回人联系电话：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:textfield name="zdryBean.thxx.thrlxfs" minlength="7" maxlength="20" isPhone="true" id="thrlxfs"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel width="15%">退回时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="zdryBean.thxx.thsj" value="${zdryBean.thxx.thsj}" id="thsj" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>退回单位：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="zdryBean.thxx.thdwmc" value="${zdryBean.thxx.thdwmc}" id="thdwmc" readonly="true" cssStyle="width:96.5%"></cps:textfield>
						<input type="hidden" id="thdwmc" name="zdryBean.thxx.thdwdm"  value="${zdryBean.thxx.thdwdm}" />
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>	
</creator:view>

		