<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="街路巷信息维护">
<creator:Script src="/jsp/common/js/jlxselect.js"></creator:Script>
	<creator:tbar id="condition">
		<c:if test="${operType!= 'detail'}">
			<cps:button value="保存" onclick="isExistJlxMc();"></cps:button>	
		</c:if>
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="panel" tbarId="condition"  title="街路巷选择列表">
	<form id="jlxSelectForm" method="post" >
		<s:hidden id="id" name="jlxBean.id"></s:hidden>
		<s:hidden id="dm" name="jlxBean.dm"></s:hidden>
		<cps:table>
			<cps:row id="clear_row">
				<cps:tdLabel width="12%"><font color="red">*</font>街路巷全称：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield id="mc"  required="true" name="jlxBean.mc" value="${jlxBean.mc}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>街路巷简称：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield id="mc" name="jlxBean.jc" value="${jlxBean.jc}" required="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>所属行政区划：</cps:tdLabel>
				<cps:tdContent width="22%">
					<s:hidden id="ssxzqh" name="jlxBean.ssxzqh" ></s:hidden>
					<cps:textfield required="true"  id="ssxzqhmc" name="jlxBean.ssxzqhmc" value="${jlxBean.ssxzqhmc}" appendPopuBtn="true" onclick="selectXzqh('ssxzqh','ssxzqhmc','${currentXzqh}00');"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%"><font color="red">*</font>是否民政命名：</cps:tdLabel>
				<cps:tdContent>
					<cps:select required="true" id="sfmzmm" name="jlxBean.sfmzmm" value="${jlxBean.sfmzmm}" zdlb="ZDY_ZDSF" headerKey="" headerValue=" " ></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<s:hidden id="djrjh" name="jlxBean.djrjh"></s:hidden>
				<s:hidden id="djrxm" name="jlxBean.djrxm"></s:hidden>	
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="djdwdm" name="jlxBean.djdwdm" value="${jlxBean.djdwdm}">
					<cps:textfield id="djdwmc" name="jlxBean.djdwmc" value="${jlxBean.djdwmc}" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="djsj" name="jlxBean.djsj" value="${jlxBean.djsj}" readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>	
	</creator:panel>
</creator:view>

