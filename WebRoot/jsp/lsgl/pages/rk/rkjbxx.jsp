<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:table>
	<cps:row>
		<cps:tdContent width="85%">
			<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${rkBean.jbxxBean.rybh }"/>
			<cps:table>
				<cps:row id="row_1">
					<cps:tdLabel width="15%"><font color="red">*</font>身份证号：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield id="sfzh" name="rkBean.jbxxBean.sfzh" value="${rkBean.jbxxBean.sfzh}" isSfzh="true"  onblur="loadRkxxBean(this.value)" required="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="11%"><font color="red">*</font>姓名：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield id="xm" name="rkBean.jbxxBean.xm" value="${rkBean.jbxxBean.xm}" required="true" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="11%">别名/绰号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="bmch" name="rkBean.jbxxBean.bmch" value="${rkBean.jbxxBean.bmch}" maxlength="15"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="row_2">
					<cps:tdLabel>性别：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_XB" id="xb" name="rkBean.jbxxBean.xb" value="${rkBean.jbxxBean.xb}" required="true" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>出生日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="csrq" name="rkBean.jbxxBean.csrq" value="${rkBean.jbxxBean.csrq}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>民族：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_MZ" id="mz" name="rkBean.jbxxBean.mz" value="${rkBean.jbxxBean.mz}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
				</cps:row>
				<%-- 
				<cps:row id="row_3">
					<cps:tdLabel>英文名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="ywm" name="rkBean.jbxxBean.ywm" value="${rkBean.jbxxBean.ywm}" maxlength="50"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>证件类型：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_ZJZL" id="zjzl" name="rkBean.jbxxBean.zjzl" value="${rkBean.jbxxBean.zjzl}" headerKey="" headerValue="--请选择--" ></cps:select>
					</cps:tdContent>
					<cps:tdLabel>证件号码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zjhm" name="rkBean.jbxxBean.zjhm" value="${rkBean.jbxxBean.zjhm}" maxlength="30"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				--%>
				<cps:row id="row_4">
					<cps:tdLabel>政治面貌：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_ZZMM" id="zzmm" name="rkBean.jbxxBean.zzmm" value="${rkBean.jbxxBean.zzmm}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>文化程度：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_WHCD" id="whcd" name="rkBean.jbxxBean.whcd" value="${rkBean.jbxxBean.whcd}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>婚姻状况：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_HYZK" id="hyzk" name="rkBean.jbxxBean.hyzk" value="${rkBean.jbxxBean.hyzk}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="row_5">
					<cps:tdLabel>兵役状况：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_BYZK" id="byzk" name="rkBean.jbxxBean.byzk" value="${rkBean.jbxxBean.byzk}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>宗教信仰：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZJXY" id="zzxy" name="rkBean.jbxxBean.zzxy" value="${rkBean.jbxxBean.zzxy}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>血型：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_XX" id="xx" name="rkBean.jbxxBean.xx" value="${rkBean.jbxxBean.xx}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="row_6">
					<cps:tdLabel>身高(㎝)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sg" inputType="number" name="rkBean.jbxxBean.sg" value="${rkBean.jbxxBean.sg}" maxlength="3"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="lxdh" name="rkBean.jbxxBean.lxdh" value="${rkBean.jbxxBean.lxdh}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>身份：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GA_SF" id="sf" name="rkBean.jbxxBean.sf" value="${rkBean.jbxxBean.sf}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="row_7">
					<cps:tdLabel>服务处所：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="fwcs" name="rkBean.jbxxBean.fwcs" value="${rkBean.jbxxBean.fwcs}" maxlength="60"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>职务：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zw" name="rkBean.jbxxBean.zw" value="${rkBean.jbxxBean.zw}" maxlength="35"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>专长：</cps:tdLabel>
					<cps:tdContent>
					<!-- rkBean.jbxxBean.zc -->
						<cps:textfield id="zc" name="rkBean.jbxxBean.zc" value="${rkBean.jbxxBean.zc}" maxlength="30"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="row_8">
					<cps:tdLabel>户籍地区划：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="hjdqh" name="rkBean.jbxxBean.hjdqh" value="${rkBean.jbxxBean.hjdqh}">
						<cps:textfield id="hjdqhmc" name="rkBean.jbxxBean.hjdqhmc" value="${rkBean.jbxxBean.hjdqhmc}" readonly="true" appendPopuBtn="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>户籍地详址：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="hjdxz" name="rkBean.jbxxBean.hjdxz" value="${rkBean.jbxxBean.hjdxz}" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>户籍责任区：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="ssgajgjgdm" name="rkBean.jbxxBean.ssgajgjgdm" value="${rkBean.jbxxBean.ssgajgjgdm}">
						<input type="hidden" id="ssgajgjgmc" name="rkBean.jbxxBean.ssgajgjgmc" value="${rkBean.jbxxBean.ssgajgjgmc}">
						<input type="hidden" id="sspcsdm" name="rkBean.jbxxBean.sspcsdm" value="${rkBean.jbxxBean.sspcsdm}">
						<cps:textfield id="sspcsmc" name="rkBean.jbxxBean.sspcsmc" value="${rkBean.jbxxBean.sspcsmc}" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="row_9">
					<cps:tdLabel width="12%">现住区划：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="xzzqh"  name="rkBean.jbxxBean.xzzqh" value="${rkBean.jbxxBean.xzzqh}"/>
						<cps:textfield id="xzzqhmc" name="rkBean.jbxxBean.xzzqhmc" value="${rkBean.jbxxBean.xzzqhmc}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">现住地址：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="xzzxz" name="rkBean.jbxxBean.xzzxz" value="${rkBean.jbxxBean.xzzxz}" readonly="true" cssStyle="width:90%"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="row_10">
					<cps:tdLabel >人员属性：</cps:tdLabel>
					<cps:tdContent colspan="5" >
						<span style="width:90%">${rysxms}</span>
					</cps:tdContent>
				</cps:row>
			</cps:table>
	</cps:tdContent>
	<cps:tdContent align="center" valign="top">
		<div>
			<div style="text-align: center;">
				<s:if test="rkBean.jbxxBean.sfzh == '' or rkBean.jbxxBean.sfzh == null">
					<img id="rkzpxx" src="<c:url value='/template/default/images/default_zp.png'/>" width="120px" height="130px" title="暂无照片" alt="暂无照片"/>
				</s:if>
				<s:else>
					<img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${rkBean.jbxxBean.sfzh}" width="120px" height="130px" title="全国人口库照片" alt="全国人口库照片"/>
				</s:else>
			</div>
		</div> 
	</cps:tdContent>
	</cps:row>
</cps:table>
