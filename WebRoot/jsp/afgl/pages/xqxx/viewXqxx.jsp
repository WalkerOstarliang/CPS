<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="小区信息">
			<cps:panel id="viw_xqxx" title="查看小区信息">
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">小区名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xqmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">小区地址：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xqdz }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">小区负责人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xqfzrxm }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">负责人电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xqfzrlxdh }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">物业公司：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.wygsmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">物业公司负责人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.wygsfzr }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">物业公司负责人电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.wygsfzrlxdh }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">管理类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.gllx }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">管理模式：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.glmsmc }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">大门数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.dms }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">楼栋数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.lds }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">户数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.hs }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">人口数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.rks}&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">单位数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.dws }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">小区面积：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xqmj }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">刑事案件数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xsajs}&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">治安案件数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.zaajs }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">行政案件数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xzajs }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">所属居委会：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.ssjwhmc}&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">居委会负责人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.jwhfzr }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">负责人联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.jwhfzrlxdh}&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">所属警务区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.ssjwsbh }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">社区民警：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.sqmjxm }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.jwslxdh}&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:12%">建立日期：</cps:tdLabel>
						<cps:tdContent  cssStyle="width:20%">
							${xqxxBean.jlrq }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">撤消日期：</cps:tdLabel>
						<cps:tdContent  cssStyle="width:20%">
							${xqxxBean.cxrq }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">撤消原因：</cps:tdLabel>
						<cps:tdContent  cssStyle="width:20%">
							${xqxxBean.cxyy }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.djrxm }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.djsj}&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.djdwmc }&nbsp;
						</cps:tdContent>
					</cps:row>
					
				</cps:table>
		</cps:panel>
</creator:view>