<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
 
<creator:view title="系统菜单" width="100%">
	<creator:Script src="/jsp/js/main.js"></creator:Script>
	<center>
		<div style="width:80%">
			<div id="leftpanel" style="float: left;width:10%;border:1px solid #DFF0F8;">
				<div id="header">
					<div id="head_title" style="text-align: left" class="box_title">系统菜单</div>
				</div>
				<div id="leftmenu">
				</div>
			</div>
			<div id="centermenu" style="float: right;width:89%">
				
			</div>
		</div>
	</center>
	<div class="contextMenu" id="mymenu">
	    <ul>
	      <li id="update">修改</li>
	      <li id="delete">删除</li>
	    </ul>
	</div>
</creator:view>
