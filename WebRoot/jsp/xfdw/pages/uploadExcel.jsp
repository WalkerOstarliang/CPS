<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript">
		var index = null;
		$(function(){
			var button = $("#importxlsbtn");
			new AjaxUpload(button, {
				action: contextPath + '/xfdw/hzld/importHZExcel.action', 
				name: 'uploads',
				autoSubmit : true,
				responseType : "json",
				onSubmit : function(file, ext)
				{
					$("#uploads").val(file)
					if(ext && /^(xls|xlsx)$/.test(ext.toLowerCase()))
					{
						index = layer.load(0);
						return true;
					}
					else
					{
						alert("只能上传格式为*.xls;*.xlsx");
						return false;
					}
				},
				onComplete: function(result,respose)
				{
				if(respose.error){
					alert(respose.error)
				}else{
				 alert("成功录入数据："+respose.insert+',' +"  导入失败：" +respose.error);
				}
				
				layer.close(index); 
				}
			});
		});
		
	</script>
	<cps:PanelView>
		<cps:panel title="火灾信息附件上传">
			<cps:table>
				<cps:row>
					<cps:tdContent width="85%">
						<cps:column><font color="red">如数据量较大，需等待几分钟,只支持Excel 2003</font></cps:column>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent width="85%">
						<cps:textfield id="uploads" name="uploads" readonly="true" cssStyle="width:100%"></cps:textfield>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button id="importxlsbtn" value="浏览上传附件"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:panel>
	</cps:PanelView>
	<form id="syrkformlist" method="post">
		<input type="hidden" name="fwid" value="${fwid}">
		<input type="hidden" id="batchno" name="syrkImportBean.batchno" value="">
	</form>
	<div id="cyryimmportlist">
	</div>
</creator:view>