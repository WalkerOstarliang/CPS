<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 重点人员签收 --%>
<creator:view>
	<creator:Script src="/jsp/lsgl/pages/zdry/zdryqs/js/zdryqs.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${!(operType eq 'detail')}">
				<cps:button value="签收" onclick="saveZdryqs('1')"></cps:button>
				<cps:button value="退回" onclick="saveZdryqs('0')"></cps:button>
			</c:if>
			<cps:button value="关闭" onclick="window.close();"></cps:button>
		</cps:tbar>
		
		<cps:panel title="重点人员基本信息">
			<%@include file="/jsp/lsgl/pages/zdry/zdryqs/zdryjbxx.jsp" %>
		</cps:panel>
	</cps:PanelView>
	
	<%-- 取保候审 --%>
	<c:if test="${zdry.jbxx.rylxflag eq '1'}">
		<%@include file="/jsp/lsgl/pages/zdry/zdryqs/zdryqbhs.jsp" %>
	</c:if>
	
	<%-- 监视居住--%>
	<c:if test="${zdry.jbxx.rylxflag eq '2'}">
		<%@include file="/jsp/lsgl/pages/zdry/zdryqs/zdryjsjz.jsp" %>
	</c:if>
	
	<%-- 社区戒毒--%>
	<c:if test="${zdry.jbxx.rylxflag eq '3'}">
		<%@include file="/jsp/lsgl/pages/zdry/zdryqs/zdrysqjd.jsp" %>
	</c:if>
	
	<%-- 社区康复--%>
	<c:if test="${zdry.jbxx.rylxflag eq '4'}">
		<%@include file="/jsp/lsgl/pages/zdry/zdryqs/zdrysqkf.jsp" %>
	</c:if>
	
	<c:if test="${!(operType eq 'detail')}">
		<cps:panel title="重点人员签收">
			<form id="zdryqsform">
				<input type="hidden" id="rybh" name="zdryqs.rybh" value="${zdry.jbxx.renyuanbianhao}" />
				<input type="hidden" id="sfzh" name="zdryqs.sfzh" value="${zdry.jbxx.shenfenzhenghao}" />
				<input type="hidden" id="rylx" name="zdryqs.rylx" value="${zdry.jbxx.rylxflag}" />
				
				<input type="hidden" id="ladwmc" name="zdryqs.ladw" value="${zdry.jbxx.banandanweimc}" />
				<input type="hidden" id="flws" name="zdryqs.flws" value="${zdry.jbxx.wenshuwenhao}" />
				<input type="hidden" id="qfjg" name="zdryqs.qfjg" value="${zdry.jbxx.gonganmingcheng}" />
				<input type="hidden" id="qfsj" name="zdryqs.qfsj" value="${zdry.jbxx.pizhunriqi}" />
				
				<input type="hidden" id="ssjwqdm"  name="zdryqs.ssjwqdm" />
				<input type="hidden" id="ssjwqmc"  name="zdryqs.ssjwqmc" />
				
				<input type="hidden" id="jszt" name="zdryqs.jszt"/>
				
				<cps:table>
					<cps:row>
						<cps:tdLabel width="25%">重点人员所在社区：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="sssqdm"  name="zdryqs.sssqdm" />
							<cps:textfield name="zdryqs.sssqmc" id="sssqmc" readonly="true" onclick="openSqselectWin()" appendPopuBtn="true" cssStyle="width:93%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>退回原因：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="zdryqs.thyy" id="thyy" maxlength="100" cssStyle="width:93%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</c:if>
</creator:view>