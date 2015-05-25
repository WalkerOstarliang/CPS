<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header">
	<div class="logo-lsgl">
		<span style="font-size:12px; color:#FFFFFF; float:right; padding:5px 10px 0 0;">
			欢迎您，${loginInfo.orgname } ${loginInfo.realname}[${loginInfo.username }]，今天是<label id="Clock"></label>
		</span>
	</div>
</div>
<div class="header_menu">
	<div style="float:left;">
			<a href="<c:url value='/pgis/toMain.action'/>" class="menu_a" style="border-color: white;">地图模式</a>
			<a href="<c:url value='/index.action?modename=lsgl&menuid=SQJW1000001106'/>" class="menu_b" style="border-color: white;">列表模式</a>
		</div>
		<div>
			<marquee direction="left" scrolldelay="20" behavior="scroll" style="float: left;width: 70%;color: white;">
				<span onclick="zipFieldDown('/down/gapcsgztzgs.doc','湖南省公安派出所基础台账规范.doc')" style="color: white;" class="cps_span_href">关于印发《湖南省公安派出所基础台账规范》的通知</span>
			</marquee>
			<a href="javascript:closeWindow();" style="float:right; line-height:30px; color:#FFFFFF;">退出系统</a>
		</div>
</div>