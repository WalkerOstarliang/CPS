<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">

	function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect2({
			rootOrgCode : orgcode,
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}

function querydwtjxx() {
	$("#ckyjxxList").query("F", "nbdwtjQueryForm");
}
</script>
<creator:view>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="querydwtjxx()"></cps:button>
		</cps:tbar>
		<cps:panel title="统计条件">
			<form id="nbdwtjQueryForm">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">统计单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="dwcx.orgcode" id="orgcode" value="${userOrgCode}" />
							<cps:textfield id="orgname" appendPopuBtn="true" value="${userOrgName}" onclick="selectOrg('${userOrgCode}','orgcode','orgname')" readonly="true"/>
						</cps:tdContent>
						<cps:tdLabel>统计级别：</cps:tdLabel>
						<cps:tdContent>
							<input id="fxjtj" type="radio" value="1" name="dwtjjb"/>分县局
							<input id="pcstj"  type="radio" value="2" name="dwtjjb"/>派出所
							<input checked id="jwqtj" type="radio" value="3" name="dwtjjb"/>警务区
							
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>统计时间：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:date id="djsjstart" name="dwcx.djsjstart" dateFmt="yyyy-MM-dd" cssStyle="width:180px;"></cps:date>&nbsp;至&nbsp;
							<cps:date id="djsjend" name="dwcx.djsjend" dateFmt="yyyy-MM-dd" cssStyle="width:180px;"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	<cps:panel title="统计结果">
			<cps:tableGrid  url="/zagl/dw/queryNbdwlbtjPageResultInfo.action"
			id="ckyjxxList" autoload="false" pageSize="20" width="99.8%"
			usepager="true" searchform="nbdwtjQueryForm" autothead="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="单位名称" field="orgname" align="left"></cps:column>
			<cps:column title="党政机关" field="dzjg" width="8%"></cps:column>
			<cps:column title="高校" field="gx" width="4%"></cps:column>
			<cps:column title="中小学幼儿园" field="zxxx" width="6%"></cps:column>
			<cps:column title="卫生系统" field="yy" width="8%"></cps:column>
			<cps:column title="大型商场超市" field="sc" width="6%"></cps:column>
			<cps:column title="大型企业" field="qy" width="8%"></cps:column>
			<cps:column title="银行金融机构" field="yh" width="6%" ></cps:column>
			<cps:column title="三电油气" field="sdyq" width="4%"></cps:column>
			<cps:column title="重点工程" field="zdgc" width="4%"></cps:column>
			<cps:column title="物业小区" field="wyxq" width="4%"></cps:column>
			<cps:column title="其他" field="qt" width="4%"></cps:column>
			<cps:column title="合计" field="hj" width="4%"></cps:column>
		</cps:tableGrid>
	</cps:panel>
</creator:view>