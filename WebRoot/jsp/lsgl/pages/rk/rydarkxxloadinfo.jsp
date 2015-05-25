<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:panel id="ryjbxxpanel" title="人员基本信息">
	<%@include file="/jsp/lsgl/pages/rk/detailrkjbxx.jsp"%>
</creator:panel>
<creator:panel id="rydaxxpanel" title="人员档案信息"  >
	<div style="height: 100%;">
		<div id="leftpanel" style="float: left;width:12.7%;border: 2px solid #DFF0F8;">
				<div id="header">			
<!--					<div id="head_title" style="text-align: center;" class="cps-box-title">${modename}</div>-->
				<div id="dialog_leftmenu" class="dialog_leftmenu">
				   <!-- 
					<%--常住人口 --%>
					<c:if test="${queryBean.rylb == '1'}">
						<div id="ryglczrkinfo" onclick="initPage('ryglczrkinfo','1')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;人口基本信息</div>
			    		<div id="rklshkxxlist" onclick="initPage('rklshkxxlist','2')" ><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;户口迁移信息</div>
					</c:if>
					<%--流动人口 --%>
					<c:if test="${queryBean.rylb == '2'}">
						<div id="rygllkjbxx" onclick="initPage('rygllkjbxx','1')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;流口基本信息</div>
			    		<div id="zzrklist" onclick="initPage('zzrklist','2')" ><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;历史暂住信息</div>
					</c:if>
					<%--未落户人口 --%>
					<c:if test="${queryBean.rylb == '3'}">
						<div id="ryglwlhrkjbxx" onclick="initPage('ryglwlhrkjbxx','1')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;人口基本信息</div>
			    		<div id="lswlhjllist" onclick="initPage('lswlhjllist','2')" ><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;历史未落户信息</div>
					</c:if>
					
					<%--境外人员 --%>
					<c:if test="${queryBean.rylb == '4'}">
						<div id="jwrkinfo" onclick="initPage('jwrkinfo','1')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;人员基本信息</div>
			    		<div id="jwrklsjzxx" onclick="initPage('jwrklsjzxx','2')" ><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;历史居住信息</div>
					</c:if>
					
					<%--寄住人口 --%>
					<c:if test="${queryBean.rylb == '5'}">
						<div id="rygljzjbxx" onclick="initPage('rygljzjbxx','1')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;寄住基本信息</div>
			    		<div id="jzrklist" onclick="initPage('jzrklist','2')" ><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;历史寄住信息</div>
					</c:if>
					 -->
					<%--
					<div id="rklshkxxlist"  onclick="initPage('rklshkxxlist','2','1')" ><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;历史常住信息</div>
			    	<div id="zzrklist" 		onclick="initPage('zzrklist','2','2')" >    <img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;历史居住信息</div>
			    	<div id="jzrklist" 		onclick="initPage('jzrklist','2','5')" > 	<img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;历史寄住信息</div>
			    	--%>
			    	<div id="lsjzxxlist"    onclick="initPage('lsjzxxlist','1')" > 	<img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;历史居住信息</div>
			    	<div id="rkzpxx" onclick="initPage('rkzpxx','3')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;人口照片信息</div>
			    	<div id="shgxxx" onclick="initPage('shgxxx','4')" ><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;社会关系信息</div>
			    	<div id="tmtzxx" onclick="initPage('tmtzxx','5')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;体貌特征信息</div>
			    	<div id="lxfsxx" onclick="initPage('lxfsxx','6')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;联系方式信息</div>
					<div id="thryxx" onclick="initPage('thryxx','7')" ><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;同户人员信息</div>
			    	<div id="tzryxx" onclick="initPage('tzryxx','8')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;同址人员信息</div>
			    	<div id="cylsxx" onclick="initPage('cylsxx','9')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;从业历史信息</div>
					<div id="syfcxx" onclick="initPage('syfcxx','10')"><img src="/CPS/template/cps/images/left_d01.jpg" />&nbsp;所有房产信息</div>
				</div>
			</div>
		</div>
		<form id="rkxxform" enctype="multipart/form-data" method="post">
			<input type="hidden" id="msgtype" name="msgtype" value="${msgtype}"/>
			<input type="hidden" id="operType" name="operType" value="${operType}"/>
			<input type="hidden" id="rylb" name="rkBean.rylb" value="${queryBean.rylb}"/>
			<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${queryBean.rybh }"/>
			<input type="hidden" id="jsppage" value=""/>
			<div id="contentpanel" style="float: right;width:86%;">
			</div>
		</form>
	</div>
</creator:panel>
 

	