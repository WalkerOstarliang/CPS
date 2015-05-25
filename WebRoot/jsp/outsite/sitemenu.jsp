<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/outsite/js/sitemenu.js"></creator:Script>
	<form id="outsiteform">
		<input type="hidden" id="menuid" name="outsiteMenuBean.id" value="${outsiteMenuBean.id}">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%">系统名称：</cps:tdLabel>
				<cps:tdContent width="30%">
					<cps:textfield id="menuname" name="outsiteMenuBean.menuname" required="true" maxlength="8"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">系统网址：</cps:tdLabel>
				<cps:tdContent width="40%">
					<cps:textfield id="menuhref" name="outsiteMenuBean.menuhref" cssClass="validate[custom[url]]"></cps:textfield>
				</cps:tdContent>
				<cps:tdContent width="10%">
					<cps:button value="保存" onclick="saveAddOutsiteWin()"></cps:button>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent colspan="6">
					<font color="red">
						&nbsp;&nbsp;民警可以收藏自己经常使用的系统网站，方便快捷使用外部系统。
					</font>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
	</div>
	 <div class="kjrk_div">
    	<ul>
    		<c:forEach items="${outSiteMenuBeans}" var="menubeans">
    			<li>
    				<span onclick="openOutSiteWin('${menubeans.id}','${menubeans.menuname }','${menubeans.menuhref}')">${fn:substring(menubeans.menuname,0,8)}</span>
    				<span onclick="deleteOutSizeMenu('${menubeans.id}')">
    					<c:if test="${not empty menubeans.createusersfzh}">
    						<img src="${contextPath}/template/cps/images/del_icon.gif" height="12" width="12">
    					</c:if>
    				</span>
    			</li>
    		</c:forEach>
            <div class="clear"></div>
        </ul>
  	</div>
</creator:view>