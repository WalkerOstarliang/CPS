<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/dwDetailMenu.js"></creator:Script>
	<div id="menu" class="dialog_leftmenu" style="padding:0px;margin:0px;" style="overflow-y:auto;overflow-x:hidden;">
	
		<!-- class="dialog_menu_selected" -->
		
		<div id="hllbinfo_01" onclick="menuClick('toDwInfoDetail',this,'01')" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;特种行业信息</div>
		<div id="hllbinfo_02" onclick="menuClick('toDwInfoDetail',this,'02')" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;公共场所信息</div>
		<div id="hllbinfo_03" onclick="menuClick('toDwInfoDetail',this,'03')" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;企事业单位信息</div>
		<div id="hllbinfo_04" onclick="menuClick('toDwInfoDetail',this,'04')" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;危险品单位信息</div>
		<div id="hllbinfo_05" onclick="menuClick('toDwInfoDetail',this,'05')" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;上网服务场所</div>
		<div id="hllbinfo_06" onclick="menuClick('toDwInfoDetail',this,'06')" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;涉外单位信息</div>
		<div id="hllbinfo_09" onclick="menuClick('toDwInfoDetail',this,'09')" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;技防单位信息</div>
		
		<div id="cyry" onclick="menuClick('toDwCyryDetail',this)"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;从业人员信息</div>
		<div id="lscyry" onclick="menuClick('toDwCyryDetail',this)"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;历史从业人员</div>
		<div id="afxt" onclick="menuClick('toAbssDetail',this)" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;安防系统信息</div>
		<div id="abry" onclick="menuClick('toDwCyryDetail',this)" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;安保人员信息</div>
		<div id="bwjg" onclick="menuClick('toBwjgListDetail',this)" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;保卫机构信息</div>
		<div id="tfsj" onclick="menuClick('toTfsjyaListDetail',this)" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;突发事件预案</div>
		<div id="badys" onclick="menuClick('toBadysDetail',this)" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;不安定因素</div>
		<div id="zhsg" onclick="menuClick('toZhsgDetail',this)" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;灾害事故信息</div>
		<div id="aqyh" onclick="menuClick('toAqyhDetail',this)" style="display:none"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;安全隐患信息</div>
		<div id="aqjc" onclick="menuClick('toAqjcList',this)"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;安全检查信息</div>
		<div id="dwjc" onclick="menuClick('toDwjcList',this)"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;单位奖罚信息</div>
		<div id="zdyhbw" onclick="menuClick('toZdyhbwList',this)"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;重点要害部位</div>
		<div id="aqsb" onclick="menuClick('toAqsbDetail',this)"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;安全设备信息</div>
		<div id="dwzp" onclick="menuClick('toDwzpDetail',this)"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;单位照片信息</div>
	</div>
</creator:view>
