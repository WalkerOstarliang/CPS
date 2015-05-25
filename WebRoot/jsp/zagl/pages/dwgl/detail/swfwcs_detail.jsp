<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<cps:table>
		<cps:row>
			<cps:tdLabel width="15%">网吧编号：</cps:tdLabel>
			<cps:tdContent width="18%">
				${dw.swfwcs.wbbh}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="15%">宽带接入服务商：</cps:tdLabel>
			<cps:tdContent width="18%">
				${dw.swfwcs.kdjrfws}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="15%">接入方式：</cps:tdLabel>
			<cps:tdContent>
				${dw.swfwcs.jrfsmc}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel width="16%">网络文化经营许可证号：</cps:tdLabel>
			<cps:tdContent width="20%">
				${dw.swfwcs.wlwhxkzh}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>电脑台数：</cps:tdLabel>
			<cps:tdContent>
				${dw.swfwcs.dnts}(台)
			</cps:tdContent>
			
			<cps:tdLabel>临时上网卡数量：</cps:tdLabel>
			<cps:tdContent>
				${dw.swfwcs.lsswksl}(块)
			</cps:tdContent>
		</cps:row>

		<cps:row>
			<cps:tdLabel>网络安全审核意见书号：</cps:tdLabel>
			<cps:tdContent>
				${dw.swfwcs.wlaqshyjsh}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>营业面积：</cps:tdLabel>
			<cps:tdContent>
				${dw.swfwcs.yymj}(㎡)
			</cps:tdContent>
			<cps:tdLabel>&nbsp;</cps:tdLabel>
			<cps:tdContent>
				 &nbsp;
			</cps:tdContent>
		</cps:row>

		<cps:row>
			<cps:tdLabel>消防审核意见书号：</cps:tdLabel>
			<cps:tdContent>
				${dw.swfwcs.xfshyjsh}&nbsp;
			</cps:tdContent>
			<cps:tdLabel >现使用IP：</cps:tdLabel>
			<cps:tdContent colspan="3">
				${dw.swfwcs.xsyip}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.swfwcs.bz}&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:view>