<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="实体信息维护">
<script type="text/javascript">
function openSyrkInfoPage(operType, rybh, rylb)
{
	var rybh = rybh == undefined ? "" : rybh;
	$.openWindow({
		url : contextPath + "/lsgl/rk/toRkInfoPage.action",
		data : {"operType" : operType,"queryBean.rybh" : rybh,"queryBean.rylb" :rylb,  t:new Date().getTime()},
		width : 1000,
		height : 760
	});
}
</script>
<style type="text/css">
	.fw_list { padding:10px 0 0 10px;border-bottom: 1px solid blue;height: 205px}
	.fw_list_a { margin:0 10px 10px 0; padding:0; float:left; display:block;}
</style>
<div id="lcxxdiv" class="fw_nr_c">
	<div class="fw_lc">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	    	<tr>
	        	<td>
	            	<div class="fw_list">
	             		<c:if test="${not empty fwrkBeans}">
	             			<c:forEach items="${fwrkBeans}" var="rkbean">
		                 	 	<div class="fw_list_a">
		                     		<div style="float:left;">
		                     			<div><img src="<c:url value='/cps/common/showPoto.action?sfzh=${rkbean.sfzh }'/>" width="155" height="165" onclick="openSyrkInfoPage('rydaxx','${rkbean.rybh }','${rkbean.rylb }')"></div>
		                     			<div style="text-align: center">${rkbean.xm }[${rkbean.sfzh }]</div>
		                     			<div style="text-align: center">[${rkbean.rylbms}]</div>
		                     		</div>
		                     	</div>
	                     	</c:forEach>
	                   </c:if>
	                </div>
	           </td>
	       </tr>
		</table>
	</div>
</div>
</creator:view>
