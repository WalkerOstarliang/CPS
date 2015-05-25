<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<cps:table id="rkjbxxtable">
	<cps:row>
		<cps:tdLabel width="10%"><font color="red">*</font>身份证号：</cps:tdLabel>
		<cps:tdContent width="18%">
			<cps:textfield id="sfzh" name="emxxBean.sfzh" value="${emxxBean.sfzh}" isSfzh="true" onblur="checkXxy(this.value)" required="true"></cps:textfield>
		</cps:tdContent>
		
		<cps:tdLabel width="10%"><font color="red">*</font>姓名：</cps:tdLabel>
		<cps:tdContent width="18%">
			<cps:textfield id="xm" name="emxxBean.xm" value="${emxxBean.xm}" required="true" readonly="true" maxlength="15"></cps:textfield>
		</cps:tdContent>
		
		<cps:tdLabel width="10%">性别：</cps:tdLabel>
		<cps:tdContent width="18%">
			<input type="hidden" id="xb_hidden" name="emxxBean.xb" value="${emxxBean.xb}"/>
			<cps:select zdlb="GB_XB" id="xb" name="emxxBean.xbms" value="${emxxBean.xb}" disabled="true" headerKey=""  headerValue=" " onchange="xb_hidden.value=this.value"></cps:select>
		</cps:tdContent>
		
		<cps:tdLabel rowspan="6">
			<div>
				<div style="text-align: center;">
					<s:if test="emxxBean.sfzh == '' or emxxBean.sfzh == null">
						<img id="rkzpxx" src="<c:url value='/template/default/images/default_zp.png'/>" width="120px" height="130px" title="暂无照片" alt="暂无照片"/>
					</s:if>
					<s:else>
						<img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${emxxBean.sfzh}" width="120px" height="130px" title="全国人口库照片" alt="全国人口库照片"/>
					</s:else>
				</div>
			</div> 
		</cps:tdLabel>
	</cps:row>
	<cps:row>
		<cps:tdLabel>出生日期：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="csrq" name="emxxBean.csrq" value="${emxxBean.csrq}" readonly="true"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>民族：</cps:tdLabel>
		<cps:tdContent>
			<input type="hidden" id="mz_hidden" name="emxxBean.mz" value="${emxxBean.mz}"/>
			<cps:select zdlb="GB_MZ" id="mz" name="emxxBean.mzms" value="${emxxBean.mz}" headerKey="" headerValue=" " disabled="true" onchange="mz_hidden.value=this.value"></cps:select>
		</cps:tdContent>
		<cps:tdLabel>婚姻状况：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="AF_HYZK" id="hyzk" name="emxxBean.hyzk" value="${emxxBean.hyzk}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel width="10%">别名/绰号：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="bmch" name="emxxBean.bmch" value="${emxxBean.bmch}" maxlength="15"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>兵役状况：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="GB_BYZK" id="byzk" name="emxxBean.byzk" value="${emxxBean.byzk}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		<cps:tdLabel>文化程度：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="GB_WHCD" id="whcd" name="emxxBean.whcd" value="${emxxBean.whcd}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>政治面貌：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="GB_ZZMM" id="zzmm" name="emxxBean.zzmm" value="${emxxBean.zzmm}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		<cps:tdLabel>宗教信仰：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="ZJXY" id="zzxy" name="emxxBean.zzxy" value="${emxxBean.zzxy}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		<cps:tdLabel>血型：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="GB_XX" id="xx" name="emxxBean.xx" value="${emxxBean.xx}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>身高(㎝)：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="sg" inputType="number" name="emxxBean.sg" value="${emxxBean.sg}" maxlength="3"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel><font color="red" id="lxdh_tag">*</font>联系电话：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="lxdh" name="emxxBean.lxdh" value="${emxxBean.lxdh}" maxlength="20" minlength="7" isPhone="true" required="true"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>电话备注：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="lxdhbz" name="emxxBean.lxdhbz" value="${emxxBean.lxdhbz}" maxlength="50" ></cps:textfield>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>身份：</cps:tdLabel>
		<cps:tdContent>
			<cps:select zdlb="GA_SF" id="sf" name="emxxBean.sf" enableEdit="true" value="${emxxBean.sf}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		
		<cps:tdLabel>职业：</cps:tdLabel>
		<cps:tdContent>
			<cps:select id="zydm" zdlb="ZAGL_RY_ZY" name="emxxBean.zydm" enableEdit="true" value="${emxxBean.zydm}" headerKey="" headerValue=" "></cps:select>
		</cps:tdContent>
		
		<cps:tdLabel>服务处所：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="fwcs" name="emxxBean.fwcs" value="${emxxBean.fwcs}" maxlength="60"></cps:textfield>
		</cps:tdContent>
		
	</cps:row>
	<cps:row>
		<cps:tdLabel>户籍地区划：</cps:tdLabel>
		<cps:tdContent>
			<input type="hidden" id="hjdqh" name="emxxBean.hjdqh" value="${emxxBean.hjdqh}">
			<cps:textfield id="hjdqhmc" name="emxxBean.hjdqhmc" value="${emxxBean.hjdqhmc}" readonly="true"></cps:textfield>
		</cps:tdContent>
		
		<cps:tdLabel>户籍责任区：</cps:tdLabel>
		<cps:tdContent>
			<input type="hidden" id="ssgajgjgdm" name="emxxBean.ssgajgjgdm" value="${emxxBean.ssgajgjgdm}">
			<input type="hidden" id="ssgajgjgmc" name="emxxBean.ssgajgjgmc" value="${emxxBean.ssgajgjgmc}">
			<input type="hidden" id="sspcsdm" name="emxxBean.sspcsdm" value="${emxxBean.sspcsdm}">
			<cps:textfield id="sspcsmc" name="emxxBean.sspcsmc" value="${emxxBean.sspcsmc}" readonly="true"></cps:textfield>
		</cps:tdContent>
		
		<cps:tdLabel>户籍地详址：</cps:tdLabel>
		<cps:tdContent colspan="2">
			<cps:textfield id="hjdxz" name="emxxBean.hjdxz" value="${emxxBean.hjdxz}" readonly="true" ></cps:textfield>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel width="12%">现住区划：</cps:tdLabel>
		<cps:tdContent>
			<input type="hidden" id="xzzqh"  name="emxxBean.xzzqh" value="${emxxBean.xzzqh}"/>
			<cps:textfield id="xzzqhmc" name="emxxBean.xzzqhmc" value="${emxxBean.xzzqhmc}" readonly="true"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel width="12%">现住地址：</cps:tdLabel>
		<cps:tdContent colspan="4">
			<cps:textfield id="xzzxz" name="emxxBean.xzzxz" value="${emxxBean.xzzxz}" readonly="true" cssStyle="width:92%"></cps:textfield>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>专长：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="zc" name="emxxBean.zc" value="${emxxBean.zc}" maxlength="30"></cps:textfield>
		</cps:tdContent>
		<cps:tdLabel>人员属性：</cps:tdLabel>
		<cps:tdContent colspan="4">
			<cps:textfield id="rysxms" name="emxxBean.rysxms" value="${emxxBean.rysxms}" readonly="true" cssStyle="width:92%"></cps:textfield>
		</cps:tdContent>
	</cps:row>
</cps:table>
 
