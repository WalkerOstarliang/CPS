<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/ksy_detail.js"></creator:Script>
	<creator:panel id="thksy" title="特行开锁业信息">
		<input type="hidden" id="kslx" value="${dw.thksyBean.kslx}"/>
		<cps:table>
			<cps:row>
				<cps:tdLabel>开锁类型：</cps:tdLabel>
				<cps:tdContent colspan="5" id="kslxTD">
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>开业时间：</cps:tdLabel>
				<cps:tdContent>
					${dw.thksyBean.kysj}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>服务区域：</cps:tdLabel>
				<cps:tdContent >
					${dw.thksyBean.fwqy}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>主管公司：</cps:tdLabel>
				<cps:tdContent>
					${dw.thksyBean.zggs}&nbsp;
				</cps:tdContent>
			</cps:row>
			 
			 <cps:row>
				<cps:tdLabel>备注职工数：</cps:tdLabel>
				<cps:tdContent>
					${dw.thksyBean.bdzgs}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>外地职工数：</cps:tdLabel>
				<cps:tdContent>
					${dw.thksyBean.bdzgs}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			 
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					${dw.thksyBean.bz}&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</creator:view>	
