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
			return {"xxfbBean.xxid":$("#xxid").val()};
		}
		$(function(){
			ajaxUpload = $("#addwtfjbtn").ajaxUploadFire("/yjcj","saveXxfbfjxx",getData,function(file,ext){
				if ($("#xxid").val() == null || $("#xxid").val() == "")
				{
					alert("请先保存需要发布的信息后再上传附件.")
					return false;
				}
			},function(file,fjBean){
				if (fjBean != null)
				{
					 $("#xxfbsjtablegrid").query("F","queryForm");
				}
				else
				{
					alert("附件信息上传失败.")
				}
			});
		});
		
		function deleteXxfbfjBean(fjid)
		{
			$.ajax({
				type : "post",
				url : contextPath + "/yjcj/deleteXxfbfjBean.action",
				data : "fjid=" + fjid,
				dataType : "json",
				success : function(result)
				{
					if (result == true)
					{
						$("#xxfbsjtablegrid").query("F","queryForm");
					}
					else
					{
						alert("附件信息删除失败.");
					}
				}
			})
		}
		
		function czrowback(tdObj,rowdata)
		{
			var html = "";
			html += "<span class=\"cps_span_href\" onclick=\"deleteXxfbfjBean('" + rowdata["fjid"] + "')\">删除<span>";
			return html;
		}
	</script>
	<form id="queryForm">
		<input type="hidden" id="xxid" name="xxfbBean.xxid" value="${xxfbBean.xxid}">
		<cps:PanelView>
			<cps:tbar>
				<cps:button id="savebtn" value="保存" onclick="saveXxfbBean()"></cps:button>
				<cps:button id="addwtfjbtn" name="upload" value="添加附件" ></cps:button>
			</cps:tbar>
			<cps:panel id="fwquerypanel" title="发表意见">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">标题：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="title" name="xxfbBean.title" value="${xxfbBean.title}" required="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">发表人：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="djrsfzh" value="${xxfbBean.djrsfzh}">
							 <cps:textfield id="djrxm" name="xxfbBean.djrxm" value="${xxfbBean.djrxm}" readonly="true" required="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">发表单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="djdwdm" name="xxfbBean.djdwdm" value="${xxfbBean.djdwdm }">
							 <cps:textfield id="djdwmc" name="xxfbBean.djdwmc" value="${xxfbBean.djdwmc}" readonly="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>问题描述：</cps:tdLabel>
						<cps:tdContent>
							<textarea id="content" name="xxfbBean.content" class="validate[required] ">${xxfbBean.content}</textarea>
							<script type="text/javascript"> 
								var editor = CKEDITOR.replace("content",{ 
										width : 800 , 
										height : 300 , 
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
	<cps:tableGrid id="xxfbsjtablegrid" title="消息附件列表" 
			url="/yjcj/queryXxfbfjBeansPageResult.action" 
			searchform="queryForm"
			mutilSelect="false"
			pageSize="20"
			autoload="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="uploadfilename" title="附件" align="left"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="czrowback"></cps:column>
	</cps:tableGrid>
</creator:view>