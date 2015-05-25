<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="派出所管理">
	<creator:Script src="/jsp/xtgl/js/pcs.js"></creator:Script>
	<creator:Script src="/jsp/gzgl/js/userlxfs.js"></creator:Script>
 	<creator:box>
	 	<cps:table id="centertable">
	 		<cps:row height="100%">
	 			<cps:tdContent width="15%" valign="top">
	 				<%@include file="/jsp/xtgl/pages/pcsgl/pcsleft.jsp" %>
	 			</cps:tdContent>
	 			<cps:tdContent width="79%" valign="top" align="right">
					<%@include file="/jsp/xtgl/pages/pcsgl/pcscenter.jsp" %>	 
				</cps:tdContent>
	 		</cps:row>
	 	</cps:table>
 	</creator:box>
</creator:view>