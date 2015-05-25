<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="wdrc_list">
           <tr height="15px">
           	  <th width="15%">操作</th>
              <th width="60%">名称</th>
              <th width="25%">要求办理时间</th>
           </tr>
           <c:choose>
           		<c:when test="${not empty xttxListBeans}">
		           <c:forEach items="${xttxListBeans}" var="bean">
		            <tr height="15px">
		            	  <td><a href="../${bean.blhref}" target="_blank"><font color="green">办理</font></a></td>
		              	  <td title="${bean.title }" align="left">${fn:substring(bean.title,0,15)}..</td>
		                  <td>${bean.blsj }</td>
		            </tr>
		           </c:forEach>
	           </c:when>
	           <c:otherwise>
	           		<tr>
		              	<td colspan="3"><font color="red">没有可提醒记录.</font></td>
		            </tr>
	           </c:otherwise>
           </c:choose>
     </table>
</creator:view>