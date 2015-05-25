<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="乞讨人员家庭成员和亲友信息">

<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js">
	
</script>
<creator:tbar id="qtryQyxxInfotbar">
	<c:choose>
		<c:when test="${operType=='add'}">
			<cps:button id="save" value="保&nbsp;存" onclick="submitSaveQtryQyxx('true')" display="${displayAddBtn}"></cps:button>
			<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
		</c:when>
	</c:choose>
</creator:tbar>
<!--startprint1-->
<form id="qtryqyxxform" name="qtryqyxxform"  action="/qzgl/wmfwgl/saveQtryQyxxBean.action" method="post">
<creator:panel id="addQtryqy" title="乞讨人员家庭成员和亲友信息" tbarId="qtryQyxxInfotbar">
	<s:hidden id="operType" name="operType"></s:hidden>
	<!-- qtryid为关联乞讨人员基本信息的主键 -->
	<s:hidden id="qtryid" name="qtryqybean.qtryid"></s:hidden>
	<s:hidden id="id" name="qtryqybean.id"></s:hidden>
	<!-- qtryqybean -->
		  <cps:table id="qtryqyxxTable">	
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>亲友姓名：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="jtpyxm" name="qtryqybean.jtpyxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%"><font color="red">*</font>与亲友关系：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="jtpygx" name="qtryqybean.jtpygx" zdlb="SHGX" headerKey="" headerValue="--请选择--" value="${qtryqybean.jtpygx}" cssClass="validate[required]"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">亲友联系电话：</cps:tdLabel>
				<cps:tdContent width="25%" colspan="3">
					<cps:textfield id="jtpylxdh" name="qtryqybean.jtpylxdh" cssClass="validate[maxSize[30]]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><c:if test="${operType!='detail'}"></c:if>采集人：</cps:tdLabel>
				<cps:tdContent width="25%">
					<s:hidden id="djrxm" name="qtryqybean.djrxm"></s:hidden>
					<s:hidden id="djrjh" name="qtryqybean.djrjh"></s:hidden>
					${qtryqybean.djrxm} &nbsp;
				</cps:tdContent>
				<cps:tdLabel width="12%"><c:if test="${operType!='detail'}"></c:if>采集时间：</cps:tdLabel>
				<cps:tdContent width="25%">
				<s:hidden id="djsj" name="qtryqybean.djsj"></s:hidden>
					&nbsp;${qtryqybean.djsj}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><c:if test="${operType!='detail'}"></c:if>采集单位：</cps:tdLabel>
				<cps:tdContent width="25%" colspan="3">
					<s:hidden id="djdwdm" name="qtryqybean.djdwdm"></s:hidden>
					<s:hidden id="djdwmc" name="qtryqybean.djdwmc"></s:hidden>
					${qtryqybean.djdwmc}
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</form>
<!--endprint1-->
</creator:view>