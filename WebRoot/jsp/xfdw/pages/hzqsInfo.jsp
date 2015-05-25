<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<script type="text/javascript">
/**
签收
*/
function hzldQs(hzxh, execFunc){
	var url = contextPath + '/xfdw/hzld/qsHzInfo.action?t=' + new Date().getTime();
	var data = {"hzldBean.hzxh":hzxh};
	$.post(url, data, function(data){
		if(data == '1'){
			if($.isFunction(execFunc)){
				exec(execFunc)
			}
		}else{
			alert('签收失败!');
		}
	},'json');
}

function hzldQs(){
	var objForm = $('#clForm');
	var bzdz = $('#bzdz').val();
	
	if(bzdz == ''){
		alert('请选择所属社区!');
		return;
	}
	
	objForm.ajaxSubmit({
        type		:"post",
        dataType 	: "json",
        url 		: contextPath + "/xfdw/hzld/qsHzInfo.action?t="+new Date().getTime(),
        success 	: function(data){
			if(data == '1'){
				alert('签收成功.');
				window.opener.reLoadPage();
				window.close();
			}
		}
	});
}
</script>
	<cps:PanelView>
		<cps:panel title="火灾签收">
			<form id="clForm" action="${contextPath }/xfdw/hzld/qsHzInfo.action"
				method="post">
				<input type="hidden" name="hzldBean.hzxh" value="${hzldBean.hzxh }" />
				<cps:table>
					<cps:row>
						<select name="hzldBean.bzdz" id="bzdz" class="cps-select">
							<c:forEach items="${sqList}" var="sqbean">
								<option value="${sqbean.mc }">${sqbean.mc }</option>
							</c:forEach>
						</select>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="2" cssStyle="text-align:center;">
							<cps:button value="确定" onclick="hzldQs()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
</creator:view>