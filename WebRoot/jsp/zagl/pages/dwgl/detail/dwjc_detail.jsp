<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/dwjc_detail.js"></creator:Script>
	<creator:panel id="dwjcxx" title="单位奖惩信息">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="15%">
					<font color="red">*</font>奖惩类别：</cps:tdLabel>
				<cps:tdContent width="18%" id="jclb">
					<c:choose>
						<c:when test="${dw.dwjc.jclb eq '0'}">
							奖励
						</c:when>
						<c:when test="${dw.dwjc.jclb eq '1'}">
							处罚
						</c:when>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="15%">
					<font color="red">*</font>奖惩时间：</cps:tdLabel>
				<cps:tdContent width="18%" id="cfrq">
					${dw.dwjc.cfrq}&nbsp;
				</cps:tdContent>
		
				<cps:tdLabel width="15%">奖惩实施单位：</cps:tdLabel>
				<cps:tdContent width="19%" id="jcssdw">
					${dw.dwjc.jcssdw}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"> 奖惩原因：</cps:tdLabel>
				<cps:tdContent colspan="6" id="cfyy">
					${dw.dwjc.cfyy}&nbsp;
				</cps:tdContent>
			</cps:row>
		
			<cps:row>
				<cps:tdLabel> 奖惩内容：</cps:tdLabel>
				<cps:tdContent colspan="6" id="cfnr" >
					${dw.dwjc.cfnr}&nbsp;
				</cps:tdContent>
			</cps:row>
		
			<cps:row>
				<cps:tdLabel>登记人：</cps:tdLabel>
				<cps:tdContent id="djrxm">
					${dw.dwjc.djrxm}&nbsp;
				</cps:tdContent>
		
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent id="djsj">
					${dw.dwjc.djsj}&nbsp;
				</cps:tdContent>
		
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent id="djdwmc">
					${dw.dwjc.djdwmc}&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</creator:view>