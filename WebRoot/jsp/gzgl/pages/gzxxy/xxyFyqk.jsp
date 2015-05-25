<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/xxygl.js"></script>
	<script type="text/javascript">
		$(function(){
			if($("#operType").val() == "detail"){
				$("#xxfkdiv").displayInputForText();
			}
		});
	</script>
	<div id="xxfkdiv">
	<creator:tbar id="xxyfyqktbar">
		<cps:button value="保&nbsp;存" onclick="submitEmfyxx();"></cps:button>
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow();"></cps:button>
	</creator:tbar>
	<creator:panel id="fyqkPanel" title="信息员反应情况登记"  tbarId="xxyfyqktbar">
		<form id="fyqkForm" action="${contextPath}/gzgl/tzgl/saveXxyFyqkBean.action" method="post">
			<input type="hidden" name="operType" id="operType" value="${operType}"/>
			<input type="hidden" name="emfyqkxxBean.zaembh" value="${emfyqkxxBean.zaembh}"/>
			<input type="hidden" id="id" name="emfyqkxxBean.id"　value="${emfyqkxxBean.id}"/>
			<cps:table>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>反馈内容：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="emfyqkxxBean.fyqkxx" value="${emfyqkxxBean.fyqkxx}" maxlength="1800" id="fyqkxx" required="true"  cssStyle="height:80px;width:96%"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color="red">*</font>反馈时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="emfyqkxxBean.xxtgsj" id="xxtgsj" value="${emfyqkxxBean.xxtgsj}" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
					</cps:tdContent>
					
					<cps:tdLabel>录入人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="emfyqkxxBean.djrxm" value="${emfyqkxxBean.djrxm}" id="djrxm" readonly="true"></cps:textfield>
						<input type="hidden" name="emfyqkxxBean.djmjjh" value="${emfyqkxxBean.djmjjh}" />
						<input type="hidden" name="emfyqkxxBean.djrsfzh" value="${emfyqkxxBean.djrsfzh}" />
					</cps:tdContent>
					
					<cps:tdLabel>录入时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="emfyqkxxBean.djsj" value="${emfyqkxxBean.djsj}" id="djsj" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>录入单位：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="emfyqkxxBean.djdwmc" id="djdwmc" value="${emfyqkxxBean.djdwmc}" readonly="true" cssStyle="width:96%"></cps:textfield>
						<input type="hidden" name="emfyqkxxBean.djdwdm" value="${emfyqkxxBean.djdwdm}" />
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	</div>
</creator:view>