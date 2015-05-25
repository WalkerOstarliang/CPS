<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<script type="text/javascript">
	function openZdryZkdjWin(zdrybh,sfzh,rybh)
	{
		$.openWindow({
			url : contextPath + "/lsgl/zdry/toQGQLZdryInfoPage.action",
			width : 1000,
			height : 800,
			data : {
				zdrybh : zdrybh,
				sfzh : sfzh
			}
		})
	}
	$(function(){
		$("#left_menu").accordion();
		$("#centerFrame").height($(window).height() - 10)
		var zdrylbbj = $("#zdrylbbj").val();
		if (zdrylbbj != null && zdrylbbj != "" && zdrylbbj.substr(2,1)=='1')
		{
			alert("当前人员为【在逃人员】请及时抓捕.");
		}
	});
</script>
<div id="leftpanel" class="cps-box-panel" style="height:100%">
	<cps:table width="100%" height="100%">
		<cps:row>
			<cps:tdContent valign="top" width="10%">
				<div style="height: 100%;width:100%">
					<div id="header">
						<div id="head_title" style="text-align: center;" class="cps-box-title">未落户人口信息</div>
						<div id="zpxx" class="cps-box-content">
							<img id="MyImage1" src="${contextPath}/cps/common/showPoto.action?sfzh=${queryBean.sfzh}" height="140" width="130"/>
						</div>
						<div id="head_title" style="text-align: center;" class="cps-box-title">
							<c:choose>
								<c:when test="${rkBean.zdryGzdxBean != null}">
									<input type="hidden" id="zdrybh" value="${rkBean.zdryGzdxBean.zdrybh}">
									<input type="hidden" id="zdrylbbj" value="${rkBean.zdryGzdxBean.zdrylbbj}">
									<span style="cursor: pointer;text-decoration: underline;" onclick="openZdryZkdjWin('${rkBean.zdryGzdxBean.zdrybh}','${rkBean.zdryGzdxBean.sfzh }','${rkBean.zdryGzdxBean.rybh }')"><font color="red">${rkBean.zdryGzdxBean.zdrylbbjmc}</font></span>
								</c:when>
								<c:otherwise>
									<input type="hidden" id="zdrybh" value="">
									<input type="hidden" id="zdrylbbj" value="">
								</c:otherwise>
							</c:choose>
						</div>
						 <div class="left_menubox">
					    	<a href="<c:url value='/lsgl/rk/toRkJbxxInfo.action'/>?queryBean.cyrybh=${queryBean.cyrybh}&operType=${operType}&queryBean.sfzh=${queryBean.sfzh}&queryBean.fwid=${queryBean.fwid}&queryBean.rylb=${queryBean.rylb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;人口基本信息</a>
					    	<a href="<c:url value='/lsgl/rk/toRkzpxxPage.action'/>?jsppage=rkzppage&operType=${operType}&queryBean.sfzh=${queryBean.sfzh}&queryBean.fwid=${queryBean.fwid}&queryBean.rylb=${queryBean.rylb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;人口照片信息</a>
					    	<a href="<c:url value='/lsgl/rk/toShgxxxPage.action'/>?jsppage=shgxpage&operType=${operType}&queryBean.sfzh=${queryBean.sfzh}&queryBean.fwid=${queryBean.fwid}&queryBean.rylb=${queryBean.rylb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;社会关系信息</a>
					    	<a href="<c:url value='/lsgl/rk/toTmtzxxPage.action'/>?jsppage=tmtzpage&operType=${operType}&queryBean.sfzh=${queryBean.sfzh}&queryBean.fwid=${queryBean.fwid}&queryBean.rylb=${queryBean.rylb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;体貌特征信息</a>
					    	<a href="<c:url value='/lsgl/rk/toLxfsxxPage.action'/>?jsppage=lxfspage&operType=${operType}&queryBean.sfzh=${queryBean.sfzh}&queryBean.fwid=${queryBean.fwid}&queryBean.rylb=${queryBean.rylb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;联系方式信息</a>
					    	<a href="<c:url value='/lsgl/rk/toRkLsjzListPage.action'/>?jsppage=wlhrklsjzxx&operType=${operType}&queryBean.sfzh=${queryBean.sfzh}&queryBean.fwid=${queryBean.fwid}&queryBean.rylb=${queryBean.rylb}" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;居住历史信息</a>
					    </div>
					</div>
				</div>
			</cps:tdContent>
			<cps:tdContent valign="top" width="100%">
				<iframe id="centerFrame" name="centerFrame" frameborder="0" scrolling="no" src="<c:url value='/lsgl/rk/toRkJbxxInfo.action'/>?queryBean.cyrybh=${queryBean.cyrybh}&opentip=true&queryBean.sfzh=${queryBean.sfzh}&queryBean.fwid=${queryBean.fwid}&queryBean.rylb=${queryBean.rylb}" width="100%" height="100%">
			</cps:tdContent>
		</cps:row>
	</cps:table>
</div>
</creator:view>