<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<creator:view>
	<div id="tzhy">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%"><font color="red">*</font>特行类别：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.thlb_mc}&nbsp;${dw.tzhy.thxlmc}
				</cps:tdContent>
				<cps:tdLabel >经营类别：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.jylbmc}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="10%">许可证号：</cps:tdLabel>
				<cps:tdContent width="20%">
					${dw.tzhy.tzhyxkz}&nbsp;
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel width="10%">有效日期：</cps:tdLabel>
				<cps:tdContent width="25%">
					${dw.tzhy.xkzyxrq}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="10%">核发人：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.hfr}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>发证机关：</cps:tdLabel>
				<cps:tdContent >
					${dw.tzhy.xkzhfdw}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>领证人：</cps:tdLabel>
				<cps:tdContent >
					${dw.tzhy.lzr}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>建档日期：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.thjdrq}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>备案时间：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.barq}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent colspan="6" align="left" cssStyle="background-color: #FFF0B2;font-weight: 600;">经营负责人信息：</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">身份证号：</cps:tdLabel>
				<cps:tdContent width="21%">
					${dw.tzhy.jyfzrsfzh}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="12%">姓名：</cps:tdLabel>
				<cps:tdContent width="21%">
					${dw.tzhy.jyfzr}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="12%">联系电话：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.jyfzrlxdh}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent colspan="6" align="left" cssStyle="background-color: #FFF0B2;font-weight: 600;">安保负责人信息：</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>身份证号：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.abfzrsfzh}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>姓名：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.abfzrxm}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>联系电话：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.abfzrlxdh}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>责任民警：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.zrmj}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel>民警电话：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.mjdh}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel>派出所电话：</cps:tdLabel>
				<cps:tdContent>
					${dw.tzhy.pcsdh}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>治安责任单位：</cps:tdLabel>
				<cps:tdContent colspan="5">
					${dw.tzhy.zazrdwmc}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>变更情况：</cps:tdLabel>
				<cps:tdContent colspan="5">
					${dw.tzhy.bgqk}&nbsp;
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					${dw.tzhy.bz}&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</div>
	<div id="tzhytsxxdiv">
		<c:forEach items="${fn:split(dw.dwjbxx.hylb,',')}" var="dwsx">
			<c:if test="${dwsx == '07'}">
				<%@include file="/jsp/zagl/pages/dwgl/detail/thlg_detail.jsp" %>
			</c:if>
			<c:if test="${dwsx == '08'}">
				<%@include file="/jsp/zagl/pages/dwgl/detail/ksy_detail.jsp" %>
			</c:if>
		</c:forEach>
	</div>
</creator:view>	