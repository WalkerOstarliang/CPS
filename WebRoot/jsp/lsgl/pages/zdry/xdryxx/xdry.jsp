<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="tbar">
		<cps:button value="保存" onclick="submitFormZdryGzdxInfo(saveGzdxAfterCallback);"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow();"></cps:button>
</creator:tbar>
<creator:panel id="xsbxPanel" tbarId="tbar" title="吸毒人员信息">
	<input type="hidden" id="gzdxbh" name="zdryBean.xdryBean.gzdxbh" value="${zdryBean.gzdxbh }"/>
	<input type="hidden" id="rybh" name="zdryBean.xdryBean.rybh" value="${queryBean.rybh }"/>
	<input type="hidden" id="sfzh" name="zdryBean.xdryBean.sfzh" value="${queryBean.sfzh }"/> 
	<cps:table>
		<cps:row>
			<cps:tdLabel width="10%"><font color="red">*</font>人员现状：</cps:tdLabel>
			<cps:tdContent width="24%">
				<cps:select id="ryxz" name="zdryBean.xdryBean.ryxz" value="${zdryBean.xdryBean.ryxz}" headerValue="--请选择--" zdlb="ZDRY_XDRY_RYXZ" required="true"></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>现状登记日期：</cps:tdLabel>
			<cps:tdContent width="24%">
				<cps:date id="xzdjrq" name="zdryBean.xdryBean.xzdjrq" value="${zdryBean.xdryBean.xzdjrq}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
			</cps:tdContent>
				<cps:tdLabel width="10%">健康状况：</cps:tdLabel>
			<cps:tdContent width="24%">
				<cps:select id="jkzk" name="zdryBean.xdryBean.jkzk" value="${zdryBean.xdryBean.jkzk}" headerValue="--请选择--" zdlb="GB_JKZK"></cps:select>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			
			<cps:tdLabel><font color="red">*</font>初次吸毒日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="ccxdrq" name="zdryBean.xdryBean.ccxdrq" value="${zdryBean.xdryBean.ccxdrq}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>初次吸毒场所：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="ccxdcs" name="zdryBean.xdryBean.ccxdcs" value="${zdryBean.xdryBean.ccxdcs}" maxlength="100" required="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>吸毒方式：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="xdfs" name="zdryBean.xdryBean.xdfs" value="${zdryBean.xdryBean.xdfs}" headerValue="--请选择--" zdlb="ZDRY_XDFS" required="true"></cps:select>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>毒品种类：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="ccxddpzl" name="zdryBean.xdryBean.ccxddpzl" value="${zdryBean.xdryBean.ccxddpzl}" headerValue="--请选择--" zdlb="GA_DPZL"></cps:select>
			</cps:tdContent>
			<cps:tdLabel>管辖派出所：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="gxpcsdm" name="zdryBean.xdryBean.gxpcsdm" value="${zdryBean.xdryBean.gxpcsdm }"/>
				<cps:textfield id="gxpcsmc" value="${zdryBean.xdryBean.gxpcsmc}" name="zdryBean.xdryBean.gxpcsmc" readonly="true" ondblclick="openFwDwSelect('430000000000',callbackGxpcsdm)"></cps:textfield>
				<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackGxpcsdm)"></cps:button>
			</cps:tdContent>
		
			<cps:tdLabel>管辖警务区：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="gxjwqdm" name="zdryBean.xdryBean.gxjwqdm" value="${zdryBean.xdryBean.gxjwqdm }"/>
				<cps:textfield id="gxjwqmc" value="${zdryBean.xdryBean.gxjwqmc}" name="zdryBean.xdryBean.gxjwqmc" readonly="true" ondblclick="openJwsDwSelect(callbackGxjwqdm)"></cps:textfield>
				<cps:button value="选择" onclick="openJwsDwSelect(callbackGxjwqdm)"></cps:button>
			</cps:tdContent>
			
		</cps:row>
		<cps:row>
			<cps:tdLabel>管辖社区：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="gxsq" value="${zdryBean.xdryBean.gxsq}" name="zdryBean.xdryBean.gxsq"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>民警姓名：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="zrmjjh" name="zdryBean.xdryBean.zrmjjh" value="${zdryBean.xdryBean.zrmjjh }"/>
				<cps:textfield id="zrmjxm" value="${zdryBean.xdryBean.zrmjxm}" name="zdryBean.xdryBean.zrmjxm" readonly="true" ondblclick="openDwRyxxSelect('430000000000',callbackZrmj)" required="true"></cps:textfield>
				<cps:button value="选择" onclick="openDwRyxxSelect('430000000000',callbackZrmj)"></cps:button>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>民警联系电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zrmjlxdh" name="zdryBean.xdryBean.zrmjlxdh" value="${zdryBean.xdryBean.zrmjlxdh}" isPhone="true" minlength="7" maxlength="20" required="true"></cps:textfield>
			</cps:tdContent>
			
		</cps:row>		
	</cps:table>
</creator:panel>