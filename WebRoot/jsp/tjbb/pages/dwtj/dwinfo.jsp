<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<cps:table>
	<cps:row>	
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">序号</cps:tdLabel>			
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">单位</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">总数</cps:tdLabel>
		<cps:tdLabel colspan="5" cssStyle="text-align:center;">特种行业</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">公共场所</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">内保单位</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">危险单位</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">上网场所</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">涉外单位</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">商铺门店</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">物流业</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;">其他</cps:tdLabel>
	</cps:row>
	<cps:row>
		<cps:tdLabel cssStyle="text-align:center;">旅馆业</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center;">开锁业</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center;">拍卖业</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center;">典当业</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center;">其他</cps:tdLabel>
	</cps:row>
	<c:forEach items="${dwList}" var="dw" varStatus="s">
		<cps:row>
			<cps:tdContent cssStyle="text-align:center;">${s.index + 1}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:left;">${dw.dwmc}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.zs}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.lg}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.ksdw}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.pmh}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.ddh}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.qtth}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.ggcs}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.nbdw}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.wbdw}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.wb}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.swdw}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.sp}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.wldw}&nbsp;</cps:tdContent>
			<cps:tdContent cssStyle="text-align:center;">${dw.qtdw}&nbsp;</cps:tdContent>
		</cps:row>
	</c:forEach>
</cps:table>