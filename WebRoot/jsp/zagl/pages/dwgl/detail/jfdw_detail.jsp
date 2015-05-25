<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<cps:table>
		<cps:row>
			<cps:tdLabel><font color="red">*</font>备案类型：</cps:tdLabel>
			<cps:tdContent width="18%">
				${dw.jfdw.balxmc}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel width="16%">室外电视监控探头(个)：</cps:tdLabel>
			<cps:tdContent width="18%">
				${dw.jfdw.swdsjktt}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel width="15%">室内探头(个)：</cps:tdLabel>
			<cps:tdContent width="18%">
				${dw.jfdw.sntt}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>周界报警及门禁系统：</cps:tdLabel>
			<cps:tdContent>
				${dw.jfdw.zjbjjmjxtmc}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>110联网报警：</cps:tdLabel>
			<cps:tdContent>
				${dw.jfdw.lwbjmc}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>要害部防盗门窗：</cps:tdLabel>
			<cps:tdContent>
				${dw.jfdw.yhbwfdmc_mc}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.jfdw.bz}&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:view>