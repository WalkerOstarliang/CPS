<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/js/addmenu.js"></creator:Script>
<form id="menuform" method="post" enctype="multipart/form-data">
	<input type="hidden" name="operType" value="${operType }"/>
	<input type="hidden" name="menuBean.menuid" value="${menuBean.menuid}"/>
	<c:if test="${operType=='add'}">
		<input type="hidden" name="menuBean.menulevel" value="2"/>
	</c:if>
	<c:if test="${operType=='update'}">
		<input type="hidden" name="menuBean.menulevel" value="${menuBean.menulevel }"/>
	</c:if>
	<input type="hidden" name="menuBean.parentid" value="${menuBean.parentid}">
	<input type="hidden" name="menuBean.href" value="${menuBean.href}">
	<cps:table>
		<cps:row>
			<cps:tdLabel>菜单标题：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="title" name="menuBean.title" value="${menuBean.title}" maxlength="10"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>菜单图标：</cps:tdLabel>
			<cps:tdContent>
				<input type="file" id="imageicon" name="menuBean.imageicon" class="cps-file" style="width:70%" maxlength="200"/>
			</cps:tdContent>
		</cps:row>
		<cps:row>
				<cps:tdLabel>是否有效：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'1':'有效','0':'失效'}" id="isvalid" name="menuBean.isvalid" cssClass="cps-select"></s:select>
				</cps:tdContent>
			</cps:row>
		<cps:row>
			<cps:tdContent colspan="2" align="center">
				<cps:button value="确定" onclick="submitSaveMenu()"></cps:button>
				<cps:button value="关闭" onclick="closelayerWin()"></cps:button>
			</cps:tdContent>
		</cps:row>
	</cps:table>
</form>
</creator:view>