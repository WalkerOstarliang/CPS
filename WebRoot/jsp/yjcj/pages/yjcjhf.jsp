<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Style href="/jsp/yjcj/css/css.css"></creator:Style>
	<creator:Style href="/jsp/yjcj/css/paging.css"></creator:Style>
	<creator:Script src="/jsp/yjcj/js/ckeditor/ckeditor.js"></creator:Script>
	<creator:Script src="/jsp/yjcj/js/ckeditor/lang/zh-cn.js"></creator:Script>
	<creator:Script src="/jsp/yjcj/js/yjcj.js"></creator:Script>
	<script type="text/javascript">
		var ajaxUpload = null;
		$(function(){
			ajaxUpload = $("#wthffjupload").ajaxUploadFire("/yjcj","saveWtfjxx",function(){
				var data = {
					"fjBean.wthdid" : $("#wthdid").val(),
					"fjBean.wtid" : $("#wtid").val(),
					"queryBean.wtid" : $("#wtid").val(),
					"fjBean.type" : "2"
				};
				return data;
			},function(file,ext){
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
	<style type="text/css">
		body {
			font-family: "宋体";
			font-size: 12px;
			color: #333;
			line-height: 180%;
			margin: 0;
			padding: 0;
			background-color: #eaeaea;
			background-image: url(<c:url value='/jsp/yjcj/images/body_bg.jpg'/>);
			background-repeat: repeat-x;
			background-position: top;
		}
		a:link
		{
			color:blue;
			text-decoration: none;
		}
		a:VISITED 
		{
			color:blue;
			text-decoration: underline;
		}
		a:hover
		{
			color:red;
			text-decoration: underline;
		}
	</style>
	 <div class="main" style="width:100%;background-color: white;height: 900px;overflow-y: auto;">
		<div style="padding: 0 15px;">
			<div class="box">
				<input type="button" name="button1" id="button1" value="返回意见列表" onclick="history.go(-1)" class="an5" />
				&nbsp;
				<input type="button" name="button2" id="button2" value="发表新意见" onclick="toAddWtxxPage()" class="an5" />
			</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box4 jg" id="yjhftb0" >
				<tr>
					<td width="20%" valign="top" bgcolor="#effafe" style="border-right: 1px solid #c6c6c6;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center" class="di5">
								</td>
							</tr>
							<tr>
								<td align="left" id="fkr" style="padding-left: 8px">
									<span></span>&nbsp;发布人:
									<font id="yjfbdw">${wtBean.djrxm}/${wtBean.djrjh}</font>
								</td>
							</tr>
							<tr>
								<td align="left" style="padding-left: 8px">
									&nbsp;单位机构:
									<font id="yjfbdw" title="${wtBean.djdwmc }">${fn:substring(wtBean.djdwmc,0,8)}..</font>
								</td>
							</tr>
							<tr>
								<td align="left" style="padding-left: 8px">
									&nbsp;联系方式:
									<font id="yjfblxfs">${wtBean.djrlxfs }</font>
								</td>
							</tr>
							<tr>
								<td align="center">
									<img src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${wtBean.djrsfzh}" width="100" height="120">
								</td>
							</tr>
						</table>
					</td>
					<td valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">

							<tr id="yjztlx">
								<td width="60%" class="di4">
									&nbsp;
									<span class="wz">主题：<font id="yjzt">${wtBean.title }</font> </span>
								</td>
								<td width="40%" class="di4">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="di6">
										<tr>
											<td width="3%">
												<img src="<c:url value='/jsp/yjcj/images/yj1_15.gif'/>" width="14" height="18" />
											</td>
											<td width="97%">
												<font id="yjxh">楼主</font>&nbsp;&nbsp;发表于
												<font id="yjfbsj">${wtBean.djsj }</font>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td id="yjhfnr" height="100" colspan="2" valign="top" style="padding: 10px; border-bottom: dotted 2px;">${wtBean.content}</td>
							</tr>
							<tr>
								<td colspan="2">
									<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="di6">
										<tr id="yjfjtr">
											<td width="4%">
												 附件：<font color="red">双击查看大图片</font>
											</td>
										</tr>
										<tr>
											<td width="100%"><hr/></td>
										</tr>
										<tr id="yjfjtr">
											<td width="4%">
												<c:if test="${not empty wtBean.wtfjBeans}">
													<c:forEach items="${wtBean.wtfjBeans}" var="fjBean">
														<span style="margin-right: 5px;cursor:pointer" ondblclick="showBigImage('${fjBean.fjid}')"><img src="<c:url value='/yjcj/showWtfjPoto.action'/>?queryBean.fjid=${fjBean.fjid }" width="100px" height="120px"></span>
													</c:forEach>
												</c:if>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<c:if test="${not empty wthfBeans}">
				<c:forEach items="${wthfBeans}" var="wthfBean" varStatus="st">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box4 jg" id="yjhftb0" >
						<tr>
							<td width="20%" valign="top" bgcolor="#effafe" style="border-right: 1px solid #c6c6c6;">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td align="center" class="di5">
										</td>
									</tr>
									<tr>
										<td align="left" id="fkr" style="padding-left: 8px">
											&nbsp;回复人:
											<font id="yjfbdw">${wthfBean.djrxm }</font>
										</td>
									</tr>
									<tr>
										<td align="left" style="padding-left: 8px">
											&nbsp;单位机构:
											<font id="yjfbdw" title="${wthfBean.djdwmc }">${fn:substring(wthfBean.djdwmc,0,8)}..</font>
										</td>
									</tr>
									<tr>
										<td align="left" style="padding-left: 8px">
											&nbsp;联系方式:
											<font id="yjfblxfs">${wthfBean.djrlxfs }</font>
										</td>
									</tr>
									<tr>
										<td align="center">
											<img src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${wthfBean.djrsfzh}" width="100" height="120">
										</td>
									</tr>
								</table>
							</td>
							<td valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td colspan="2">
											<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="di6">
												<tr>
													<td width="3%">
														<img src="<c:url value='/jsp/yjcj/images/yj1_15.gif'/>" width="14" height="18" />
													</td>
													<td width="97%">
														<font id="yjxh">${st.index + 1 }楼</font>&nbsp;&nbsp;发表于
														<font id="yjfbsj">${wthfBean.djdj }</font>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td id="yjhfnr" height="100" colspan="2" valign="top" style="padding: 10px; border-bottom: dotted 2px;">${wthfBean.hdcontent}</td>
									</tr>
									<tr>
										<td colspan="2">
											<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="di6">
												<tr id="yjfjtr">
													<td width="4%">
														 附件：<font color="red">双击查看大图片</font>
													</td>
												</tr>
												<tr>
													<td width="100%"><hr/></td>
												</tr>
												<tr id="yjfjtr">
													<td width="4%">
														<c:if test="${not empty wthfBean.wtfjBeans}">
															<c:forEach items="${wthfBean.wtfjBeans}" var="fjBean">
																<span style="margin-right: 5px;cursor:pointer" ondblclick="showBigImage('${fjBean.fjid}')"><img src="<c:url value='/yjcj/showWtfjPoto.action'/>?queryBean.fjid=${fjBean.fjid }" width="100px" height="120px"></span>
															</c:forEach>
														</c:if>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</c:forEach>
			</c:if>
			<form id="yjcjhfform" method="post">
				<input type="hidden" id="queryBeanwtid" name="queryBean.wtid" value="${queryBean.wtid}">
				<input type="hidden" id="wtid" name="wtBean.wtid" value="${queryBean.wtid}">
				<input type="hidden" id="wthdid" name="wthfBean.wthdid" value="${wthfBean.wthdid}">
				<input type="hidden" id="wthfBeanwtid" name="wthfBean.wtid" value="${wthfBean.wtid}">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box5">
					<tr>
						<td colspan="2" valign="top" bgcolor="#effafe" style="border-bottom: 1px solid #c6c6c6;">
							&nbsp;&nbsp;
							<span class="wz">快速回复主题</span>
						</td>
					</tr>
					<tr>
						<td align="right" valign="top" width="15%">
							内容：
						</td>
						<td valign="top" width="85%">
							<textarea id="hdcontent" name="wthfBean.hdcontent"></textarea>
							<script type="text/javascript"> 
								var editor = CKEDITOR.replace("hdcontent",{ 
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
							
						</td>
					</tr>
					<tr>
						<td width="15%" align="right">
							联系方式：
						</td>
						<td width="85%">
							<input type="hidden" id="djrxm" name="wthfBean.djrxm" value="${loginInfo.realname }">
							<input type="hidden" id="djrsfzh" name="wthfBean.djrsfzh" value="${loginInfo.sfzh }">
							<input type="hidden" id="djdwdm" name="wthfBean.djdwdm" value="${loginInfo.orgcode }">
							<input type="hidden" id="djdwmc" name="wthfBean.djdwmc" value="${loginInfo.orgname }">
							<cps:textfield id="djrlxfs" name="wthfBean.djrlxfs" value="${loginInfo.moblie}" required="true"></cps:textfield>
						</td>
					</tr>
					<tr>
						<td width="15%" align="right">
							附件上传：
						</td>
						<td width="85%">
							<cps:button value="图片附件上传" id="wthffjupload" name="upload"></cps:button>
							<font color="red">只能上传格式为*.jpg;*.png;*.gif;*.jpeg;*.bmp的图片.</font>
						</td>
					</tr>
					<tr>
						<td width="100%" colspan="2" align="center">
							<hr/>
						</td>
					</tr>
					<tr>
						<td width="100%" colspan="2" align="center">
							<input type="button" name="button9" onclick="saveWthfBean()" value="提 交" class="an4" />		
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="di6">
								<tr id="yjfjtr">
									<td width="100%">
										 附件：<font color="red">双击查看大图片</font>
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td width="100%" colspan="2"><hr/></td>
								</tr>
								<tr>
									<td width="100%" colspan="2" id="fjpanel">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</creator:view>