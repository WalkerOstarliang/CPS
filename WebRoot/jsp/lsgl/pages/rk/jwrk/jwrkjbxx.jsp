<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	function getxm(){
		var ywm = $("#ywm").val();
		$("#xm").val(ywm);
	}
</script>
<div id="jwrkjbxx">
	<cps:table>
		<cps:row>
			<cps:tdLabel width="10%"><font color="red">*</font>国籍：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:select zdlb="GB_GJ" id="gj" name="rkBean.jbxxBean.gj" value="${rkBean.jbxxBean.gj}" required="true" enableEdit="true"  headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>证件种类：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:select zdlb="GB_ZJZL" id="zjzl" name="rkBean.jbxxBean.zjzl" value="${rkBean.jbxxBean.zjzl}" enableEdit="true" required="true" headerKey="" headerValue="  "></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>证件号码：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zjhm" name="rkBean.jbxxBean.zjhm" value="${rkBean.jbxxBean.zjhm}" required="true" maxlength="30"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel><font color="red">*</font>英文姓：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="ywm" name="rkBean.jwrkBean.ywx" value="${rkBean.jwrkBean.ywx}" required="true" maxlength="50" inputType="onlychar"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>英文名：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="ywm" name="rkBean.jwrkBean.ywm" value="${rkBean.jwrkBean.ywm}" required="true" maxlength="50" inputType="onlychar"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>中文姓名：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="xm" name="rkBean.jbxxBean.xm" value="${rkBean.jbxxBean.xm}" maxlength="15"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel><font color="red">*</font>性别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="GB_XB" id="xb" name="rkBean.jbxxBean.xb" value="${rkBean.jbxxBean.xb}" required="true" headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
			<cps:tdLabel>出生日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="csrq" name="rkBean.jbxxBean.csrq" value="${rkBean.jbxxBean.csrq}" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}"></cps:date>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>联系电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="lxdh" name="rkBean.jbxxBean.lxdh" isPhone="true" value="${rkBean.jbxxBean.lxdh}" maxlength="60" required="true" minlength="7"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>服务处所：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="fwcs" name="rkBean.jbxxBean.fwcs" value="${rkBean.jbxxBean.fwcs}" maxlength="60" ></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>职务：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zw" name="rkBean.jbxxBean.zw" value="${rkBean.jbxxBean.zw}" maxlength="35"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>电话备注：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="lxdhbz" name="rkBean.jbxxBean.lxdhbz" value="${rkBean.jbxxBean.lxdhbz}" maxlength="10"></cps:textfield>
			</cps:tdContent>
		</cps:row>
	</cps:table>
</div>