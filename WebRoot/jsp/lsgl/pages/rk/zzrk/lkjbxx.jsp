<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	var csrq = $("#csrq").val();
	var xb = $("#xb").val();
	var sfjhsy = $("#sfjhsy").val();
	var age =daysBetween(csrq);
	if((xb == '2') && (age >= 16 && age <=49)){
		$("#jhsydiv").show();
	}
	
	function daysBetween(DateTwo){   
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
</script>
<cps:PanelView>
	<cps:tbar id="rkjbxxsavetbar">
		<cps:button value="保存" onclick="submitFormRkInfo(saveLdrkJbxxAfterCallback,'jzzxx')"></cps:button>
		<cps:button value="登记居住证"  onclick="openLdrkJzzxxPage();"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</cps:tbar>
	<cps:panel id="rkjbxx" title="人口基本信息" height="window" >
		<%@include file="/jsp/lsgl/pages/rk/newrkjbxx.jsp" %>
 		<%@include file="/jsp/lsgl/pages/rk/zzrk/dqzzxx.jsp" %>	
	</cps:panel>
</cps:PanelView>





