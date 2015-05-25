<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="灾害事故信息">
<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
<creator:tbar id="op">
	<cps:button value="保存" onclick="saveZhsg()"></cps:button>
	<cps:button value="关闭" onclick="window.close()"></cps:button>
</creator:tbar>
<creator:panel id="zhsg" tbarId="op" title="灾害事故">
	<div id="zhsg_div">
		<form id="zhsg_form">
			<input type="hidden" name="dw.zhsg.bh" id="bh" />
			<input type="hidden" name="dw.zhsg.jgbh" value="${dwBean.dwjbxx.jgbh}" id="zhsg_jgbh"/>
			<input type="hidden" value="${operType}" id="opertype"/>
			<input type="hidden" name="dw.dwjbxx.jgbh" value="${dwBean.dwjbxx.jgbh}"/>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>事故类型：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select name="dw.zhsg.sglx" id="sglx" zdlb="ZDY_SGLX"  headerKey="" headerValue=" " required="true" />
					</cps:tdContent>
					
					<cps:tdLabel width="12%">发生时间：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:date name="dw.zhsg.fssj" id="fssj" maxDate="sysdate" dateFmt="yyyy-MM-dd HH:mm:ss" defaultSystemDate="true"/>
					</cps:tdContent>
					
					<cps:tdLabel width="12%"><font color="red">*</font>损失财产(万元)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.zhsg.sscc" id="sscc" inputType="number" maxlength="9" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>发生地点：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield name="dw.zhsg.fsdd" id="fsdd" maxlength="100"  cssStyle="width:93%"/>
					</cps:tdContent>
					
					<cps:tdLabel>事故责任人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.zhsg.sgzrr" id="sgzrr" maxlength="15" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>承办人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.zhsg.cbr" id="cbr" maxlength="15" />
					</cps:tdContent>
					
					<cps:tdLabel>事故原因：</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="dw.zhsg.sgyy" id="sgyy" zdlb="ZDY_SGYY"  headerKey="" headerValue=" "/>
					</cps:tdContent>
					
					<cps:tdLabel>事故案件状态：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.zhsg.sgajzt" id="sgajzt" maxlength="50" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>发生经过：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" cssStyle="height:60px;width:93%" name="dw.zhsg.fsjg" id="fsjg" maxlength="200" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>处置措施：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" cssStyle="height:60px;width:93%" name="dw.zhsg.czcs" id="czcs" maxlength="200" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
				<cps:tdLabel width="15%">登记人：</cps:tdLabel>
				<cps:tdContent width="18%">
					<c:choose>
						<c:when test="${dw.zhsg.djrxm != null}">
							<cps:textfield name="dw.zhsg.djrxm" value="${dw.zhsg.djrxm}" readonly="true" id="djrxm" />
						</c:when>
						<c:otherwise>
							<cps:textfield name="dw.zhsg.djrxm" value="${loginInfo.realname}" readonly="true" id="djrxm" />
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="15%">登记时间：</cps:tdLabel>
				<cps:tdContent width="18%">
					<c:choose>
						<c:when test="${dw.zhsg.djsj != null}">
							<cps:textfield name="dw.zhsg.djsj" value="${dw.zhsg.djsj}" readonly="true" id="djsj" />
						</c:when>
						<c:otherwise>
							<cps:textfield name="dw.zhsg.djsj" value="${currentSystemDate}" readonly="true" id="djsj" />
						</c:otherwise>
					</c:choose>
				</cps:tdContent>

				<cps:tdLabel width="15%">登记单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${dw.zhsg.djdwdm != null}">
							<cps:textfield name="dw.zhsg.djdwmc" value="${dw.zhsg.djdwmc}" readonly="true" id="djdwmc" />
							<input type="hidden" name="dw.zhsg.djdwdm" id="djdwdm" value="${dw.zhsg.djdwdm}"/>
						</c:when>
						<c:otherwise>
							<cps:textfield name="dw.abss.djdwmc" value="${loginInfo.orgname}" readonly="true" id="djdwmc" />
							<input type="hidden" name="dw.zhsg.djdwdm" id="djdwdm" value="${loginInfo.orgcode }"/>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
				
			</cps:table>
		</form>
	</div>
	<cps:tableGrid list="${dwBean.zhsgList}" title="灾难事故列表" height="150" id="zhsgList"
		pageSize="5" width="99.5%"  click="loadZhsg"
		usepager="false" mutilSelect="false" isAsynch="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" field="cz"></cps:column>
		<cps:column title="事故类型" field="sglxmc"></cps:column>
		<cps:column title="发生时间" field="fssj"></cps:column>
		<cps:column title="发生地点" field="fsdd"></cps:column>
		<cps:column title="损失财产(万元)" field="sscc"></cps:column>
		<cps:column title="承办人" field="cbr"></cps:column>
	</cps:tableGrid>
</creator:panel>
</creator:view>