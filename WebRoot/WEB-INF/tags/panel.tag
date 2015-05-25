<%@tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="id" required="true" rtexprvalue="true"%>
<%@attribute name="title" required="false" rtexprvalue="true"%>
<%@attribute name="width" required="false" rtexprvalue="true"%>
<%@attribute name="height" required="false" rtexprvalue="true"%>
<%@attribute name="expand" required="false" rtexprvalue="true"%>
<%@attribute name="tbarId" required="false" rtexprvalue="true"%>
<%@attribute name="scroll" required="false" rtexprvalue="true"%>
<%@attribute name="help" required="false" rtexprvalue="true"%>
<%@attribute name="helpclick" required="false" rtexprvalue="true"%>
<%@attribute name="display" required="false" rtexprvalue="true"%>
<div id="${id}" class="creatorpanel" tbarId="${tbarId}" width="${width}" height="${height}" style="display:${display == null?'block':'display'};">
	<div id="head_${id}" class="cps-box-title" style="text-align: left;">
		<div style="float:left">
			<span>
				&nbsp;${title} 
				<c:if test="${help==true}">
			      	<a href="javascript:${helpclick}"><img src="<c:url value='/template/cps/images/help.jpg'/>" width="16" height="16" title="帮助"></a>
			    </c:if>
			</span>
		</div>
		<div id="tbar_${id}" style="float:right;padding-right: 5px;">
		</div>
	</div>
	<div id="body_${id}" class="creatorpanelcontent" style="overflow-x:hidden;overflow-y:${scroll==true?'auto':'hidden'};">
		<jsp:doBody></jsp:doBody>
	</div>
</div>