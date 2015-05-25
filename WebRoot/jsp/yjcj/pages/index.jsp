<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view title="湖南省社区警务信息综合管理平台">
	<link href="<c:url value='/main/css/index.css'/>" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	var index = null;
	function zipFieldDown(filePath, fileName)
	{
		window.location.href = "<c:url value='/download.action'/>?filePath=" + encodeURIComponent(filePath) + "&fileName=" + fileName;
	}
	
	function openUpdatePasswordWin()
	{
		var url = contextPath + "/toUpdatePasswordPage.action";
		index = $.layer({
		    type : 2,
		    move : false,
		    title : "用户密码更新",
		    iframe : {src : url},
		    area : ['450px' , '250px'],
		    offset : ['5px','']
		});
	}
	
	function closeLayerWin()
	{
		layer.close(index);
	}
	
	function logout()
	{
		$.ajax({
			url : contextPath + "/logout.action",
			success : function(result)
			{
				document.location.href = "http://${cas.href}/logout?service=http://${CPS.href}/index.action";
			}
		})
		
	}
	
	function openMoreAjList()
	{
		$.openWindow({
			url : contextPath + "/schedule/toAjjbxxListPage.action",
			width:900,
			height:600
		})
	}
	</script>
	<center>
		<div class="body_bg02" style="width:80%;">
			<div class="warp">
		      	<div id="otherscontentdiv">
		      		<iframe id="otherscontentiframe" src="<c:url value='/yjcj/toYjcjList.action'/>" height="900" frameborder="0" width="100%" scrolling="no"></iframe>
		     	</div>
			     <div>
		            <div class="footer">
				      	<div class="footer_a">
				      		<a href="#" class="l_hei">网站纠错</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				      		<a href="#" class="l_hei">网站地图</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				      		<a href="#" class="l_hei">法律顾问</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				      		<a href="#" class="l_hei">联系信箱</a></div>
				   	 	</div>
				   	 	<div class="p10" align="center">
				   	 		 <div>当前在线人数<font color="red">${inlineNum}</font>人</div>
		                    <div>版权所有：湖南省公安厅    推荐使用1024*788分辨率浏览</div>
		                    <div>技术支持：湖南科创   电话：0731-84597427</div>
		                </div>
			       	</div>
				</div>
			</center>
</creator:view>