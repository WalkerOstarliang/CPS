<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/qbxs/js/qbxslist.js"></creator:Script>
<script type="text/javascript">
	$(function(){
		var operType = $("#operType").val();
		if(operType =='detail'){
			$("#qbxsggxxDiv").displayInputForText();
		}
	});
</script>
<creator:tbar id="ggxxtbar">
	<c:if test="${operType != 'detail'}">
	<cps:button value="保存" onclick="saveQbxsGgxx();"></cps:button>
	</c:if>
	<cps:button value="关闭" onclick="window.close();"></cps:button>
</creator:tbar>
<creator:panel id="qbxsggxxpanel" tbarId="ggxxtbar" title="情报线索骨干信息">
<div id="qbxsggxxDiv">
<form id= "qbxsform">
	<input type="hidden" id="id" name="ggxxBean.id" value="${ggxxBean.id }">
	<input type="hidden" id="sjid" name="ggxxBean.sjid" value="${ggxxBean.sjid }">
	<input type="hidden" id="ldxxbh" name="ggxxBean.ldxxbh" value="${ggxxBean.ldxxbh }">
	<input type="hidden" id="yldxxbh" name="ggxxBean.yldxxbh" value="${ggxxBean.yldxxbh }">
	<input type="hidden" id="operType" name="operType" value="${operType }">
	<cps:table id="rkjbxxtable">
		<cps:row>
			<cps:tdLabel width="14%"><font color="red">*</font>身份证号：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:textfield id="gmsfhm" name="ggxxBean.gmsfhm" value="${ggxxBean.gmsfhm}" isSfzh="true" required="true" onblur="loadRkxxBean(this.value)"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="12%"><font color="red">*</font>姓名：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:textfield id="xm" name="ggxxBean.xm" value="${ggxxBean.xm}" required="true" readonly="true" maxlength="15"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="10%">性别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="GB_XB" id="xb" name="ggxxBean.xb " value="${ggxxBean.xb}" headerKey="" headerValue=" " disabled="true" enableEdit="true"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>出生日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="csrq" name="ggxxBean.csrq" value="${ggxxBean.csrq}" readonly="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>民族：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="GB_MZ" id="mz" name="ggxxBean.mz " value="${ggxxBean.mz}" headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
			<cps:tdLabel >国籍：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="GB_GJ" id="gj" name="ggxxBean.gj" value="${ggxxBean.gj}"  headerKey="" headerValue=" " ></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel width="10%">别名/绰号：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="bmhch" name="ggxxBean.bmhch" value="${ggxxBean.bmhch}" maxlength="15"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>手机号码：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="sjhm" name="ggxxBean.sjhm" value="${ggxxBean.sjhm}" maxlength="200" minlength="7" isPhone="true" required="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>固定电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="gddhhm" name="ggxxBean.gddhhm" value="${ggxxBean.gddhhm}" maxlength="200" minlength="7" isPhone="true"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>暂住证号码：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zzzhm" name="ggxxBean.zzzhm" value="${ggxxBean.zzzhm}" maxlength="15"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>职业：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="zy" zdlb="ZAGL_RY_ZY" name="ggxxBean.zy"  value="${ggxxBean.zy}" headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
			<cps:tdLabel>服务处所：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="fwcs" name="ggxxBean.fwcs" value="${ggxxBean.fwcs}" maxlength="35"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel >户籍地区划：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="hjd" name="ggxxBean.hjd" value="${ggxxBean.hjd}">
				<cps:textfield id="hjdqhmc" name="ggxxBean.hjdqhmc" value="${ggxxBean.hjdqhmc}" readonly="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel >户籍地详址：</cps:tdLabel>
			<cps:tdContent colspan="3">
				<cps:textfield id="hjdxz" name="ggxxBean.hjdxz" value="${ggxxBean.hjdxz}" readonly="true" cssStyle="width:95%"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel width="12%">现住地区划：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="xzd"  name="ggxxBean.xzd" value="${ggxxBean.xzd}"/>
				<cps:textfield id="xzdmc" name="ggxxBean.xzdmc" value="${ggxxBean.xzdmc}" readonly="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="12%">现住地详址：</cps:tdLabel>
			<cps:tdContent colspan="3">
				<cps:textfield id="xzdxz" name="ggxxBean.xzdxz" value="${ggxxBean.xzdxz}" readonly="true" cssStyle="width:95%" maxlength="50"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel width="10%">互联网通讯工具号码：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="hlwtxgjhm" name="ggxxBean.hlwtxgjhm" value="${ggxxBean.hlwtxgjhm}" maxlength="100" ></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>护照号码：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="hzhm" name="ggxxBean.hzhm" value="${ggxxBean.hzhm}" maxlength="100" ></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>外文姓名：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="wwxm" name="ggxxBean.wwxm" value="${ggxxBean.wwxm}" maxlength="40" ></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent colspan="5">
				<cps:textfield type="textarea" id="bz" name="ggxxBean.bz" value="${ggxxBean.bz}" cssStyle="width:98%;height:50px" maxlength="240"></cps:textfield>
			</cps:tdContent>
		</cps:row>
	</cps:table>
</form>
</div>
</creator:panel>
</creator:view>
