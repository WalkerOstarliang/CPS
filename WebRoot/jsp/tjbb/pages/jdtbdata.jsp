<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/tjbb/js/jdtb.js"></creator:Script>
	<cps:panel title="统计结果">
		<cps:table>
			<cps:row>
				<cps:tdLabel cssStyle="text-align:center;" rowspan="3">序号</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" rowspan="3">单位</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2" rowspan="2">实有人口</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2" rowspan="2">实有单位</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="4">企事业单位</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="6">行业场所</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2" rowspan="2">从业人员</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="6">社区基本信息</cps:tdLabel>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2">单位信息</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2">重点要害部位</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2">歌舞厅</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2">卡拉OK</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2">电子游戏</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2">基本信息</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2">干部信息</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;" colspan="2">治保会成员</cps:tdLabel>
				
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center;">季度数</cps:tdLabel> 
			</cps:row>
			<c:forEach items="${jdTbList}" varStatus="s" var="jdTbL">
				<cps:row>
					<cps:tdContent cssStyle="text-align:center;">${s.index + 1}&nbsp;</cps:tdContent>
					<cps:tdContent>
						${jdTbL.dwmc}&nbsp;
					</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.rk_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.rks}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.dw_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.dws}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.qsydw_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.qsydws}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.zdyhbw_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.zdyhbws}&nbsp;</cps:tdContent>
					
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.hycsgwt_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.hycsgwts}&nbsp;</cps:tdContent>
					
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.hycsklok_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.hycskloks}&nbsp;</cps:tdContent>
					
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.hycsdzyx_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.hycsdzyxs}&nbsp;</cps:tdContent>
					
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.cyry_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.cyrys}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.sq_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.sqs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.sqgb_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.sqgbs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.zbhcy_zs}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${jdTbL.zbhcys}&nbsp;</cps:tdContent>
				</cps:row>
			</c:forEach>
		</cps:table>
	</cps:panel>
</creator:view>