<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="dw.jfdw.id" value="${dw.jfdw.id}" id="jfdw_id" />
<input type="hidden" name="dw.jfdw.jgbh" value="${dw.jfdw.jgbh}" id="jfdw_jgbh" />

<cps:table>
	<cps:row>
		<cps:tdLabel><font color="red">*</font>备案类型：</cps:tdLabel>
		<cps:tdContent width="18%">
			<cps:select zdlb="ZDY_JFDW_BALX" name="dw.jfdw.balx" value="${dw.jfdw.balx}"  id="balx" required="true" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		
		<cps:tdLabel width="16%">室外电视监控探头(个)：</cps:tdLabel>
		<cps:tdContent width="18%">
			<cps:textfield name="dw.jfdw.swdsjktt" maxlength="5" value="${dw.jfdw.swdsjktt}" id="swdsjktt" inputType="integer"/>
		</cps:tdContent>
		
		<cps:tdLabel width="15%">室内探头(个)：</cps:tdLabel>
		<cps:tdContent width="18%">
			<cps:textfield name="dw.jfdw.sntt" maxlength="5" value="${dw.jfdw.sntt}" id="sntt" inputType="integer"/>
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>周界报警及门禁系统：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="ZDY_JFDW_SSYW" name="dw.jfdw.zjbjjmjxt" value="${dw.jfdw.zjbjjmjxt}" id="zjbjjmjxt" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		
		<cps:tdLabel>110联网报警：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="ZDY_JFDW_SSYW" name="dw.jfdw.lwbj" value="${dw.jfdw.lwbj}" id="lwbj" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		
		<cps:tdLabel>要害部防盗门窗：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="ZDY_JFDW_SSYW" name="dw.jfdw.yhbwfdmc" value="${dw.jfdw.yhbwfdmc}"  id="yhbwfdmc" headerKey="" headerValue=" "/>
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>备注：</cps:tdLabel>
		<cps:tdContent colspan="5">
			<cps:textfield type="textarea" name="dw.jfdw.bz" maxlength="200" value="${dw.jfdw.bz}" id="bz" cssStyle="width:94%;height:40px;" />
		</cps:tdContent>
	</cps:row>
</cps:table>