<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="上网服务场所信息">
	<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var operType = $("#operType").val();
			if (operType == "detail")
			{
				$("#swfwcsform").find(":input").attr("disabled","true")
			}
		});
	</script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button id="savebtn" value="保存" onclick="saveSwfwcsBean()" display="${operType!='detail'}"></cps:button>
			<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
		</cps:tbar>
		<cps:panel title="上网服务场所信息">
		<form id="swfwcsform" action="<c:url value='/sydw/dwgl/saveSwfwcsBean.action'/>" method="post">
			<input type="hidden" name="dwBean.swfwcs.jlbh" id="swfwcsjlbh" value="${dwBean.swfwcs.jlbh}" />
			<input type="hidden" name="dwBean.swfwcs.jgbh" value="${dwBean.dwjbxx.jgbh}" id="swfwcsjgbh">
			<input type="hidden" name="dwBean.dwjbxx.jgbh" value="${dwBean.dwjbxx.jgbh}" id="jgbh">
			<s:hidden id="operType" name="operType"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="14%">网吧编号：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield id="wbbh" name="dwBean.swfwcs.wbbh" value="${dwBean.swfwcs.wbbh}" maxlength="25"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">宽带接入服务商：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield id="fws" name="dwBean.swfwcs.kdjrfws" value="${dwBean.swfwcs.kdjrfws}"  maxlength="60"/>
					</cps:tdContent>
					<cps:tdLabel width="14%">接入方式：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="jrfs" zdlb="ZDY_JRFS" headerKey="" headerValue=" " name="dwBean.swfwcs.jrfs" value="${dwBean.swfwcs.jrfs}" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>网络文化经营许可证号：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" name="dwBean.swfwcs.jgbh" value="${dwBean.swfwcs.jgbh}" />
						<cps:textfield id="hkzh" name="dwBean.swfwcs.wlwhxkzh" value="${dwBean.swfwcs.wlwhxkzh}" inputType="onlychar" maxlength="50" />
					</cps:tdContent>
					
					<cps:tdLabel>电脑台数(台)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="dnts" name="dwBean.swfwcs.dnts" value="${dwBean.swfwcs.dnts}" inputType="integer"  maxlength="4"/>
					</cps:tdContent>
					<cps:tdLabel>临时上网卡数量(块)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="lsswksl" name="dwBean.swfwcs.lsswksl" inputType="number" value="${dwBean.swfwcs.lsswksl}"  maxlength="4"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>网络安全审核意见书号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="wlaqyjsh" name="dwBean.swfwcs.wlaqshyjsh" value="${dwBean.swfwcs.wlaqshyjsh}" inputType="onlychar"  maxlength="60" />
					</cps:tdContent>
					<cps:tdLabel>营业面积(㎡)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="yymj" name="dwBean.swfwcs.yymj" value="${dwBean.swfwcs.yymj}" inputType="number" maxlength="7"/>
					</cps:tdContent>
					<cps:tdLabel>消防审核意见书号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield  id="xfyjsh"  name="dwBean.swfwcs.xfshyjsh" value="${dwBean.swfwcs.xfshyjsh}" inputType="onlychar" cssClass="validate[maxSize[60]]" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel >现使用IP：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield id="xsyip"  name="dwBean.swfwcs.xsyip" value="${dwBean.swfwcs.xsyip}" inputType="onlychar"  maxlength="150" />
					</cps:tdContent>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="bz" name="dwBean.swfwcs.bz" value="${dwBean.swfwcs.bz}" maxlength="250" cssStyle="width: 96%;"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				 
			</cps:table>
		</form>
		</cps:panel>
	</cps:PanelView>
</creator:view>