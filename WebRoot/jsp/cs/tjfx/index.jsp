<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<creator:Style href="/jsp/cs/css/layout.css"></creator:Style>
	<creator:Script src="/jsp/cs/common/cs.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var height = $(document).height();
			$("#leftpanel").height(height - 50);
			$("#mainiframe").height(height - 21);
		});
	</script>
	<!--主内容 开始-->
	<div class="main">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top" width="12%">
				<div style="height: 100%;width:100%">
					<div id="header">
						<div id="head_title" style="text-align: center;" class="cps-box-title">系统菜单</div>
						<div id="zpxx" class="cps-box-content">
							<div id="leftpanel" class="zfba_menu" style="">
								<a href="<c:url value='/tjbb/toPcsJbqkTjPage.action'/>" class="zfba_a" target="mainiframe" style="text-align: left">派出所基本情况</a>
								<a href="<c:url value='/tjbb/toPcsxxPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">警务区信息查询</a>
								<a href="<c:url value='/tjbb/toJcsjtjtjPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">基础数据统计</a>
								<a href="<c:url value='/tjbb/toPcsjbqkhzPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">派出所汇总分析</a>
								<a href="<c:url value='/tjbb/toPcsJbqkList.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">派出所列表分析</a>
								<a href="<c:url value='/tjbb/toFqfzqkPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">发案情况统计表</a>
								<a href="<c:url value='/tjbb/toCzfwTjbbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">出租房屋统计</a>
								<a href="<c:url value='/tjbb/toLdrkTjbbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">流动人口统计</a>
								<a href="<c:url value='/tjbb/toGabzzrktjbbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">公安部流口统计</a>
								<a href="<c:url value='/tjbb/toJzztjbbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">居住证统计报表</a>
								<a href="<c:url value='/tjbb/toDatalrTjPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">数据录入量排名</a>
								<a href="<c:url value='/tjbb/toSjlrWeektjPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">数据周采集情况</a>
								<a href="<c:url value='/tjbb/toDwAqjctjbbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">安全检查统计</a>
								<a href="<c:url value='/tjbb/toDwTjPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">单位数量统计</a>
					   	 		<a href="<c:url value='/qzgl/wmfwgl/toStZapctbbbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">极端暴力统计</a>
					   	 		<a href="<c:url value='/tjbb/toJdTbPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">季度数据统计</a>
					   	 		<a href="<c:url value='/khkp/lssjtj/toLssjTjPage.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">两实数据统计</a>
				                        	<a href="<c:url value='/lsgl/jzzxx/toTjLdrkMzxx.action'/>" class="zfba_b" target="mainiframe" style="text-align: left">流动人口统计</a>
					   	 	</div>
						</div>
					</div>
				</div>
			</td>
			<td width="85%">
				<iframe id="mainiframe" name="mainiframe" frameborder="0" src="<c:url value='/tjbb/toPcsJbqkTjPage.action'/>" width="98.5%" height="500"></iframe>
			</td>
		</tr>
	 </table>
	</div>
</creator:view>