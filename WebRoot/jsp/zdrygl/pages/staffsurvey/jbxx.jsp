<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view>
	<creator:Script src="/jsp/zdrygl/js/staffsurvey.js"></creator:Script>
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="box_title">
		<tr>
			<td width="23">
				<img src="${contextPath}/template/cps/images/img_title.jpg"
					width="23" height="28" />
			</td>
			<td>
				基础信息 > 基本信息
			</td>
		</tr>
	</table>
	<form id="jbxxForm">
	<input type="hidden" name="personnel.sfzh" value="${sfzh}"/>
	<cps:table>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">别名：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="bm" name="personnel.bm" value="${personnel.bm }"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">籍贯：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="jg" name="personnel.jg" value="${personnel.jg }"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">国籍：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="gj" name="personnel.gj" value="${personnel.gj }"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">职业类别：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="zylb" name="personnel.zylb" value="${personnel.zylb }"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">职位：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="zw" name="personnel.zw" value="${personnel.zw }"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">服务处所：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="fwcs" name="personnel.fwcs" value="${personnel.fwcs }"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">其他证件号码：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="qtzjhm" name="personnel.qtzjhm" value="${personnel.qtzjhm }"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">证件类型：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select id="qtzjlx" name="personnel.qtzjlx" zdlb="GB_ZJZL" cssClass="cps-input" value="${personnel.qtzjlx }" headerKey="" headerValue="--请选择--"></cps:select>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">兵役状况：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select id="byzk" name="personnel.byzk" zdlb="ZDRY_BYZK" cssClass="cps-input" value="${personnel.byzk }" headerKey="" headerValue="--请选择--"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">身高（cm）：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="sg" name="personnel.sg" value="${personnel.sg }"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">宗教信仰：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="zjxy" name="personnel.zjxy" value="${personnel.zjxy }"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">政治面貌：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select id="zzmh" name="personnel.zzmh" zdlb="GB_ZZMM" cssClass="cps-input" value="${personnel.zzmh }" headerKey="" headerValue="--请选择--"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">健康状况：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select id="jkzk" name="personnel.jkzk" zdlb="GB_JKZK" cssClass="cps-input" value="${personnel.jkzk }" headerKey="" headerValue="--请选择--"></cps:select>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">联系方式：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:textfield id="lxfs" name="personnel.lxfs" value="${personnel.lxfs }"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">文化程度：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select id="whcd" name="personnel.whcd" zdlb="ZAGL_RY_WHCD" cssClass="cps-input" value="${personnel.whcd }" headerKey="" headerValue="--请选择--"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="width:13%">婚姻状况：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select id="hyzk" name="personnel.hyzk" zdlb="AF_HYZK" cssClass="cps-input" value="${personnel.hyzk }" headerKey="" headerValue="--请选择--"></cps:select>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">血型：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select id="xx" name="personnel.xx" zdlb="ZDRY_XX" cssClass="cps-input" value="${personnel.xx }" headerKey="" headerValue="--请选择--"></cps:select>
			</cps:tdContent>
			<cps:tdLabel cssStyle="width:13%">民族：</cps:tdLabel>
			<cps:tdContent cssStyle="width:20%">
				<cps:select id="mz" name="personnel.mz" zdlb="GB_MZ" cssClass="cps-input" value="${personnel.mz }" headerKey="" headerValue="--请选择--"></cps:select>
			</cps:tdContent>
		</cps:row>
	</cps:table>
	</form>
	<div class="clearDiv"></div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="box_title">
			<tr>
				<td width="23">
					<img src="${contextPath}/template/cps/images/img_title.jpg"
						width="23" height="28" />
				</td>
				<td>
					基础信息 > 列管信息
				</td>
			</tr>
		</table>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="25%">列管状态:</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:if test="${personnel.isgk=='1'}">列管中</c:if>
					<c:if test="${personnel.isgk!='1'}">未列管</c:if>
				</cps:tdContent>
				<cps:tdLabel width="25%">责任民警:</cps:tdLabel>
				<cps:tdContent width="25%">
					
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>列管开始日期:</cps:tdLabel>
				<cps:tdContent>
					${personnel.djsj}
				</cps:tdContent>
				<cps:tdLabel>列管结束日期:</cps:tdLabel>
				<cps:tdContent>
					
				</cps:tdContent>
			</cps:row>
		</cps:table>
	<cps:button value="保存" onclick="saveValue('jbxxForm','jbxx');"></cps:button>
</creator:view>