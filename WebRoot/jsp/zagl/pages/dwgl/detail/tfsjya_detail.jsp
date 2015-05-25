<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="突发事件预案">
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/tfsjyaList_detail.js"></creator:Script>
	<creator:panel id="bwjg" title="突发事件预案" tbarId="op">
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>预案类型：</cps:tdLabel>
				<cps:tdContent>
					${dw.tfsjya.yalxmc}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel>修订时间：</cps:tdLabel>
				<cps:tdContent>
					${dw.tfsjya.xdsj}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>要求人员情况：</cps:tdLabel>
				<cps:tdContent colspan="5">
					${dw.tfsjya.yqryqk}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>要求装备情况：</cps:tdLabel>
				<cps:tdContent colspan="5">
					${dw.tfsjya.yqzbqk}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel><font color="red">*</font>预案内容：</cps:tdLabel>
				<cps:tdContent colspan="5">
					${dw.tfsjya.yanr}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="15%">登记人：</cps:tdLabel>
				<cps:tdContent width="18%">
					${dw.tfsjya.djrxm}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel width="15%">登记时间：</cps:tdLabel>
				<cps:tdContent width="18%">
					${dw.tfsjya.djsj}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel width="15%">登记单位：</cps:tdLabel>
				<cps:tdContent>
					${dw.tfsjya.djdwmc}&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
			
	<div style="height:10px;"></div>
			
	<form id="yaylcx">
		<input type="hidden" name="dw.tfsjya.yabh" value="${dw.tfsjya.yabh}" id="ylcx_yabh" />
	</form>
	
	<creator:panel id="yayl" title="预案演练" tbarId="yayl_op">
		<cps:tableGrid url="${contextPath}/zagl/dw/queryYaylByYabh.action" searchform="yaylcx"
				id="yaylList" autoload="true" width="99.5%" height="150" 
				pageSize="10" usepager="false" mutilSelect="false" click="loadYl">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="演练名称" field="ylmc"></cps:column>
			<cps:column title="演练时间" field="ylsj"></cps:column>
			<cps:column title="参演人数(人)" field="cyrs"></cps:column>
			<cps:column title="演练描述" field="ms"></cps:column>
		</cps:tableGrid>
		
		<div style="height:10px;"></div>
			
		<cps:table>
			<cps:row>
				<cps:tdLabel width="15%"><font color="red">*</font>演练名称：</cps:tdLabel>
				<cps:tdContent width="18%" id="ylmc">
				</cps:tdContent>
				
				<cps:tdLabel width="15%"><font color="red">*</font>演练时间：</cps:tdLabel>
				<cps:tdContent width="18%" id="ylsj">
				</cps:tdContent>
				
				<cps:tdLabel width="15%">参演人数：</cps:tdLabel>
				<cps:tdContent id="cyrs">
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel><font color="red">*</font>描述：</cps:tdLabel>
				<cps:tdContent colspan="5" id="ms">
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</creator:view>