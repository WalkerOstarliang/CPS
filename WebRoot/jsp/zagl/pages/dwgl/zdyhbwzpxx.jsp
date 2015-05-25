<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view title="重点要害部位添加附件">
	<script type="text/javascript">
		function deleteZdyhbwzpBean()
		{
			var zpbh = $("#zpbh").val();
			if (zpbh != null && zpbh != "")
			{
				$.ajax({
					url : contextPath + "/zagl/dw/deleteZdyhbwzpBean.action",
					data : "bh=" + zpbh,
					type : "post",
					dataType : "json",
					success : function(result)
					{
						
						if (result == true)
						{
							alert("删除照片成功.");
							$("#xyzpdiv").find("span[bh='" + zpbh + "']").remove();
							$("#showbigimgdiv").empty();
						}
						else
						{
							alert("删除照片失败.");
						}
					}
				});
			}
			else
			{
				alert("请选择要删除的图片.");
			}
		}
		
		function showbigimage(bh)
		{
			$("#showbigimgdiv").empty();
		    $("#showbigimgdiv").append("<img width=\"140\" height=\"170\" src=\"" + contextPath + "/zagl/dw/showYhbwzp.action?bh=" + bh + "\"/>")
			$("#zpbh").val(bh);
		}
	
		$(function(){
			var button = $("#uploads");
			new AjaxUpload(button, {
				action: contextPath + '/zagl/dw/uploadFile.action', 
				name: 'uploads',
				responseType : "json",
				data: 
				{
					"dwcx.yhbwbh":"${dwcx.yhbwbh}"
				},
				autoSubmit : true,
				onSubmit : function(file, ext){
					if(ext && /^(jpg|png|jpeg|gif|bmp)$/.test(ext))
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
				onComplete: function(file, serverData){
					var bh = serverData;
			    	$("#xyzpdiv").append("<span bh=\"" + bh + "\" style=\"background: #CCCCCC;margin: 2px;cursor: pointer;\"><img width=\"140\" height=\"170\" src=\"" + contextPath + "/zagl/dw/showYhbwzp.action?bh=" + bh + "\"/></span>");
		    		$("#xyzpdiv").find("span:last").click(function(){
		    			showbigimage(bh);
		    		});
			    	layer.close(index);  
				}
			});
		});
	</script>
		<cps:table>
			<cps:row>
				<cps:tdContent>
					<cps:button id="uploads" value="上传"></cps:button>
					<cps:button value="删除" onclick="deleteZdyhbwzpBean()"></cps:button>
				</cps:tdContent>
				<cps:tdContent>
					<span><font color="red">每次最多允许上传8个，允许上传图片格式（*.jpg;*.png;*.gif;*.jpeg;*.bmp）</font></span>
				</cps:tdContent>
			</cps:row>
		</cps:table>
		<div id="xyzpdiv" style="width:790px;height:180px;overflow: auto;background: #CCCCCC;border: 1px solid #CCCCCC;padding-top: 10px">
			<c:forEach items="${zdyhbwzpbeans}" var="zpBean">
				<span  bh="${zpBean.bh}"  onclick="showbigimage('${zpBean.bh}')" style="background: #CCCCCC;margin: 2px;cursor: pointer;">
					<img width="140" height="170" src="<c:url value='/zagl/dw/showYhbwzp.action'/>?bh=${zpBean.bh}"/>
				</span>
			</c:forEach>
		</div>
		<cps:table height="235px">
			<cps:row>
				<cps:tdContent width="70%">
					<div id="fileQueue"></div>
				</cps:tdContent>
				<cps:tdContent width="30%" align="center">
					<input type="hidden" id="zpbh" name="zpbh">
					<div id="showbigimgdiv">
					</div>
				</cps:tdContent>
			</cps:row>
		</cps:table>
</creator:view>

