<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="rkjbxxsavetbar">
	<cps:button value="保存" onclick="submitFormZdryGzdxInfo(saveGzdxAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="rkjbxx"  title="人口基本信息" tbarId="rkjbxxsavetbar" >
	<%@include file="/jsp/lsgl/pages/zdry/newrkjbxx.jsp"%>
</creator:panel>
<creator:panel id="zdryjsbr"  title="基本信息>>精神病人信息" >
	<cps:table>
		<input type="hidden"  id="jsbrBeanrybh" name="zdryBean.jsbrBean.rybh" value="${zdryBean.rybh}">
		<input type="hidden"  id="sfzh" name="zdryBean.jsbrBean.sfzh" value="${zdryBean.sfzh}">
		<input type="hidden"  id="gzdxbh" name="zdryBean.jsbrBean.gzdxbh" value="${zdryBean.gzdxbh}">
		<cps:row id="clear_row">
			<cps:tdLabel  width="12%"><font color="red">*</font>精神病类型：</cps:tdLabel>
			<cps:tdContent width="23%">
				<cps:select id="jsblx" name="zdryBean.jsbrBean.jsblx" zdlb="ZDY_JSBLX" value="${zdryBean.jsbrBean.jsblx}" headerKey="" headerValue="---请选择---" required="true"></cps:select>
			 </cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>现实状态：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:select id="xszt" name="zdryBean.jsbrBean.xszt" zdlb="ZDY_XSZT" value="${zdryBean.jsbrBean.xszt}" headerKey="" headerValue="---请选择---" required="true"></cps:select>
			 </cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>信息来源：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="xxly" name="zdryBean.jsbrBean.xxly" zdlb="ZDY_XXLY" value="${zdryBean.jsbrBean.xxly}" headerKey="" headerValue="---请选择---" required="true"></cps:select>
			 </cps:tdContent>
		</cps:row>
		<cps:row id="clear_row2">
			<cps:tdLabel><font color="red">*</font>危害程度：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="whcd" name="zdryBean.jsbrBean.whcd" zdlb="ZDY_WHCD" value="${zdryBean.jsbrBean.whcd}" headerKey="" headerValue="---请选择---" required="true"></cps:select>
			 </cps:tdContent>   
			<cps:tdLabel><font color="red">*</font>病人类别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="brlb" name="zdryBean.jsbrBean.brlb" zdlb="ZDY_JSBRLB" value="${zdryBean.jsbrBean.brlb}" headerKey="" headerValue="---请选择---" required="true"></cps:select>
			 </cps:tdContent>   
			<cps:tdLabel><font color="red">*</font>身份类别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="sflb" name="zdryBean.jsbrBean.sflb" zdlb="ZDY_JSBRSFLB" value="${zdryBean.jsbrBean.sflb}" headerKey="" headerValue="---请选择---" required="true"></cps:select>
			 </cps:tdContent>   
    	</cps:row>
		<cps:row>
			<cps:tdLabel><font color="red">*</font>是否收容治疗：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="issrzl" name="zdryBean.jsbrBean.issrzl" zdlb="ZDY_ZDSF" value="${zdryBean.jsbrBean.issrzl}" headerKey="" headerValue="---请选择---" required="true"></cps:select>
			 </cps:tdContent>   
			<cps:tdLabel>病人级别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="brjb" name="zdryBean.jsbrBean.brjb"  zdlb="ZDY_BRJB" value="${zdryBean.jsbrBean.brjb}" headerKey="" headerValue="---请选择---" ></cps:select>
			</cps:tdContent>   
			<cps:tdLabel id="clear_row3">重症精神病症：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="zzjsbz" name="zdryBean.jsbrBean.zzjsbz" zdlb="ZDY_ZDSF"  value="${zdryBean.jsbrBean.zzjsbz}" headerKey="" headerValue="---请选择---" ></cps:select>
			</cps:tdContent>   
		</cps:row>
		<cps:row id="clear_row4">
			<cps:tdLabel><font color="red">*</font>监护人：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="jhr" name="zdryBean.jsbrBean.jhr" value="${zdryBean.jsbrBean.jhr}" required="true" maxlength="15"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel><font color="red">*</font>监护人电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="jhrdh" name="zdryBean.jsbrBean.jhrdh" value="${zdryBean.jsbrBean.jhrdh}" isPhone="true" minlength="10" maxlength="20" required="true"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel><font color="red">*</font>与病人关系：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="ybrgx" name="zdryBean.jsbrBean.ybrgx" value="${zdryBean.jsbrBean.ybrgx}" required="true" zdlb="YJHRGX" headerKey="" headerValue="---请选择---"></cps:select>
			</cps:tdContent>   
		</cps:row>
		<cps:row>
			<cps:tdLabel ><font color="red">*</font>监护人住址：</cps:tdLabel>
			<cps:tdContent colspan="3">
				<cps:textfield id="jhrzz" name="zdryBean.jsbrBean.jhrzz" value="${zdryBean.jsbrBean.jhrzz}"  maxlength="100" cssStyle="width:87%"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="12%">监护人服务处所：</cps:tdLabel>
			<cps:tdContent >
				<cps:textfield id="jhrfwcs" name="zdryBean.jsbrBean.jhrfwcs" value="${zdryBean.jsbrBean.jhrfwcs}"  maxlength="30"></cps:textfield>
			</cps:tdContent>
			
		</cps:row>
		<cps:row id="clear_row5">
			<cps:tdLabel><font color="red">*</font>发病时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="fbsj" name="zdryBean.jsbrBean.fbsj" value="${zdryBean.jsbrBean.fbsj}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>诊断时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="zdsj" name="zdryBean.jsbrBean.zdsj" value="${zdryBean.jsbrBean.zdsj}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
			</cps:tdContent>   
			<cps:tdLabel><font color="red">*</font>治疗时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="zlsj" name="zdryBean.jsbrBean.zlsj" value="${zdryBean.jsbrBean.zlsj}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
			</cps:tdContent>   	
		</cps:row>
		<cps:row id="clear_row6">
			<cps:tdLabel><font color="red">*</font>诊断医生：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zdys" name="zdryBean.jsbrBean.zdys" value="${zdryBean.jsbrBean.zdys}" required="true" maxlength="15"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel>肇事与否：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="zsyf" name="zdryBean.jsbrBean.zsyf" value="${zdryBean.jsbrBean.zsyf}" zdlb="ZDY_ZDSF"  headerKey=""  headerValue="---请选择---"></cps:select>
			</cps:tdContent>   
			<cps:tdLabel>&nbsp;</cps:tdLabel>
			<cps:tdContent>
				&nbsp;
			</cps:tdContent>   	
		</cps:row>
		<cps:row >  
			<cps:tdLabel>管辖派出所：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="gxpcsdm" name="zdryBean.jsbrBean.gxpcsdm" value="${zdryBean.jsbrBean.gxpcsdm }"/>
				<cps:textfield id="gxpcsmc" value="${zdryBean.jsbrBean.gxpcsmc}" name="zdryBean.jsbrBean.gxpcsmc" readonly="true" ondblclick="openFwDwSelect('430000000000',callbackGxpcsdm)"></cps:textfield>
				<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackGxpcsdm)"></cps:button>
			</cps:tdContent>
			<cps:tdLabel>管辖警务区：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="gxjwqdm" name="zdryBean.jsbrBean.gxjwqdm" value="${zdryBean.jsbrBean.gxjwqdm }"/>
				<cps:textfield id="gxjwqmc" value="${zdryBean.jsbrBean.gxjwqmc}" name="zdryBean.jsbrBean.gxjwqmc" readonly="true" ondblclick="openJwsDwSelect(callbackGxjwqdm)"></cps:textfield>
				<cps:button value="选择" onclick="openJwsDwSelect(callbackGxjwqdm)"></cps:button>
			</cps:tdContent>  
			<cps:tdLabel>管辖社区：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="gxsq" value="${zdryBean.jsbrBean.gxsq}" name="zdryBean.jsbrBean.gxsq"></cps:textfield>
			</cps:tdContent>		

		</cps:row>
		
		<cps:row >
			<cps:tdLabel><font color="red">*</font>责任民警：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="zrmjjh" name="zdryBean.jsbrBean.zrmjjh" value="${zdryBean.jsbrBean.zrmjjh }"/>
				<cps:textfield id="zrmjxm" name="zdryBean.jsbrBean.zrmjxm" value="${zdryBean.jsbrBean.zrmjxm}"  ondblclick="openZrmjSelect('${loginInfo.rootOrgCode}')" required="true"></cps:textfield>
				<cps:button value="选择" onclick="openZrmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
			</cps:tdContent>   
			<cps:tdLabel><font color="red">*</font>联系电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="sszrmjlxdh" name="zdryBean.jsbrBean.zrmjlxdh"  value="${zdryBean.jsbrBean.zrmjlxdh}" required="true" isPhone="true" minlength="7" maxlength="20"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel>登记时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="djsj" name="zdryBean.jsbrBean.djsj" dateFmt="yyyy-MM-dd" value="${zdryBean.jsbrBean.djsj}" defaultSystemDate="true"></cps:date>
			</cps:tdContent>  
		</cps:row>
		<cps:row id="clear_row7">
			<cps:tdLabel width="12%">病人症状：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="brzz" name="zdryBean.jsbrBean.brzz"    cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[150]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row id="clear_row7">
			<cps:tdLabel width="12%">当前病情：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="dqbq" name="zdryBean.jsbrBean.dqbq"    cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[150]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row id="clear_row7">
			<cps:tdLabel width="12%">控制情况：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="kzqk" name="zdryBean.jsbrBean.kzqk"    cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[150]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		
		<cps:row id="clear_row7">
			<cps:tdLabel  width="12%">备注：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="bz" name="zdryBean.jsbrBean.bz"    cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[150]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:panel>

