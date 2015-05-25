<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<cps:panel title="单位退回(退回到派发单位)">
		<c:choose>
			<c:when test="${!(operType eq 'detail')}">
				<form id="dwpfForm">
					<input type="hidden" name="log.id" value="${log.id}" />
					<input type="hidden" name="log.ywxtzj" value="${log.ywxtzj}" />
					<input type="hidden" name="log.ywxtlx" value="${log.ywxtlx}" />
					
					<cps:table>
						<cps:row>
							<cps:tdLabel width="15%">派发人姓名：</cps:tdLabel>
							<cps:tdContent width="18%">
								${log.czrxm}&nbsp;
							</cps:tdContent>
							<cps:tdLabel width="15%">派发时间：</cps:tdLabel>
							<cps:tdContent>
								${log.czsj}&nbsp;
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel width="20%">派发单位：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<input type="hidden" name="log.pfdwdm" value="${log.pfdwdm}" />
								${log.pfdwmc}&nbsp;
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel><font color='red'>*</font>退回原因：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<cps:textfield type="textarea" id="thyy" cssStyle="height:80px;width:95%" name="log.thyy" maxlength="500" required="true" />
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</form>
			</c:when>
			<c:otherwise>
				<cps:table>
						<cps:row>
							<cps:tdLabel>退回人姓名：</cps:tdLabel>
							<cps:tdContent>
								${log.czrxm}&nbsp;
							</cps:tdContent>
							<cps:tdLabel>退回时间：</cps:tdLabel>
							<cps:tdContent>
								${log.czsj}&nbsp;
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel width="20%">退回单位：</cps:tdLabel>
							<cps:tdContent colspan="3">
								${log.czdwmc}&nbsp;
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>退回原因：</cps:tdLabel>
							<cps:tdContent colspan="3" cssStyle="height:80px;" valign="top">
								${log.thyy}&nbsp;
							</cps:tdContent>
						</cps:row>
					</cps:table>
			</c:otherwise>
		</c:choose>
	</cps:panel>
</creator:view>