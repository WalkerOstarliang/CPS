<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:table id="rkjbxxtable">
	<input id="loginhjdqh" value="${loginInfo.orgcode}" type="hidden">
	<input id="loginhjdqhmc" value="${loginInfo.orgname}" type="hidden">
	<cps:row>
		<cps:tdLabel width="12%"><font color="red">*</font>身份证号：</cps:tdLabel>
		<cps:tdContent width="25%">
			<cps:textfield id="sfzh" name="rkBean.jbxxBean.sfzh" value="${rkBean.jbxxBean.sfzh}" isSfzh="true" readonly="true" required="true"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel width="12%"><font color="red">*</font>姓名：</cps:tdLabel>
		<cps:tdContent width="25%">
			<cps:textfield id="xm" name="rkBean.jbxxBean.xm" value="${rkBean.jbxxBean.xm}" required="true" readonly="true" maxlength="15"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel width="10%">性别：</cps:tdLabel>
		<cps:tdContent>
			<input type="hidden" id="xb_hidden" name="rkBean.jbxxBean.xb" value="${rkBean.jbxxBean.xb}"/>
			<cps:select zdlb="GB_XB" id="xb" name="rkBean.jbxxBean.xbms" value="${rkBean.jbxxBean.xb}" disabled="true" headerKey=""  headerValue=" " onchange="xb_hidden.value=this.value"></cps:select>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>出生日期：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="csrq" name="rkBean.jbxxBean.csrq" value="${rkBean.jbxxBean.csrq}" readonly="true"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>民族：</cps:tdLabel>
		<cps:tdContent>
			<input type="hidden" id="mz_hidden" name="rkBean.jbxxBean.mz" value="${rkBean.jbxxBean.mz}"/>
			<cps:select zdlb="GB_MZ" id="mz" name="rkBean.jbxxBean.mzms" value="${rkBean.jbxxBean.mz}" headerKey="" headerValue=" " disabled="true" onchange="mz_hidden.value=this.value"></cps:select>
		</cps:tdContent>
		<cps:tdLabel>婚姻状况：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="AF_HYZK" id="hyzk" name="rkBean.jbxxBean.hyzk" value="${rkBean.jbxxBean.hyzk}" headerKey="" headerValue=" " onchange="validatehyzk(this.value);"></cps:select>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel width="10%">别名/绰号：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="bmch" name="rkBean.jbxxBean.bmch" value="${rkBean.jbxxBean.bmch}" maxlength="15"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>兵役状况：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="GB_BYZK" id="byzk" name="rkBean.jbxxBean.byzk" value="${rkBean.jbxxBean.byzk}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		<cps:tdLabel>文化程度：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="GB_WHCD" id="whcd" name="rkBean.jbxxBean.whcd" value="${rkBean.jbxxBean.whcd}" headerKey="" headerValue=" " onchange="validatewhcd(this.value);"></cps:select>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>政治面貌：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="GB_ZZMM" id="zzmm" name="rkBean.jbxxBean.zzmm" value="${rkBean.jbxxBean.zzmm}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		<cps:tdLabel>宗教信仰：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="ZJXY" id="zzxy" name="rkBean.jbxxBean.zzxy" value="${rkBean.jbxxBean.zzxy}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		<cps:tdLabel>血型：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="GB_XX" id="xx" name="rkBean.jbxxBean.xx" value="${rkBean.jbxxBean.xx}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>身高(㎝)：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="sg" inputType="number" name="rkBean.jbxxBean.sg" value="${rkBean.jbxxBean.sg}" maxlength="3"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel><font color="red">*</font>联系电话：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="lxdh" name="rkBean.jbxxBean.lxdh" value="${rkBean.jbxxBean.lxdh}" maxlength="20" minlength="7" isPhone="true" required="true"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>电话备注：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="lxdhbz" name="rkBean.jbxxBean.lxdhbz" value="${rkBean.jbxxBean.lxdhbz}" maxlength="50" ></cps:textfield>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>身份：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="GA_SF" id="sf" name="rkBean.jbxxBean.sf" value="${rkBean.jbxxBean.sf}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		<cps:tdLabel>职业：</cps:tdLabel>
		<cps:tdContent>
			<cps:select id="zydm" zdlb="ZAGL_RY_ZY" name="rkBean.jbxxBean.zydm" value="${rkBean.jbxxBean.zydm}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		<cps:tdLabel>服务处所：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="fwcs" name="rkBean.jbxxBean.fwcs" value="${rkBean.jbxxBean.fwcs}" maxlength="60"></cps:textfield>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel><font color="red">*</font>户籍地区划：</cps:tdLabel>
		<cps:tdContent>
			<input type="hidden" id="hjdqh" name="rkBean.jbxxBean.hjdqh" value="${rkBean.jbxxBean.hjdqh}">
			<cps:textfield id="hjdqhmc" name="rkBean.jbxxBean.hjdqhmc" value="${rkBean.jbxxBean.hjdqhmc}" required="true" readonly="true" onclick="openSelectXzqh('0',callbackHjdqh)" appendPopuBtn="true"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>户籍地详址：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="hjdxz" name="rkBean.jbxxBean.hjdxz" value="${rkBean.jbxxBean.hjdxz}"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>户籍责任区：</cps:tdLabel>
		<cps:tdContent>
			<input type="hidden" id="ssgajgjgdm" name="rkBean.jbxxBean.ssgajgjgdm" value="${rkBean.jbxxBean.ssgajgjgdm}">
			<input type="hidden" id="ssgajgjgmc" name="rkBean.jbxxBean.ssgajgjgmc" value="${rkBean.jbxxBean.ssgajgjgmc}">
			<input type="hidden" id="sspcsdm" name="rkBean.jbxxBean.sspcsdm" value="${rkBean.jbxxBean.sspcsdm}">
			<cps:textfield id="sspcsmc" name="rkBean.jbxxBean.sspcsmc" value="${rkBean.jbxxBean.sspcsmc}" readonly="true"></cps:textfield>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel width="12%">现住区划：</cps:tdLabel>
		<cps:tdContent>
			<input type="hidden" id="xzzqh"  name="rkBean.jbxxBean.xzzqh" value="${rkBean.jbxxBean.xzzqh}"/>
			<cps:textfield id="xzzqhmc" name="rkBean.jbxxBean.xzzqhmc" value="${rkBean.jbxxBean.xzzqhmc}" readonly="true"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel width="12%">现住地址：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="xzzxz" name="rkBean.jbxxBean.xzzxz" value="${rkBean.jbxxBean.xzzxz}" readonly="true" ></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>现住责任区：</cps:tdLabel>
		<cps:tdContent>
			<input type="hidden" id="xzzzrq" name="rkBean.jbxxBean.xzzzrq" value="${rkBean.jbxxBean.xzzzrq}">
			<cps:textfield id="xzzzrqms" name="rkBean.jbxxBean.xzzzrqms" value="${rkBean.jbxxBean.xzzzrqms}" readonly="true"></cps:textfield>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>出生地：</cps:tdLabel>
		<cps:tdContent colspan="3">
			<input type="hidden" id="csd" name="rkBean.jbxxBean.csd" value="${rkBean.jbxxBean.csd}">
			<cps:textfield id="csdms" name="rkBean.jbxxBean.csdms" value="${rkBean.jbxxBean.csdms}" readonly="true" cssStyle="width:95%"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>专长：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="zc" name="rkBean.jbxxBean.zc" value="${rkBean.jbxxBean.zc}" maxlength="30"></cps:textfield>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>人员特殊属性：</cps:tdLabel>
		<cps:tdContent colspan="5">
			<cps:checkBoxList id="rytssx" name="rkBean.jbxxBean.rytssx" value="${rkBean.jbxxBean.rytssx}" zdlb="ZDY_RYTSSX"></cps:checkBoxList>
		</cps:tdContent>
	</cps:row>
</cps:table>
 
