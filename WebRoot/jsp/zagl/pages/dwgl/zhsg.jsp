<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="op">
	<cps:button value="保存" onclick="saveZhsg()"></cps:button>
	<cps:button value="关闭" onclick="window.close()"></cps:button>
</creator:tbar>
<creator:panel id="zhsg" tbarId="op" title="灾害事故">
	<cps:tableGrid list="${dw.zhsgList}" height="150" id="zhsgList"
		autoload="true" searchform="" pageSize="5" width="99.5%"  click="loadZhsg"
		usepager="false" mutilSelect="false" isAsynch="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" field="cz"></cps:column>
		<cps:column title="事故类型" field="sglxmc"></cps:column>
		<cps:column title="发生时间" field="fssj"></cps:column>
		<cps:column title="发生地点" field="fsdd"></cps:column>
		<cps:column title="损失财产(万元)" field="sscc"></cps:column>
		<cps:column title="承办人" field="cbr"></cps:column>
	</cps:tableGrid>
	
	<div id="zhsg_div">
		<form id="zhsg_form">
			<input type="hidden" name="dw.zhsg.bh" id="bh" />
			<input type="hidden" name="dw.zhsg.jgbh" value="${jhbh}" id="zhsg_jgbh"/>
			<input type="hidden" value="${operType}" id="opertype"/>
		
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%"><font color="red">*</font>事故类型：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:select name="dw.zhsg.sglx" id="sglx" zdlb="ZDY_SGLX"  headerKey="" headerValue="--请选择--" required="true" />
					</cps:tdContent>
					
					<cps:tdLabel width="15%">发生时间：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:date name="dw.zhsg.fssj" id="fssj" maxDate="sysdate" dateFmt="yyyy-MM-dd HH:mm:ss" defaultSystemDate="true"/>
					</cps:tdContent>
					
					<cps:tdLabel width="15%"><font color="red">*</font>损失财产(万元)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.zhsg.sscc" id="sscc" inputType="number" maxlength="9" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>发生地点：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield name="dw.zhsg.fsdd" id="fsdd" maxlength="100"  cssStyle="width:89%"/>
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
						<cps:select name="dw.zhsg.sgyy" id="sgyy" zdlb="ZDY_SGYY"  headerKey="" headerValue="--请选择--"/>
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
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.zhsg.djrxm" value="${dw.zhsg.djrxm}" id="djrxm"  readonly="true"/>
					</cps:tdContent>
					
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.zhsg.djsj" value="${dw.zhsg.djsj}" id="djsj"  readonly="true"/>
					</cps:tdContent>
					
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" name="dw.zhsg.djdwdm" value="${dw.zhsg.djdwdm}" id="djdwdm" />
						<cps:textfield name="dw.zhsg.djdwmc" value="${dw.zhsg.djdwmc}" id="djdwmc"  readonly="true"/>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</div>
</creator:panel>