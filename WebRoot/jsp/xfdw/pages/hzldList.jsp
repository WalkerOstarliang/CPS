<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/xfdw/js/xfdwgl.js"></creator:Script>
<script type="text/javascript">

function queryHzld(){
	if($.validateform("queryForm"))
	{
		$("#hzldtablegrid").query("F","queryForm");
	}
}

function reLoadPage(){
	queryHzld();
}

function czCallBack(trObj,rowdataobj){
	var html = rowdataobj["cz"];
	html += " <span class=\"cps_span_href\" style=\"color:green\" onclick=\"openDeail('" + rowdataobj["hzxh"] + "')\">详情</span>";
	return html;
}

$(function(){
	var index = null;
	var button = $("#importxlsbtn");
	new AjaxUpload(button, {
		action: contextPath + '/xfdw/import/importHZExcel.action', 
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
			var error =respose.fail;
			if(respose.fail!='0'){
				error+=" 可能原因数据已存在"
			}
		 alert("成功录入数据："+respose.insert+',' +"  导入失败：" +error);
		}
		
		layer.close(index); 
		}
	});
});

</script>
<creator:box>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryHzld()"></cps:button>
			<cps:button value="导入" id="importxlsbtn"></cps:button>
		</cps:tbar>
		<cps:panel title="火灾信息管理">
			<form id="queryForm">
				<cps:table>
					<cps:row cssStyle="display:none">
						<cps:tdContent width="85%">
							<cps:textfield id="uploads" name="uploads" readonly="true" cssStyle="width:100%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">起火时间：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:date id="qhsjStart" name="queryBean.qhsjStart" dateFmt="yyyy-MM-dd HH:mm:ss" cssStyle="width:40%;"></cps:date>
							-
							<cps:date id="qhsjEnd" name="queryBean.qhsjEnd" dateFmt="yyyy-MM-dd HH:mm:ss" cssStyle="width:40%;"></cps:date>
						</cps:tdContent>
						<cps:tdLabel width="12%">火灾序号：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:textfield name="queryBean.hzxh" value="" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">起火地点：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="queryBean.qhdd" value=""></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">查看所有数据：</cps:tdLabel>
						<cps:tdContent >
							<input type="checkbox" name="queryBean.issy" value="1" />
						</cps:tdContent>
						<cps:tdLabel width="12%">已派发数据：</cps:tdLabel>
						<cps:tdContent colspan="4">
							<input type="checkbox" name="queryBean.czrjh" value="1" />
						</cps:tdContent>
					</cps:row>	
				</cps:table>
				<cps:tableGrid id="hzldtablegrid"  
						title="火灾信息列表"
						url="/xfdw/hzld/queryHzldList.action" 
						searchform="queryForm"
						autoload="true"
						pageSize="10"
						width="100%"> <!--  click="openDeail" -->
					<cps:column rowcallback="czCallBack" title="操作" width="8%"></cps:column>	
					<cps:column field="hzxh" title="火灾序号" width="10%"></cps:column>
					<cps:column field="xzqybm" title="行政区域" maxlength="20" align="left" width="12%"></cps:column>
					<cps:column field="qhsj" title="起火时间" width="10%"></cps:column>
					<cps:column field="qhdd" title="起火地点" maxlength="18" align="left" width="12%"></cps:column>
					<cps:column field="hzmc" title="单位名称/户主名称" align="left" width="10%"></cps:column>
					<cps:column field="hzyy" title="火灾原因" maxlength="18" align="left" width="12%"></cps:column>
					<cps:column field="qhcs" title="起火场所" maxlength="18" align="left" width="8%"></cps:column>
				</cps:tableGrid>
			</form>	
		</cps:panel>
	</cps:PanelView>
</creator:box>
</creator:view>