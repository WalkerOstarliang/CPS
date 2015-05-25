<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view>
	<creator:Script src="/jsp/zdrygl/js/staffsurvey.js"></creator:Script>
	<link type="text/css"
		href="<c:url value='/jsp/zdrygl/images/css.css'/>" rel="stylesheet" />
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="box_title">
		<tr>
			<td width="23">
				<img src="${contextPath}/template/cps/images/img_title.jpg"
					width="23" height="28" />
			</td>
			<td>
				动态信息 > 体貌特征
			</td>
		</tr>
	</table>
	<form id="tmtzForm">
	<input type="hidden" name="personnel.sfzh" value="${sfzh}"/>
	<cps:table>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">脸型：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select name="personnel.lx" id="lx" zdlb="GB_LX" headerKey="" headerValue="--请选择--" value="${personnel.lx}"></cps:select>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">体型：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select name="personnel.tx" id="tx" zdlb="GB_TX" headerKey="" headerValue="--请选择--" value="${personnel.tx}"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">鞋号：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="xh" name="personnel.xh" value="${personnel.xh }"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">足长：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="zc" name="personnel.zc" value="${personnel.zc }"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">有无伤疤：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select name="personnel.ywsb" id="ywsb" zdlb="GB_ZT" headerKey="" headerValue="--请选择--" value="${personnel.ywsb}"></cps:select>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">伤疤位置：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select name="personnel.sbwz" id="sbwz" zdlb="GB_RTSSBW" headerKey="" headerValue="--请选择--" value="${personnel.sbwz}"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">口音：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select name="personnel.ky" id="ky" zdlb="GB_KY" headerKey="" headerValue="--请选择--" value="${personnel.ky}"></cps:select>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">专长：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select name="personnel.tc" id="tc" zdlb="GB_ZC" headerKey="" headerValue="--请选择--" value="${personnel.tc}"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">描述：</cps:tdLabel>
			<cps:tdContent colspan="3">
				<textarea name="personnel.ms" id="ms" cols="35" rows="2"
									class="textarea2">${personnel.ms }</textarea>
			</cps:tdContent>
		</cps:row>
	</cps:table>
	</form>
	<cps:button value="保存" onclick="saveValue('tmtzForm','tmtz');"></cps:button>
</creator:view>