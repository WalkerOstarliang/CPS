<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div style="height: 100%;">
	<div id="leftpanel" style="float: left;width:13%;height: 700px;border: 2px solid #DFF0F8;">
		<div id="header">
			<div id="head_title" style="text-align: center;" class="cps-box-title">重点人员</div>
			<div id="zpxx" style="text-align: center;">
				<img  id="MyImage1" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${zdryBean.sfzh}" title="全国人口库照片" alt="全国人口库照片" height="140" width="130"/>
				<br>
				<a href="${bDzda_url}?method=getBussinessInfo&rybh=${zdryBean.zdrybh}" style="color:red;text-decoration:underline;" target="_blank ">部电子档案</a>
				<br>
				<a href="${sDzda_url}?user_name=${loginInfo.username}&sfzh=${queryBean.sfzh}" style="color:red;text-decoration:underline;" target="_blank ">省电子档案</a>
				<br>
				<a href="${csDzda_url}?method=getBussinessInfo&id=${queryBean.sfzh}" style="color:red;text-decoration:underline;" target="_blank ">长沙电子档案</a>
			</div>
			<div id="dialog_leftmenu" class="dialog_leftmenu">
				<c:if test="${showtype=='xsbx'}">
					<div id="xsbx" onclick="initPage('xsbx','6')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;在控信息登记</div>
				</c:if>
		    	<div id="zdryjbxx" class="dialog_menu_selected" onclick="initPage('zdryjbxx','1')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;重点对象信息</div>
		    	<%--
		    	<div id="zdryzpxx" onclick="initPage('zdryzpxx','3')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;人口照片信息</div>

		    	<c:if test="${dxlb=='06'}">
		    	<div id="zdryjsbrxx"   onclick="initPage('zdryjsbrxx','7')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;精神病人信息</div>
		    	<div id="zdryjsbrzsxx" onclick="initPage('zdryjsbrzsxx','8')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;精神肇事信息</div>
				</c:if>
		    	<c:if test="${dxlb=='02'}">
		    	<div id="zdryswry"     onclick="initPage('zdryswry','9')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;涉稳人员信息</div>
		    	<div id="zdryswrysfjl" onclick="initPage('zdryswrysfjl','10')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;上访记录信息</div>
		    	</c:if>
		    	
		    	<c:if test="${dxlb=='3'}">
		    	<div id="gzry" onclick="initPage('gzry','7')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;关注人员信息</div>
		    	</c:if>
		    	<c:if test="${dxlb=='04'}">
		    	<div id="xdry" onclick="initPage('xdry','7')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;吸毒人员信息</div>
		    	<div id="xdxhnjxx" onclick="initPage('xdxhnjxx','7')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;吸毒尿检信息</div>
		    	</c:if>
		    	<c:if test="${dxlb=='2'}">
					<div id="jzdx" onclick="initPage('jzdx','6')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;矫正对象信息</div>
				</c:if>
				--%>
				<c:if test="${showtype!='xsbx'}">
					<div id="zkxxdjInfo" onclick="initPage('xsbx','6')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;在控信息登记</div>
				</c:if>
				<div id="wfjlxx" onclick="initPage('wfjlxx','2')" ><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;违法经历信息</div>
		    	
				<div id="tmtzxx" onclick="initPage('tmtzxx','5')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;体貌特征信息</div>
		    	<div id="shgxxx" onclick="initPage('shgxxx','4')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;社会关系信息</div>
			</div>
		</div>
	</div>
	
	<form id="rkxxform" enctype="multipart/form-data" method="post">
		<input type="hidden" id="msgtype" name="msgtype" value="${msgtype}"/>
		<input type="hidden" id="showMenu" value="${showMenu}"/>
		<input type="hidden" id="operType" name="operType" value="${operType}"/>
		<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${zdryBean.rybh}"/>
		<input type="hidden" id="jsppage" value="${jsppage}"/>
		<input type="hidden" id="flagChange" name="zdryBean.gzdxbh" value="${zdryBean.gzdxbh }" />
		<input type="hidden" id="dxlb" name="dxlb" value="${dxlb}" />
		<!-- 
		<input type="hidden" id="xdrybh" name="zdryBean.xdryBean.xdrybh" value="${zdryBean.xdryBean.xdrybh }"/>
		<input type="hidden" id="sfzh" name="zdryBean.sfzh" value="${queryBean.sfzh }"/>	
		<input type="hidden"  id="jsbrbh" name="zdryBean.jsbrBean.jsbrbh" value="${zdryBean.jsbrBean.jsbrbh}">
		<input type="hidden"  id="swrybh" name="zdryBean.swryBean.swrybh" value="${zdryBean.swryBean.swrybh}">	
		 -->
		<div id="contentpanel" style="float: right;width:86%">	 	
		</div>
	</form>
</div>
 