<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<creator:view>
	<script type="text/javascript"
		src="${contextPath}/jsp/gzgl/js/xxygl.js">
</script>

<script type="text/javascript">
	$(function(){
		if($("#beanOp").val() == "detail"){
			$("#xxydiv").displayInputForText();
		}
	})
</script>
<div id="xxydiv">
	<creator:tbar id="tbar">
		<cps:button value="保&nbsp;存" onclick="submitSave();"></cps:button>
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow();"></cps:button>
	</creator:tbar>
	<creator:panel id="xxyPanel" title="耳目（信息员）登记" tbarId="tbar">
		<form id="beanform"
			action="${contextPath}/gzgl/tzgl/saveXxyBean.action" method="post">
			<input type="hidden" id="zaembh" name="emxxBean.zaembh" value="${emxxBean.zaembh}" />
			<input type="hidden" id="beanOp" name="operType" value="${operType}" />
			<input type="hidden" id="rybh" name="emxxBean.rybh"
				value="${emxxBean.rybh}" />

			<%@include file="/jsp/gzgl/pages/gzxxy/newrkjbxx.jsp"%>
			<cps:table id="gbxxtable">
				<cps:row>
					<cps:tdLabel width="12%">
						<font color="red">*</font>物建人姓名：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:textfield id="wjrxm" name="emxxBean.wjrxm"
							value="${emxxBean.wjrxm}" required="true"></cps:textfield>
					</cps:tdContent>

					<cps:tdLabel width="12%">物建时间：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:date id="wjsj" name="emxxBean.wjsj" value="${emxxBean.wjsj}"
							dateFmt="yyyy-MM-dd" readOnly="true"></cps:date>
					</cps:tdContent>

					<cps:tdLabel width="10%">
						<font color="red">*</font>所属单位：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="emxxBean.ssdwmc" value="${emxxBean.ssdwmc}"
							appendPopuBtn="true" onclick="orgSelect('${loginInfo.orgcode}')" id="ssdwmc" readonly="true"
							required="true"></cps:textfield>
						<input type="hidden" name="emxxBean.ssdwdm"
							value="${emxxBean.ssdwdm}" id="ssdwdm" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>启用状态：</cps:tdLabel>
					<cps:tdContent>
						<s:select list="#{'1':'启用','0':'停用'}" id="qyzt" name="emxxBean.qyzt" headerValue="1" cssClass="cps-select validate[required]" onchange="qyztChange(this.value)"></s:select>
					</cps:tdContent>
					<c:choose>
						<c:when test="${emxxBean.qyzt eq '1' || empty emxxBean.qyzt}">
							<cps:tdLabel id="qysjLabel"><font color='red'>*</font>启用时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date id="qysj" name="emxxBean.qysj" value="${emxxBean.qysj}" dateFmt="yyyy-MM-dd" readOnly="true" required="true" maxDateDepend="tysj" maxDate="sysdate"></cps:date>
							</cps:tdContent>
							
							<cps:tdLabel id="tysjLabel">停用时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date id="tysj" name="emxxBean.tysj" value="${emxxBean.tysj}" dateFmt="yyyy-MM-dd" readOnly="true" disabled="true" minDateDepend="qysj" maxDate="sysdate"></cps:date>
							</cps:tdContent>
						</c:when>
						<c:otherwise>
							<cps:tdLabel id="qysjLabel">启用时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date id="qysj" name="emxxBean.qysj" value="${emxxBean.qysj}" dateFmt="yyyy-MM-dd" readOnly="true"  maxDateDepend="tysj" maxDate="sysdate"></cps:date>
							</cps:tdContent>
							
							<cps:tdLabel id="tysjLabel"><font color='red'>*</font>停用时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date id="tysj" name="emxxBean.tysj" value="${emxxBean.tysj}" dateFmt="yyyy-MM-dd" readOnly="true"  required="true" minDateDepend="qysj" maxDate="sysdate"></cps:date>
							</cps:tdContent>
						</c:otherwise>
					</c:choose>
					
				</cps:row>
				
				<cps:row>
					<c:choose>
						<c:when test="${emxxBean.qyzt eq '1' || empty emxxBean.qyzt}">
							<cps:tdLabel id="tyyyLabel">停用原因：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<cps:textfield name="emxxBean.tzsyyy" value="${emxxBean.tzsyyy}" id="tzsyyy" cssStyle="width:95%" disabled="true"></cps:textfield>
							</cps:tdContent>
						</c:when>
						<c:otherwise>
							<cps:tdLabel id="tyyyLabel"><font color='red'>*</font>停用原因：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<cps:textfield name="emxxBean.tzsyyy" value="${emxxBean.tzsyyy}" id="tzsyyy" cssStyle="width:95%" required="true"></cps:textfield>
							</cps:tdContent>
						</c:otherwise>
					</c:choose>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>物建人意见：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
						<cps:textfield type="textarea" id="wjryj"
							cssStyle="width:95%;height:40px;" maxlength="100"
							name="emxxBean.wjryj" value="${emxxBean.wjryj}" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>领导意见：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
						<cps:textfield type="textarea" id="ldyj"
							cssStyle="width:95%;height:40px;" maxlength="100"
							name="emxxBean.ldyj" value="${emxxBean.ldyj}" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>奖励记载：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
						<cps:textfield type="textarea" id="jljz"
							cssStyle="width:95%;height:40px;" maxlength="200"
							name="emxxBean.jljz" value="${emxxBean.jljz}"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>反映情况简要记载：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
						<cps:textfield type="textarea" id="fyqkjyjz"
							cssStyle="width:95%;height:40px;" maxlength="1000"
							name="emxxBean.fyqkjyjz" value="${emxxBean.fyqkjyjz}" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
						<cps:textfield type="textarea" id="bz"
							cssStyle="width:95%;height:40px;" name="emxxBean.bz"
							value="${emxxBean.bz}" maxlength="200" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*&nbsp;</font>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djrxm" readonly="true"
							value="${emxxBean.djrxm}" name="emxxBean.djrxm" required="true" />
					</cps:tdContent>

					<cps:tdLabel>
						<font color="red">*&nbsp;</font>登记日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djsj" name="emxxBean.djsj" readonly="true"
							value="${emxxBean.djsj}">
						</cps:textfield>
					</cps:tdContent>

					<cps:tdLabel>
						<font color="red">*&nbsp;</font>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<input id="djdwdm" type="hidden" value="${emxxBean.djdwdm}"
							name="emxxBean.djdwdm" />
						<input type="hidden" value="${emxxBean.djmjjh}"
							name="emxxBean.djmjjh" />
						<cps:textfield id="djdwmc" value="${emxxBean.djdwmc}"
							readonly="true" name="emxxBean.djdwmc" />
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
</div>	
	<creator:tbar id="xxfkop">
		<c:if test="${(!(emxxBean.qyzt eq '0')) && (!(operType eq 'detail'))}" >
			<cps:button value="反馈信息" onclick="openFkxx('','add')"></cps:button>
		</c:if>
	</creator:tbar>
	<cps:tableGrid id="xxfkList" title="信息反馈列表"
					tbarId="xxfkop"
					url="/gzgl/tzgl/queryXxyfyqkList.action?zaembh=${emxxBean.zaembh}"
					width="99.8%"
					autoload="true" 
					autothead="true">
			<cps:column isNumber="true" title="序号" ></cps:column>
			<cps:column field="cz" title="操作" align="left"></cps:column>
			<cps:column field="fyqkxx" title="反馈内容" align="left"></cps:column>
			<cps:column field="xxtgsj" title="反馈时间"></cps:column>
			<cps:column field="djrxm" title="录入人" align="left"></cps:column>
	</cps:tableGrid>
</creator:view>