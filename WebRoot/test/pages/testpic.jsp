<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="新增/修改房屋信息" >
	<creator:Script src="/jsp/lsgl/js/fwinfo.js"></creator:Script>
 	<div style="border:none;">
			<!--  上翻   -->
			<div id="up" class="up"></div>
			<!--  图片列表   -->
			<div id="list" class="list">
				<ul id="imgList">
					<li><img src="ss/1.jpg"></li>
					<li><img src="ss/2.jpg"></li>
					<li><img src="ss/3.jpg"></li>
					<li><img src="ss/4.jpg"></li>
					<li><img src="ss/5.jpg"></li>
					<li><img src="ss/6.jpg"></li>
					<li><img src="ss/7.jpg"></li>
				</ul>
			</div>
			<!-- 下翻   -->
			<div id="down" class="down"></div>	
		</div>
		
		<!--  图片显示区域     -->
		<div id="img_main" class="img_main">
			<div id="img" class="img"></div>
		</div>	
</creator:view>