<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view>
	<creator:Script src="/jsp/zdrygl/js/staffsurvey.js"></creator:Script>
	<creator:Script src="/jsp/zdrygl/js/zdry_comm.js"></creator:Script>
	<link type="text/css"
		href="<c:url value='/jsp/zdrygl/images/css.css'/>" rel="stylesheet" />
	
	<creator:panel id="wffzjl" title="动态信息 > 违法犯罪经历">
	<form id="wffzjlForm">
		<input type="hidden" name="wffzjl.sfzh" id="sfzh" value="${sfzh }" /> 
		
		<cps:table id="wffzjlTable">
			<cps:row>
				<cps:tdLabel cssStyle="width:13%">犯罪时间：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<input type="hidden" name="wffzjl.id" id="id" value="" />
					<cps:date name="wffzjl.toChar_zasj" value="${wffzjl.toChar_zasj}" id="toChar_zasj"></cps:date>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">犯罪地点：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="zadd" name="wffzjl.zadd" value="${wffzjl.zadd }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">问题性质：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="wtxz" name="wffzjl.wtxz" value="${wffzjl.wtxz }"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="width:13%">处理结果：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="cljg" name="wffzjl.cljg" value="${wffzjl.cljg }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">处理单位：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="cldw" name="wffzjl.cldw" value="${wffzjl.cldw }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">处理时间：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:date name="wffzjl.toChar_clsj" value="${wffzjl.toChar_clsj}" id="toChar_clsj"></cps:date>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="width:13%">维护单位：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="whdw" name="wffzjl.whdw" value="${wffzjl.whdw }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">维护人：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="whrxm" name="wffzjl.whrxm" value="${wffzjl.whrxm }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">案件类别：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="ajlb" name="wffzjl.ajlb" value="${wffzjl.ajlb }"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="width:13%">选择对象：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="xzdx" name="wffzjl.xzdx" value="${wffzjl.xzdx }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">选择物品：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="xzwp" name="wffzjl.xzwp" value="${wffzjl.xzwp }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">作案手段：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="zasd" name="wffzjl.zasd" value="${wffzjl.zasd }"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="width:13%">作案工具：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="zagj" name="wffzjl.zagj" value="${wffzjl.zagj }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">销赃方式：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="xzfs" name="wffzjl.xzfs" value="${wffzjl.xzfs }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">作案特点：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="zatd" name="wffzjl.zatd" value="${wffzjl.zatd }"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="width:13%">作案动机：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="zadj" name="wffzjl.zadj" value="${wffzjl.zadj }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">选择处所：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="xzcs" name="wffzjl.xzcs" value="${wffzjl.xzcs }"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%">活动地区：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<cps:textfield id="hddq" name="wffzjl.hddq"  value="${wffzjl.hddq }"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="width:13%">备注：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%" colspan="5">
					<textarea name="wffzjl.bz" id="bz" cols="35" rows="2" class="textarea2"
						class="textarea2">${wffzjl.bz }</textarea>
				</cps:tdContent>
			</cps:row>
		</cps:table>
		<cps:button value="保存" onclick="saveWffzjl();"></cps:button>
	</form>
	</creator:panel>
	<creator:panel id="lswffzjl" title="动态信息 > 历史违法犯罪经历">
		<cps:button value="新增" onclick="addWffzjl();"></cps:button>
		<cps:button value="修改" onclick="updateWffzjl();"></cps:button>
		<cps:button value="删除" onclick="delWffzjl();"></cps:button>
		<form id="searchform">
			<input type="hidden" name="wffzjl.sfzh" value="${sfzh }" id="sfzh" />
		</form>
		<cps:tableGrid id="wffzjlInfo" pageSize="15" usepager="true" searchform="searchform"
			autothead="true" url="/zdry/staffsurvey_queryWfjlList.action"
			click="showWffzjl" mutilSelect="false" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="犯罪时间" field="toChar_zasj"></cps:column>
			<cps:column title="犯罪地点" field="zadd"></cps:column>
			<cps:column title="问题性质" field="wtxz"></cps:column>
			<cps:column title="处理结果" field="cljg"></cps:column>
			<cps:column title="处理单位" field="cldw"></cps:column>
		</cps:tableGrid>
	</creator:panel>
</creator:view>