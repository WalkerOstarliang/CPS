<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/rkinfo.js"></creator:Script>
	<script type="text/javascript">
		var isydj = "${rkBean.ldrkBean.zzbh != null && rkBean.ldrkBean.zzbh != ''}";
		var opentip = "${opentip}";
		var operType = "${operType}";
		if (operType=="add" && opentip=="true" && isydj == "true")
		{
			if(!confirm("${rkBean.jbxxBean.xm}在房屋【${rkBean.fwxxBean.dzmc}】已经登记，确定继续登记吗？"))
			{
				parent.close();
			}
		}
		
		function daysBetween(DateTwo)
		{   
		 	var now = new Date();
		  	var OneYear = now.getFullYear();
		  	var OneMonth = now.getMonth()+1;
		  	var OneDay = now.getDate();
		  
		    var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));  
		    var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);  
		    var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));  
		  
		    var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000/365);   
		  	var age = Math.abs(cha)+1+"";
		  	
		    return age.split(".")[0];
		}
		
		$(function(){
			var csrq = $("#csrq").val();
			var xb = $("#xb").val();
			var sfjhsy = $("#sfjhsy").val();
			var age =daysBetween(csrq);
			if((xb == '2') && (age >= 16 && age <=49))
			{
				$("#jhsydiv").show();
			}
		})
	</script>
	<form id="rkxxform" method="post">
		<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${rkBean.jbxxBean.rybh}"/>
		<input type="hidden" id="cyrybh" name="queryBean.cyrybh" value="${queryBean.cyrybh}">
		<cps:PanelView>
			<cps:tbar>
				<cps:button id="savebtn" value="保存" onclick="saveLdrkInfo()"></cps:button>
				<cps:button value="登记居住证"  onclick="openLdrkJzzxxPage();"></cps:button>
				<cps:button value="关闭" onclick="closeWindow()"></cps:button>
			</cps:tbar>
			<cps:panel id="wlhrkjbxx" title="人口基本信息"  height="720px">
				<%@include file="/jsp/lsgl/pages/rk/newrkjbxx.jsp" %>
				<%@include file="/jsp/lsgl/pages/rk/zzrk/dqzzxx.jsp"%>
			</cps:panel>
		</cps:PanelView>
	</form>
</creator:view>