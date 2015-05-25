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
			
			$(".zfba_menu").find("a").bind("click",function(){
				$(".zfba_menu").find("a").removeClass("zfba_a").addClass("zfba_b");
				$(this).removeClass("zfba_b").addClass("zfba_a");
				$(".menubox").find("a").removeClass("zfba_e").addClass("zfba_d");
			});
			
			$(".zfba_menu").find("a[class=zfba_b]").bind("click",function(){
				var $this = $(this);
				$(this).next("div[class=menubox]").first().toggle();
			});
			
			$(".menubox").find("a").bind("click",function(){
				$(".menubox").find("a").removeClass("zfba_e").addClass("zfba_d");
				$(this).removeClass("zfba_d").addClass("zfba_e");
			});
		});
	
	</script>
	<!--主内容 开始-->
	<div class="main">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	       <tr>
	            <td valign="top"width="12%">
					<div style="height: 100%;width:100%;">
						<div id="header">
							<div id="head_title" style="text-align: center;" class="cps-box-title">系统菜单</div>
							<div id="zpxx" class="cps-box-content">
								<div id="leftpanel" class="zfba_menu" style="">
									<c:forEach items="${menubeans}" var="menubean">
		                    			<c:choose>
		                    				<c:when test="${not empty menubean.childMenuBeans}">
		                    					<a href="javascript:void(0)" class="zfba_b" title="${menubean.name }" style="text-align: left" menuindex="${menubean.menuindex}">${menubean.name}</a>
	                    						<div class="menubox" style="display: none;">
	                    							<c:forEach items="${menubean.childMenuBeans}" var="twomenubean">
		                    							<a href="<c:url value='${twomenubean.path }'/>" class="zfba_d" target="mainiframe" style="text-align: left" menuindex="${menubean.menuindex}">${twomenubean.name}</a>
		                    						</c:forEach>
	                    						</div>
		                    				</c:when>
		                    				<c:otherwise>
		                    					<a href="<c:url value='${menubean.path}'/>" class="zfba_b" target="mainiframe" style="text-align: left" menuindex="${menubean.menuindex}">${menubean.name }</a>
		                    				</c:otherwise>
		                    			</c:choose>
		                    		</c:forEach>
						   	 	</div>
							</div>
						</div>
					</div>
				</td>
				<td>
					<iframe id="mainiframe" name="mainiframe" frameborder="0" src="<c:url value='/lsgl/rk/toSyrkDjQueryPage.action'/>" width="98.5%" height="500"></iframe>
				</td>
			</tr>
		</table>
	</div>
</creator:view>
