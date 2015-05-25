<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="可疑物品信息">
		<creator:panel id="viewkywpxx" title="查看可疑物品信息">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">物品名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpmc }
						</cps:tdContent>
						<cps:tdLabel width="12%">物品类型：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wplxmc }
						</cps:tdContent>
						<cps:tdLabel width="12%">物品型号：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpxh }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">物品规格：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpgg }
						</cps:tdContent>
						<cps:tdLabel width="12%">物品样式：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpys }
						</cps:tdContent>
						<cps:tdLabel width="12%">物品颜色：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpyas }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">物品数量：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpsl }
						</cps:tdContent>
						<cps:tdLabel width="12%">数量单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpsldwmc }
						</cps:tdContent>
						<cps:tdLabel width="12%">物品重量：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpzl }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">重量单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpzldwmc }
						</cps:tdContent>
						<cps:tdLabel width="12%">物品长度：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpcd }
						</cps:tdContent>
						<cps:tdLabel width="12%">长度单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpcddwmc }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">追缴单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.zjdwmc }
						</cps:tdContent>
						<cps:tdLabel width="12%">追缴时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.zjsj }
						</cps:tdContent>
						<cps:tdLabel width="12%">性质：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpxzmc }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">物品价值：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpjz }
						</cps:tdContent>
						<cps:tdLabel width="12%">特征描述：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpms }
						</cps:tdContent>
						<cps:tdLabel width="12%">处理状态：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.clztmc }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">处理情况：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.clqkmc }
						</cps:tdContent>
						<cps:tdLabel width="12%">处理人姓名：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.clrxm }
						</cps:tdContent>
						<cps:tdLabel width="12%">处理单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.cldwmc }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">处理日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.clrq }
						</cps:tdContent>
						<cps:tdLabel width="12%">物品存放地点：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.wpcfdz }
						</cps:tdContent>
						<cps:tdLabel width="12%">&nbsp;</cps:tdLabel>
						<cps:tdContent width="20%">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">备注：</cps:tdLabel>
						<cps:tdContent colspan="5">
							${kywpxxBean.bz }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">图片：</cps:tdLabel>
						<cps:tdContent colspan="5">
							${kywpxxBean.wptp }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">登记人：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.djrxm }
						</cps:tdContent>
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.djsj }
						</cps:tdContent>
						<cps:tdLabel width="12%">登记单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kywpxxBean.djdwmc }
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
		
</creator:view>