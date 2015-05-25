<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="addfj">
	<cps:button value="添加辅警" onclick="openFjPage('','add')"></cps:button>
</creator:tbar>

<div id="pcsxxdiv">
	<iframe id="pcsjbxxiframe" scrolling="yes" src="" width="99%" height="870" frameborder="0">
	</iframe>
</div>
