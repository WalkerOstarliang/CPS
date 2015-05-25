<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<script type="text/javascript" src="<c:url value='/jsp/common/js/top.js'/>"></script>
	<div class="header">
		<div class="logo-${modename}">
			<span style="font-size:12px; color:#FFFFFF; float:right; padding:5px 10px 0 0;">
				欢迎您，${loginInfo.orgname } ${loginInfo.realname}[${loginInfo.username }]，今天是<label id="Clock"></label>
			</span>
		</div>
	</div>
	<div class="header_menu">
	
		<a href="<c:url value='http://${sqmh.href}/index.action'/>" class="menu_b" target="_parent"  >首页</a>
		
		<%--
		<a href="<c:url value='/lsgl/collect/toLsglCollection.action'/>" class="${modename=='lscj' ? 'menu_a' : 'menu_b'}" target="centerFrame" onclick="closeLeftFrame();">两实采集入口</a>
		--%>
		<a href="<c:url value='/index.action?modename=gzgl&menuid=SQJW1000001105'/>" class="${modename=='gzgl' ? 'menu_a' : 'menu_b'}" target="_parent">工作管理</a>
		<a href="<c:url value='/index.action?modename=lsgl&menuid=SQJW1000001106'/>" class="${modename=='lsgl' ? 'menu_a' : 'menu_b'}" target="_parent">两实管理</a>
		<a href="<c:url value='/index.action?modename=zagl&menuid=SQJW1000001400'/>" class="${modename=='zagl' ? 'menu_a' : 'menu_b'}"  target="_parent">治安管理</a>
		<a href="<c:url value='/index.action?modename=afgl&menuid=SQJW1000001410'/>" class="${modename=='afgl' ? 'menu_a' : 'menu_b' }" target="_parent">安全防范</a>
		<a href="<c:url value='/index.action?modename=zdrygl&menuid=SQJW1000001621'/>" class="${modename=='zdrygl' ? 'menu_a' : 'menu_b'}" target="_parent">重点人员管理</a>
		
		<a href="<c:url value='/index.action?modename=tjfx&menuid=SQJW1000001180'/>" class="${modename=='tjfx' ? 'menu_a' : 'menu_b'}" target="_parent">统计分析</a>
		
		<a href="<c:url value='/index.action?modename=xtgl&menuid=SQJW1000001340'/>" class="${modename=='xtgl' ? 'menu_a' : 'menu_b'}" target="_parent">派出所管理</a>
		<a href="http://${cas.href}/logout?service=http://${sqmh.href}/index.action" target="_parent" style="float:right; line-height:30px; color:#FFFFFF;">退出系统</a>
	</div>
	<%--
	<div class="header_bg">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td width="550"><img src="<c:url value='/template/cps/images/logo-${modename}.jpg'/>" height="70" /></td>
			    <td valign="bottom" style="margin: 0px;padding: 0px;">
			    	<div style="float: left;">
				<span style="font-size:12px; color:#FFFFFF; text-align: left;padding: 10px 10px 0px 0px;">
					&nbsp;&nbsp;欢迎您，${loginInfo.orgname } ${loginInfo.realname}[${loginInfo.username }]，今天是<label id="Clock"></label>
				</span>
			</div>
			<a href="http://${cas.href}/logout?service=http://${sqmh.href}/index.action" target="_parent" style="color:white;">退出</a>
			    	 
			    	<div style="border: 0px solid red; width: 100%;">
			    		<table border="0" cellspacing="0" cellpadding="0" class="header_navbg" width="100%">
			    			<tr>
			                	<td width="30"><img src="<c:url value='/template/cps/images/hy_header_08.gif'/>" width="38" height="29" /></td>
			                	<td>
			                		<a href="http://${sqmh.href}/index.action" target="_parent" class="header_nav">首 页</a>
				                	<c:choose>
					                	<c:when test="${modename =='gzgl'}">
					                		<a href="<c:url value='/index.action?modename=gzgl&menuid=SQJW1000001105'/>" target="_parent" class="header_nav_b">工作管理</a>
					                	</c:when>
					                	<c:otherwise>
					                		<a href="<c:url value='/index.action?modename=gzgl&menuid=SQJW1000001105'/>" target="_parent" class="header_nav">工作管理</a>
					                	</c:otherwise>
				                	</c:choose>
				                	<c:choose>
					                	<c:when test="${modename =='lsgl'}">
					                		<a href="<c:url value='/index.action?modename=lsgl&menuid=SQJW1000001106'/>" target="_parent" class="header_nav_b">数据采集</a>
					                	</c:when>
					                	<c:otherwise>
					                		<a href="<c:url value='/index.action?modename=lsgl&menuid=SQJW1000001106'/>" target="_parent" class="header_nav">数据采集</a>
					                	</c:otherwise>
				                	</c:choose>
				                	<c:choose>
					                	<c:when test="${modename =='tjfx'}">
					                		<a href="<c:url value='/index.action?modename=tjfx&menuid=SQJW1000001180'/>" target="_parent" class="header_nav_b">统计分析</a>
					                	</c:when>
					                	<c:otherwise>
					                		<a href="<c:url value='/index.action?modename=tjfx&menuid=SQJW1000001180'/>" target="_parent" class="header_nav">统计分析</a>
					                	</c:otherwise>
				                	</c:choose>
				                	<a href="http://${cms.ip}:${cms.port}/${cms.projectname}/index.jsp?subsystem_id=cms" target="_blank" class="header_nav">内容发布</a>
				                	
				                	<a href="<c:url value='/index.action?modename=xtgl&menuid=SQJW1000001340'/>" target="_parent" class="header_nav">系统管理</a>
				                	
				                	<div class="clear"></div>
			                	</td>
			                </tr>
			    		</table>
			    	</div>
			    	 
			    </td>
			  </tr>
		</table>
	</div>
	<div class="header_menu">
		<div style="float:left;">
			<a href="http://${sqmh.href}/index.action" target="_parent" class="header_nav">首 页</a>
				                	<c:choose>
					                	<c:when test="${modename =='gzgl'}">
					                		<a href="<c:url value='/index.action?modename=gzgl&menuid=SQJW1000001105'/>" target="_parent"  style="border-color: white;" class="menu_a">工作管理</a>
					                	</c:when>
					                	<c:otherwise>
					                		<a href="<c:url value='/index.action?modename=gzgl&menuid=SQJW1000001105'/>" target="_parent" class="header_nav">工作管理</a>
					                	</c:otherwise>
				                	</c:choose>
				                	<c:choose>
					                	<c:when test="${modename =='lsgl'}">
					                		<a href="<c:url value='/index.action?modename=lsgl&menuid=SQJW1000001106'/>" target="_parent" class="header_nav_b">数据采集</a>
					                	</c:when>
					                	<c:otherwise>
					                		<a href="<c:url value='/index.action?modename=lsgl&menuid=SQJW1000001106'/>" target="_parent" class="header_nav">数据采集</a>
					                	</c:otherwise>
				                	</c:choose>
				                	<c:choose>
					                	<c:when test="${modename =='tjfx'}">
					                		<a href="<c:url value='/index.action?modename=tjfx&menuid=SQJW1000001180'/>" target="_parent" class="header_nav_b">统计分析</a>
					                	</c:when>
					                	<c:otherwise>
					                		<a href="<c:url value='/index.action?modename=tjfx&menuid=SQJW1000001180'/>" target="_parent" class="header_nav">统计分析</a>
					                	</c:otherwise>
				                	</c:choose>
				                	<a href="http://${cms.ip}:${cms.port}/${cms.projectname}/index.jsp?subsystem_id=cms" target="_blank" class="header_nav">内容发布</a>
				                	
				                	<a href="<c:url value='/index.action?modename=xtgl&menuid=SQJW1000001340'/>" target="_parent" class="header_nav">系统管理</a>
				                	
		
			 
			<c:if test="${modename == 'lsgl'}">
				<a href="<c:url value='/pgis/toMain.action'/>" class="menu_b" style="border-color: white;" target="_parent">地图模式</a>
				<a href="<c:url value='/index.action?modename=lsgl&menuid=SQJW1000001106'/>" class="menu_a" style="border-color: white;" target="_parent">列表模式</a>
			</c:if>
			 
		</div>
		<div style="float: right;">
			<div style="float: left;">
				<span style="font-size:12px; color:#FFFFFF; text-align: left;padding: 10px 10px 0px 0px;">
					&nbsp;&nbsp;欢迎您，${loginInfo.orgname } ${loginInfo.realname}[${loginInfo.username }]，今天是<label id="Clock"></label>
				</span>
			</div>
			<a href="http://${cas.href}/logout?service=http://${sqmh.href}/index.action" target="_parent" style="color:white;">退出</a>
		</div>
	</div>
	 --%>
	<%--
	<script type="text/javascript" src="<c:url value='/jsp/common/js/top.js'/>"></script>
	<div class="header">
		<div class="logo-${modename}">
			<span style="font-size:12px; color:#FFFFFF; float:right; padding:5px 10px 0 0;">
				欢迎您，${loginInfo.orgname } ${loginInfo.realname}[${loginInfo.username }]，今天是<label id="Clock"></label>
			</span>
		</div>
	</div>
	<div class="header_menu">
		<div style="float:left;">
			<c:if test="${modename == 'lsgl'}">
				<a href="<c:url value='/pgis/toMain.action'/>" class="menu_b" style="border-color: white;" target="_parent">地图模式</a>
				<a href="<c:url value='/index.action?modename=lsgl&menuid=9'/>" class="menu_a" style="border-color: white;" target="_parent">列表模式</a>
			</c:if>
		</div>
		<div>
			<marquee direction="left" scrolldelay="20" behavior="scroll" style="float: left;width: 70%;color: white;">
				<span onclick="zipFieldDown('/down/gapcsgztzgs.doc','湖南省公安派出所基础台账规范.doc')" style="color: white;" class="cps_span_href">
					关于印发《湖南省公安派出所基础台账规范》的通知
				</span>
			</marquee>
			<a href="javascript:closeWindow();" style="float:right; line-height:30px; color:#FFFFFF;">退出系统</a>
		</div>
	</div>
	 --%>
</creator:view>
