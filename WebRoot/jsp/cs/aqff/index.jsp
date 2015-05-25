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
			<c:when test="${currentXzqh == '4301' || currentXzqh == '4307'}">
				<div class="main_box03" style="margin-top:0px;">
			    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			          <tr>
			            <td valign="top" width="100%">
			           	 	<div style="padding:5px;;width:100%;height: 100%">
				       	    	<div class="zfba_leftbox" style="border: 0px solid red;">
				                	<div><img src="<c:url value='/jsp/cs/images/zfba_a.jpg'/>" width="140" height="15" /></div>
				                    	<div id="leftpanel" class="zfba_menu" style="padding:0 10px;height: 400px">
				                    		<a href="<c:url value='/afgl/sqjbgl/toSqJbxxListPage.action'/>" class="zfba_a" target="mainiframe">社区/村管理</a>
				                    		<a href="javascript:void(0)" class="zfba_c">人员干部管理</a>
				                    		<div class="menubox" style="display: none;">
				                    			<a href="<c:url value='/afgl/sqgbgl/toSqgbListPage.action?queryBean.lx=3'/>" class="zfba_b" target="mainiframe">乡镇街道干部</a>
				                    			<a href="<c:url value='/afgl/sqgbgl/toSqgbListPage.action?queryBean.lx=1'/>" class="zfba_b" target="mainiframe">社区干部管理</a>
				                    			<a href="<c:url value='/afgl/sqgbgl/toSqgbListPage.action?queryBean.lx=2'/>" class="zfba_b" target="mainiframe">小区组干部</a>
				                    		</div>
				                    		<a href="javascript:void(0)" class="zfba_c">社区成员管理</a>
				                    		<div class="menubox" style="display: none;">
				                    			<a href="<c:url value='/afgl/sqgbgl/toSqddbListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">代表委员管理</a>
				                       	    	<a href="<c:url value='/afgl/sqldzgl/toSqldzListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">楼栋长管理</a>
				                    			<a href="<c:url value='/afgl/sqldzgl/toSqwyhListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">业委会成员</a>
				                    		</div>
				                    		<a href="javascript:void(0)" class="zfba_c">辅助人员管理</a>
				                    		<div class="menubox" style="display: none;">
				                    			<a href="<c:url value='/gzgl/gzjwsgl/toLkXgyglPage.action'/>" class="zfba_b" target="mainiframe">流口协管员</a>
				                    			<a href="<c:url value='/gzgl/gzjwsgl/toXfjglPage.action'/>" class="zfba_b" target="mainiframe">协辅警管理</a>
				                    			<a href="<c:url value='/zbhxx/toZbhCyListPage.action'/>" class="zfba_b" target="mainiframe">治保会成员管理</a>
				                    			<a href="<c:url value='/afgl/xldxx/toXldxxPage.action'/>" class="zfba_b" target="mainiframe">巡防队管理</a>
				                        		<a href="<c:url value='/gzgl/gzjwsgl/toXfdyglPage.action'/>" class="zfba_b" target="mainiframe">巡防队员管理</a>
				                        		<a href="<c:url value='/gzgl/tzgl/toXxyglList.action'/>" class="zfba_b" target="mainiframe">治安耳目管理</a>
				                        		<a href="<c:url value='/qzgl/zyzgl/toZyzList.action'/>" class="zfba_b" target="mainiframe">志愿者管理</a>	
				                    		</div>
				                    		<a href="javascript:void(0)" class="zfba_c">火灾数据管理</a>
				                    		<div class="menubox" style="display: none;">
				                    			<a href="<c:url value='/xfdw/hzld/toHzldListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">火灾数据管理</a>
				                    			<a href="<c:url value='/xfdw/hztj/toHztjList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">火灾统计</a>
				                    		</div>
				                    		<a href="<c:url value='/rhzf/toRhzfListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">入户走访管理</a>
				                    		<a href="<c:url value='/rhzftj/toRhzfTjPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">入户走访统计</a>
				                    		<a href="<c:url value='/afgl/zaxl/toZaxlListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">治安巡逻管理</a>
				                        	<a href="<c:url value='/gzgl/pcsxchd/toPcsXcHdListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">宣传活动管理</a>
				                    		<a href="<c:url value='/gzgl/pcsxchd/toPcsXcHdTjPage.action'/>?query.orgcode=430000000000&query.orgleve=2" class="zfba_b" target="mainiframe" style="text-align: left">宣传活动统计</a>
				                    		<%-- 
				                    		<a href="<c:url value='/xqxx/toXqxxList.action'/>" class="zfba_b" target="mainiframe">居民小区</a>
				                    		--%>
				                        	<%-- 
				                        	<a href="<c:url value='/gzgl/xldrw/toListPage.action'/>" class="zfba_b" target="mainiframe">巡防登记</a>
				                        	<a href="<c:url value='/gzgl/xldjl/toListPage.action'/>" class="zfba_b" target="mainiframe">巡防奖励</a>
				                        	<a href="<c:url value='/qzgl/hbgzgl/tohbgzList.action'/>" class="zfba_b" target="mainiframe">工作汇报</a>
				                        	--%>
				                    	</div>
				                    <div><img src="<c:url value='/jsp/cs/images/zfba_b.jpg'/>" width="140" height="15" /></div>
				              	</div>
				              	<div class="zfba_rightbox" style="border: 0px solid red;">
				              		<iframe id="mainiframe" name="mainiframe" frameborder="0" src="<c:url value='/afgl/sqjbgl/toSqJbxxListPage.action'/>" width="98.5%" height="500"></iframe>
				           	  	</div>
				           	</div>
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
									<div id="leftpanel" class="zfba_menu">
										
										<a href="<c:url value='/afgl/sqjbgl/toSqJbxxListPage.action'/>" class="zfba_a" target="mainiframe" style="text-align: left">社区/村管理</a>
			                    		<a href="javascript:void(0)" class="zfba_c" style="text-align: left">人员干部管理</a>
			                    		<div class="menubox" style="display: none;">
			                    			<a href="<c:url value='/afgl/sqgbgl/toSqgbListPage.action?queryBean.lx=3'/>" class="zfba_b" target="mainiframe" style="text-align: left">乡镇街道干部</a>
			                    			<a href="<c:url value='/afgl/sqgbgl/toSqgbListPage.action'/>" class="zfba_b" class="zfba_b" target="mainiframe" style="text-align: left">社区干部管理</a>
			               					<a href="<c:url value='/afgl/sqgbgl/toSqgbListPage.action?queryBean.lx=2'/>" class="zfba_b" target="mainiframe" style="text-align: left">小区组干部</a>
			                    		</div>
			                    		<a href="javascript:void(0)" class="zfba_c" style="text-align: left">社区成员管理</a>
			                    		<div class="menubox" style="display: none;">
			                    			<a href="<c:url value='/afgl/sqgbgl/toSqddbListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">代表委员管理</a>
			                       	    	<a href="<c:url value='/afgl/sqldzgl/toSqldzListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">楼栋长管理</a>
			                    			<a href="<c:url value='/afgl/sqldzgl/toSqwyhListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">业委会成员</a>
			                    		</div>
			                    		<a href="javascript:void(0)" class="zfba_c" style="text-align: left">辅助人员管理</a>
			                    		<div class="menubox" style="display: none;">
			                    			<a href="<c:url value='/gzgl/gzjwsgl/toLkXgyglPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">流口协管员</a>
			                    			<a href="<c:url value='/gzgl/gzjwsgl/toXfjglPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">协辅警管理</a>
			                    			<a href="<c:url value='/zbhxx/toZbhCyListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">治保会成员管理</a>
			                    			<a href="<c:url value='/afgl/xldxx/toXldxxPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">巡防队管理</a>
			                        		<a href="<c:url value='/gzgl/gzjwsgl/toXfdyglPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">巡防队员管理</a>
			                        		<a href="<c:url value='/gzgl/tzgl/toXxyglList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">治安耳目管理</a>
			                        		<a href="<c:url value='/qzgl/zyzgl/toZyzList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">志愿者管理</a>	
			                    		</div>
			                    		<a href="<c:url value='/rhzf/toRhzfListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">入户走访管理</a>
			                    		<a href="<c:url value='/rhzftj/toRhzfTjPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">入户走访统计</a>
			                    		<a href="<c:url value='/afgl/zaxl/toZaxlListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">治安巡逻管理</a>
			                    		<a href="<c:url value='/afgl/lmpcxx/toLmpcList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">路面盘查管理</a>
							   	 	</div>
								</div>
							</div>
						</div>
					</td>
					<td width="85%">
						<iframe id="mainiframe" name="mainiframe" frameborder="0" src="<c:url value='/afgl/sqjbgl/toSqJbxxListPage.action'/>" width="98.5%" height="500"></iframe>
					</td>
				</tr>
			</table>
			</c:otherwise>
		</c:choose>
	</div>
</creator:view>