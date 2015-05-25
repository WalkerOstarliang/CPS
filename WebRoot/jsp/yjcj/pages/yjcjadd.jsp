<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/yjcj/js/ckeditor/ckeditor.js"></creator:Script>
	<creator:Script src="/jsp/yjcj/js/ckeditor/lang/zh-cn.js"></creator:Script>
	<creator:Script src="/jsp/yjcj/js/yjcj.js"></creator:Script>
	<script type="text/javascript">
		var ajaxUpload = null;
		function getData()
		{
			return {"queryBean.wtid":$("#wtid").val()};
		}
		$(function(){
			ajaxUpload = $("#addwtfjbtn").ajaxUploadFire("/yjcj","saveWtfjxx",getData,function(file,ext){
				if ($("#wtid").val() == null || $("#wtid").val() == "")
				{
					alert("请先保存问题意见信息后在进行图片上传.")
					return false;
				}
				else if(ext && /^(jpg|png|jpeg|gif|bmp|jpeg)$/.test(ext.toLowerCase()))
				{
					index = layer.load(0);
					return true;
				}
				else
				{
					alert("只能上传格式为*.jpg;*.png;*.gif;*.jpeg;*.bmp的图片.");
					return false;
				}
			},function(file,fjBean){
				if (fjBean != null)
				{
					var fjid = fjBean["fjid"];
					$("#fjpanel").append("<span style=\"margin-right: 5px;cursor:pointer\" ondblclick=\"showBigImage('" + fjid + "')\"><img src=\""+contextPath + "/yjcj/showWtfjPoto.action?queryBean.fjid=" + fjid +"\" width=\"150px\" height=\"200px\"></span>");
				}
				else
				{
					alert("附件信息上传失败.")
				}
			});
		});
		
	</script>
	<form id="queryForm">
		<input type="hidden" id="wtid" name="wtBean.wtid" value="${wtBean.wtid }">
		<cps:PanelView>
			<cps:tbar>
				<cps:button id="savebtn" value="保存" onclick="saveWtxxBean()"></cps:button>
				<cps:button id="addwtfjbtn" name="upload" value="添加附件" ></cps:button>
			</cps:tbar>
			<cps:panel id="fwquerypanel" title="发表意见">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>问题标题：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="title" name="wtBean.title" value="${wtBean.title}" required="true" maxlength="100"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">发表人：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="djrsfzh" value="${wtBean.djrsfzh}">
							 <cps:textfield id="djrxm" name="wtBean.djrxm" value="${wtBean.djrxm}" readonly="true" required="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">发表单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="djdwdm" name="wtBean.djdwdm" value="${wtBean.djdwdm }">
							 <cps:textfield id="djdwmc" name="wtBean.djdwmc" value="${wtBean.djdwmc}" readonly="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">发表时间：</cps:tdLabel>
						<cps:tdContent>
							 <cps:date id="djsj" name="wtBean.djsj" value="${wtBean.djsj}" readOnly="true"></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>联系电话：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="djrlxfs" name="wtBean.djrlxfs" value="${wtBean.djrlxfs}" required="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>问题描述：</cps:tdLabel>
						<cps:tdContent>
							<textarea id="content" name="wtBean.content" class="validate[required] ">${wtBean.content}</textarea>
							<script type="text/javascript"> 
								var editor = CKEDITOR.replace("content",{ 
										width : 700 , 
										height : 150 , 
										toolbar : [
											['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
											['Link','Unlink','Table','Autogrow','Liststyle','Styles','Format','Font','FontSize'],
											['TextColor','BGColor'],
											], 
										undoStackSize : 20 , 
										removePlugins : 'elementspath' , 
										resize_enabled : false , 
										startupShowBorders : false , 
										enterMode : CKEDITOR.ENTER_BR 
									});
								
    		 				</script>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
	<creator:panel id="fjpanel" title="附件列表<font color='red'>（只能上传格式为*.jpg;*.png;*.gif;*.jpeg;*.bmp的图片.）</font>&nbsp;双击查看大图片" tbarId="fjtbar" >
		<c:forEach items="${wtfjBeans}" var="fjBean">
			<span style="margin-right: 5px;cursor:pointer" ondblclick="showBigImage('${fjBean.fjid}')"><img src="<c:url value='/yjcj/showWtfjPoto.action'/>?queryBean.fjid=${fjBean.fjid }" width="150px" height="200px"></span>
		</c:forEach>
	</creator:panel>
</creator:view>