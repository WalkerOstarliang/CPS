<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<script type="text/javascript">

function saveHzldTh(){
	var objForm = $('#clForm');
	
	objForm.ajaxSubmit({
        type		:"post",
        dataType 	: "json",
        url 		: contextPath + "/xfdw/hzld/thHzInfo.action?t="+new Date().getTime(),
        success 	: function(data){
			if(data == '1'){
				alert('退回成功!');
				window.opener.reLoadPage();
				window.close();
			}
		}
	});
}

</script>
<cps:PanelView>
	<cps:panel title="退回原因">
		<form id="clForm" action="${contextPath }/xfdw/hzld/thHzInfo.action"
			method="post">
			<input type="hidden" name="hzldBean.hzxh" value="${hzldBean.hzxh }" />
			<cps:table>
				<cps:row>
					<cps:tdContent width="100%" align="center">
						<cps:textfield type="textarea" cssStyle="width:99.5%;height:150px;" name="bzsm" value=""></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent cssStyle="text-align:center;">
						<cps:button value="确定" onclick="saveHzldTh()"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</cps:panel>
</cps:PanelView>
</creator:view>