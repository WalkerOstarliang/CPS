<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="leftpanel" class="cps-box-panel">
	<cps:table width="100%" height="100%">
		<cps:row>
			<cps:tdContent valign="top" width="10%">
				<div style="height: 100%;width:100%">
					<div id="header">
						<div id="head_title" style="text-align: center;" class="cps-box-title">${modename}</div>
						<div id="zpxx" class="cps-box-content">
							<c:choose>
								<c:when test="${queryBean.rylb != '4'}">
									<img id="MyImage1" src="${contextPath}/cps/common/showPoto.action?sfzh=${rkBean.jbxxBean.sfzh}" title="全国人口库照片" alt="全国人口库照片" height="140" width="130"/>
								</c:when>
								<c:otherwise>
									<img id="MyImage1" src="${contextPath}/cps/common/showJwrkPoto.action?rybh=${rkBean.jbxxBean.rybh}" title="全国人口库照片" alt="全国人口库照片" height="140" width="130"/>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="zdryDxlb" style="color: red;" class="cps-box-title">${zdryDxlb }</div>
						<div id="dialog_leftmenu" class="dialog_leftmenu">
							<%--常住人口 --%>
							<c:if test="${queryBean.rylb == '1'}">
								<div id="czrkinfo" onclick="initPage('czrkinfo','1')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;人口基本信息</div>
							</c:if>
							<%--流动人口 --%>
							<c:if test="${queryBean.rylb == '2'}">
								<div id="lkjbxx" onclick="initPage('lkjbxx','1')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;流口基本信息</div>
							</c:if>
							<%--未落户人口 --%>
							<c:if test="${queryBean.rylb == '3'}">
								<div id="wlhrkjbxx" onclick="initPage('wlhrkjbxx','1')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;人口基本信息</div>
							</c:if>
							
							<%--境外人员 --%>
							<c:if test="${queryBean.rylb == '4'}">
								<div id="jwrkinfo" onclick="initPage('jwrkinfo','1')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;人员基本信息</div>
							</c:if>
							
							<%--寄住人口 --%>
							<c:if test="${queryBean.rylb == '5'}">
								<div id="jzjbxx" onclick="initPage('jzjbxx','1')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;寄住基本信息</div>
							</c:if>
							
					    	<div id="rkzpxx" onclick="initPage('rkzpxx','3')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;人口照片信息</div>
					    	<div id="shgxxx" onclick="initPage('shgxxx','4')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;社会关系信息</div>
					    	<div id="tmtzxx" onclick="initPage('tmtzxx','5')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;体貌特征信息</div>
					    	<div id="lxfsxx" onclick="initPage('lxfsxx','6')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;联系方式信息</div>
							
							<%--
							<div id="thryxx" onclick="initPage('thryxx','7')" ><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;同户人员信息</div>
					    	<div id="tzryxx" onclick="initPage('tzryxx','8')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;同址人员信息</div>
					    	<div id="cylsxx" onclick="initPage('cylsxx','9')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;从业历史信息</div>
							 --%>
							 <%--常住人口 --%>
							<c:if test="${queryBean.rylb == '1'}">
					    		<div id="rklshkxxlist" onclick="initPage('rklshkxxlist','2')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;户口迁移信息</div>
							</c:if>
							<%--流动人口 --%>
							<c:if test="${queryBean.rylb == '2'}">
					    		<div id="zzrklist" onclick="initPage('zzrklist','2')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;历史居住信息</div>
							</c:if>
							 <%--境外人员 --%>
							<c:if test="${queryBean.rylb == '4'}">
					    		<div id="jwrklsjzxx" onclick="initPage('jwrklsjzxx','2')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;历史居住信息</div>
							</c:if>
							<%--寄住人口 --%>
							 <c:if test="${queryBean.rylb == '5'}">
					    		<div id="jzrklist" onclick="initPage('jzrklist','2')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;历史寄住信息</div>
							</c:if>
							<%--未落户人口 --%>
							<c:if test="${queryBean.rylb == '3'}">
					    		<div id="lswlhjllist" onclick="initPage('lswlhjllist','2')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;历史未落户信息</div>
							</c:if>
						</div>
					</div>
				</div>
			</cps:tdContent>
			<cps:tdContent valign="top" width="90%">
				<form id="rkxxform" enctype="multipart/form-data" method="post">
					<input type="hidden" id="msgtype" name="msgtype" value="${msgtype}"/>
					<input type="hidden" id="operType" name="operType" value="${operType}"/>
					<input type="hidden" id="rylb" name="rkBean.rylb" value="${queryBean.rylb}"/>
					<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${queryBean.rybh }"/>
					<input type="hidden" id="jsppage" value=""/>
					<div id="contentpanel" style="width:100%">
						
					</div>
				</form>
			</cps:tdContent>
		</cps:row>
	</cps:table>
</div>
 

	