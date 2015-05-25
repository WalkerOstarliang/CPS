<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<cps:table>
		<cps:row>
			<cps:tdLabel width="13%">重点人员编号：</cps:tdLabel>
			<cps:tdContent width="16%">
				${ckxx.ckyj.zdrybh}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel width="13%">重点人员姓名：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.zdryxm}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel  width="13%">公民身份证号码：</cps:tdLabel>
			<cps:tdContent width="16%">
				${ckxx.ckyj.sfzh}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel rowspan="5" width="120">
				<img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${ckxx.ckyj.sfzh}" width="120px" height="130px" title="全国人口库照片" alt="全国人口库照片"/>
			</cps:tdLabel>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>重点人员外文名：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.zdrywwxm}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>其他证件号码：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.qtzjhm}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>人员类别标识：</cps:tdLabel>
			
			<cps:tdContent>
				${ckxx.ckyj.zdrylbbjmc}&nbsp;
			</cps:tdContent>
		</cps:row>
	
		<cps:row>
			<cps:tdLabel>重点人员细类：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.zdryxlmc}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>活动发生地点：</cps:tdLabel>
			<cps:tdContent colspan="3">
				${ckxx.ckyj.hdfsddxz}&nbsp;
			</cps:tdContent>
		</cps:row>
			
		<cps:row>
			<cps:tdLabel>活动发生时间：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.hdfssj}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>所属社会场所：</cps:tdLabel>
			<cps:tdContent colspan="3">
				${ckxx.ckyj.hdfsddssshcs}&nbsp;
			</cps:tdContent>
		</cps:row>
	
		<cps:row>
			<cps:tdLabel>预警信息编号：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.yjxxbh}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>发文字号：</cps:tdLabel>
			<cps:tdContent colspan="3">
				${ckxx.ckyj.fwzh}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>预警级别：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.yjjbmc}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>动态信息类别：</cps:tdLabel>
			<cps:tdContent colspan="4">
				${ckxx.ckyj.dtxxlbmc}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>发布人：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.fbrxm}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>发布时间：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.yjfbsj}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>发布单位：</cps:tdLabel>
			<cps:tdContent colspan='2'>
				${ckxx.ckyj.fbdw}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>动态轨迹编号：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.dtgjxxbh}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>所属公安机关：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.hdfsddssgajg}&nbsp;
			</cps:tdContent>
		
			<cps:tdLabel>信息提供单位：</cps:tdLabel>
			<cps:tdContent colspan="2">
				${ckxx.ckyj.dtxxtgdw}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>签收时限：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.qssx}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>首次反馈时限：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.scczfksx}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>预警接收单位：</cps:tdLabel>
			<cps:tdContent colspan="2">
				${ckxx.ckyj.yjjsdwmc}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>省市县（区）：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.hdfsddqhmc}&nbsp;
			</cps:tdContent>
		
			<cps:tdLabel>信息比对时间：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.xxbdsj}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>信息比对单位：</cps:tdLabel>
			<cps:tdContent colspan="2">
				${ckxx.ckyj.xxbddw}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>处置要求：</cps:tdLabel>
			<cps:tdContent colspan="6">
				${ckxx.ckyj.czyq}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>活动相关信息：</cps:tdLabel>
			<cps:tdContent colspan='6'>
				${ckxx.ckyj.hdxgxx}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>登记姓名：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.djxm}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>入库时间：</cps:tdLabel>
			<cps:tdContent>
				${ckxx.ckyj.rksj}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>&nbsp;</cps:tdLabel>
			<cps:tdContent colspan="2">&nbsp;</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:view>