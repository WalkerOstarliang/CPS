<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="rkjbxxsavetbar">
	<cps:button value="保存" onclick="submitFormZdryGzdxInfo(saveGzdxAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="rkjbxx"  title="人口基本信息" tbarId="rkjbxxsavetbar">
	<%@include file="/jsp/lsgl/pages/zdry/newrkjbxx.jsp"%>
</creator:panel>
<creator:panel id="zdryswry"  title="基本信息>>涉稳人员信息"  >
	<cps:table>
		<input type="hidden"  id="swryBeanrybh" name="zdryBean.swryBean.rybh" value="${zdryBean.rybh}">
		<input type="hidden"  id="sfzh" name="zdryBean.swryBean.sfzh" value="${zdryBean.sfzh}">
		<input type="hidden"  id="gzdxbh" name="zdryBean.swryBean.gzdxbh" value="${zdryBean.gzdxbh}">
		
		<cps:row id="clear_row">
			<cps:tdLabel  width="12%"><font color="red">*</font>涉稳人员类别：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:select id="swrylb" name="zdryBean.swryBean.swrylb" zdlb="ZDY_SWRYLB" value="${zdryBean.swryBean.swrylb}" headerKey="" headerValue="---请选择---" required="true" ></cps:select>
			 </cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>问题类别：</cps:tdLabel>
			<cps:tdContent width="22%">
				<cps:select id="wtlb" name="zdryBean.swryBean.wtlb" zdlb="ZDY_ZDSF" value="${zdryBean.swryBean.wtlb}" headerKey="" headerValue="---请选择---" required="true"></cps:select>
			 </cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>信息来源：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="xxlb" name="zdryBean.swryBean.xxlb" zdlb="ZDY_XXLY" value="${zdryBean.swryBean.xxlb}" headerKey="" headerValue="---请选择---" required="true"></cps:select>
			 </cps:tdContent>
		</cps:row>
		<cps:row id="clear_row2">
			<cps:tdLabel>事发地区县：</cps:tdLabel>
			<cps:tdContent>
			<input id="sfdqx" type="hidden" name="zdryBean.swryBean.sfdqx" value="${zdryBean.swryBean.sfdqx}" /> 
			<cps:textfield id="sfdqxmc" name="zdryBean.swryBean.sfdqxmc" value="${zdryBean.swryBean.sfdqxmc}" ></cps:textfield>	
			<cps:button value="选择" onclick="openSelectXzqh('0',callbackSfdqx)"></cps:button>	
			 </cps:tdContent>   
			<cps:tdLabel>事发责任区：</cps:tdLabel>
			<cps:tdContent>
				<input id="sfzrq" type="hidden" name="zdryBean.swryBean.sfzrq" value="${zdryBean.swryBean.sfzrq }" >
				<cps:textfield id="sfzrqmc" name="zdryBean.swryBean.sfzrqmc" value="${zdryBean.swryBean.sfzrqmc}" ondblclick="" readonly="true"></cps:textfield>
				<cps:button value="选择" onclick="openSelectXzqh('0',callbackSfzrq)"></cps:button>		 
			</cps:tdContent>   
			<cps:tdLabel>事发成因地：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="sfcyd" name="zdryBean.swryBean.sfcyd" value="${zdryBean.swryBean.sfcyd}"></cps:textfield>
			</cps:tdContent>  
    	</cps:row>
    	
    	<cps:row id="clear_row7">
			<cps:tdLabel width="12%">主要问题：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="zywt" name="zdryBean.swryBean.zywt"    cssStyle="width:92%;height:40px;" cssClass="validate[maxSize[150]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		
		<cps:row id="clear_row7">
			<cps:tdLabel  width="12%">工作措施：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="gzcs" name="zdryBean.swryBean.gzcs"    cssStyle="width:92%;height:40px;" cssClass="validate[maxSize[150]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
    	
    	
		<cps:row>
			<cps:tdLabel width="12%">管理类别：</cps:tdLabel>
			<cps:tdContent colspan="3">
				<cps:select id="gllb" name="zdryBean.swryBean.gllb"  cssStyle="width:90%"  zdlb="ZDRY_GLLB" value="${zdryBean.swryBean.gllb}" headerKey="" headerValue="---请选择---"></cps:select>
			 </cps:tdContent>   
			 <%--
			<cps:tdLabel>管理力量类别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="gllllb" name="zdryBean.swryBean.gllllb"  zdlb="" value="${zdryBean.swryBean.gllllb}" headerKey="" headerValue="---请选择---"></cps:select>
			</cps:tdContent>   
			--%>
			<cps:tdLabel id="clear_row3">管理单位：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="gldw" name="zdryBean.swryBean.gldw" value="${zdryBean.swryBean.gldw}"></cps:textfield>
			</cps:tdContent>   
		</cps:row>
		<cps:row id="clear_row4">
			<cps:tdLabel>管理人姓名：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="glrxm" name="zdryBean.swryBean.glrxm" value="${zdryBean.swryBean.glrxm}"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel>管理人身份证：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="glrsfzh" name="zdryBean.swryBean.glrsfzh" value="${zdryBean.swryBean.glrsfzh}"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel>管理人电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="glrlxdh" name="zdryBean.swryBean.glrlxdh" value="${zdryBean.swryBean.glrlxdh}" minlength="7" maxlength="0" isPhone="true"></cps:textfield>
			</cps:tdContent>   
		</cps:row>
		<cps:row id="clear_row7">
			<cps:tdLabel width="12%">管理人现居地址：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="glrxzdz" name="zdryBean.swryBean.glrxzdz"    cssStyle="width:92%;" cssClass="validate[maxSize[150]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		<%--
		<cps:row>
			<cps:tdLabel width="12%">现涉稳级别：</cps:tdLabel>
			<cps:tdContent >
				<cps:select id="xswjb" name="zdryBean.swryBean.xswjb"  zdlb=""  value="${zdryBean.swryBean.xswjb}"   ></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="10%">最高涉稳级别：</cps:tdLabel>
			<cps:tdContent >
				<cps:select id="zgswdj" name="zdryBean.swryBean.zgswdj" zdlb="" value="${zdryBean.swryBean.zgswdj}"  ></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
			<cps:tdContent >
				&nbsp;
			</cps:tdContent>
		</cps:row>
		--%>
		<cps:row >
			<cps:tdLabel>管辖派出所：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="gxpcsdm" name="zdryBean.swryBean.gxpcsdm" value="${zdryBean.swryBean.gxpcsdm }">
				<cps:textfield id="gxpcsmc" name="zdryBean.swryBean.gxpcsmc" value="${zdryBean.swryBean.gxpcsmc}" readonly="true" ondblclick="openFwDwSelect('430000000000',callbackGxpcsdm)"></cps:textfield>		
				<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackGxpcsdm)"></cps:button>
			</cps:tdContent>   
			<cps:tdLabel>管辖警务区：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="gxjwqdm" name="zdryBean.swryBean.gxjwqdm" value="${zdryBean.swryBean.gxjwqdm }">
				<cps:textfield id="gxjwqmc" name="zdryBean.swryBean.gxjwqmc" value="${zdryBean.swryBean.gxjwqmc}" readonly="true" ondblclick="openJwsDwSelect(callbackGxjwqdm)">
				</cps:textfield>
				<cps:button value="选择" onclick="openJwsDwSelect(callbackGxjwqdm)" cssStyle="width:37px"></cps:button>
			</cps:tdContent>   
			<cps:tdLabel>管辖社区：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="gxsq"  name="zdryBean.swryBean.gxsq" value="${zdryBean.swryBean.gxsq}"></cps:textfield>
			</cps:tdContent>  
		</cps:row>
		
		<cps:row >
			<cps:tdLabel><font color="red">*</font>责任民警：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="zrmjjh" name="zdryBean.swryBean.zrmjjh" value="${zdryBean.swryBean.zrmjjh }"/>
				<cps:textfield id="zrmjxm" name="zdryBean.swryBean.zrmjxm" value="${zdryBean.swryBean.zrmjxm}" readonly="true" maxlength="15"></cps:textfield>
				<cps:button value="选择" onclick="openZrmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
			</cps:tdContent>   
			<cps:tdLabel>联系电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="sszrmjlxdh" name="zdryBean.swryBean.zrmjlxdh"  value="${zdryBean.swryBean.zrmjlxdh}"  maxlength="20"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel>登记时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="djsj" name="zdryBean.swryBean.djsj"  readOnly="true" defaultSystemDate="true"></cps:date>
			</cps:tdContent>  
		</cps:row>
	</cps:table>
</creator:panel>

