<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/rkinfo.js"></creator:Script>
	<script type="text/javascript">
		var isydj = "${rkBean.czrkBean.czrkbh != null && rkBean.czrkBean.czrkbh != ''}";
		var opentip = "${opentip}";
		var operType = "${operType}";
		if (operType=="add" && opentip=="true" && isydj == "true")
		{
			if(!confirm("${rkBean.jbxxBean.xm}在房屋【${rkBean.fwxxBean.dzmc}】已经登记，确定继续登记吗？"))
			{
				parent.close();
			}
		}
	</script>
	<form id="rkxxform" method="post">
		<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${rkBean.jbxxBean.rybh}"/>
		<input type="hidden" id="cyrybh" name="queryBean.cyrybh" value="${queryBean.cyrybh}">
		<cps:PanelView>
			<cps:tbar>
				<cps:button id="savebtn" value="保存" onclick="saveCzrkInfo()"></cps:button>
				<cps:button  value="关闭" onclick="closeWindow()"></cps:button>
			</cps:tbar>
			<cps:panel title="人口基本信息" height="720px">
				<%@include file="/jsp/lsgl/pages/rk/newrkjbxx.jsp" %>
				<%@include file="/jsp/lsgl/pages/rk/czrk/dhrkhkxx.jsp"%>
			</cps:panel>
		</cps:PanelView>
	</form>
</creator:view>