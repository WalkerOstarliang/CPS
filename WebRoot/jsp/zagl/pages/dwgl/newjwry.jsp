<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="jwrkjbxx">
	
	<input type="hidden" name="rkBean.jwrkBean.jwbh" value="${rkBean.jwrkBean.jwbh}" />
	<input type="hidden" name="rkBean.jwrkBean.rybh" value="${rkBean.jwrkBean.rybh}" />

	<cps:table>
		<cps:row>
			<cps:tdLabel width="10%"><font color="red">*</font>国籍：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:select zdlb="GB_GJ" id="gj" name="rkBean.jbxxBean.gj" value="${rkBean.jbxxBean.gj}" required="true"  headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>证件种类：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:select zdlb="GB_ZJZL" id="zjzl" name="rkBean.jbxxBean.zjzl" value="${rkBean.jbxxBean.zjzl}" required="true" headerKey="" headerValue="  "></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>证件号码：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zjhm" name="rkBean.jbxxBean.zjhm" value="${rkBean.jbxxBean.zjhm}" required="true" maxlength="30"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel><font color="red">*</font>外文姓：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="ywm" name="rkBean.jwrkBean.ywx" value="${rkBean.jwrkBean.ywx}" required="true" maxlength="50" inputType="onlychar"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>外文名：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="ywm" name="rkBean.jwrkBean.ywm" value="${rkBean.jwrkBean.ywm}" required="true" maxlength="50" inputType="onlychar"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>中文姓名：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="xm" name="rkBean.jbxxBean.xm" value="${rkBean.jbxxBean.xm}" maxlength="25"></cps:textfield>
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
		
		<cps:row>
			<cps:tdLabel>签证类型：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="GA_QZZZL" id="qzzl" name="rkBean.jwrkBean.qzzl" headerKey="" headerValue=" " value="${rkBean.jwrkBean.qzzl}"></cps:select>
			</cps:tdContent>
			<cps:tdLabel>签证机关：</cps:tdLabel>
			<cps:tdContent >
				<cps:textfield id="qzjg" name="rkBean.jwrkBean.qzjg" value="${rkBean.jwrkBean.qzjg}" maxlength="60"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>签发日期：</cps:tdLabel>
			<cps:tdContent >
				<cps:date id="qfrq" name="rkBean.jwrkBean.qfrq" value="${rkBean.jwrkBean.qfrq}" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}" ></cps:date>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>停留有效期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="tlyxq" name="rkBean.jwrkBean.tlyxq" value="${rkBean.jwrkBean.tlyxq}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>停留事由：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="ZDY_TLSY" id="tlsy" name="rkBean.jwrkBean.tlsy" value="${rkBean.jwrkBean.tlsy}" headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
			<cps:tdLabel>居住类型：</cps:tdLabel>
			<cps:tdContent>
				<s:select id="jwrylx" list="#{'0':'常住','1' : '临住'}" name="rkBean.jwrkBean.jwrylx" cssClass="cps-select" />
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent colspan="5">
				<cps:textfield id="bz" name="rkBean.jwrkBean.bz" value="${rkBean.jwrkBean.bz}" cssStyle="width:97%" maxlength="100"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<%-- 
		<cps:row>
			<cps:tdLabel><font color="red">*</font>居住地址：</cps:tdLabel>
			<cps:tdContent colspan="5">
				<input type="hidden" id="fwid"  name="rkBean.fwxxBean.fwid" value="${rkBean.fwxxBean.fwid}"/>
				<input type="hidden" id="dzid"  name="rkBean.fwxxBean.dzid" value="${rkBean.fwxxBean.dzid}"/>
				<input type="hidden" id="sssq"  name="rkBean.fwxxBean.sssq" value="${rkBean.fwxxBean.sssq}"/>
				<input type="hidden" id="ssxzqh" name="rkBean.fwxxBean.ssxzqh" value="${rkBean.fwxxBean.ssxzqh}"/>
				<input type="hidden" id="sszrdwdm" name="rkBean.fwxxBean.sszrdwdm" value="${rkBean.fwxxBean.sszrdwdm}"/>
				<input type="hidden" id="rkfwglid" name="rkBean.jwrkBean.rkfwglid" value="${rkBean.jwrkBean.rkfwglid}"/>
				<cps:textfield id="dzmc" name="rkBean.fwxxBean.dzmc" value="${rkBean.fwxxBean.dzmc}" required="true" appendPopuBtn="true" cssStyle="width:97%" readonly="true" onclick="openSelectFwWin(updateSelectFwCallback,'select','4')"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		--%>
	</cps:table>
</div>