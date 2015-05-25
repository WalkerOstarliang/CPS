<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="卡口盘查信息">
		<creator:panel id="viewkkpcxx" title="查看卡口盘查信息">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">卡口名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.kkmc }
						</cps:tdContent>
						<cps:tdLabel width="12%">卡口位置：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.kkwz }
						</cps:tdContent>
						<cps:tdLabel width="12%">卡口范围：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.kkfw}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">被盘查人身份证号：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.bpcrsfzh }
						</cps:tdContent>
						<cps:tdLabel width="12%">性别：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.bpcrxbmc }
						</cps:tdContent>
						<cps:tdLabel width="12%">出生日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.bpcrcsrq }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">姓名：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.bpcrxm }
						</cps:tdContent>
						<cps:tdLabel width="12%">户籍地：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.bpcrhjdxz }
						</cps:tdContent>
						<cps:tdLabel width="12%">现住地：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.bpcrxzdxz }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">处理结果：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.cljg }
						</cps:tdContent>
						<cps:tdLabel width="12%">车架号：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pcclcjh }
						</cps:tdContent>
						<cps:tdLabel width="12%">被盘查车辆类型：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pccllxmc }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">车牌号：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pcclcph }
						</cps:tdContent>
						<cps:tdLabel width="12%">发动机号：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pcclfdjh }
						</cps:tdContent>
						<cps:tdLabel width="12%">车牌所属人：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pcclcpssr }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">处理情况：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pcclqk }
						</cps:tdContent>
						<cps:tdLabel width="12%">盘查民警：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pcmjxm }
						</cps:tdContent>
						<cps:tdLabel width="12%">参与盘查人员：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.cypcry }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">盘查民警所在单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pcdwmc }
						</cps:tdContent>
						<cps:tdLabel width="12%">盘查原因：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pcyymc }
						</cps:tdContent>
						<cps:tdLabel width="12%">盘查时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pcsj }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">盘查地点：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.pcdd }
						</cps:tdContent>
						<cps:tdLabel width="12%">盘查类型：</cps:tdLabel>
						<cps:tdContent colspan="3">
							${kkpcxxBean.pclbmc }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">登记人：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.djrxm}
						</cps:tdContent>
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.djsj}
						</cps:tdContent>
						<cps:tdLabel width="12%">登记单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							${kkpcxxBean.djdwmc}
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
</creator:view>