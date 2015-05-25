<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="汇报工作登记表">
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/hbgzInfo.js"></script>
		<creator:tbar id="hbgzcyrInfotbar">
			<cps:button value="保&nbsp;存" onclick="save()"></cps:button>
			<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
		</creator:tbar>
		<creator:panel id="hbgzcyrInfo" title="向群众汇报工作登记表" tbarId="hbgzcyrInfotbar">
			<form id="hbgzcyrform" action="<c:url value='/qzgl/hbgzgl/addCyr.action'/>" method="post">
			<input id="operType" name="operType" value="${operType }" type="hidden" />
			<input type="hidden" id="hbgzbh" value="${bh }" name="yhr.bgbh"/>
		    <input type="hidden" id="cyrbh" value="${cyrbh }" name="yhr.bh"/>
			
				<cps:table id="cyrtable">
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>姓名：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xm" name="yhr.xm" cssClass="validate[maxSize[15],required]" value="${yhr.xm}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="lxdh" name="yhr.lxdh" maxlength="20" minlength="7" value="${yhr.lxdh}" isPhone="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">单位名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="dwmc" name="yhr.dwmc"  cssClass="validate[maxSize[60]" value="${yhr.dwmc}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">职务：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="zw" name="yhr.zw" value="${yhr.zw}" zdlb="ZAGL_RY_ZW" headerKey="" headerValue="--选择--"></cps:select>
						</cps:tdContent>
					</cps:row>
					
				</cps:table>
			</form>
		</creator:panel>
</creator:view>