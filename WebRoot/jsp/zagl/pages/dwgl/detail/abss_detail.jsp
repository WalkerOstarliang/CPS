<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/abss_detail.js"></creator:Script>
	<cps:tableGrid list="${dw.abssList}" id="abssList" autoload="true"
			width="99.5%" height="150" isAsynch="false" click="loadAfxt"
			mutilSelect="false" usepager="false">
		<cps:column isNumber="true" title="序号" width="5%"></cps:column>
		<cps:column title="系统名称" field="xtmc"></cps:column>
		<cps:column title="安防管理属性" field="afglsxmc" ></cps:column>
		<cps:column title="系统检测情况" field="xtjcqk" ></cps:column>
		<cps:column title="管理员" field="afxtgly"></cps:column>
		<cps:column title="值守电话" field="afxtzsdh" ></cps:column>
	</cps:tableGrid>
		
	<div style="height:5px"></div>
	
	<cps:table>
		<cps:row>
			<cps:tdLabel>
				<font color="red">*</font>系统名称：</cps:tdLabel>
			<cps:tdContent id="xtmc">
				&nbsp;
			</cps:tdContent>
	
			<cps:tdLabel>验收单位：</cps:tdLabel>
			<cps:tdContent id="ysdwmc">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>使用单位名称：</cps:tdLabel>
			<cps:tdContent id="sydwmc">
				&nbsp;
			</cps:tdContent>
		</cps:row>
	
		<cps:row>
			<cps:tdLabel>使用单位地址：</cps:tdLabel>
			<cps:tdContent colspan="5" id="sydwdz">
				&nbsp;
			</cps:tdContent>
		</cps:row>
	
		<cps:row>
			<cps:tdLabel>系统检测情况：</cps:tdLabel>
			<cps:tdContent id="xtjcqkmc">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>安防管理属性：</cps:tdLabel>
			<cps:tdContent colspan="3" id="afglsxmc">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>安防系统管理员：</cps:tdLabel>
			<cps:tdContent id="afxtgly">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>安防系统值守电话：</cps:tdLabel>
			<cps:tdContent id="afxtzsdh">
				&nbsp;
			</cps:tdContent>
			<cps:tdLabel>有无入侵报警子系统：</cps:tdLabel>
			<cps:tdContent id="ywrqbjzxt">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>入侵报警子系统联网情况：</cps:tdLabel>
			<cps:tdContent id="rqxtlwqkmc">
				&nbsp;
			</cps:tdContent>
			<cps:tdLabel>探测器数量：</cps:tdLabel>
			<cps:tdContent id="tcqsl">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>固定目标数：</cps:tdLabel>
			<cps:tdContent id="gdmbs">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>移动目标数：</cps:tdLabel>
			<cps:tdContent id="ydmbs">
				&nbsp;
			</cps:tdContent>
			<cps:tdLabel>有无视频监控子系统：</cps:tdLabel>
			<cps:tdContent id="ywspjkzxt">
				&nbsp;
			</cps:tdContent>
			<cps:tdLabel>施工单位：</cps:tdLabel>
			<cps:tdContent id="sgdw">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>摄像机数量：</cps:tdLabel>
			<cps:tdContent id="sxjsl">
				&nbsp;
			</cps:tdContent>
				
			<cps:tdLabel>视频监控子系统联网情况：</cps:tdLabel>
			<cps:tdContent id="spjkxtlwqkmc">
				&nbsp;
			</cps:tdContent>
				
			<cps:tdLabel>图像保存天数：</cps:tdLabel>
			<cps:tdContent id="txbcts">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>运行情况：</cps:tdLabel>
			<cps:tdContent id="yxqkmc">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>系统造价(万元)：</cps:tdLabel>
			<cps:tdContent id="xtzj">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>&nbsp;</cps:tdLabel>
			<cps:tdContent>&nbsp;</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>有无出入口监控子系统：</cps:tdLabel>
			<cps:tdContent id="ywcrkjkzxt">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>有无电子巡查子系统：</cps:tdLabel>
			<cps:tdContent id="ywdzxcxt">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>有无停车库管理子系统：</cps:tdLabel>
			<cps:tdContent id="ywtckglzxt">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel width="15%">登记人：</cps:tdLabel>
			<cps:tdContent width="18%" id="djrxm">
				&nbsp;
			</cps:tdContent>
	
			<cps:tdLabel width="15%">登记时间：</cps:tdLabel>
			<cps:tdContent width="18%" id="djsj">
				&nbsp;
			</cps:tdContent>
	
			<cps:tdLabel width="15%">登记单位：</cps:tdLabel>
			<cps:tdContent id="djdwmc">
				&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:view>



