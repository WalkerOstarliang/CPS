<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript">
		function saveSyrkDrList()
		{
			if ($.validateform("syrkformlist"))
			{
				$("#syrkformlist").ajaxSubmit({
					dataType:"json",
					success : function(result)
					{
						if (result == true)
						{
							alert("保存导入的实有人口信息成功，即将关闭窗口。");
							window.close();
						}
						else
						{
							alert("保存导入的实有人口信息失败。");
						}
					}
				})
			}
		}
		function exportSyrkZdryList()
		{
			$("#syrkformlist").attr("action",contextPath + "/lsgl/rkdr/exportSyrkZdryList.action");
			$("#syrkformlist").attr("target","_blank");
			$("#syrkformlist").submit();
		}
		
		function syrkCjbDown()
		{
			window.location.href = "<c:url value='/download.action'/>?filePath=" + encodeURIComponent('/down/import/syrkplcjb.xls') + "&fileName=实有人口批量采集表格.xls" 
		}
		
		function errorInfoRowback(tdObj,rowdata)
		{
			var html = "";
			if (rowdata["errorInfo"] != null && rowdata["errorInfo"] != "")
			{
				html = "<font color='red'>" + rowdata["errorInfo"] +"</font>";
			}
			return html;
		}
		
		var index = null;
		$(function(){
			var button = $("#importxlsbtn");
			new AjaxUpload(button, {
				action: contextPath + '/lsgl/rkdr/importSyrkInfo.action', 
				name: 'uploads',
				autoSubmit : true,
				data: {"fwid" : "${fwid}"},
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
						alert("只能上传格式为*.xls;*.xlsx;的图片.");
						return false;
					}
				},
				onComplete: function(file, result)
				{
					if (result.indexOf("error")==0)
					{
						alert(result);
					}
					else
					{
						alert("实有人口信息导入成功.")
						$("#batchno").val(result);
						$("#zdrylist").query("F","syrkformlist");
					}
			    	layer.close(index);  
				}
			});
		});
		
	</script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="模板下载" onclick="syrkCjbDown()"/>
		</cps:tbar>
		<cps:panel title="实有人口附件上传">
			<cps:table>
				<cps:row>
					<cps:tdContent width="85%">
						<cps:textfield id="uploads" name="uploads" readonly="true" cssStyle="width:100%"></cps:textfield>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button id="importxlsbtn" value="浏览上传附件"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="2">
						<font color="red">
							说明：导入的数据不能及时查看导入结果，需要几分钟后到"实有人口核查"功能中查询导入数据的情况.
						</font>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:panel>
	</cps:PanelView>
	<form id="syrkformlist" method="post">
		<input type="hidden" name="fwid" value="${fwid}">
		<input type="hidden" id="batchno" name="syrkImportBean.batchno" value="">
	</form>
	<creator:tbar id="cyryzdrytbar">
		<cps:button value="导出重点人员" onclick="exportSyrkZdryList()"></cps:button>
	</creator:tbar>
	<div id="cyryimmportlist">
		<cps:tableGrid id="zdrylist" tbarId="cyryzdrytbar"
			url="/lsgl/rkdr/queryImportCyryList.action" 
			autoload="false" 
			width="99.9%"
			title="导入从业人员中存在的重点人员列表"
			searchform="syrkformlist">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="xm" title="姓名"></cps:column>
			<cps:column field="sfzh" title="身份证号码"></cps:column>
			<cps:column field="lxdh" title="电话号码"></cps:column>
			<cps:column field="jzsj" title="居住时间"></cps:column>
			<cps:column field="jzsy" title="居住事由"></cps:column>
			<cps:column field="jzcs" title="居住处所"></cps:column>
			<cps:column field="yhzgx" title="与户主关系"></cps:column>
			<cps:column field="njzqx" title="拟居住期限"></cps:column>
			<cps:column field="zdrylbms" title="重点人员标识"></cps:column>
			<cps:column field="errorInfo" title="错误信息" rowcallback="errorInfoRowback"></cps:column>
		</cps:tableGrid>
	</div>
</creator:view>