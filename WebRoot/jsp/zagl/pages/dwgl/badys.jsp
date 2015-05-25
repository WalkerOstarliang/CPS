<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="op">
	<cps:button value="保存" onclick="saveBadys()"></cps:button>
	<cps:button value="关闭" onclick="window.close()"></cps:button>
</creator:tbar>
<creator:panel id="badys" tbarId="op" title="不安定因素">
	<cps:tableGrid list="${dw.badysList}" height="150" id="badysList"
		autoload="true" searchform="" pageSize="5" width="99.5%"  click="onloadBadxx"
		usepager="false" mutilSelect="false" isAsynch="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" field="cz"></cps:column>
		<cps:column title="不安定因素类型" field="lxmc"></cps:column>
		<cps:column title="引发原因" field="yfyymc"></cps:column>
		<cps:column title="表现形式" field="bxxsmc"></cps:column>
		<cps:column title="发生时间" field="fssj"></cps:column>
		<cps:column title="发生地点" field="fsdd"></cps:column>
		<cps:column title="承办人" field="cbr"></cps:column>
	</cps:tableGrid>
	
	<div id="badys_div">
		<form id="badys_form">
			<input type="hidden" name="dw.badys.bh" value="${dw.badys.bh}" id="bh" />
			<input type="hidden" name="dw.badys.jgbh" value="${dw.badys.jgbh}" id="badys_jgbh"/>
			<input type="hidden" value="${operType}" id="opertype"/>
		
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%"><font color="red">*</font>不安定因素类型：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:select name="dw.badys.lx" value="${dw.badys.lx}" id="lx" zdlb="ZDY_BADYSLX"  headerKey="" headerValue="--请选择--" required="true" onchange="lxChange(this.value)"/>
					</cps:tdContent>
					
					<cps:tdLabel width="15%"><font color="red">*</font>引发原因：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:select name="dw.badys.yfyy" value="${dw.badys.yfyy}" id="yfyy" zdlb="ZDY_YFYY"  headerKey="" headerValue="--请选择--" required="true"/>
					</cps:tdContent>
					
					<cps:tdLabel width="15%">发生时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="dw.badys.fssj" maxDate="sysdate" value="${dw.badys.fssj}" id="fssj" dateFmt="yyyy-MM-dd HH:mm:ss" defaultSystemDate="true"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>承办人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.badys.cbr" value="${dw.badys.cbr}" id="cbr" maxlength="15" />
					</cps:tdContent>
					
					<cps:tdLabel>发生地点：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield name="dw.badys.fsdd" value="${dw.badys.fsdd}" id="fsdd" maxlength="150"  cssStyle="width:89%"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>表现形式：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:doubleSelect zdlb="ZDY_BXXS" id="bxxsdl" name="dw.badys.bxxsdl" value="${dw.badys.bxxsdl}" doubleSelectId="bxxs" parentdm="0"  headerKey="" headerValue="--请选择--" disabled="true" cssStyle="width:40%"></cps:doubleSelect>
						<cps:doubleSelect zdlb="ZDY_BXXS" id="bxxs" name="dw.badys.bxxs" value="${dw.badys.bxxs}" dependSelectId="bxxsdl" headerKey="" headerValue="--请选择--" disabled="true" cssStyle="width:40%"></cps:doubleSelect>
					</cps:tdContent>
					
					<cps:tdLabel>事端规模：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.badys.sdgm" value="${dw.badys.sdgm}" id="sdgm" maxlength="50" disabled="true" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>情况描述：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" cssStyle="height:60px;width:93%" name="dw.badys.qkms" value="${dw.badys.qkms}" id="qkms" maxlength="200" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>处置措施：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" cssStyle="height:60px;width:93%" name="dw.badys.czcs" value="${dw.badys.czcs}" id="czcs" maxlength="200" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.badys.djrxm" value="${dw.badys.djrxm}" id="djrxm"  readonly="true"/>
					</cps:tdContent>
					
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.badys.djsj" value="${dw.badys.djsj}" id="djsj"  readonly="true"/>
					</cps:tdContent>
					
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" name="dw.badys.djdwdm" value="${dw.badys.djdwdm}" id="djdwdm" />
						<cps:textfield name="dw.badys.djdwmc" value="${dw.badys.djdwmc}" id="djdwmc"  readonly="true"/>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</div>
</creator:panel>