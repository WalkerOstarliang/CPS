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
			           	 	<div style="padding:5px;width:100%;height: 100%">
				       	    	<div class="zfba_leftbox" style="border: 0px solid red;">
				                	<div><img src="<c:url value='/jsp/cs/images/zfba_a.jpg'/>" width="140" height="15" /></div>
				                    	<div id="leftpanel" class="zfba_menu" style="padding:0 10px;height: 400px">
				                    		<a href="<c:url value='/lsgl/rk/toSyrkDjQueryPage.action'/>" class="zfba_b" target="mainiframe">实有人口登记</a>
				                    		<a href="javascript:void(0)" class="zfba_c">实有人口管理</a>
				                    		<div class="menubox" style="display: none;">
				                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=select" class="zfba_d" target="mainiframe">实有人口查询</a>
				                    			<a href="<c:url value='/lsgl/rkdr/toSyrkImportHcPage.action'/>" class="zfba_d" target="mainiframe">实有人口核查</a>
				                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=1" class="zfba_d" target="mainiframe">常住人口管理</a>
				                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=2" class="zfba_d" target="mainiframe">流动人口管理</a>
				                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=5" class="zfba_d" target="mainiframe">寄住人口管理</a>
				                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=3" class="zfba_d" target="mainiframe">未落户人口管理</a>
				                    			<a href="<c:url value='/lsgl/rk/toRyxglPageList.action'/>" class="zfba_d" target="mainiframe">人员相片管理</a>
				                    		</div>
				                    		<a href="<c:url value='/lsgl/jwrk/toJwrkListPage.action'/>" class="zfba_b" target="mainiframe">境外人员管理</a>
				                    		<a href="<c:url value='/lsgl/jzzxx/toJzzxxPageInfo.action'/>" class="zfba_b" target="mainiframe">居住证件管理</a>
				                    		<a href="<c:url value='/lsgl/jzzxx/toJzzDyListPage.action'/>" class="zfba_b" target="mainiframe">居住证件打印</a>
				                        	<a href="<c:url value='/lsgl/fw/toFwJbxxListPage.action'/>" class="zfba_b" target="mainiframe">房屋信息管理</a>
				                        	<a href="<c:url value='/lsgl/fw/toCzFwJbxxListPage.action'/>" class="zfba_b" target="mainiframe">出租房屋管理</a>
				                        	<a href="<c:url value='/lsgl/rk/toSrykLsjzPage.action'/>" class="zfba_b" target="mainiframe">人员居住历史</a>
				                        	<a href="<c:url value='/khkp/lssjtj/toLssjTjPage.action'/>" class="zfba_b" target="mainiframe">两实数据统计</a>
				                        	<a href="<c:url value='/lsgl/jzzxx/toTjLdrkMzxx.action'/>" class="zfba_b" target="mainiframe">流动人口统计</a>
				                        	<a href="<c:url value='/lsgl/jzzxx/toLdrkchQueryListPage.action'/>" class="zfba_b" target="mainiframe">流口入室盗分析</a>
				                        	<a href="<c:url value='/lsgl/jzzxx/toJzzTjPage.action'/>" class="zfba_b" target="mainiframe">居住证统计</a>
				                        	<a href="http://10.143.1.200:8383/CPSService/filter/jzzindex.do" class="zfba_b" target="mainiframe">居住证核查</a>
				                        	
				                        	<a href="<c:url value='/whsrk/toWhsRkListPage.action'/>" class="zfba_b" target="mainiframe">人员派发</a>
				                        	<a href="<c:url value='/whsrk/toWhsRkListPage.action'/>" class="zfba_b" target="mainiframe">人员管理</a>
				                    	</div>
				                    <div><img src="<c:url value='/jsp/cs/images/zfba_b.jpg'/>" width="140" height="15" /></div>
				              	</div>
				              	<div class="zfba_rightbox" style="border: 0px solid red;">
				              		<iframe id="mainiframe" name="mainiframe" frameborder="0" src="<c:url value='/lsgl/rk/toSyrkDjQueryPage.action'/>" width="98.5%" height="500"></iframe>
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
			            <td valign="top"width="12%">
							<div style="height: 100%;width:100%;">
								<div id="header">
									<div id="head_title" style="text-align: center;" class="cps-box-title">系统菜单</div>
									<div id="zpxx" class="cps-box-content">
										<div id="leftpanel" class="zfba_menu" style="">
											<a href="<c:url value='/lsgl/rk/toSyrkDjQueryPage.action'/>" class="zfba_a" target="mainiframe" style="text-align: left">实有人口登记</a>
				                    		<a href="javascript:void(0)" class="zfba_c" style="text-align: left">实有人口管理</a>
				                    		<div class="menubox" style="display: none;">
				                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=select" class="zfba_d" target="mainiframe" style="text-align: left">实有人口查询</a>
				                    			<a href="<c:url value='/lsgl/rkdr/toSyrkImportHcPage.action'/>" class="zfba_d" target="mainiframe" style="text-align: left">实有人口核查</a>
				                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=1" class="zfba_d" target="mainiframe" style="text-align: left">常住人口管理</a>
				                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=2" class="zfba_d" target="mainiframe" style="text-align: left">流动人口管理</a>
				                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=5" class="zfba_d" target="mainiframe" style="text-align: left">寄住人口管理</a>
				                    			<a href="<c:url value='/lsgl/rk/toSyrkListPage.action'/>?queryBean.rylb=3" class="zfba_d" target="mainiframe" style="text-align: left">未落户人口管理</a>
				                    			<a href="<c:url value='/lsgl/rk/toSrykLsjzPage.action'/>" class="zfba_d" target="mainiframe" style="text-align: left">人员居住历史</a>
				                    			<a href="<c:url value='/lsgl/rk/toRyxglPageList.action'/>" class="zfba_d" target="mainiframe" style="text-align: left">人员相片管理</a>
				                    		</div>
				                    		<a href="<c:url value='/lsgl/jwrk/toJwrkListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">境外人口管理</a>
				                    		<a href="<c:url value='/lsgl/jzzxx/toJzzxxPageInfo.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">居住证件管理</a>
				                        	<a href="<c:url value='/lsgl/fw/toFwJbxxListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">房屋信息管理</a>
				                        	<a href="<c:url value='/lsgl/fw/toCzFwJbxxListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">出租房屋管理</a>
				                        	<a href="<c:url value='/lsgl/jzzxx/toLdrkchQueryListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">流动入室盗分析</a>
				                        	<!-- 
				                        	<a href="<c:url value='/whsrk/toWhsRkListPage.action'/>" class="zfba_b" target="mainiframe">人员派发</a>
				                        	<a href="<c:url value='/whsrk/toWhsRkListPage.action'/>" class="zfba_b" target="mainiframe">人员管理</a>
				                        	 -->
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
			</c:otherwise>
	    </c:choose>
	</div>
</creator:view>
