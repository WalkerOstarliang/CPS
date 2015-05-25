<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/aqjc_detail.js"></creator:Script>
	<creator:panel id="aqjc" title="单位安全检查">
		<cps:table>
			<cps:row>
				<cps:tdLabel>
					<font color="red">*</font>检查人员：</cps:tdLabel>
				<cps:tdContent id="jcryxm">
					${dw.aqjc.jcryxm}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="12%">
					<font color="red">*</font>检查单位：</cps:tdLabel>
				<cps:tdContent width="22%" id="jcdwmc">
					${dw.aqjc.jcdwmc}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="10%">
					<font color="red">*</font>检查日期：</cps:tdLabel>
				<cps:tdContent id="jcsj">
					${dw.aqjc.jcsj}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
	
				<cps:tdLabel width="13%">被检查单位负责人：</cps:tdLabel>
				<cps:tdContent width="22%" id="bjcdwfzr">
					${dw.aqjc.bjcdwfzr}&nbsp;
				</cps:tdContent>
	
				<cps:tdLabel>见证人：</cps:tdLabel>
				<cps:tdContent id="jcjzr">
					${dw.aqjc.jcjzr}&nbsp;
				</cps:tdContent>
	
				<cps:tdLabel>记录人：</cps:tdLabel>
				<cps:tdContent id="jcjlr">
					${dw.aqjc.jcjlr}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>
					<font color="red">*</font>检查内容：</cps:tdLabel>
				<cps:tdContent colspan="5" id="jcnr">
					${dw.aqjc.jcnr}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>检查部位：</cps:tdLabel>
				<cps:tdContent colspan="5" id="jcbw">
					${dw.aqjc.jcbw}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>检查情况：</cps:tdLabel>
				<cps:tdContent colspan="5" id="jcqk">
					${dw.aqjc.jcqk}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">发现问题：</cps:tdLabel>
				<cps:tdContent colspan="5" id="fxwt">
					${dw.aqjc.fxwt}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">检查处理情况：</cps:tdLabel>
				<cps:tdContent colspan="3" id="jcclqk">
					${dw.aqjc.jcclqkmc}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="13%">限期整改日期：</cps:tdLabel>
				<cps:tdContent width="22%" id="jcxqzgrq">
					${dw.aqjc.jcxqzgrq}&nbsp;
				</cps:tdContent>
			</cps:row>
	
			<cps:row>
				<cps:tdLabel>处理意见：</cps:tdLabel>
				<cps:tdContent colspan="5" id="jcclyj">
					${dw.aqjc.jcclyj}&nbsp;
				</cps:tdContent>
			</cps:row>
	
			<cps:row>
				<cps:tdLabel>被检查单位意见：</cps:tdLabel>
				<cps:tdContent colspan="5" id="bjcdwyj">
					${dw.aqjc.bjcdwyj}&nbsp;
				</cps:tdContent>
			</cps:row>
	
			<cps:row>
				<cps:tdLabel>整改结果：</cps:tdLabel>
				<cps:tdContent colspan="5" id="jczgjg">
					${dw.aqjc.jczgjg}&nbsp;
				</cps:tdContent>
			</cps:row>
	
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5" id="bz">
					${dw.aqjc.bz}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">录入人：</cps:tdLabel>
				<cps:tdContent width="22%" id="djrxm">
					${dw.aqjc.djrxm}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="13%">录入单位：</cps:tdLabel>
				<cps:tdContent id="djdwmc">
					${dw.aqjc.djdwmc}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="10%">录入时间：</cps:tdLabel>
				<cps:tdContent width="22%" id="djsj">
					${dw.aqjc.djsj}&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</creator:view>
