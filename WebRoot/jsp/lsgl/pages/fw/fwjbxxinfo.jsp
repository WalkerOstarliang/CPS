<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="${modename}房屋登记信息">
	<creator:Script src="/jsp/lsgl/js/fwinfo.js"></creator:Script>
	<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
	<script type="text/javascript">
		var existfwjbxx = "${existfwjbxx}";
		if (existfwjbxx == "false")
		{
			alert("没有找到关联房屋信息");
			$.closeWindow();
		}
	</script>
	
	<div style="height: 100%;">
		<cps:table>
			<cps:row>
				<cps:tdContent width="13%" valign="top">
					<div id="leftpanel" style="float: left;width:100%;height: 690px;border: 2px solid #DFF0F8;">
						<div id="header">
							<div id="head_title" style="text-align: center;" class="cps-box-title">房屋信息</div>
							<div id="dialog_leftmenu" class="dialog_leftmenu">
								<c:choose>
									<c:when test="${queryBean.sfczw== '1'}">
										<div id="fwinfo" onclick="initPage('fwinfo','1')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;出租房屋信息</div>
										<%--
						    			<div id="czxx"   onclick="initPage('czxx','4')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;出租记录信息</div>
						    			 --%>
						    			<div id="czfxcdj" onclick="initPage('czfxcdj','5')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;房屋巡查登记</div>
						    			<c:if test="${operType == 'update'}" >
											<div id="xtzry" onclick="initPage('xtzry','6')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;当前居住人员</div>
										</c:if>
						    			<c:if test="${operType == 'detail'}">
											<div id="xtzry" onclick="initPage('xtzry','6')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;当前居住人员</div>
						    				<div id="lstzry" onclick="initPage('lstzry','7')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;历史居住人员</div>
						    				<div id="lstzry" onclick="initPage('gldwxx','8')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;关联单位信息</div>
						    				<div id="czrxx" onclick="initPage('czrxx','9')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;承租人信息</div>
						    			</c:if>
									</c:when>
									<c:otherwise>
										<div id="fwinfo" onclick="initPage('fwinfo','1')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;房屋基本信息</div>
										<c:if test="${operType == 'update'}" >
											<div id="xtzry" onclick="initPage('xtzry','6')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;当前居住人员</div>
										</c:if>
										<c:if test="${operType == 'detail'}">
											<div id="xtzry" onclick="initPage('xtzry','6')"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;当前居住人员</div>
						    				<div id="lstzry" onclick="initPage('lstzry','7')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;历史居住人员</div>
						    				<div id="gldwxx" onclick="initPage('gldwxx','8')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;关联单位信息</div>
						    			</c:if>
									</c:otherwise>
								</c:choose>
								<div id="fwzpxx" onclick="initPage('fwzpxx','2')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;房屋照片信息</div>
								<div id="fwdzqy" onclick="initPage('fwdzqy','2')" ><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;合并地址迁移</div>
							</div>
						</div>
					</div>
				</cps:tdContent>
				<cps:tdContent valign="top">
					<form id="fwxxform" enctype="multipart/form-data" method="post">
						<input type="hidden"  id="sfczwhidden" value="${fwBean.sfczw}"/>
						<input type="hidden"  id="operType" name="operType" value="${operType }" />
						<input type="hidden" name="modename" value="实有房屋"/>
						<input type="hidden" id="fwid" name="fwBean.fwid" value="${fwBean.fwid}">
						<input type="hidden" id="queryBeanfwid" name="queryBean.fwid" value="${queryBean.fwid}">
						<input type="hidden" id="stid" name="queryBean.stid" value="${queryBean.stid}">
						<input type="hidden" id="dzid" name="queryBean.dzid" value="${queryBean.dzid}">
						<input type="hidden" id="msgtype" name="queryBean.msgtype" value="${queryBean.msgtype}"/>
						<input type="hidden" id="jsppage" name="queryBean.jsppage" value="${queryBean.jsppage}"/>
						<input type="hidden" id="queryBeanCzType" name="queryBean.czType" value="${queryBean.czType}">
						<input type="hidden" id="queryBeanSfczw" name="queryBean.sfczw" value="${queryBean.sfczw}"/>
						<input type="hidden" id="isczfdj" name="queryBean.isczfdj" value="${queryBean.isczfdj}"/>
						<input type="hidden" id="fwlch" name="queryBean.lch" value="${queryBean.lch}"/>
						<input type="hidden" id="fwdyh" name="queryBean.dyh" value="${queryBean.dyh}"/>
						<div id="contentpanel" style="width:100%">
						</div>
					</form>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</div>
</creator:view>
