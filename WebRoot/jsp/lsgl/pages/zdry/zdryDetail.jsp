<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:table>
	<cps:row>
		<cps:tdLabel width="12%">重点人员编号：</cps:tdLabel>
		<cps:tdContent width="25%">${zdryBean.zdrybh}&nbsp;</cps:tdContent>
		<cps:tdLabel width="12%">重点人员类别：</cps:tdLabel>
		<cps:tdContent width="25%">${zdryBean.zdrylbbjmc}&nbsp;</cps:tdContent>
		<cps:tdLabel width="12%">重点人员细类：</cps:tdLabel>
		<cps:tdContent width="22%">${zdryBean.zdryxlmc}&nbsp;</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>管辖单位：</cps:tdLabel>
		<cps:tdContent>${zdryBean.gxdwmc}&nbsp;</cps:tdContent>
		<cps:tdLabel width="12%">纳入部级时间：</cps:tdLabel>
		<cps:tdContent>${zdryBean.nrbjzdryksj}&nbsp;</cps:tdContent>
		<cps:tdLabel>最近立案时间：</cps:tdLabel>
		<cps:tdContent>${zdryBean.zxlasj}&nbsp;</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel><font color="red">*</font>对象类别：</cps:tdLabel>
		<cps:tdContent>${zdryBean.dxlbmc}&nbsp;</cps:tdContent>
		<cps:tdLabel>立案单位：</cps:tdLabel>
		<cps:tdContent>${zdryBean.ladw}&nbsp;</cps:tdContent>
		<cps:tdLabel>刑满解救时间：</cps:tdLabel>
		<cps:tdContent>${zdryBean.xmjjzs}&nbsp;</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>涉案类别：</cps:tdLabel>
		<cps:tdContent >${zdryBean.salbmc}&nbsp;</cps:tdContent>
		<cps:tdLabel>从业状况：</cps:tdLabel>
		<cps:tdContent>${zdryBean.cyzkmc}&nbsp;</cps:tdContent>
		<cps:tdLabel>在逃类别：</cps:tdLabel>
		<cps:tdContent>${zdryBean.ztlxmc}&nbsp;</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>管理方法：</cps:tdLabel>
		<cps:tdContent>${zdryBean.glffmc}&nbsp;</cps:tdContent>
		<cps:tdLabel>管理类别：</cps:tdLabel>
		<cps:tdContent  colspan="3">${zdryBean.gllb}&nbsp;</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>有无档案：</cps:tdLabel>
		<cps:tdContent>${zdryBean.ywdamc}&nbsp;</cps:tdContent>
		<cps:tdLabel>档案编号：</cps:tdLabel>
		<cps:tdContent>${zdryBean.dabh}&nbsp;</cps:tdContent>
		<cps:tdLabel>是否指纹采集：</cps:tdLabel>
		<cps:tdContent>${zdryBean.iscjzwmc}&nbsp;</cps:tdContent>
	</cps:row>
	<cps:row>
		
		<cps:tdLabel>是否笔记采集：</cps:tdLabel>
		<cps:tdContent>${zdryBean.iscjbjmc}&nbsp;</cps:tdContent>
		<cps:tdLabel>笔记采集类型：</cps:tdLabel>
		<cps:tdContent>${zdryBean.bjcjlxmc}&nbsp;</cps:tdContent>
		<cps:tdLabel>法律文书编号：</cps:tdLabel>
		<cps:tdContent>${zdryBean.flwsbh}&nbsp;</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>法律文书名称：</cps:tdLabel>
		<cps:tdContent>${zdryBean.flwsmc}&nbsp;</cps:tdContent>
		<cps:tdLabel>签发机关：</cps:tdLabel>
		<cps:tdContent>${zdryBean.qfjg}&nbsp;</cps:tdContent>
		<cps:tdLabel>签发时间：</cps:tdLabel>
		<cps:tdContent>${zdryBean.qfsj}&nbsp;</cps:tdContent>
	</cps:row>

	<cps:row>
		<cps:tdLabel width="12%">曾被处理情况：</cps:tdLabel>
		<cps:tdContent colspan="5" >${zdryBean.cbclqk}&nbsp;</cps:tdContent>
	</cps:row>
</cps:table>	