<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript">
	function clickAjxxDetail(id)
	{
		$.openWindow({
			url : contextPath + "/schedule/toAjxxDetail.action?queryBean.id=" + id,
			width:1000,
			height:600
		})
	}
	
	</script>
	<c:forEach items="${ajjbxxList}" var="ajjbxx" varStatus="st">
		<div>
			<span><img src="<c:url value="/template/cps/images/left_icon.gif"/>" width="9" height="15" style="margin-bottom:-7px;" /></span> 
			<a href="#" onclick="clickAjxxDetail('${ajjbxx.id }')">${ajjbxx.anjianmingcheng}</a>
		</div>
	</c:forEach>
</creator:view>