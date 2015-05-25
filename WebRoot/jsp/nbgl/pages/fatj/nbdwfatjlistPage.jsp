<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view title="内保单位发案统计">
	<creator:Script src="/jsp/nbgl/js/nbfatj/nbfatj.js"></creator:Script>
	<creator:box>
	<!-- 内保单位发案统计 -->
		<creator:panel id="search" title="内保单位发案统计条件" tbarId="nbdyfatjquerytbar">
			<form id="queryNbdwfatjForm">
				<input type="hidden" id="djdwdm" name="query.djdwdm" value="${query.djdwdm}" />
				<cps:table>
					<cps:row>
						<cps:tdLabel>立案日期</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="query.ksrq" dateFmt="yyyyMMdd" cssStyle="width:12%" />
							至 
							<cps:date name="query.jzrq" dateFmt="yyyyMMdd" cssStyle="width:12%" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<creator:tbar id="nbdyfatjquerytbar">
			<cps:button id="nbdwfatjQueryButton" value="统计" onclick="querynbdwfatj()"></cps:button>
			<cps:button value="导出" onclick="toExportExcelnbdwfatj()"></cps:button>
		</creator:tbar>
		<creator:panel id="jgpanel" title="统计结果" tbarId="nbfatjquerytbar">
			<creator:tbar id="nbfatjquerytbar">
				<cps:button value="返回" onclick="rowBackNbdwfatj()"></cps:button>
			</creator:tbar>
			<input type="hidden" id="snum" name="snum" value="0"/>
			<div id="tjjgdiv" class="cps-panel-content" style="width: 99.8%;">
				<table class="cps-table-list"  style="width: 100%;" border="0" cellSpacing="0" cellPadding="0">
					<tbody>
						<tr> 
							<th style="text-align: center;"  rowspan="2" >案件类别</th>
							<th  style="text-align: center;"   colspan="4" >&nbsp;盗&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;窃&nbsp;</th>
							<th  style="text-align: center;"   rowspan="2" >抢劫</th>
						    <th  style="text-align: center;"   rowspan="2" >抢夺</th>
						    <th  style="text-align: center;"   rowspan="2" >电信诈骗</th>
						    <th  style="text-align: center;"   rowspan="2" >合计</th></tr>
						    <tr > <th style="text-align: center;" >扒窃</th>
						    <th  style="text-align: center;" >其他盗窃</th>
						    <th  style="text-align: center;"  >其他入室盗窃</th>
						    <th  style="text-align: center;" >入户盗窃</th> 
					    </tr>
				    </tbody>
			    </table>
			</div>
		</creator:panel>
		
	</creator:box>
	<div style="display:none">
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
</creator:view>