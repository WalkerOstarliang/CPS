<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<c:choose>
	<c:when test="${not empty fwjgDetail.fwjglinkMap}">
		<c:forEach items="${fwjgDetail.fwjglinkMap}" var="entry">
			<div class="fw_lc" value="${entry.key}">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
			      	<tr>
			         	<td class="fw_lc_a">第<br/>${entry.key}<br />层</td>
			         	<td>
			         		<div class="fw_list">
				         		<c:forEach items="${entry.value}" var="fwBean">
				         			<div class="fw_list_a">
					                 	<div style="float:left;" title="${fwBean.dzmc }">
					                 		<a href="#" class="fw_house" onclick="openNewFwInfo('detail','${fwBean.fwid}','${fwBean.sfczw }')">
					                 			<c:choose>
					                 				<c:when test="${not empty fwBean.fjh}">${fwBean.fjh}</c:when>
					                 				<c:when test="${not empty fwBean.fsdz}">${fn:substring(fwBean.fsdz,0,4)}</c:when>
					                 				<c:otherwise>
					                 					无房号
					                 				</c:otherwise>
					                 			</c:choose>
					                 		</a>
					                 	</div>
					                 	<c:choose>
					                 		<c:when test="${fwBean.sfczw == '1'}">
					                 			<div class="fw_zt"><img src="<c:url value='/jsp/dzgl/images/fw_zu.jpg'/>" title="出租房" /></div>
					                 		</c:when>
					                 		<c:otherwise>
					                 			<div class="fw_zt"><img src="<c:url value='/jsp/dzgl/images/fw_pu.jpg'/>" title="普通住房" /></div>
					                 		</c:otherwise>
					                 	</c:choose>
					                 	<c:choose>
					                 		<c:when test="${fwBean.fwrks > 0}">
					                 			<div class="fw_zt" onclick="openJzrkxxwin('${fwBean.fwid}')"><img src="<c:url value='/jsp/dzgl/images/fw_youren.jpg'/>" title="有人居住"/></div>
					                 		</c:when>
					                 		<c:otherwise>
					                 			 <div class="fw_zt"><img src="<c:url value='/jsp/dzgl/images/fw_kong.jpg'/>" title="无人居住" /></div>
					                 		</c:otherwise>
					                 	</c:choose>
					                 	<c:if test="${operType != 'detail'}">
						                 	<div id="menu_${fwBean.fwid}" fwid="${fwBean.fwid }" class="fw_zt"><img id="img_${fwBean.fwid}" src="<c:url value='/jsp/dzgl/images/fw_cz.jpg'/>" title="操作按钮" /></div>
						               		<div id="rightMenu_${fwBean.fwid}" class="fw_drop" style="position: absolute;display: none;">
						               			<a href="#" onclick="openNewFwInfo('update','${fwBean.fwid }','${fwBean.sfczw}')" class="fw_drop_a">修改房屋信息</a>
												<a href="#" onclick="openAddSyrkInfoWin('${fwBean.fwid}')" class="fw_drop_a">实有人口登记</a>
												<a href="#" onclick="openJwrkInfoWin('${fwBean.fwid}')" class="fw_drop_a">境外人口登记</a>
											    <a href="#" onclick="openSyrkDwInfoWin('${fwBean.fwid }')" class="fw_drop_a">实有单位登记</a>
											    <c:if test="${fwBean.sfczw == '0'}">
													<a href="#" onclick="openCzfwDjInfoWin('${fwBean.fwid }')" class="fw_drop_a">出租房登记</a>
												</c:if>
											    <c:if test="${fwBean.sfczw == '1'}">
													<a href="#" onclick="zxCzFwInfo('${fwBean.fwid}');" class="fw_drop_a">停止出租房屋</a>
												</c:if>
											    <c:if test="${fwBean.sfczw == '0'}">
											   	 	<a href="#" onclick="zxFwInfo('${fwBean.fwid}')" class="fw_drop_a">注销房屋信息</a>
											    </c:if>
											</div>
										</c:if>
					                </div>
				         		</c:forEach>
				         		<c:if test="${operType != 'detail'}">
				         			<div class="fw_list_add"><a href="#" onclick="openNewFwJgInfoWin('add','${entry.key}')"><img src="<c:url value='/jsp/dzgl/images/fw_add.jpg'/>" title="添加房屋" /></a></div>
		                  		</c:if>
		                  		<div style="clear:both;"></div>
			         		</div>
			         	</td>
			       	</tr>
			    </table>
		    </div>
		</c:forEach> 
	</c:when>
	<c:otherwise>
		<div class="fw_lc" value="1">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
		      	<tr>
		         	<td class="fw_lc_a">第<br/>1<br />层</td>
		         	<td>
		         		<div class="fw_list">
			         		<div class="fw_list_add"><a href="#" onclick="openNewFwJgInfoWin('add','1')"><img src="<c:url value='/jsp/dzgl/images/fw_add.jpg'/>" title="添加房屋" /></a></div>
	                  		<div style="clear:both;"></div>
		         		</div>
		         	</td>
		       	</tr>
		    </table>
	    </div>
	</c:otherwise>
</c:choose>