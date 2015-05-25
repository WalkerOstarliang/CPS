<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view>
	<creator:Script src="/jsp/xtgl/js/xzqhIndex.js"></creator:Script>
	<script type="text/javascript">
		var currentOrgCode = "${loginInfo.countrygajgdm}";
		if (currentOrgCode == "")
		{
			currentOrgCode = "${loginInfo.citygajgdm}";
			if (currentOrgCode == "")
			{
				currentOrgCode = "0";
			}
		}
	</script>
	<creator:box>
		<div style="width:100%;margin: 0px;padding: 0px;">
			<div style="float: left;width: 20%;margin: 0px;padding: 0px;">
				<div id="aaa" class="creatorpanel">
					<div id="head_aaa">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="cps-panel-box-title" >
						    <tr>
						      <td align="left">&nbsp;行政区划列表</td>
						    </tr>
						</table>
					</div>
					<div id="body_aaa" class="creatorpanelcontent" style="padding: 0px;margin: 0px;width: 99%;overflow: hidden">
						<%@include file="/jsp/xtgl/pages/xzqh/xzqhleft.jsp" %>
					</div>
				</div>
			</div>
			<div style="float: right;width: 79%">
				<%@include file="/jsp/xtgl/pages/xzqh/xzqhcenter.jsp" %>
			</div>
		</div>
	</creator:box>
</creator:view>









