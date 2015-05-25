<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/xunldJL.js"></script>
	<creator:tbar id="tbar">
	<s:if test="bean.op != 'detail'" >
							<cps:button value="保存" onclick="save();"></cps:button>
						</s:if>
						<cps:button value="关闭" onclick="window.close();"></cps:button>
	</creator:tbar>
	<creator:panel title="巡逻队奖励"  id="xldjl" tbarId="tbar">
		<form action="${contextPath}/gzgl/xldjl/save.action" method="post" id="xunldJLform">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>巡逻队:</cps:tdLabel>
					<cps:tdContent width="35%">
						<input type="hidden" name="bean.op" value="${bean.op}" />
						<input type="hidden" name="bean.bh" value="${bean.bh}" />
						<s:hidden id="xldbh" name="bean.xldbh"></s:hidden>
						<c:choose>
							<c:when test="${bean.op == 'detail'}">
								${bean.xldmc}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldmc" name="bean.xldmc"  value="${bean.xldmc}" cssClass="validate[required]" readonly="true" appendPopuBtn="true" onclick="openXldSelectWin()"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
					<cps:tdLabel width="10%"><font color="red">*</font>奖励时间:</cps:tdLabel>
					<cps:tdContent width="35%">
						<s:if test="bean.op != 'detail'">
							<cps:date name="bean.jlsj" value="${bean.jlsj}" cssStyle="width:84%"  id='jlsj' cssClass="validate[required]" dateFmt="yyyy-MM-dd"></cps:date>
						</s:if>
						<s:else>
							<cps:textfield name="bean.jlsj" value="${bean.jlsj}" cssStyle="width:84%" readonly="true"></cps:textfield>
						</s:else>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>荣誉:</cps:tdLabel>
					<cps:tdContent colspan="3">
						<s:if test="bean.op !='detail'" >
							<textarea name="bean.ry" style="width:93%;height:60px;" id='ry' class="validate[maxSize[50]]">${bean.ry}</textarea>
						</s:if>
						<s:else>
							<textarea name="bean.ry" style="width:93%;height:60px;" readonly="readonly">${bean.ry}</textarea>
						</s:else>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>奖励原因:</cps:tdLabel>
					<cps:tdContent colspan="3">
						<s:if test="bean.op != 'detail'">
							<textarea name="bean.jlyy" style="width: 93%; height: 60px;" id="jlyy" class="validate[maxSize[150]]">${bean.jlyy}</textarea>
						</s:if>
						<s:else>
							<textarea name="bean.jlyy" style="width: 93%; height: 60px;" readonly="readonly">${bean.jlyy}</textarea>
						</s:else>
					</cps:tdContent>
				</cps:row>
			</cps:table>
				
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">批准人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:if test="bean.op != 'detail'">
							<input type="hidden" name="bean.jlpzrjh" value="${bean.jlpzrjh}" id="jlpzrjh" />
							<cps:textfield name="bean.jlpzrxm" value="${bean.jlpzrxm}"  readonly="true" id="jlpzrxm" appendPopuBtn="true" onclick="orgUserSelect('${loginInfo.rootOrgCode}','jlpzrjh','jlpzrxm')"/>
						</s:if>
						<s:else>
							<cps:textfield name="bean.jlpzrxm" value="${bean.jlpzrxm}"  readonly="true" />
						</s:else>
						
					</cps:tdContent>
					
					<cps:tdLabel width="9%">批准单位：</cps:tdLabel>
					<cps:tdContent width="18%">
						<s:if test="bean.op != 'detail'">
							<input type="hidden" name="bean.jlpzdwdm" value="${bean.jlpzdwdm}" id="jlpzdwdm"/>
							<cps:textfield name="bean.jlpzdwmc" value="${bean.jlpzdwmc}" readonly="true" id="jlpzdwmc" />
						</s:if>
						<s:else>
							<cps:textfield name="bean.jlpzdwmc" value="${bean.jlpzdwmc}" />
						</s:else>
					</cps:tdContent>
					
					<cps:tdLabel width="9%">批准日期：</cps:tdLabel>
					<cps:tdContent width="18%">
						<s:if test="bean.op != 'detail'">
							<cps:date name="bean.jlpzrq" value="${bean.jlpzrq}"  readOnly="true" dateFmt="yyyy-MM-dd"></cps:date>
						</s:if>
						<s:else>
							<cps:textfield name="bean.jlpzrq" value="${bean.jlpzrq}"></cps:textfield>
						</s:else>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<s:if test="bean.op == 'add'">
							<cps:textfield readonly="true" name="bean.djrxm" value="${loginInfo.realname}"></cps:textfield>
						</s:if>
						<s:else>
							<cps:textfield readonly="true" name="bean.djrxm" value="${bean.djrxm}"></cps:textfield>
						</s:else>
					</cps:tdContent>
					
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<s:if test="bean.op == 'add'">
							<cps:textfield name="bean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
							<input type="hidden" name="bean.djdwdm" value="${loginInfo.orgcode}" />
						</s:if>
						<s:else>
							<cps:textfield name="bean.djdwmc" value="${bean.djdwmc}" readonly="true" ></cps:textfield>
							<input type="hidden" name="bean.djdwdm" value="${bean.djdwdm}" />
						</s:else>
					</cps:tdContent>
					
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<s:if test="bean.op == 'add'">
							<cps:textfield name="bean.djsj" value="${now}" readonly="true" ></cps:textfield>
						</s:if>
						<s:else>
							<cps:textfield name="bean.djsj" value="${bean.djsj}" readonly="true" ></cps:textfield>
						</s:else>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel colspan="6" cssStyle="text-align:center;margin:auto;">
						
					</cps:tdLabel>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
</creator:view>