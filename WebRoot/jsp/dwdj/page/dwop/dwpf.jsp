<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<cps:panel title="单位派发">
		<s:if test="!(operType eq 'detail')">
			<form id="dwpfForm">
				<input type="hidden" name="log.id" value="${log.id}" />
				<input type="hidden" name="log.ywxtzj" value="${log.ywxtzj}" />
				<input type="hidden" name="log.ywxtlx" value="${log.ywxtlx}" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="20%"><font color='red'>*</font>派发到：</cps:tdLabel>
						<cps:tdContent>
							<input id="dwdm" type="hidden" name="log.mbdwdm" value="${log.mbdwdm}" />
							<cps:textfield name="log.mbdwmc"  id="dwmc" onclick="dwselect('${loginInfo.orgcode}',${loginInfo.leve})" appendPopuBtn="true" readonly="true" required="true" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</s:if>
		<s:else>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">派发人：</cps:tdLabel>
					<cps:tdContent width="18%">${log.czrxm}&nbsp;</cps:tdContent>
					<cps:tdLabel width="15%">派发时间：</cps:tdLabel>
					<cps:tdContent width="18%">${log.czsj}&nbsp;</cps:tdContent>
					<cps:tdLabel>派发单位：</cps:tdLabel>
					<cps:tdContent>${log.pfdwmc}&nbsp;</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>派发到：</cps:tdLabel>
					<cps:tdContent colspan="5">${log.mbdwmc}&nbsp;</cps:tdContent>
				</cps:row>
			</cps:table>
		</s:else>
	</cps:panel>
</creator:view>