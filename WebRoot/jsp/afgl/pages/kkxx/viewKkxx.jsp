<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="卡口信息">
		<creator:panel id="viewkkxx" title="卡口信息">
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">卡口名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkmc}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">卡口警力数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkjls}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">专职巡防人数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkzzxfrs}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">卡口位置：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkwz}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">卡口范围：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkfw}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">装备情况：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkzbqk}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">警务责任区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.sszrqmc}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">建立日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkcjsj}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">撤销日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.zxrq}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">撤销原因：</cps:tdLabel>
						<cps:tdContent colspan="5">
							${kkxxBean.zxyy}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.djrxm}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.djsj}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.djdwmc}
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
</creator:view>