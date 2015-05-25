<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/gongzuogl.js"></script>
	<creator:tbar id="addnewrztbar">
		<s:if test="rizhiBean.op != 'detail'">
			<cps:button value="保&nbsp;存" onclick="submitNewBean();"></cps:button>
		</s:if>
		<cps:button value="取&nbsp;消" onclick="$.closeWindow();"></cps:button>
	</creator:tbar>
	<creator:panel id="rizhiPanel" title="工作日志登记"  tbarId="addnewrztbar">
		<form id="beanform" action="${contextPath}/gzgl/rzgl/saveRizhiBean.action" method="post">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*&nbsp;</font>主题：</cps:tdLabel>
					<cps:tdContent width="23%">
						<c:choose>
						<c:when test="${rizhiBean.op=='new'}">
						<cps:textfield id="rzbt" readonly="${rizhiBean.op!='new'}" name="rizhiBean.rzbt" cssClass="validate[required]"  maxlength="35" value="${now}${loginInfo.realname}日志登记"/>
						</c:when>
						<c:otherwise>
							<cps:textfield id="rzbt" readonly="${rizhiBean.op!='new'}" name="rizhiBean.rzbt" cssClass="validate[required]"  maxlength="35" value="${rizhiBean.rzbt}"/>
						</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<input type="hidden" id="rzbh" name="rizhiBean.rzbh" value="${rizhiBean.rzbh}"/>
					<input type="hidden" name="viewMode" value="${viewMode}"/>
					<input type="hidden" id="beanOp" name="rizhiBean.op" value="${rizhiBean.op}"/>
					<cps:tdLabel width="10%"><font color="red">*&nbsp;</font>工作时间：</cps:tdLabel>
					<cps:tdContent width="23%">
						<c:if test="${rizhiBean.op=='new'}">
							<s:select list="rzrqMap" id="gzrq" name="rizhiBean.gzrq" cssClass="cps-select" onchange="loadGzrzByGzRqAndJh()"></s:select>
						</c:if>
						<c:if test="${rizhiBean.op!='new'}">
							<cps:textfield id="gzrq" name="rizhiBean.gzrq" readonly="true" value="${rizhiBean.gzrq}" required="true"></cps:textfield>
						</c:if>
					</cps:tdContent>
					
					<cps:tdLabel width="10%"><font color="red">*&nbsp;</font>值班民警：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:if test="${rizhiBean.op=='new'}">
							<cps:textfield id="mjxm" name="rizhiBean.gzmjxm" readonly="true" cssClass="validate[required]" value="${loginInfo.realname}" onclick="selectZhixMJ('${loginInfo.rootOrgCode}');" appendPopuBtn="true"/>
						</c:if>
						<c:if test="${rizhiBean.op=='edit' || rizhiBean.op=='detail'}">
							<cps:textfield id="mjxm" name="rizhiBean.gzmjxm" readonly="true" cssClass="validate[required]" />
						</c:if>
					</cps:tdContent>
					<c:if test="${rizhiBean.op=='new'}">
						<input id="mjsfzh" name="rizhiBean.gzmjsfzh"  value="${loginInfo.sfzh}" type="hidden"/>
						<input id="mjjh" name="rizhiBean.gzmjjh" value="${loginInfo.username}" type="hidden"/>
						<input id="mjdwdm" name="rizhiBean.gzmjdwdm" value="${loginInfo.orgcode}" type="hidden"/>
						<input id="mjdwmc" name="rizhiBean.gzmjdwmc" value="${loginInfo.orgname}" type="hidden"/>
					</c:if>
					<c:if test="${rizhiBean.op=='edit' || rizhiBean.op=='detail'}">
						<input id="mjsfzh" name="rizhiBean.gzmjsfzh"  value="${rizhiBean.gzmjsfzh}" type="hidden"/>
						<input id="mjjh" name="rizhiBean.gzmjjh" value="${rizhiBean.gzmjjh}" type="hidden"/>
						<input id="mjdwdm" name="rizhiBean.gzmjdwdm" value="${rizhiBean.gzmjdwdm}" type="hidden"/>
						<input id="mjdwmc" name="rizhiBean.gzmjdwmc" value="${rizhiBean.gzmjdwmc}" type="hidden"/>
					</c:if>
					
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">工作内容：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
						<s:if test="rizhiBean.op == 'detail'">
							<s:textarea id="cljgms" cssStyle="width:96%;height:80px;" cssClass="validate[maxSize[2000]] textarea" 
									name="rizhiBean.cljgms" readonly="true" />
						</s:if>
						<s:else>
							<s:textarea id="cljgms" cssStyle="width:96%;height:80px;" cssClass="validate[maxSize[2000]] textarea" name="rizhiBean.cljgms" />
						</s:else>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">数据采集：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
						<s:if test="rizhiBean.op == 'detail'">
							<s:textarea id="gznrms" cssStyle="width:96%;height:80px;;background:#CCCCCC" cssClass="validate[maxSize[250]]" name="rizhiBean.gznrms" readonly="true" />
						</s:if>
						<s:else>
							<s:textarea id="gznrms" cssStyle="width:96%;height:80px;background:#CCCCCC" cssClass="validate[maxSize[250]]" name="rizhiBean.gznrms" readonly="true"/>
						</s:else>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*&nbsp;</font>登记人：</cps:tdLabel>
					<cps:tdContent>
					<c:if test="${rizhiBean.op == 'new'}">
						<cps:textfield id="djrxm" readonly="true" value="${loginInfo.realname}"  cssClass="validate[required]" 
								name="rizhiBean.djrxm" />
					</c:if>
					<c:if test="${rizhiBean.op != 'new'}">
						<cps:textfield id="djrxm" readonly="true" value="${rizhiBean.djrxm}"  cssClass="validate[required]" 
								name="rizhiBean.djrxm" />
					</c:if>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*&nbsp;</font>所属单位：</cps:tdLabel>
					<cps:tdContent>
						<c:if test="${rizhiBean.op == 'new'}">
						<input type="hidden" value="${loginInfo.orgcode}" name="rizhiBean.djdwdm"/>
						<input type="hidden" value="${loginInfo.username}" name="rizhiBean.djmjjh"/>
						<cps:textfield id="djdwmc" value="${loginInfo.orgname}" readonly="true" 
								cssClass="validate[required]" name="rizhiBean.djdwmc" />
						</c:if>
						<c:if test="${rizhiBean.op != 'new'}">
						<input type="hidden" value="${rizhiBean.djdwdm}" name="rizhiBean.djdwdm"/>
						<input type="hidden" value="${rizhiBean.djmjjh}" name="rizhiBean.djmjjh"/>
						<cps:textfield id="djdwmc" value="${rizhiBean.djdwmc}" readonly="true" 
								cssClass="validate[required]" name="rizhiBean.djdwmc" />
						</c:if>
					</cps:tdContent>
					
					<cps:tdLabel ><font color="red">*&nbsp;</font>登记日期：</cps:tdLabel>
					<cps:tdContent >
						<c:if test="${rizhiBean.op == 'edit' || rizhiBean.op == 'detail'}">
							<cps:textfield id="djsj" name="rizhiBean.djsj" readonly="true" value="${rizhiBean.djsj}" 
								 cssClass="validate[required] cps-input" >
							</cps:textfield>
						</c:if>
						<c:if test="${rizhiBean.op == 'new'}">
							<cps:textfield id="djsj" name="rizhiBean.djsj" readonly="true" value="${now}" 
								 cssClass="validate[required] cps-input" >
							</cps:textfield>
						</c:if>
					</cps:tdContent>
				</cps:row>
		
			</cps:table>
		</form>
	</creator:panel>
</creator:view>