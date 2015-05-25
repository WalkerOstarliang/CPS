<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="汇报工作登记表">
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/gyhd.js"></script>
		<creator:panel id="hbgzcyrInfo" title="向群众汇报工作登记表">
			<form id="hbgzcyrform" action="<c:url value='/qzgl/hbgzgl/addCyr.action'/>" method="post">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="bh" name="bh"></s:hidden>
				<cps:table id="cyrtable">
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>附件：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xm" name="yhr.xm" cssClass="validate[maxSize[30],required]"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="lxdh" name="yhr.lxdh" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
				<cps:tableGrid url="/qzgl/gyhdgl/queryFjlist.action?bh=${bh}" id="fjlist" pageSize="5">
					<cps:column isNumber="true" title="序号"></cps:column>
					<c:if test="${operTypee=='update' }"><cps:column isCheckbox="true"></cps:column></c:if>
					<cps:column field="fjmc" title="附件名称" ></cps:column>
					<c:if test="${operType=='update' }"><cps:column field="cz" title="操作" maxlength="5" rowcallback="fjcz"></cps:column></c:if>
				</cps:tableGrid>
			</form>
		</creator:panel>
</creator:view>