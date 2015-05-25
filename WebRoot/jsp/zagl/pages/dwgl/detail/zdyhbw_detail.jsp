<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/zdyhbw_detail.js"></creator:Script>
	<creator:panel id="zdyhbw" title="重点要害部位">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="15%"> <font color="red">*</font>要害部位名称：</cps:tdLabel>
				<cps:tdContent colspan="5" id="bwmc">
					${dw.zdyhbw.bwmc}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="15%"><font color="red">*</font>部位责任人姓名：</cps:tdLabel>
				<cps:tdContent width="18%" id="zrr">
					${dw.zdyhbw.zrr}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="15%"> <font color="red">*</font>责任人身份证：</cps:tdLabel>
				<cps:tdContent width="18%" id="zrrsfzh">
					${dw.zdyhbw.zrrsfzh}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="15%">联系电话：</cps:tdLabel>
				<cps:tdContent id="zrrlxfs">
					${dw.zdyhbw.zrrlxfs}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>要害部位方位：</cps:tdLabel>
				<cps:tdContent colspan="5" id="fw">
					${dw.zdyhbw.fw}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>列入要害理由：</cps:tdLabel>
				<cps:tdContent colspan="5" id="lryhbwly">
					${dw.zdyhbw.lryhbwly}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>重要设备数量：</cps:tdLabel>
				<cps:tdContent id="zysb">
					${dw.zdyhbw.zysb}(台)
				</cps:tdContent>
				<cps:tdLabel>工作人员数：</cps:tdLabel>
				<cps:tdContent id="gzrs">
					${dw.zdyhbw.gzrs}(人)
				</cps:tdContent>
				<cps:tdLabel>经济价值：</cps:tdLabel>
				<cps:tdContent id="jjjz">
					${dw.zdyhbw.jjjz}(万元)
				</cps:tdContent>
			</cps:row>
	
			<cps:row>
				<cps:tdLabel>武警人数：</cps:tdLabel>
				<cps:tdContent id="wjrs">
					${dw.zdyhbw.wjrs}(人)
				</cps:tdContent>
	
				<cps:tdLabel>保安人数：</cps:tdLabel>
				<cps:tdContent id="bars">
					${dw.zdyhbw.bars}(人)
				</cps:tdContent>
				<cps:tdLabel id="hwdrs">护卫队人数：</cps:tdLabel>
				<cps:tdContent>
					${dw.zdyhbw.hwdrs}(人)
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>人防措施：</cps:tdLabel>
				<cps:tdContent id="rfcs">
					${dw.zdyhbw.rfcs}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>物防措施：</cps:tdLabel>
				<cps:tdContent id="wfcs">
					${dw.zdyhbw.wfcs}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>技防措施：</cps:tdLabel>
				<cps:tdContent id="jfcs">
					${dw.zdyhbw.jfcs}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>犬防措施：</cps:tdLabel>
				<cps:tdContent id="qfcs">
					${dw.zdyhbw.qfcs}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>安全防范标准：</cps:tdLabel>
				<cps:tdContent id="aqffbz">
					${dw.zdyhbw.aqffbz}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>保卫制度建立情况：</cps:tdLabel>
				<cps:tdContent id="bwzdjlqk">
					${dw.zdyhbw.bwzdjlqk}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5" id="bz">
					${dw.zdyhbw.bz}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>登记人：</cps:tdLabel>
				<cps:tdContent id="djrxm">
					${dw.zdyhbw.djrxm}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent id="djsj">
					${dw.zdyhbw.djsj}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent id="djdwmc">
					${dw.zdyhbw.djdwmc}&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</creator:view>	