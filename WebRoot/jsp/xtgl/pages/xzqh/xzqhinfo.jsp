<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="行政区划信息">
<creator:Script src="/jsp/xtgl/js/xzqhinfo.js"></creator:Script>
<c:if test="${operType != 'detail'}">
<creator:tbar id="tbar">
	<cps:button value="保&nbsp;存" onclick="saveXzqhBean()"></cps:button>
	<cps:button value="重&nbsp;置" type="reset"></cps:button>
	<cps:button value="关&nbsp;闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="xzqhinfo" title="${xzqhBean.leve==5 ? '社区维护':'街道维护'}" tbarId="tbar">
	<form id="xzqhform" action="<c:url value='/xtgl/xzqh/saveHnxzqhBean.action'/>" method="post">
		<input type="hidden" id="rootParentDm" name="rootParentDm" value="${rootParentDm}">
		<input type="hidden" id="operType" name="operType" value="${operType }">
		<input type="hidden" id="leve" name="xzqhBean.leve" value="${xzqhBean.leve}">
		<input type="hidden" id="parent_dm" name="xzqhBean.parent_dm" value="${xzqhBean.parent_dm}">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="20%">
					<font color="red">*</font>
					<c:choose>
						<c:when test="${xzqhBean.leve == '4'}">
							市县区：
						</c:when>
						<c:when test="${xzqhBean.leve == '5'}">
							乡镇街道:
						</c:when>
					</c:choose>
				</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="parent_mc" name="xzqhBean.parent_mc" value="${xzqhBean.parent_mc}" required="true" readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>行政代码：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="dm" name="xzqhBean.dm" value="${xzqhBean.dm}" readonly="true" required="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>
					<font color="red">*</font>
					<c:choose>
						<c:when test="${xzqhBean.leve == '4'}">
							乡镇街道名称：
						</c:when>
						<c:when test="${xzqhBean.leve == '5'}">
							社区/农村名称：
						</c:when>
					</c:choose>
				</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="parent_dm" name="xzqhBean.jc" value="${xzqhBean.jc}" required="true" maxlength="100"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			 <cps:row>
			 	<cps:tdContent colspan="2">
					<c:choose>
						<c:when test="${xzqhBean.leve == '4'}">
							<font color="red">(乡镇街道名称命名规范 ---街道名称  如:韭菜园街道)</font>
						</c:when>
						<c:when test="${xzqhBean.leve == '5'}">
							<font color="red">(社区/农村简称命名规范---社区名称   如:汤家岭社区)</font>
						</c:when>
					</c:choose>
			 	</cps:tdContent>
			 </cps:row>
			<cps:row>
				<cps:tdLabel>管辖派出所：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="sspcsdm" name="xzqhBean.sspcsdm" value="${xzqhBean.sspcsdm}">
					<cps:textfield id="sspcsmc" name="xzqhBean.sspcsmc" value="${xzqhBean.sspcsmc}" appendPopuBtn="true" onclick="openSelectPcsWinBySjdm()"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<c:if test="${xzqhBean.leve == '5'}">
				<cps:row>
					<cps:tdLabel>管辖警务区：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="gxsqjwsdm" name="xzqhBean.gxsqjwsdm" value="${xzqhBean.gxsqjwsdm}">
						<cps:textfield id="gxsqjwsmc" name="xzqhBean.gxsqjwsmc" value="${xzqhBean.gxsqjwsmc}" appendPopuBtn="true" onclick="openSelectSqjwsWin()"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</c:if>
			 
			<cps:row>
				<cps:tdLabel>是否有效：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'1':'是','0':'否'}" id="isvalid" name="xzqhBean.isvalid" cssStyle="width:100px"></s:select>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
</c:if>
<c:if test="${operType == 'detail'}">
	<creator:panel id="xzqhinfo" title="行政区划明细">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="20%">
					 代码：
				</cps:tdLabel>
				<cps:tdContent>
					${xzqhBean.dm }
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>
					 名称：
				</cps:tdLabel>
				<cps:tdContent>
					${xzqhBean.mc }
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>所属街道：</cps:tdLabel>
				<cps:tdContent>
					${xzqhBean.parent_mc }
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>
					级别：
				</cps:tdLabel>
				<cps:tdContent>
					 ${xzqhBean.leve }
				</cps:tdContent>
			</cps:row>
			<c:if test="${xzqhBean.leve == '5' || xzqhBean.leve == '4'}">
				<cps:row>
					<cps:tdLabel>管辖派出所：</cps:tdLabel>
					<cps:tdContent>
						 ${xzqhBean.sspcsmc }
					</cps:tdContent>
				</cps:row>
			</c:if>
			<c:if test="${xzqhBean.leve == '5'}">
				<cps:row>
					<cps:tdLabel>管辖警务区：</cps:tdLabel>
					<cps:tdContent>
						 ${xzqhBean.gxsqjwsmc }
					</cps:tdContent>
				</cps:row>
			</c:if>
			<cps:row>
				<cps:tdLabel>有效性：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${xzqhBean.isvalid=='0'}">
							<input type="radio" name="xzqhBean.isvalid" value="1">是
							<input type="radio" name="xzqhBean.isvalid" value="0" checked="checked">否
						</c:when>
						<c:otherwise>
							<input type="radio" name="xzqhBean.isvalid" value="1" checked="checked">是
							<input type="radio" name="xzqhBean.isvalid" value="0">否
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</c:if>
</creator:view>