<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/gongzuogl.js"></script>
	<creator:tbar id="addnewzjtbar">
			<c:if test="${zjieBean.op != 'view'}">
				<cps:button value="保&nbsp;存" onclick="submitNewBean();"></cps:button>&nbsp;
			</c:if>
			<cps:button value="取&nbsp;消" onclick="$.closeWindow();"></cps:button>
	</creator:tbar>
	<creator:panel id="newPanel" title="工作总结登记" tbarId="addnewzjtbar">
		<form id="beanform" action="${contextPath}/gzgl/zjgl/saveZongjieBean.action" method="post">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*&nbsp;</font>主题：</cps:tdLabel>
					<cps:tdContent width="20%">
						<c:choose>
						<c:when test="${zjieBean.op=='new'}">
						<cps:textfield id="rzbt"  name="zjieBean.zjbt" cssClass="validate[required] cps-input"  maxlength="35" value="${now}${loginInfo.realname }日志总结"></cps:textfield>
						</c:when>
						<c:otherwise>
						<cps:textfield id="rzbt" readonly="true" name="zjieBean.zjbt" cssClass="validate[required] cps-input"  maxlength="35" value="${zjieBean.zjbt}"></cps:textfield>
						</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
					<input type="hidden" name="zjieBean.zjbh" value="${zjieBean.zjbh}"/>
					<input type="hidden" name="viewMode" value="${viewMode}"/>
					<input type="hidden" id="beanOp" name="zjieBean.op" value="${zjieBean.op}"/>
					<cps:tdLabel width="10%"><font color="red">*&nbsp;</font>总结类型：</cps:tdLabel>
					<cps:tdContent width="20%">
						<s:if test="zjieBean.op=='new' || zjieBean.op=='edit'">
							<cps:select zdlb="GZGL_ZJLB" value="${zjieBean.zjlx}" name="zjieBean.zjlx" cssClass="cps-input" onchange="changeZjlb(this.value)" headerKey="" headerValue="--请选择--"></cps:select>
						</s:if>
						<s:else>
							<cps:select zdlb="GZGL_ZJLB" value="${zjieBean.zjlx}" name="zjieBean.zjlx" cssClass="cps-input"  disabled="true"></cps:select>
						</s:else>
					</cps:tdContent>
					
					<cps:tdLabel width="10%">类型描述：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield id="zjlxms" name="zjieBean.zjlxms" maxlength="15" cssStyle="width:90%"></cps:textfield>
					</cps:tdContent>
					
				</cps:row>
					
				<cps:row>
					
					<cps:tdLabel width="10%"><font color="red">*&nbsp;</font>值班民警：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<c:if test="${zjieBean.op=='new'}">
							<cps:textfield id="mjxm" name="zjieBean.zjmjxm" readonly="true" cssClass="validate[required] cps-input" ondblclick="selectZhixMJ('${loginInfo.rootOrgCode}');" value="${loginInfo.realname}"></cps:textfield>
							<cps:button value="选择" onclick="selectZhixMJ('${loginInfo.rootOrgCode}');"></cps:button>
						</c:if>
						<c:if test="${zjieBean.op=='edit' || zjieBean.op=='view' }">
							<cps:textfield id="mjxm" name="zjieBean.zjmjxm" readonly="true" cssClass="validate[required]" value="${zjieBean.zjmjxm}"></cps:textfield>
						</c:if>
					</cps:tdContent>
					
					<c:choose>
					<c:when test="${zjieBean.op=='new'}">
						<input id="mjsfzh"  name="zjieBean.zjmjsfzh" type="hidden" value="${loginInfo.sfzh }">
						<input id="mjjh" name="zjieBean.zjmjjh" value="${loginInfo.username}" type="hidden"/>
					    <input id="mjdwdm" name="zjieBean.zjmjdwdm" value="${loginInfo.orgcode}" type="hidden"/>
						<input id="mjdwmc" name="zjieBean.zjmjdwmc" value="${loginInfo.orgname}" type="hidden"/>
					</c:when>
					<c:otherwise>
						<input id="mjsfzh"  name="zjieBean.zjmjsfzh" type="hidden" value="${zjieBean.zjmjsfzh }">
						<input id="mjjh" name="zjieBean.zjmjjh" value="${zjieBean.zjmjjh}" type="hidden"/>
					    <input id="mjdwdm" name="zjieBean.zjmjdwdm" value="${zjieBean.zjmjdwdm}" type="hidden"/>
					    <input id="mjdwmc" name="zjieBean.zjmjdwmc" value="${zjieBean.zjmjdwmc}" type="hidden"/>
					</c:otherwise>
					</c:choose>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*&nbsp;</font>总结内容:</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
						<s:textarea id="nrms" cssStyle="width:93%;height:200px;" cssClass="validate[required]" name="zjieBean.zjnr" readonly="zjieBean.op=='view'" ></s:textarea>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color="red">*&nbsp;</font>登记人：</cps:tdLabel>
					<cps:tdContent>
						<c:if test="${zjieBean.op == 'new'}">
						<cps:textfield id="djrxm" readonly="true" value="${loginInfo.realname}"  cssClass="validate[required] cps-input" name="zjieBean.djrxm"></cps:textfield>
						</c:if>
						<c:if test="${zjieBean.op != 'new'}">
						<cps:textfield id="djrxm" readonly="true" value="${zjieBean.djrxm}"  cssClass="validate[required] cps-input" name="zjieBean.djrxm"></cps:textfield>
						</c:if>
					</cps:tdContent>
					
					<cps:tdLabel><font color="red">*&nbsp;</font>所属单位：</cps:tdLabel>
					<cps:tdContent>
					 <c:if test="${zjieBean.op == 'new'}">
						<cps:textfield id="djdwmc" value="${loginInfo.orgname}" readonly="true"  cssClass="validate[required] cps-input" name="zjieBean.djdwmc"></cps:textfield>
						<input type="hidden" name="zjieBean.djdwdm" value="${loginInfo.orgcode}"/>
						<input type="hidden" name="zjieBean.djmjjh" value="${loginInfo.username}"/>
						</c:if>
						<c:if test="${zjieBean.op != 'new'}">
						<cps:textfield id="djdwmc" value="${zjieBean.djdwmc}" readonly="true"  cssClass="validate[required] cps-input" name="zjieBean.djdwmc"></cps:textfield>
						<input type="hidden" name="zjieBean.djdwdm" value="${zjieBean.djdwdm}"/>
						<input type="hidden" name="zjieBean.djmjjh" value="${zjieBean.djmjjh}"/>
						</c:if>
					</cps:tdContent>

					<cps:tdLabel><font color="red">*&nbsp;</font>登记日期：</cps:tdLabel>
					<cps:tdContent>
						<c:if test="${zjieBean.op == 'edit' || zjieBean.op == 'view'}">
							<cps:textfield id="djsj" name="zjieBean.djsj" readonly="true" value="${zjieBean.djsj}" 
								cssClass="validate[required] cps-input">
							</cps:textfield>
						</c:if>
						<c:if test="${zjieBean.op == 'new'}">
							<cps:textfield id="djsj" name="zjieBean.djsj" readonly="true" value="${now}" 
								 cssClass="validate[required] cps-input">
							</cps:textfield>
						</c:if>
					</cps:tdContent>
				</cps:row>
				
			</cps:table>
		</form>
	</creator:panel>
</creator:view>