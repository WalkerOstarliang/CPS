<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="卡口巡逻信息">
		<creator:panel id="ckkkxlxx" title="查看卡口巡逻信息">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">卡口名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.kkmc }
						</cps:tdContent>
						<cps:tdLabel width="12%">卡口位置：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.kkwz }
						</cps:tdContent>
						<cps:tdLabel width="12%">卡口范围：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.kkfw }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">开始时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.xlkssj }
						</cps:tdContent>
						<cps:tdLabel width="12%">结束时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.xljssj }
						</cps:tdContent>
						<cps:tdLabel width="12%">巡逻民警：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.xlmj}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">参与巡逻人员：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.cyxlry }
						</cps:tdContent>
						<cps:tdLabel width="12%">巡逻情况：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.xlqk }
						</cps:tdContent>
						<cps:tdLabel width="12%">盘查情况：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.pcqk }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">巡逻接班时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.xljbsj }
						</cps:tdContent>
						<cps:tdLabel width="12%">巡逻接班民警：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.xljbmj}
						</cps:tdContent>
						<cps:tdLabel width="12%">&nbsp;</cps:tdLabel>
						<cps:tdContent width="20%">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">登记人：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.djrxm}
						</cps:tdContent>
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.djsj}
						</cps:tdContent>
						<cps:tdLabel width="12%">登记单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkxlxxBean.djdwmc}
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
</creator:view>