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
				                    		<%-- 
				                    		<a href="<c:url value='/zagl/dw/toDwcx.action'/>" class="zfba_a" target="mainiframe">实有单位登记</a>
				                    		--%>
				                    		<a href="<c:url value='/sydw/dwgl/toSydwdjDwQueryPage.action'/>" class="zfba_a" target="mainiframe">实有单位登记</a>
				                    		<a href="<c:url value='/zagl/dw/toDwcx.action?operType=select'/>" class="zfba_b" target="mainiframe">实有单位管理</a>
				                    		<%-- 
				                    		<a href="javascript:void(0)" class="zfba_c">实有单位管理</a>
				                    		<div class="menubox" style="display: none;">
				                    			<a href="<c:url value='/zagl/dw/toDwcx.action?operType=select'/>" class="zfba_a" target="mainiframe">实有单位查询</a>
				                    			<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=03'/>" class="zfba_d" target="mainiframe">企事业单位管理</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=01'/>" class="zfba_d" target="mainiframe">特种行业管理</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=02'/>" class="zfba_d" target="mainiframe">公共场所管理</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=05'/>" class="zfba_d" target="mainiframe">上网场所管理</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=04'/>" class="zfba_d" target="mainiframe">危险品单位</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=06'/>" class="zfba_d" target="mainiframe">涉外单位</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=07'/>" class="zfba_d" target="mainiframe">旅馆业</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=08'/>" class="zfba_d" target="mainiframe">开锁业</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=10'/>" class="zfba_d" target="mainiframe">其他单位</a>
				                    		</div>
				                    		--%>
				                    		<a href="javascript:void(0)" class="zfba_c">从业人员管理</a>
				                    		<div class="menubox" style="display: none;">
				                    			<a href="<c:url value='/zagl/dw/toCyryList.action'/>" class="zfba_a" target="mainiframe">从业人员查询</a>
				                        		<a href="<c:url value='/zagl/dw/toCyryPfListPage.action'/>" class="zfba_d" target="mainiframe">从业人员派发</a>
				                        		<a href="<c:url value='/zagl/cyry/toImportCyryHcPage.action'/>" class="zfba_d" target="mainiframe">从业人员核查</a>
				                        		<a href="<c:url value='/zagl/dw/toCyryList.action?cyrycx.sfabry=1'/>" class="zfba_d" target="mainiframe">治保人员查询</a>
				                        		<a href="<c:url value='/zagl/dw/toCyryList.action?cyrycx.zwlb=01'/>" class="zfba_d" target="mainiframe">单位法人查询</a>
				                    		</div>
				                    		<%-- 
				                        	<a href="<c:url value='/zagl/dw/toCyryList.action'/>" class="zfba_b" target="mainiframe">从业人员管理</a>
				                        	<a href="<c:url value='/zagl/cyry/toImportCyryHcPage.action'/>" class="zfba_b" target="mainiframe">从业人员核查</a>
				                        	<a href="<c:url value='/zagl/dw/toCyryPfListPage.action'/>" class="zfba_b" target="mainiframe">从业人员派发</a>
				                        	<a href="<c:url value='/dxhd/toDxhdList.action'/>" class="zfba_b" target="mainiframe">大型活动管理</a>
				                        	--%>
				                        	<a href="<c:url value='/afgl/lmpcxx/toLmpcList.action'/>" class="zfba_b" target="mainiframe">路面盘查管理</a>
				                        	<a href="<c:url value='/zagl/dw/toJfdwListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">技防单位管理</a>
				                        	
				                        	<a href="javascript:void(0)" class="zfba_c">内保单位管理</a>
				                    		<div class="menubox" style="display: none;">
				                    			<!-- 
				                    			<a href="<c:url value='/zagl/dw/toStcxPage.action'/>" class="zfba_b" target="mainiframe">实体信息采集</a>
				                    			<a href="<c:url value='/zagl/dw/toNbdwdj.action'/>" class="zfba_b" target="mainiframe">内保单位登记</a>
				                    			 -->
				                    			<a href="<c:url value='/zagl/dw/toNbdwcx.action?dwcx.hylb=03'/>" class="zfba_d" target="mainiframe">内保单位管理</a>
				                    			<a href="<c:url value='/sydw/dwgl/toDwglbmhcListPage.action?dwcx.glbm=2'/>" class="zfba_b" target="mainiframe">内保单位核签</a>
				                    			<a href="<c:url value='/zagl/wyxq/toWyxqListPage.action'/>?wyxq.ywwygs=1" class="zfba_b" target="mainiframe" style="text-align: left">物业小区管理</a>
				                    			<a href="<c:url value='/zagl/dw/toDwtj.action'/>?queryBean.rylb=1" class="zfba_d" target="mainiframe">单位信息统计</a>
				                    			<!-- 
				                    			<a href="<c:url value='/zagl/dw/toDwfatj.action'/>?queryBean.rylb=2" class="zfba_d" target="mainiframe">发案信息统计</a>
				                    			
				                    			<a href="<c:url value='/zagl/dw/toZbdwfatj.action'/>" class="zfba_b" target="mainiframe">治保单位发案表</a>
				                    			<a href="<c:url value='/zagl/dw/toZddwfatj.action'/>" class="zfba_d" target="mainiframe">重点单位发案</a>
				                    			<a href="<c:url value='/zagl/dw/toWyxqQcAjTj.action'/>?wyxq.ywwygs=1" class="zfba_b" target="mainiframe" style="text-align: left">小区侵财案统计</a>
				                    			<a href="<c:url value='/zagl/dw/toWyxqFaTj.action'/>" class="zfba_d" target="mainiframe">小区侵财案情况</a>
				                    			 -->
				                    		</div>
				                    		
				                    		<a href="<c:url value='/zagl/ddccj/toListPage.action'/>" class="zfba_b" target="mainiframe">电动车管理</a>
				                  			<a href="<c:url value='/zagl/ddccx/toDdcjjListPage.action'/>" class="zfba_b" target="mainiframe">交警电动车查询</a>
				                  			<!-- 
				                  			<a href="<c:url value='/sydw/dwgl/toDwglbmhcListPage.action?dwcx.glbm=1'/>" class="zfba_b" target="mainiframe">治安单位核实</a>
				                  			<a href="<c:url value='/sydw/dwgl/toDwglbmhcListPage.action?dwcx.glbm=5'/>" class="zfba_b" target="mainiframe">消防单位核实</a>
				                  			<a href="<c:url value='/sydw/dwgl/toDwglbmhcListPage.action?dwcx.glbm=4'/>" class="zfba_b" target="mainiframe">网监单位核实</a>
				                  			-->
				                  			<a href="<c:url value='/zagl/dw/toAqjcListPage.action'/>" class="zfba_b" target="mainiframe">安全检查查询</a>
				                  			
				                  			<a href="<c:url value='/nbtj/toNbdwFaTjPage.action'/>" class="zfba_b" target="mainiframe">内保单位发案</a>
			                    			<a href="<c:url value='/nbtj/toZddwfaTjPage.action'/>" class="zfba_d" target="mainiframe">重点单位发案</a>
			                    			<a href="<c:url value='/nbtj/toWyxqFaTjPage.action'/>" class="zfba_b" target="mainiframe">物业小区发案</a>
			                    			<a href="<c:url value='/nbtj/toWyxqTbPage.action'/>" class="zfba_d" target="mainiframe">物业小区通报</a>
			                    			
			                    			<a href="<c:url value='/sydw/dwop/toDwOpListPage.action'/>?query.glbm=1" class="zfba_d" target="mainiframe">治安单位派发</a>
			                    			<a href="<c:url value='/sydw/dwop/toDwOpListPage.action'/>?query.glbm=4" class="zfba_d" target="mainiframe">网技单位派发</a>
			                    			<a href="<c:url value='/sydw/dwop/toDwOpListPage.action'/>" class="zfba_d" target="mainiframe">单位派发</a>
			                    			<a href="<c:url value='/sydw/dwop/toDwOpListPage.action'/>" class="zfba_d" target="mainiframe">单位签收</a>
			                    			
			                    			<a href="<c:url value='/sydw/wbdwgl/toWbdwShListPage.action'/>" class="zfba_d" target="mainiframe">危爆单位审核</a>
				                    	</div>
				                    <div><img src="<c:url value='/jsp/cs/images/zfba_b.jpg'/>" width="140" height="15" /></div>
				              	</div>
				              	<div class="zfba_rightbox" style="border: 0px solid red;">
				              		<iframe id="mainiframe" name="mainiframe" frameborder="0" src="<c:url value='/sydw/dwgl/toSydwdjDwQueryPage.action'/>" width="98.5%" height="500"></iframe>
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
									    	<a href="<c:url value='/sydw/dwgl/toSydwdjDwQueryPage.action'/>" class="zfba_a" target="mainiframe" style="text-align: left">实有单位登记</a>
				                    		<a href="<c:url value='/zagl/dw/toDwcx.action?operType=select'/>" class="zfba_b" target="mainiframe" style="text-align: left">实有单位管理</a>
				                    		<%-- 
				                    		<a href="javascript:void(0)" class="zfba_c" style="text-align: left">实有单位管理</a>
				                    		<div class="menubox" style="display: none;">
				                    			<a href="<c:url value=''/>" class="zfba_a" target="mainiframe" style="text-align: left">实有单位查询</a>
				                    			<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=03'/>" class="zfba_d" target="mainiframe" style="text-align: left">企事业单位管理</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=01'/>" class="zfba_d" target="mainiframe" style="text-align: left">特种行业管理</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=02'/>" class="zfba_d" target="mainiframe" style="text-align: left">公共场所管理</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=05'/>" class="zfba_d" target="mainiframe" style="text-align: left">上网场所管理</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=04'/>" class="zfba_d" target="mainiframe" style="text-align: left">危险品单位</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=06'/>" class="zfba_d" target="mainiframe" style="text-align: left">涉外单位</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=07'/>" class="zfba_d" target="mainiframe" style="text-align: left">旅馆业</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=08'/>" class="zfba_d" target="mainiframe" style="text-align: left">开锁业</a>
				                        		<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=10'/>" class="zfba_d" target="mainiframe" style="text-align: left">其他单位</a>
				                    		</div>
				                    		--%>
				                        	<a href="<c:url value='/zagl/dw/toCyryList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">从业人员管理</a>
				                        	<a href="<c:url value='/zagl/dw/toCyryTjfxList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">从业人员统计</a>
				                        	<a href="<c:url value='/zagl/cyry/toImportCyryHcPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">从业人员核查</a>
				                        	<a href="<c:url value='/dxhd/toDxhdList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">大型活动管理</a>
				                        	<a href="<c:url value='/zagl/dw/toAqjcListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">安全检查查询</a>
				                        	<%-- 
				                        	<a href="<c:url value='/zagl/dw/toJfdwListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">技防单位管理</a>
				                        	<a href="<c:url value='/zagl/ddccx/toDdcjjListPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">交警电动车查询</a>
				                        	--%>
				                        	<%-- 
				                        	<a href="javascript:void(0)" class="zfba_c">内保单位管理</a>
				                        	--%>
				                    		<div class="menubox" style="display: none;">
				                    		<!-- 
				                    			<a href="<c:url value='/zagl/dw/toStcxPage.action'/>" class="zfba_b" target="mainiframe">实体信息采集</a>
				                    			<a href="<c:url value='/zagl/dw/toNbdwdj.action'/>" class="zfba_b" target="mainiframe">内保单位登记</a>
				                    		 -->	
				                    			<a href="<c:url value='/zagl/dw/toNbdwcx.action?dwcx.hylb=03'/>" class="zfba_d" target="mainiframe">内保单位管理</a>
				                    			<a href="<c:url value='/sydw/dwgl/toDwglbmhcListPage.action?dwcx.glbm=2'/>" class="zfba_b" target="mainiframe">内保单位核签</a>
				                    			<a href="<c:url value='/zagl/wyxq/toWyxqListPage.action'/>?wyxq.ywwygs=1" class="zfba_b" target="mainiframe" style="text-align: left">物业小区管理</a>
				                    			<a href="<c:url value='/zagl/dw/toDwtj.action'/>?queryBean.rylb=1" class="zfba_d" target="mainiframe">单位信息统计</a>
				                    			<!-- 
				                    			<a href="<c:url value='/zagl/dw/toDwfatj.action'/>?queryBean.rylb=2" class="zfba_d" target="mainiframe">发案信息统计</a>
				                    			 -->
				                    			<a href="<c:url value='/nbtj/toNbdwFaTjPage.action'/>" class="zfba_b" target="mainiframe">内保单位发案</a>
				                    			<a href="<c:url value='/nbtj/toZddwfaTjPage.action'/>" class="zfba_d" target="mainiframe">重点单位发案</a>
				                    			<a href="<c:url value='/nbtj/toWyxqFaTjPage.action'/>" class="zfba_b" target="mainiframe">物业小区发案</a>
				                    			<a href="<c:url value='/nbtj/toWyxqTbPage.action'/>" class="zfba_d" target="mainiframe">物业小区通报</a>
				                    		</div>
								   	 	</div>
									</div>
								</div>
							</div>
						</td>
						<td width="85%">
							<iframe id="mainiframe" name="mainiframe" frameborder="0" src="<c:url value='/sydw/dwgl/toSydwdjDwQueryPage.action'/>" width="98.5%" height="500"></iframe>
						</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</creator:view>