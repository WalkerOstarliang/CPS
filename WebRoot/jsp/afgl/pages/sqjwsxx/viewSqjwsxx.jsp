<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="社区警务室信息">
		<creator:panel id="viewsqjwsxx" title="社区警务室信息">
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">警务室名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.orgname }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">警务室类别：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.jwslbmc }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">警务室类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.jwslxmc }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">管辖社区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.gxqy }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">警务室地址：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.jwsdz}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">办公场所类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.bgcslxmc }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">责任民警：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.zrmj }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">民警联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.mjlxdh}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所属派出所：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.sspcsmc}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">所属行政区划：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.ssxzqhmc }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">分管所领导：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.fgdwldxm}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所领导联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.fgdwldlxdh}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">注销标识：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.zxbsmc }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">注销日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.zxrq}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">注销单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.zxdwmc}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.czrxm}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.czsj}
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${sqjwsxxBean.czdwmc}
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
</creator:view>