<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="<c:url value='/main/css/index.css'/>" rel="stylesheet" type="text/css" />
	</head>
	<body style="background: none;padding-top: 6px;">
        <div class="news_list" style="height:145px;width: 100%;">
        	<table border="0" cellpadding="0" cellspacing="0" class="news_list">
        		 <c:forEach items="${docsList }" var="doc" begin="0" end="6">
	        		<tr>
	        			<td width="80%">
	        				<span class="f_r" style="width:80%">
	                			&nbsp;<img src="<c:url value='/main/images/a_22.jpg'/>"/>
	                			<a href="http://${cms.href }/sitepublish/${doc.siteDir }/${doc.chnlPath }/content_${doc.documentId }.html" target="_blank" style="list-style-type: none;">
	                				${fn:substring(doc.title,0,25)}...
	                			</a> 
		                	</span>
	        			</td>
	        			<td width="5%"  >
	        				<c:if test="${doc.isNew eq 1 }">
	                    		<img src="<c:url value='/main/images/news.gif'/>" width="22" height="9" />
	                    	 </c:if>
	        			</td>
	        			<td width="15%" align="right">
	        				 <span class="f_r" style="width:30px;color: red;text-align: right;">${doc.docWTime }&nbsp;</span>
	        			</td>
	        		</tr>
        		</c:forEach>
        	</table>
        </div>
        <div style="float: right;">
        	<c:if test="${not empty docsList}">
        		<c:forEach items="${docsList }" var="doc" begin="0" end="0">
        			<a href="http://${cms.href }/sitepublish/${doc.siteDir }/${doc.chnlPath }/default.htm" target="_blank" style="color: red;">更多</a>&nbsp;&nbsp;
        		</c:forEach>
			</c:if>
		</div>
	</body>
</html>
