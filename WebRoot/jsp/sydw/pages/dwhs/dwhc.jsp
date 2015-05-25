<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/sydw/js/dwhc.js"></creator:Script>
	
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="核签" onclick="save()" id="savebutton"></cps:button>
			<cps:button value="关闭" onclick="window.close()"></cps:button>
		</cps:tbar>
		<cps:panel title="单位基本信息">
			<%@include file="/jsp/zagl/pages/dwgl/detail/dwjbxx_detail.jsp"%>
		</cps:panel>
	</cps:PanelView>
	<cps:panel title="管理部门核签信息">
		<form id="dwhsfrom">
			<input type="hidden" name="dwBean.dwhs.id" value="${dwBean.dwhs.id }" id="id" />
			<input type="hidden" name="dwBean.dwhs.jgbh" value="${dwBean.dwhs.jgbh}" id="jgbh" />
			<input type="hidden" name="dwBean.dwhs.glbm" value="${dwBean.dwhs.glbm}" id="glbm" />
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">
						<font color='red'>*</font>是否${dwBean.dwhs.glbmms}单位管理：
					</cps:tdLabel>
					<cps:tdContent width="18%">
						<s:select list="#{'0':'否','1':'是'}" name=" dwBean.dwhs.sfgl" onchange="sfglChange(this.value)" value="1" id="sfgl" cssClass="validate[required] cps-select"></s:select>
					</cps:tdContent>
					
					<cps:tdLabel width="15%">
						<font color='red'>*</font>重点单位标识：</cps:tdLabel>
					<cps:tdContent width="18%">
						<c:choose>
							<c:when test="${loginInfo.leve == 3}">
								<cps:select zdlb="ZAGL_ZDDJ" name="dwBean.dwhs.zddwbz" headerKey="" headerValue=" " parentDm="3" value="${dwBean.dwhs.zddwbz}" id="zddwbz"  required="true"></cps:select>
							</c:when>
							<c:otherwise>
								<cps:select zdlb="ZAGL_ZDDJ" name="dwBean.dwhs.zddwbz" headerKey="" headerValue=" " value="${dwBean.dwhs.zddwbz}" id="zddwbz"  required="true"></cps:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<c:choose>
						<c:when test="${dwBean.dwhs.glbm eq '2'}">
							<cps:tdLabel width="15%"><font color="red">*</font>单位分类：</cps:tdLabel>
							<cps:tdContent>
								<cps:select name="dwBean.dwhs.dwfl" value="${dwBean.dwhs.dwfl}" id="dwfl" headerKey="" headerValue=" "  zdlb="ZDY_NBDWLB" required="true" />
							</cps:tdContent>
						</c:when>
						<c:otherwise>
							<cps:tdLabel width="15%">&nbsp;</cps:tdLabel>
							<cps:tdContent>&nbsp;</cps:tdContent>
						</c:otherwise>
					</c:choose>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6">
						<font color='red'>
							说明：当"是否单位管理"选择"否"时，不需要填写"重点单位标识"和"单位分类".
						</font>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</cps:panel>
</creator:view>