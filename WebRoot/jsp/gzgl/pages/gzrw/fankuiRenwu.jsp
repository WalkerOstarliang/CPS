<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/gongzuogl.js"></script>
	<creator:panel title="工作任务反馈" id="rwfk">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">
						任务标题：
					</cps:tdLabel>
					<cps:tdContent width="25%" colspan="3">
						<input type="hidden" name="renwuBean.rwclzt" value="${renwuBean.rwclzt}"/>
						<input type="hidden" name="renwuBean.rwwcqk" value="${renwuBean.rwwcqk}"/>
						<input type="hidden" name="renwuBean.rwbh" value="${renwuBean.bh}"/>
						<cps:textfield readonly="true" name="renwuBean.rwbt" value="${requestScope.chli.rwbt}" id="rwbt" cssClass="validate[required] cps-input"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">
						要求完成时间：
					</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield name="renwuBean.yqclwcrq" value="${requestScope.chli.yqclwcrq}"  id="yqclwcrq" cssClass="validate[required] cps-input" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">
						任务说明：
					</cps:tdLabel>
					<cps:tdContent colspan="4" width="25%" >
						<s:textarea name="#request.chli.rwms" id="rwms" readonly="true" cssClass="validate[required] textarea" 
						cssStyle="width:80%;height:100px;" ></s:textarea>
					</cps:tdContent>
				</cps:row>
				<cps:row id="aa">
					<cps:tdLabel>执行民警：</cps:tdLabel>
					<cps:tdContent colspan="4">
						<div style="overflow:auto; height:120px; width:98%;">
							<cps:tableGrid width="100%" url="${contextPath}/gzgl/rwgl/queryMinjs.action?renwuQuery.rwbh=${requestScope.chli.rwbh}" 
										id="datagridList" usepager="false" autothead="false">
										<cps:column width="40%" field="clmjxm" title="执行民警"></cps:column>
										<cps:column width="40%" field="clmjdwmc" title="单位名称"></cps:column>
							</cps:tableGrid>
						</div>
					</cps:tdContent>
					<cps:tdContent colspan="1">
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">登记人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="djrxm" readonly="true" value="${requestScope.chli.djrxm}"cssClass="validate[required] cps-input" name="renwuBean.djrxm"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">所属单位：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input type="hidden" value="${requestScope.chli.djdwdm}" name="renwuBean.djdwdm"/>
						<cps:textfield id="djdwmc" value="${requestScope.chli.djdwmc}" readonly="true"  cssClass="validate[required] cps-input" name="renwuBean.djdwmc"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记日期：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="djsj" name="renwuBean.djsj" readonly="true" value="${requestScope.chli.djsj}" 
							 cssClass="validate[required] cps-input" >
						</cps:textfield>
					</cps:tdContent>
				</cps:row>
				<form action="${contextPath}/gzgl/rwgl/submitRenwuChliJieg.action" method="post" id="beanform">	
				<cps:row>
					<cps:tdLabel cssStyle="width:10%"><font color="red">*&nbsp;</font>完成情况：</cps:tdLabel>
					<cps:tdContent cssStyle="width:25%">
						<s:if test="#request.chli.op=='qt' && #request.chli.rwclzt==0">
							<cps:select zdlb="GZGL_RWWCQK" id="rwqk" value="${requestScope.chli.cljg}"  cssClass="validate[required] cps-input"  name="minjChliBean.cljg" headerKey="" headerValue="--请选择--"></cps:select>
						</s:if>
						<s:if test="#request.chli.op=='detail' && #request.chli.rwclzt != '0'">
							<input type='text' class="cps-input" readonly="readonly" style="width:80%;" value="<cps:dicText zdlb="GZGL_RWWCQK" dm="${requestScope.chli.cljg}" />" />
						</s:if>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:12%"><font color="red">*&nbsp;</font>实际完成时间：</cps:tdLabel>
					<cps:tdContent cssStyle="width:25%">
						<s:if test="#request.chli.rwclzt==0 && #request.chli.op=='qt'">
							<cps:date name="minjChliBean.wcsj"  id="sjwcsj" cssClass="validate[required] cps-input" readOnly="true" ></cps:date>
						</s:if>
						<s:else>
							<cps:textfield name="minjChliBean.wcsj" value="${requestScope.chli.wcsj}"  id="sjwcsj" cssClass="validate[required] cps-input" readonly="true" ></cps:textfield>
						</s:else>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:10%"><font color="red">*&nbsp;</font>执行民警：</cps:tdLabel>
					<cps:tdContent cssStyle="width:25%">
						<cps:textfield id="clmjxm" cssClass="cps-input" readonly="${requestScope.chli.rwclzt != '0' || requestScope.chli.op!= 'qt'}"  value="${requestScope.chli.clmjxm}"></cps:textfield>
						<%--<input type='hidden' name="minjChliBean.clmjjh" value="${requestScope.chli.clmjjh}"/>
						<input type='hidden' name="minjChliBean.clmjid" value="${requestScope.chli.clmjid}"/>
						--%><input type='hidden' name="minjChliBean.id" value="${requestScope.chli.id}"/>
						<%--<cps:button value="选&nbsp;择"></cps:button>--%>
					</cps:tdContent>
				</cps:row>
				<cps:row>	
					<cps:tdLabel width="12%">完成结果描述：</cps:tdLabel>
					<cps:tdContent colspan="4">
						<s:if test="#request.chli.rwclzt==0 && #request.chli.op=='qt'">
							<s:textarea name="minjChliBean.wcqkms" cssStyle="width:80%;height:100px;"></s:textarea>
							<input type='hidden' name="minjChliBean.cldjrxm" value="${loginInfo.realname}"/>
							<input type='hidden' name="minjChliBean.cldjrjh" value="${loginInfo.username}"/>
							<input type='hidden' name="minjChliBean.cldjdwdm" value="${loginInfo.orgcode}"/>
							<input type='hidden' name="minjChliBean.cldjdwmc" value="${loginInfo.orgname}"/>
							<input type='hidden' name="minjChliBean.cldjsj" value="${now}"/>
							<input type='hidden' name="minjChliBean.rwbh" value="${requestScope.chli.rwbh}"/>
						</s:if>
						<s:else>
							<s:textarea name="#request.chli.wcqkms" readonly="true" cssStyle="width:80%;height:100px;"></s:textarea>
						</s:else>
					</cps:tdContent>
				</cps:row>
				</form>
			</cps:table>
		
	</creator:panel>
	<creator:tbar>
		<s:if test="#request.chli.rwclzt==0 && #request.chli.op=='qt'">
			<cps:button value="保&nbsp;存" onclick="submitNewBean();" cssStyle="align:center"></cps:button>
		</s:if>
		<cps:button value="取&nbsp;消" onclick="$.closeWindow();" cssStyle="align:center"></cps:button>
	</creator:tbar>
</creator:view>