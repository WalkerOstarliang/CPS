<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<creator:Style href="/jsp/cs/css/layout.css"></creator:Style>
	<creator:Script src="/jsp/cs/common/cs.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var height = $(document).height();
			$("#leftpanel").height(height - 50);
			$("#mainiframe").height(height - 21);
		});
	</script>
	<!--主内容 开始-->
	<div class="main">
		<div class="main_box03" style="margin-top:0px;">
	    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td valign="top" width="100%">
	           	 	<div style="padding:5px;;width:100%;height: 100%">
		       	    	<div class="zfba_leftbox" style="border: 0px solid red;">
		                	<div><img src="<c:url value='/jsp/cs/images/zfba_a.jpg'/>" width="140" height="15" /></div>
		                    	<div id="leftpanel" class="zfba_menu" style="padding:0 10px;height: 400px">
		                    		<a href="<c:url value='/xtgl/stxx/toStxxManagerPage.action'/>" class="zfba_a" target="mainiframe">实体迁移</a>
		                    		<a href="<c:url value='/xtgl/stxx/toXzqhQyPage.action'/>" class="zfba_b" target="mainiframe">社区迁移</a>
		                    	</div>
		                    <div><img src="<c:url value='/jsp/cs/images/zfba_b.jpg'/>" width="140" height="15" /></div>
		              	</div>
		              	<div class="zfba_rightbox" style="border: 0px solid red;">
		              		<iframe id="mainiframe" name="mainiframe" frameborder="0" src="<c:url value='/xtgl/stxx/toStxxManagerPage.action'/>" width="98.5%" height="500"></iframe>
		           	  	</div>
		           	</div>
	            </td>
	          </tr>
	          <tr>
	            <td height="10">
		            <table width="100%" border="0" cellspacing="0" cellpadding="0">
		            	  <tr>
		            	    <td width="10"><img src="<c:url value='/jsp/cs/images/box_b01.jpg'/>" width="10" height="10" /></td>
		            	    <td width="980" class="box_b02"></td>
		            	    <td width="10" align="right"><img src="<c:url value='/jsp/cs/images/box_b03.jpg'/>" width="10" height="10" /></td>
		          	    </tr>
		       	    </table>
	            </td>
	          </tr>
	        </table>
	    </div>
	</div>
</creator:view>