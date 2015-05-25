<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<cps:table>
		<cps:row>
			<cps:tdLabel width="12%">外文名称：</cps:tdLabel>
			<cps:tdContent width="25%">
				${dw.swdwBean.wmmc}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="12%">投资国家和地区：</cps:tdLabel>
			<cps:tdContent width="23%">
				${dw.swdwBean.tzgjdq}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="12%">中方投资单位：</cps:tdLabel>
			<cps:tdContent>
				${dw.swdwBean.zftzdw}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel  >外方投资单位：</cps:tdLabel>
			<cps:tdContent  >
				${dw.swdwBean.wftzdw}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>董事长：</cps:tdLabel>
			<cps:tdContent>
				${dw.swdwBean.dsz}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>副董事长：</cps:tdLabel>
			<cps:tdContent>
				${dw.swdwBean.fdsz}&nbsp;
			</cps:tdContent>
		</cps:row>

		<cps:row>
			<cps:tdLabel>总经理：</cps:tdLabel>
			<cps:tdContent>
				${dw.swdwBean.zjl}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>副总经理：</cps:tdLabel>
			<cps:tdContent>
				${dw.swdwBean.fzjl}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>联系人：</cps:tdLabel>
			<cps:tdContent>
				${dw.swdwBean.lxr}&nbsp;
			</cps:tdContent>
		</cps:row>

		<cps:row>
			<cps:tdLabel>涉外外方资本：</cps:tdLabel>
			<cps:tdContent>
				${dw.swdwBean.swwfzb}(万美元)
			</cps:tdContent>
			<cps:tdLabel>涉外中方资本：</cps:tdLabel>
			<cps:tdContent >
				${dw.swdwBean.swzfzb}(万元)
			</cps:tdContent>
			<cps:tdLabel>电子邮箱：</cps:tdLabel>
			<cps:tdContent>
				${dw.swdwBean.email}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>实际办公地址：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.swdwBean.sjbgdz}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>企业情况记载：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.swdwBean.qyqkjz}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.swdwBean.bz}&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:view>