<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/xfdw/js/xfdwgl.js"></creator:Script>
<script type="text/javascript">

function reLoadPage(){
	window.location.reload();
}

$(function(){
	$(window).bind('beforeunload', function(){
		window.opener.reLoadPage();
	})
});

</script>
<creator:box>
	<cps:PanelView>
		<cps:panel title="火灾信息详情">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="20%">火灾序号：</cps:tdLabel>
					<cps:tdContent width="30%">
						${hzldBean.hzxh }
					</cps:tdContent>
					<cps:tdLabel width="20%">起火时间：</cps:tdLabel>
					<cps:tdContent width="30%">
						${hzldBean.qhsj }
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>起火地点：</cps:tdLabel>
					<cps:tdContent>
						${hzldBean.qhdd }
					</cps:tdContent>
					<cps:tdLabel>所属行政区：</cps:tdLabel>
					<cps:tdContent>
						${hzldBean.xzqybm }
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>单位名称/户主名称：</cps:tdLabel>
					<cps:tdContent>
						${hzldBean.hzmc }
					</cps:tdContent>
					<cps:tdLabel>死亡人数：</cps:tdLabel>
					<cps:tdContent>
						${hzldBean.swrs }
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>受伤人数：</cps:tdLabel>
					<cps:tdContent>
						${hzldBean.ssrs }
					</cps:tdContent>
					<cps:tdLabel>直接财产损失：</cps:tdLabel>
					<cps:tdContent>
						${hzldBean.zjccss }
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>受灾户数：</cps:tdLabel>
					<cps:tdContent>
						${hzldBean.szhs }
					</cps:tdContent>
					<cps:tdLabel>起火场所：</cps:tdLabel>
					<cps:tdContent>
						${hzldBean.qhcs }
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>火灾等级：</cps:tdLabel>
					<cps:tdContent colspan="3">
						${hzldBean.hzdjmc }
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>火灾原因：</cps:tdLabel>
					<cps:tdContent colspan="3">
						${hzldBean.hzyy }
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>派发单位：</cps:tdLabel>
					<cps:tdContent colspan="3">
						${hzldBean.ssdwmc }
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>标准地址：</cps:tdLabel>
					<cps:tdContent colspan="3">
						${hzldBean.bzdz }${hzldBean.qhdd }
					</cps:tdContent>
				</cps:row>
				<c:if test="${empty czType}">
					<cps:row>
						<cps:tdContent colspan="4" align="center">
							${hzldBean.cz }
						</cps:tdContent>
					</cps:row>
				</c:if>
			</cps:table>
		</cps:panel>
		
		<form id="queryForm" name="queryForm" method="post">
			<input type="hidden" name="queryBean.hzxh" value="${hzldBean.hzxh }"/>
		</form>
		<cps:tableGrid id="hzpftablegrid"  
					title="火灾信息流转轨迹"
					url="/xfdw/hzld/queryByHzpfInfo.action" 
					searchform="queryForm"
					autoload="true"
					pageSize="10"
					width="100%" > 
				<cps:column field="czrjh" title="操作人警号"></cps:column>
				<cps:column field="czrxm" title="操作人姓名"></cps:column>
				<cps:column field="czrdwmc" title="操作人单位" maxlength="15" align="left"></cps:column>
				<cps:column field="czsj" title="操作时间"></cps:column>
				<cps:column field="czip" title="操作IP地址"></cps:column>
				<cps:column field="cldwmc" title="处理单位" maxlength="25" align="left"></cps:column>
				<cps:column field="clztmc" title="处理状态" align="left"></cps:column>
				<cps:column field="bzsm" title="备注说明" maxlength="15" align="left"></cps:column>
			</cps:tableGrid>
	</cps:PanelView>
</creator:box>
</creator:view>