<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="危险物品单位">
	<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var operType = $("#operType").val();
			if (operType == "detail")
			{
				$("#wxpdwform").find(":input").attr("disabled","true")
			}
		});
	</script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button id="savebtn" value="保存" onclick="saveWxwpdwBean()" display="${operType!='detail'}"></cps:button>
			<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
		</cps:tbar>
		<cps:panel title="危险物品单位">
		<form id="wxpdwform" action="<c:url value='/sydw/dwgl/saveWxwpdwBean.action'/>" method="post">
		    <input type="hidden" id="wxwpdwjlbh" name="dwBean.wxwpdwBean.jlbh"  value="${dwBean.wxwpdwBean.jlbh}" />
			<input type="hidden" id="wxwpjgbh" name="dwBean.wxwpdwBean.jgbh" value="${dwBean.dwjbxx.jgbh}" />
			<input type="hidden" id="jgbh" name="dwBean.dwjbxx.jgbh" value="${dwBean.dwjbxx.jgbh}" >
			<s:hidden id="operType" name="operType"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>货物类别：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:select zdlb="ZDY_HWLB" id="hwlb" name="dwBean.wxwpdwBean.hwlb" value="${dwBean.wxwpdwBean.hwlb}" required="true" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>单位分类：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<s:checkboxlist list="wxpdwflList" id="dwflchk" name="dwBean.wxwpdwBean.dwfls" listKey="dm" listValue="mc" required="true" onchange="changeWxwpdwfl(this)"></s:checkboxlist>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>生产地址：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="scdz" name="dwBean.wxwpdwBean.scdz" value="${dwBean.wxwpdwBean.scdz}"  maxlength="100" cssStyle="width: 93%;"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>储存设备：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="cssb" name="dwBean.wxwpdwBean.cssb" value="${dwBean.wxwpdwBean.cssb}"  maxlength="100" cssStyle="width: 93%;"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>许可范围：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="fbxkfw" type="textarea" name="dwBean.wxwpdwBean.fbxkfw" value="${dwBean.wxwpdwBean.fbxkfw}"  maxlength="250" cssStyle="width: 93%; height: 60px;"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="bz" type="textarea" name="dwBean.wxwpdwBean.bz" value="${dwBean.wxwpdwBean.bz}" cssClass="validate[maxSize[150]]" cssStyle="width: 93%; height: 60px;"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
		</cps:panel>
	</cps:PanelView>
</creator:view>