<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<script type="text/javascript">

function saveHzPf(){
	var objForm = $('#clForm');
	var ssdwdm = $('#ssdwdm').val();
	var loginOrgCode = '${loginInfo.orgcode}';
	
	if(ssdwdm == ''){
		alert('请选择下发单位!');
		return;
	}
	
	if(ssdwdm == loginOrgCode){
		alert('不能下发本单位!');
		return;
	}
	objForm.ajaxSubmit({
        type		:"post",
        dataType 	: "json",
        url 		: contextPath + "/xfdw/hzld/pfHzInfo.action?t="+new Date().getTime(),
        success 	: function(data){
			if(data == '1'){
				alert('派发成功.');
				window.opener.reLoadPage();
				window.close();
			}
		}
	});
}

function openHzDwSelect(){
	openDwSelect2({
		rootOrgCode : '${loginInfo.orgcode}',
		mutilSelect : false,
		nodeSelectedType : "ps",
		nodeNotSelectedType : "ps"
		}, 
		function(orgbeans) {
			if (orgbeans != null) {
				$("#ssdwdm").val(orgbeans.id);
				$("#ssdwmc").val(orgbeans.name);
			}
		}
	);
}
</script>
	<cps:PanelView>
		<cps:panel title="火灾派发">
			<form id="clForm" action="${contextPath }/xfdw/hzld/pfHzInfo.action"
				method="post">
				<input type="hidden" name="hzldBean.hzxh" value="${hzldBean.hzxh }" />
				<input type="hidden" id="ssdwdm" name="hzldBean.ssdwdm" value="" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="20%"><font color='red'>*</font>派发单位：</cps:tdLabel>
						<cps:tdContent align="left">
							<cps:textfield id="ssdwmc" name="ssdwmc" cssStyle="width:70%;" value=""></cps:textfield>
							<cps:button value="选择" onclick="openHzDwSelect()"></cps:button>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="2" cssStyle="text-align:center;">
							<cps:button value="确定" onclick="saveHzPf()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
</creator:view>