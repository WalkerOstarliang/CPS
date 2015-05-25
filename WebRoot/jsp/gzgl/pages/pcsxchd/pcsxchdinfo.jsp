<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 派出所宣传活动信息 --%>
<creator:view>
	<creator:Script src="/jsp/gzgl/js/pcsxchd.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${!(operType eq 'detail')}">
				<cps:button value="保存" id="saveButton" onclick="savePcsXcHd()" />
			</c:if>
			<cps:button value="关闭" onclick="window.close()" />
 		</cps:tbar>
 		<cps:panel title="派出所宣传活动信息">
 			<form id="pcsxchdform">
 				<input type="hidden" id="id" name="xchd.id" value="${xchd.id}" />
 				<cps:table>
 					<cps:row>
 						<cps:tdLabel width="20%"><font color='red'>*</font>活动类型：</cps:tdLabel>
 						<cps:tdContent width="30%">
 							<cps:select id="hdlx" name="xchd.hdlx" value="${xchd.hdlx}" headerKey=" " headerValue=" " zdlb="ZDY_PCS_HDLX" required="true"></cps:select>
 						</cps:tdContent>
 						
 						<cps:tdLabel width="20%"><font color="red">*</font>活动开展时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="hdsj" name="xchd.hdsj" value="${xchd.hdsj}" dateFmt="yyyy-MM-dd" maxDate="sysdate" minDate="${fn:substring(sysdate,0,4)}-${fn:substring(sysdate,4,6)}-01" required="true"></cps:date>
						</cps:tdContent> 						
 					</cps:row>
 					<cps:row>
 						<cps:tdLabel><font color="red">*</font>活动地址：</cps:tdLabel>
 						<cps:tdContent colspan="3">
 							<cps:textfield id="hdxz" name="xchd.hdxz" value="${xchd.hdxz}" required="true" maxlength="100" cssStyle="width:94%"></cps:textfield>
 						</cps:tdContent>
 					</cps:row>
 					<cps:row>
	 					<cps:tdLabel><font color='red'>*</font>活动内容：</cps:tdLabel>
 						<cps:tdContent colspan="3">
	 						<cps:textfield id="hdnr" type="textarea" name="xchd.hdnr" value="${xchd.hdnr}" maxlength="1000" cssStyle="height:80px;width:94%"></cps:textfield>
 						</cps:tdContent>
 					</cps:row>
 					<cps:row>
 						<cps:tdLabel>活动开展民警：</cps:tdLabel>
 						<cps:tdContent>
 							<input type="hidden" name="xchd.hdkzmjjh" value="${xchd.hdkzmjjh}" />
 							<cps:textfield name="xchd.hdkzmjxm" value="${xchd.hdkzmjxm}" readonly="true"></cps:textfield>
 						</cps:tdContent>
 						<cps:tdLabel>活动开展单位：</cps:tdLabel>
 						<cps:tdContent>
 							<input type="hidden" name="xchd.hdkzdwdm" value="${xchd.hdkzdwdm}" />
 							<cps:textfield name="xchd.hdkzdwmc" value="${xchd.hdkzdwmc}" readonly="true"></cps:textfield>
 						</cps:tdContent>
 					</cps:row>
 				</cps:table>
 			</form>
 		</cps:panel>
	</cps:PanelView>
	<span style="color:red">
		<b>*说明：必须上传两张照片。</b>
	</span>
	<cps:PanelView>
		<cps:tbar>
			<span style="color:red">双击照片可以删除照片</span>
			<cps:button value="上传照片" onclick="" display="${((not empty xchd.id) and !(operType eq 'detail'))?true:false}" id="imgButton"></cps:button>
		</cps:tbar>
		<cps:panel title="活动照片">
			<div id="xyzpdiv" style="width:99.8%; height:190px; overflow: auto;border: 1px solid #CCCCCC;padding-top: 10px">
			<c:forEach items="${xchd.zpList}" var="zp">
				<span zpid="${zp.id}" ondblclick="deleteHdZp(this,'${zp.id}')" style="margin: 2px;cursor: pointer;">
					<img width="145" height="170" src="<c:url value='/gzgl/pcsxchd/showHdZp.action'/>?zpid=${zp.id}"/>
				</span>
			</c:forEach>
			</div>
		</cps:panel>
	</cps:PanelView>
</creator:view>