<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="op">
	<cps:button value="保存" onclick="saveAqyh()"></cps:button>
	<cps:button value="关闭" onclick="window.close()"></cps:button>
</creator:tbar>
<creator:panel id="aqyh" tbarId="op" title="安全隐患">
	<cps:tableGrid list="${dw.aqyhList}" height="150" id="aqyhList"
		autoload="true" searchform="" pageSize="5" width="99.5%"  click="loadAqyh"
		usepager="false" mutilSelect="false" isAsynch="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" field="cz"></cps:column>
		<cps:column title="隐患类型" field="yhlxmc"></cps:column>
		<cps:column title="隐患名称" field="yhmc"></cps:column>
		<cps:column title="隐患登记" field="yhdjmc"></cps:column>
		<cps:column title="发现时间" field="fxsj"></cps:column>
		<cps:column title="发现人员" field="fxry"></cps:column>
	</cps:tableGrid>
	
	<div id="aqyh_div">
		<form id="aqyh_form">
			<input type="hidden" name="dw.aqyh.bh" id="bh" />
			<input type="hidden" name="dw.aqyh.jgbh" value="${jhbh}" id="aqyh_jgbh"/>
			<input type="hidden" value="${operType}" id="opertype"/>
		
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%"><font color="red">*</font>隐患名称：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:textfield name="dw.aqyh.yhmc" id="yhmc" maxlength="50" required="true" />
					</cps:tdContent>
					
					<cps:tdLabel width="15%"><font color="red">*</font>隐患类型：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:select name="dw.aqyh.yhlx" id="yhlx" zdlb="ZDY_YHLX"  headerKey="" headerValue="--请选择--" required="true" />
					</cps:tdContent>
					
					<cps:tdLabel width="15%"><font color="red">*</font>隐患等级：</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="dw.aqyh.yhdj" id="yhdj" zdlb="ZDY_YHJB"  headerKey="" headerValue="--请选择--" required="true" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>发现人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.aqyh.fxry" id="fxry" maxlength="15" />
					</cps:tdContent>
					
					<cps:tdLabel>发现时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="dw.aqyh.fxsj" id="fxsj" maxDate="sysdate"  dateFmt="yyyy-MM-dd" defaultSystemDate="true"/>
					</cps:tdContent>
					
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>具体位置：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield cssStyle="width:93%" name="dw.aqyh.jtwz" id="jtwz" maxlength="100" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>处置措施：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" cssStyle="height:60px;width:93%" name="dw.aqyh.czcs" id="czcs" maxlength="200" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.aqyh.djrxm" value="${dw.aqyh.djrxm}" id="djrxm"  readonly="true"/>
					</cps:tdContent>
					
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.aqyh.djsj" value="${dw.aqyh.djsj}" id="djsj"  readonly="true"/>
					</cps:tdContent>
					
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" name="dw.aqyh.djdwdm" value="${dw.aqyh.djdwdm}" id="djdwdm" />
						<cps:textfield name="dw.aqyh.djdwmc" value="${dw.aqyh.djdwmc}" id="djdwmc"  readonly="true"/>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</div>
</creator:panel>