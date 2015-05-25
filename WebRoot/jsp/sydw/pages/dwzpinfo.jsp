<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="单位照片信息">
	<script type="text/javascript">

function clickShowDwzp(obj,zpid)
{
	if (confirm("删除照片后将无法找回，你确定要删除吗？"))
	{
		$.ajax({
			url : contextPath + "/zagl/dw/deleteDwzp.action",
			data : {
				"dw.dwzp.id" : zpid
			},
			dataType : "json",
			success : function(result) 
			{
				if (result == true)
				{
					$(obj).remove();
				}
				else
				{
					alert("删除照片失败,请稍后再试.");
				}
				
			}
		});
	}
}

var index = null;
$(function(){
	var button = $('#dwzpuploadbtn');
	new AjaxUpload(button, {
			action: contextPath + "/zagl/dw/saveDwZp.action", 
			name: 'dw.dwzp.zps',
			responseType: "json",
			data: {"dw.dwjbxx.jgbh" : "${dwBean.dwjbxx.jgbh}"},
			autoSubmit : true,
			onSubmit : function(file, ext){
				if(ext && (/^(jpg|png|jpeg|gif|bmp)$/.test(ext) || /^(JPG|PNG|JPEG|GIF|BMP)$/.test(ext)))
				{
					index = layer.load(0);
					return true;
				}
				else
				{
					alert("只能上传格式为*.jpg;*.png;*.gif;*.jpeg;*.bmp的图片.");
					return false;
				}
			},
			onComplete: function(file, serverData)
			{
				if (serverData != null && $.isArray(serverData))
		    	{
		    		$.each(serverData,function(i,data){
		    			$("#xyzpdiv").append("<span zpid=\""+ data.id + "\" style=\"margin:2px;cursor: pointer;\"></span>");
		    			$("#xyzpdiv").find("span[zpid='" + data.id + "']").first().append("<img width=\"145\" height=\"170\" src=\"" + contextPath + "/zagl/dw/showDwzp.action?dw.dwzp.id=" +data.id + "\"/>");
		    			$("#xyzpdiv").find("span[zpid='" + data.id + "']").first().bind("dblclick",function(){
		    				clickShowDwzp(this,data.id);
		    			});
		    		});
		    	}
		    	layer.close(index);  
			}
		});
});

</script>
<cps:PanelView>
	<cps:tbar>
		<span><font color="red">双击照片可以删除照片</font></span>
		<cps:button id="dwzpuploadbtn" value="照片上传"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow()" />
	</cps:tbar>
	<cps:panel title="单位照片信息">
		<div id="xyzpdiv" style="width:99.8%;overflow: auto;border: 1px solid #CCCCCC;padding-top: 10px">
			<c:forEach items="${dwBean.dwzpList}" var="zp">
				<span zpid="${zpBean.id}" ondblclick="clickShowDwzp(this,'${zp.id}')" style="margin: 2px;cursor: pointer;">
					<img width="145" height="170" src="<c:url value='/zagl/dw/showDwzp.action'/>?dw.dwzp.id=${zp.id}"/>
				</span>
			</c:forEach>
		</div>
	</cps:panel>
</cps:PanelView>
</creator:view>