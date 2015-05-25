<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="单位核实登记">
	<creator:Script src="/jsp/zagl/js/dwInfo.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/abss.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/abry.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/cyry.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/aqjc.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/dwjc.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/zdyhbw.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/dwzp.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/dw.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/bwjgList.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/tfsjyaList.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/badys.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/zhsg.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/aqyh.js"></creator:Script>
 
	<div style="height: 100%;">
		<div id="leftpanel" style="float: left; width: 13%;" class="cps-box-panel">
			<div id="header">
				<div id="head_title" style="text-align: center;" class="cps-box-title">
					<span id="dwtitle">单位信息</span>
				</div>
				<div id="dialog_leftmenu" class="dialog_leftmenu">
					<div id="dwjbxxinfo" class="dialog_menu_selected" onclick="goDwJbxxPage()">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;单位基本信息
					</div>
					
					<%-- 
					<div id="hllbinfo" style="display: none" onclick="goHylbInfoPageClick()">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;<span id="hylbtitleinfo">单位信息</span>
					</div>
					--%>
					
					<div id="toTzhy" onclick="goHylbInfoPageClick('01')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;特种行业信息
					</div>
					
					<div id="toGgcs" onclick="goHylbInfoPageClick('02')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;公共场所信息
					</div>
					
					<div id="toNbdw" onclick="goHylbInfoPageClick('03')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;企事业单位信息
					</div>
					
					<div id="toWxwp" onclick="goHylbInfoPageClick('04')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;危险品单位信息
					</div>
					
					<div id="toSwfwcs" onclick="goHylbInfoPageClick('05')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;上网服务场所
					</div>
					
					<div id="toSydw" onclick="goHylbInfoPageClick('06')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;涉外单位信息
					</div>
					
					<div id="toCyry" onclick="ajaxLoadDwPageInfo('toCyry')">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;从业人员信息
					</div>
					
					<div id="toAbss" onclick="ajaxLoadDwPageInfo('toAbss')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;安防系统信息
					</div>
					
					<div id="toAbry" onclick="ajaxLoadDwPageInfo('toAbry')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;安保人员信息
					</div>
					
					<div id="toBwjgList" onclick="ajaxLoadDwPageInfo('toBwjgList')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;保卫机构信息
					</div>
					
					<div id="toTfsjyaList" onclick="ajaxLoadDwPageInfo('toTfsjyaList')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;突发事件预案
					</div>
					
					<div id="toBadys" onclick="ajaxLoadDwPageInfo('toBadys')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;不安定因素
					</div>
					
					<div id="toZhsg" onclick="ajaxLoadDwPageInfo('toZhsg')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;灾害事故信息
					</div>
					
					<div id="toAqyh" onclick="ajaxLoadDwPageInfo('toAqyh')" style="display: none">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;安全隐患信息
					</div>
					
					<div id="toAqjc" onclick="ajaxLoadDwPageInfo('toAqjc')">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;安全检查信息
					</div>
					
					<div id="toDwjc" onclick="ajaxLoadDwPageInfo('toDwjc')">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;单位奖罚信息
					</div>
					<div id="toZdyhbw" onclick="ajaxLoadDwPageInfo('toZdyhbw')">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;重点要害部位
					</div>
					
					<div id="toDwaqsb" onclick="ajaxLoadDwPageInfo('toDwaqsb')">
						<img src="/CPS/template/cps/images/left_d01.jpg" />
						&nbsp;安全设备信息
					</div>
				</div>
			</div>
		</div>
		<form id="dw_form" enctype="multipart/form-data" method="post">
			<input type="hidden" id="operType" name="operType" value="${operType}"/>
			<input type="hidden" id="jgbh" name="dw.dwjbxx.jgbh" value="${dw.dwjbxx.jgbh}" />
			<input type="hidden" id="hylbhidden" value="${dw.dwjbxx.hylb}">
			<input type="hidden" id="dwmchidden" value="${dw.dwjbxx.dwmc}">
			<input type="hidden" id="dw_add_hylb" value="${dwcx.hylb}">
			<div id="contentpanel" style="float: right; width: 100%">
				<%@include file="/jsp/zagl/pages/dwgl/dwjbxx.jsp"%>
			</div>
		</form>
	</div>
</creator:view>

