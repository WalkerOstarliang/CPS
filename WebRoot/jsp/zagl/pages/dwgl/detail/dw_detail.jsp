<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="单位详情">
	<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/dwdetail.js"></creator:Script>
	<script type="text/javascript">
	
		$(function(){
			$.maxWindow();
			$.ajax({
				type : "post",
				url : contextPath + "/zagl/dw/toDwjbxxDetail.action?dw.dwjbxx.jgbh=${jgbh}",
				success : function(resulthtml)
				{
					$("#dwjbxx_detail").html(resulthtml);
					var winheight = $(window).height();
					$("#detailcontent").height(winheight - $("#dwjbxx_panel").height() -20)
					$("#dwDetail_menu").height(winheight - $("#dwjbxx_panel").height() -40);
					$("#dwDetai_main").height(winheight - $("#dwjbxx_panel").height() -40);
				}
			});
		});
	</script>
	<input type="hidden" value="${jgbh}" id="jgbh" />
	<input type="hidden" value="${hylb}" id="hylb" />
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<creator:panel id="dwjbxx_panel" title="单位基本信息">
					<div id="dwjbxx_detail"></div>
				</creator:panel>
			</td>
		</tr>
		<tr id="detailcontent">
			<td height="100%">
				<creator:panel id="dwxq" title="单位详细信息"  width="99.8%" scroll="false">
					<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" style="border-color: #CCCCCC">
						<tr>
							<td id="menuiframe" width="150px" valign="top" style="margin-right: 5px;border: 1px solid #CCCCCC;">
								<iframe id="dwDetail_menu" frameborder="0" style="overflow-x:hidden;overflow-y:auto;" src="${contextPath}/zagl/dw/toDwMenu.action?hylb=${hylb}" width="100%"></iframe>
							</td>
							<td id="contenttdiframe" width="90%" valign="top" align="left">
								<iframe id="dwDetai_main" frameborder="0" style="overflow-x:hidden;overflow-y:auto;" src="" width="100%"></iframe>
							</td>
						</tr>
					</table>
				</creator:panel>
			</td>
		</tr>
	</table>
</creator:view>
