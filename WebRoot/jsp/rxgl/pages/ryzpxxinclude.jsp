<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Style href="/jcrop/css/jquery.Jcrop.css"></creator:Style>
<script type="text/javascript" src="<c:url value='/jcrop/js/jquery.Jcrop.min.js'/>"></script>
<creator:Script src="/jsp/rxgl/js/ryzpglinfo.js"></creator:Script>
<cps:PanelView>
<cps:tbar>
	<cps:button value="保存" onclick="saveCutImageCoords()"></cps:button>
	<cps:button value="删除" onclick="deleteRkzpxxBean()"></cps:button>
</cps:tbar>
<cps:panel id="ryzppanel" title="人员相片管理">
	<cps:table height="400">
		<cps:row height="100%">
			<cps:tdContent width="400" align="center" valign="middle">
				<div id="insertimgdiv" style="width:400px;height: 400px;border: 1px solid #CCCCCC;overflow: auto;background: #CCCCCC;margin: 3px;">
					<img id="insertimg" width="100%" height="98%" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${sfzh}"/>
				</div>
			</cps:tdContent>
			<cps:tdContent width="50%" valign="top">
				<form id="cutimageform" action="<c:url value='/rk/rxgl/saveCutImage.action'/>" method="post">
					<input type="hidden" id="zpid" name="zpid" value=""/>
					<input type="hidden" id="rybh" name="rkzpBean.rybh" value="${rybh}"/>
					<input type="hidden" id="sfzh" name="rkzpBean.sfzh" value="${sfzh}"/>
					<input type="hidden" id="x" name="x"/>
					<input type="hidden" id="y" name="y"/>
					<input type="hidden" id="w" name="w"/>
					<input type="hidden" id="h" name="h"/>
					<input type="hidden" id="saveFileName" name="saveFileName"/>
					<input type="hidden" id="ycfwzp" name="rkzpBean.ycfwzp" value="0"/>
					<cps:table>
						<cps:row>
							<cps:tdLabel width="25%">人像方位：</cps:tdLabel>
							<cps:tdContent>
								<cps:select zdlb="ZDY_RXFW" name="rkzpBean.rxfw"></cps:select>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${empty rkzpBean.djsj}">
										<cps:textfield name="rkzpBean.djsj" value="${currentSystemDate}" readonly="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										<cps:textfield name="rkzpBean.djsj" value="${rkzpBean.djsj}" readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>登记人：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${empty rkzpBean.djrxm}">
										<cps:textfield name="rkzpBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										<cps:textfield name="rkzpBean.djrxm" value="${rkzpBean.djrxm}" readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>登记单位：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${empty rkzpBean.djdwdm}">
										<input type="hidden" name="rkzpBean.djdwdm" value="${loginInfo.orgcode}">
										<cps:textfield name="rkzpBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										<input type="hidden" name="rkzpBean.djdwdm" value="${rkzpBean.djdwdm}">
										<cps:textfield name="rkzpBean.djdwmc" value="${rkzpBean.djdwmc}" readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent valign="top" colspan="2">
								 <cps:button id="bdzpcs" value="本地照片采集"></cps:button>
								 <cps:button id="hqycfwzp" value="保存远程服务器照片" onclick="saveRemoteZpxx()"></cps:button>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent valign="top" colspan="3">
								<span style="color:red;">
									注意：只能上传*.jpg;*.png;*.gif;*.jpeg;*.bmp格式的图片.
								</span>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent valign="top" colspan="3">
								<span style="color:red;">
									照片上传方法：
								</span>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent valign="top" colspan="3">
								<span style="color:red;">
									1、本地照片采集，选择照片后，在左边的大框中会显示照片；<br/>
									2、把鼠标移动到照片上后，出现十字形后，拖动鼠标可以对照片进行裁剪；<br/>
									3、选定裁剪大小后，点击保存按钮，提示“照片裁剪并保存成功”后；<br/>
									4、在下方“已成功上传照片”的地方显示有裁剪完后的照片，表示照片已经上传成功;<br/>
								</span>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</form>
				
			</cps:tdContent>
		</cps:row>
	</cps:table>
	<creator:panel id="" title="已经成功上传照片(点击下里面照片后点击删除按钮，可以删除照片)">
	<cps:table height="200px">
		<cps:row height="190px">
			<cps:tdContent cssStyle="border-right:1px #CCCCCC" valign="middle">
				<div id="xyzpdiv" style="width:890px;height:180px;overflow: auto;background: #CCCCCC;border: 1px solid #CCCCCC;padding-top: 10px">
					<c:forEach items="${rkzpBeanList}" var="zpBean">
						<span zpid="${zpBean.id}" onclick="clickShowRkzp('${zpBean.id}')" style="background: #CCCCCC;margin: 2px;cursor: pointer;">
							<img width="140" YCFWZP="${zpBean.ycfwzp}" height="170" src="<c:url value='/lsgl/rk/showRkzpImage.action'/>?queryBean.zpid=${zpBean.id}"/>
						</span>
					</c:forEach>
				</div>
			</cps:tdContent>
		</cps:row>
	</cps:table>
	</creator:panel>
</cps:panel>
</cps:PanelView>