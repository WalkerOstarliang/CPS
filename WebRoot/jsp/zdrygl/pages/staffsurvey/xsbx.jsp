<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view>
	<creator:Script src="/jsp/zdrygl/js/staffsurvey.js"></creator:Script>
	<link type="text/css"
		href="<c:url value='/jsp/zdrygl/images/css.css'/>" rel="stylesheet" />
	<creator:Script src="/jsp/zdrygl/js/zdry_comm.js"></creator:Script>
	<creator:panel id="xsbx" title="动态信息 > 现实表现">
		<form id="xsbxForm" method="post">
			<input type="hidden" name="xsbx.sfzh" id="sfzh" value="${sfzh }" /> 
			<cps:table id="xsbxTable">
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">记录时间：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<input type="hidden" name="xsbx.id" id="id" value="" />
						<cps:date name="xsbx.toChar_jlsj" value="${xsbx.toChar_jlsj}" id="toChar_jlsj"></cps:date>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">在控状态</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:select id="zkzt" name="xsbx.zkzt" zdlb="ZDRY_ZKZT" value="${xsbx.zkzt}" headerKey=""
									headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">去往省市</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="qwss" name="xsbx.qwss" value="${xsbx.qwss }"></cps:textfield>
					</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">是否长期混迹于复杂场所：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:select id="iscqhjyfzcs" name="xsbx.iscqhjyfzcs" zdlb="GB_ZT" value="${xsbx.iscqhjyfzcs}" headerKey=""
									headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">场所名称：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="csmc" name="xsbx.csmc" value="${xsbx.csmc }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">场所详址：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="csxz" name="xsbx.csxz" value="${xsbx.csxz }"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">是否长期有家不归：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:select id="iscqyjbg" name="xsbx.iscqyjbg" zdlb="GB_ZT" value="${xsbx.iscqyjbg}" headerKey=""
									headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">居住起始时间：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:date name="xsbx.toChar_jzqssj" value="${xsbx.toChar_jzqssj}" id="toChar_jzqssj"></cps:date>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">居住地址：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="zzxz" name="xsbx.zzxz" value="${xsbx.zzxz }"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">是否有固定职业：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:select id="isygdzy" name="xsbx.isygdzy" zdlb="GB_ZT" value="${xsbx.isygdzy}" headerKey=""
									headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">是否在原籍市内：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:select id="iszyhjsn" name="xsbx.iszyhjsn" zdlb="GB_ZT" value="${xsbx.iszyhjsn}" headerKey=""
									headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">离开本市时间：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:date name="xsbx.toChar_lkbssj" value="${xsbx.toChar_lkbssj}" id="toChar_lkbssj"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">考察情况：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%" colspan="5">
						<textarea name="xsbx.xsqkms" id="xsqkms" cols="35" rows="2"
							class="textarea2">${xsbx.xsqkms }</textarea>
					</cps:tdContent>
				</cps:row>
			</cps:table>
			<cps:button value="保存" onclick="saveXsbx();"></cps:button>
		</form>
	</creator:panel>
	<creator:panel id="xsbx" title="动态信息 > 历史现实状况">
		<cps:button value="新增" onclick="addXsbx();"></cps:button>
		<cps:button value="修改" onclick="updateXsbx();"></cps:button>
		<cps:button value="删除" onclick="delXsbx();"></cps:button>
		<form id="searchform" method="POST">
			<input type="hidden" value="${sfzh }" name="sfzh" />
		</form>
		<cps:tableGrid id="xsbxInfo" usepager="false" searchform="searchform"
			autothead="true" url="/zdry/staffsurvey_queryBySfzhXsbxList.action"
			click="showXsbx" mutilSelect="false" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="记录时间" field="toChar_jlsj"></cps:column>
			<cps:column title="在控状况" field="zkztmc"></cps:column>
			<cps:column title="考察情况" field="xsqkms"></cps:column>
		</cps:tableGrid>
	</creator:panel>
</creator:view>