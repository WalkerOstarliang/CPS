<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<div id="leftpanel" class="cps-box-panel">
		<cps:table width="100%" height="100%">
			<cps:row>
				<cps:tdContent valign="top" width="10%">
					<div style="height: 100%;width:100%">
						<div id="header">
							<div id="head_title" style="text-align: center;" class="cps-box-title">境外人口信息</div>
							<div id="zpxx" class="cps-box-content">
								<img id="MyImage1" src="${contextPath}/cps/common/showJwrkPoto.action?rybh=${queryBean.rybh}" height="140" width="130"/>
							</div>
							 <div class="left_menubox">
						    	<a href="<c:url value='/lsgl/jwrk/loadJwrkJbxxInfo.action'/>?queryBean.cyrybh=${queryBean.cyrybh}&queryBean.rybh=${queryBean.rybh}&queryBean.fwid=${queryBean.fwid}&queryBean.gj=${queryBean.gj}&queryBean.zjzl=${queryBean.zjzl}&queryBean.zjhm=${queryBean.zjhm}&queryBean.ywx=${queryBean.ywx}&queryBean.ywm=${queryBean.ywm}&queryBean.xb=${queryBean.xb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;人口基本信息</a>
						    	<a href="<c:url value='/lsgl/jwrk/toJwrkzpPage.action'/>?queryBean.rybh=${queryBean.rybh}&queryBean.fwid=${queryBean.fwid}&queryBean.gj=${queryBean.gj}&queryBean.zjzl=${queryBean.zjzl}&queryBean.zjhm=${queryBean.zjhm}&queryBean.ywx=${queryBean.ywx}&queryBean.ywm=${queryBean.ywm}&queryBean.xb=${queryBean.xb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;人口照片信息</a>
					    		<a href="<c:url value='/lsgl/jwrk/toShgxxxPage.action'/>?queryBean.rybh=${queryBean.rybh}&queryBean.fwid=${queryBean.fwid}&queryBean.gj=${queryBean.gj}&queryBean.zjzl=${queryBean.zjzl}&queryBean.zjhm=${queryBean.zjhm}&queryBean.ywx=${queryBean.ywx}&queryBean.ywm=${queryBean.ywm}&queryBean.xb=${queryBean.xb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;社会关系信息</a>
					    		<a href="<c:url value='/lsgl/jwrk/toTmtzxxPage.action'/>?queryBean.rybh=${queryBean.rybh}&queryBean.fwid=${queryBean.fwid}&queryBean.gj=${queryBean.gj}&queryBean.zjzl=${queryBean.zjzl}&queryBean.zjhm=${queryBean.zjhm}&queryBean.ywx=${queryBean.ywx}&queryBean.ywm=${queryBean.ywm}&queryBean.xb=${queryBean.xb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;体貌特征信息</a>
					    		<a href="<c:url value='/lsgl/jwrk/toLxfsxxPage.action'/>?queryBean.rybh=${queryBean.rybh}&queryBean.fwid=${queryBean.fwid}&queryBean.gj=${queryBean.gj}&queryBean.zjzl=${queryBean.zjzl}&queryBean.zjhm=${queryBean.zjhm}&queryBean.ywx=${queryBean.ywx}&queryBean.ywm=${queryBean.ywm}&queryBean.xb=${queryBean.xb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;联系方式信息</a>
						    </div>
						</div>
					</div>
				</cps:tdContent>
				<cps:tdContent valign="top" width="90%">
					<iframe id="centerFrame" name="centerFrame" frameborder="0" scrolling="no" 
							src="<c:url value='/lsgl/jwrk/loadJwrkJbxxInfo.action'/>?queryBean.cyrybh=${queryBean.cyrybh}&queryBean.jwbh=${queryBean.jwbh}&queryBean.fwid=${queryBean.fwid}&queryBean.gj=${queryBean.gj}&queryBean.zjzl=${queryBean.zjzl}&queryBean.zjhm=${queryBean.zjhm}&queryBean.ywx=${queryBean.ywx}&queryBean.ywm=${queryBean.ywm}&queryBean.xb=${queryBean.xb}" 
							width="100%" height="790">
					</iframe>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</div>
</creator:view>