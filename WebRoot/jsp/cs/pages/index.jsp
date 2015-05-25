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
			
			var showindex = '${showindex}';
			if(showindex){
				var a_array = $("#leftpanel").find("a");
				
				for(var i = 0 ; i<a_array.length ; i++){
					var a_Obj = $(a_array[i]);
					if(a_Obj.attr("menuindex") == showindex){
						a_Obj.attr("class","zfba_a");
						$("#mainiframe").attr("src",a_Obj.attr("href"));
						break;
					}
				}
			}else{
				var href = $("#leftpanel").find("a:first").attr("href");
				$("#mainiframe").attr("src",href);
				
			}
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
		                    		<c:if test="${not empty menubeans}">
			                    		<c:forEach items="${menubeans}" var="menubean">
			                    			<c:choose>
			                    				<c:when test="${not empty menubean.childMenuBeans}">
			                    					<a href="javascript:void(0)" class="zfba_c" title="${menubean.name }" menuindex="${menubean.menuindex}">${menubean.name}</a>
		                    						<div class="menubox" style="display: none;">
		                    							<c:forEach items="${menubean.childMenuBeans}" var="twomenubean">
			                    							<a href="<c:url value='${twomenubean.path }'/>" class="zfba_d" target="mainiframe" menuindex="${menubean.menuindex}">${twomenubean.name}</a>
			                    						</c:forEach>
		                    						</div>
			                    				</c:when>
			                    				<c:otherwise>
			                    					<a href="<c:url value='${menubean.path}'/>" class="zfba_b" target="mainiframe" menuindex="${menubean.menuindex}">${menubean.name }</a>
			                    				</c:otherwise>
			                    			</c:choose>
			                    		</c:forEach>
		                    		</c:if>
		                    		<%-- 
		                    		<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>" class="zfba_b" target="mainiframe">实有人口登记</a>
		                    		<a href="javascript:void(0)" class="zfba_c">实有人口管理</a>
		                    		<div class="menubox" style="display: none;">
		                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=1" class="zfba_d" target="mainiframe">常住人口管理</a>
		                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=2" class="zfba_d" target="mainiframe">流动人口管理</a>
		                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=5" class="zfba_d" target="mainiframe">寄住人口管理</a>
		                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=3" class="zfba_d" target="mainiframe">未落户人口管理</a>
		                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=4" class="zfba_d" target="mainiframe">境外人口管理</a>
		                    			<a href="<c:url value='/lsgl/rk/toRyxglPageList.action'/>" class="zfba_d" target="mainiframe">人员相片管理</a>
		                    		</div>
		                    		<a href="<c:url value='/lsgl/jzzxx/toJzzxxPageInfo.action'/>" class="zfba_b" target="mainiframe">居住证管理</a>
		                        	<a href="<c:url value='/lsgl/fw/toFwJbxxListPage.action'/>" class="zfba_b" target="mainiframe">房屋管理</a>
		                        	<a href="<c:url value='/lsgl/fw/toCzFwJbxxListPage.action'/>" class="zfba_b" target="mainiframe">出租屋管理</a>
		                        	--%>
		                    	</div>
		                    <div><img src="<c:url value='/jsp/cs/images/zfba_b.jpg'/>" width="140" height="15" /></div>
		              	</div>
		              	<div class="zfba_rightbox" style="border: 0px solid red;">
		              		<iframe id="mainiframe" name="mainiframe" frameborder="0" src="" width="98.5%" height="500"></iframe>
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