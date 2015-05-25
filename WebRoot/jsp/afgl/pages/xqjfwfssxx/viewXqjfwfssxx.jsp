<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="技防物防设施信息">
			<creator:panel id="head_djxqjfwfssxxviw" title="技防物防设施信息">
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">设施名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.ssmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所在社区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.sqmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所在小区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.xqmc }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">设施类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.sslxmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">安装时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.azsj }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">安装位置：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.azwz }&nbsp;
						</cps:tdContent>
						
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">位置类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.wzlx }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">设备数量：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.sssl }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">运行情况：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.sbyxqk }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">是否发挥作用：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<${xqjfwfssxxBean.isfhzymc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">报警设施连接：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.bjssljmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">&nbsp;</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<c:if test="${xqjfwfssxxBean.iscc eq '1'}">
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">拆除时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.ccsj }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">拆除原因：</cps:tdLabel>
						<cps:tdContent colspan="3">
							${xqjfwfssxxBean.ccyy }&nbsp;
						</cps:tdContent>
					</cps:row>
					</c:if>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.djrxm }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.djsj }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.djdwmc }&nbsp;
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
</creator:view>