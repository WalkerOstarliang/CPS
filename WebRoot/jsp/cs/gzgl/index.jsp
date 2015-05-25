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
		<c:choose>
		<c:when test="${currentXzqh == '4301'  || currentXzqh == '4307'}">
			<div class="main_box03" style="margin-top:0px;">
		    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td valign="top" width="100%">
		           	 	<div style="padding:5px;;width:100%;height: 100%">
			       	    	<div class="zfba_leftbox" style="border: 0px solid red;">
			                	<div><img src="<c:url value='/jsp/cs/images/zfba_a.jpg'/>" width="140" height="15" /></div>
			                    	<div id="leftpanel" class="zfba_menu" style="padding:0 10px;height: 400px">
			                    		<a href="<c:url value='/gzgl/rzgl/init.action'/>" class="zfba_a" target="mainiframe" style="text-align: left">日志登记</a>
			                        	<a href="<c:url value='/gzgl/rzgl/toJqtbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">警情通报</a>
			                        	<a href="<c:url value='/gzgl/zjgl/init.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">总结登记</a>
							   	 		<a href="<c:url value='/qzgl/hbgzgl/tohbgzList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">报告工作</a>
							   	 		<a href="<c:url value='/gzgl/rwgl/toRwListPage.action?renwuQuery.rwlx=0'/>" class="zfba_b" target="mainiframe" style="text-align: left">任务派发</a>
							   	 		<a href="<c:url value='/gzgl/rwgl/toRwListPage.action?renwuQuery.rwlx=1'/>" class="zfba_b" target="mainiframe" style="text-align: left">任务处理</a>
							   	 		<a href="<c:url value='/qzgl/gyhdgl/toGyhdList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">公益活动</a>
							   	 		<!--  
			                        	<a href="<c:url value='/qzgl/bmfwgl/toBmfwList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">为民服务</a>
			                        	-->
			                        	<a href="javascript:void(0)" class="zfba_b">为民服务</a>
			                        	<div class="menubox" style="display: none;">
			                        		<a href="<c:url value='/qzgl/lxdjgl/toLxdjListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">来访来信</a>
			                        	</div>
			                        	
			                        	<a href="<c:url value='/qzgl/jftjgl/toJftjList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">纠纷调解</a>
			                        	<a href="<c:url value='/gzgl/gztzgl/togztzmbxzPage.action?operType=2'/>" class="zfba_b" target="mainiframe" style="text-align: left">工作台帐</a>
			                        	<a href="<c:url value='/qzgl/wmfwgl/toStZapctbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">极端暴力填报</a>
			                    	</div>
			                    <div><img src="<c:url value='/jsp/cs/images/zfba_b.jpg'/>" width="140" height="15" /></div>
			              	</div>
			              	<div class="zfba_rightbox" style="border: 0px solid red;">
			              		<iframe id="mainiframe" name="mainiframe" frameborder="0" src="<c:url value='/gzgl/rzgl/init.action'/>" width="98.5%" height="500"></iframe>
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
	    </c:when>
	    <c:otherwise>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
	          	<tr>
		            <td valign="top" width="12%">
						<div style="height: 100%;width:100%">
							<div id="header">
								<div id="head_title" style="text-align: center;" class="cps-box-title">系统菜单</div>
								<div id="zpxx" class="cps-box-content">
									<div id="leftpanel" class="zfba_menu" style="height: 400px">
										<a href="<c:url value='/gzgl/rzgl/init.action'/>" class="zfba_a" target="mainiframe" style="text-align: left" >日志登记</a>
			                        	<a href="<c:url value='/gzgl/rzgl/toJqtbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">警情通报</a>
			                        	<a href="<c:url value='/gzgl/zjgl/init.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">总结登记</a>
							   	 		<a href="<c:url value='/qzgl/hbgzgl/tohbgzList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">报告工作</a>
							   	 		<a href="<c:url value='/gzgl/rwgl/toRwListPage.action?renwuQuery.rwlx=0'/>" class="zfba_b" target="mainiframe" style="text-align: left">任务派发</a>
							   	 		<a href="<c:url value='/gzgl/rwgl/toRwListPage.action?renwuQuery.rwlx=1'/>" class="zfba_b" target="mainiframe" style="text-align: left">任务处理</a>
							   	 		<a href="<c:url value='/qzgl/gyhdgl/toGyhdList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">公益活动</a>
			                        	<!--  
			                        	<a href="<c:url value='/qzgl/bmfwgl/toBmfwList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">为民服务</a>
			                        	-->
			                        	<a href="javascript:void(0)" class="zfba_c" style="text-align: left">为民服务</a>
			                        	<div class="menubox" style="display: none;">
			                        		<a href="<c:url value='/qzgl/lxdjgl/toLxdjListPage.action'/>" class="zfba_d" target="mainiframe" style="text-align: left">来访来信</a>
			                        		<a href="<c:url value='/qzgl/wmfwgl/tgzmList.action'/>" class="zfba_d" target="mainiframe" style="text-align: left">提供证明</a>
			                        		<a href="<c:url value='/qzgl/wmfwgl/mtryList.action'/>" class="zfba_d" target="mainiframe" style="text-align: left">迷途人员</a>
			                        		<a href="<c:url value='/qzgl/wmfwgl/qyryList.action'/>" class="zfba_d" target="mainiframe" style="text-align: left">弃婴信息</a>
			                        		<a href="<c:url value='/qzgl/wmfwgl/qtryList.action'/>" class="zfba_d" target="mainiframe" style="text-align: left">流浪乞讨人员</a>
			                        		<a href="<c:url value='/qzgl/wmfwgl/qtfwList.action'/>" class="zfba_d" target="mainiframe" style="text-align: left">其他服务</a>
			                        	</div>
			                        	<a href="<c:url value='/qzgl/jftjgl/toJftjList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">纠纷调解</a>
			                        	<a href="<c:url value='/gzgl/gztzgl/togztzmbxzPage.action?operType=2'/>" class="zfba_b" target="mainiframe" style="text-align: left">工作台帐</a>
			                        	<a href="<c:url value='/qzgl/wmfwgl/toStZapctbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">极端暴力填报</a>
							   	 	</div>
								</div>
							</div>
						</div>
					</td>
					<td width="85%">
						<iframe id="mainiframe" name="mainiframe" frameborder="0" src="<c:url value='/gzgl/rzgl/init.action'/>" width="98.5%" height="500"></iframe>
					</td>
				</tr>
			</table>
		</c:otherwise>
		</c:choose>
	</div>
</creator:view>