<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="tbar">
		<cps:button value="保存" onclick="submitFormZdryGzdxInfo(saveGzdxAfterCallback);"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow();"></cps:button>
</creator:tbar>
<creator:panel id="xsbxPanel" tbarId="tbar" title="关注人员信息">
	<input type="hidden" id="gzdxbh" name="zdryBean.gzryBean.gzdxbh" value="${zdryBean.gzdxbh }"/>
	<input type="hidden" id="gzrybh" name="zdryBean.gzryBean.gzrybh" value="${zdryBean.gzryBean.gzrybh }"/>
	<input type="hidden" id="rybh" name="zdryBean.gzryBean.rybh" value="${queryBean.rybh }"/>
	<input type="hidden" id="sfzh" name="zdryBean.gzryBean.sfzh" value="${queryBean.sfzh }"/> 
	<cps:table>
		<cps:row>
			<cps:tdLabel width="10%"><font color="red">*</font>关注类别：</cps:tdLabel>
			<cps:tdContent width="23%">
				<cps:textfield id="gzlb" name="zdryBean.gzryBean.gzlb" value="${zdryBean.gzryBean.gzlb}" maxlength="30" required="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="10%">关注时间：</cps:tdLabel>
			<cps:tdContent width="23%">
				<cps:date id="gzsj" name="zdryBean.gzryBean.gzsj" value="${zdryBean.gzryBean.gzsj}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>民警姓名：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:textfield id="lamjxm" name="zdryBean.gzryBean.lamjxm" value="${zdryBean.gzryBean.lamjxm}" ondblclick="openDwRyxxSelect('430000000000',callbackLamjxm)" required="true"></cps:textfield>
				<cps:button value="选择" onclick="openDwRyxxSelect('430000000000',callbackLamjxm)"></cps:button>
			</cps:tdContent>
			
		</cps:row>
		
		<cps:row>
			<cps:tdLabel width="10%"><font color="red">*</font>立案单位：</cps:tdLabel>
			<cps:tdContent width="25%"> 
				<cps:textfield id="ladw" value="${zdryBean.gzryBean.ladw}" name="zdryBean.gzryBean.ladw" readonly="true" required="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>民警身份证号：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="lamjsfzh" name="zdryBean.gzryBean.lamjsfzh" value="${zdryBean.gzryBean.lamjsfzh}" isSfzh="true" required="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>民警联系方式：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="lamjlxfs" name="zdryBean.gzryBean.lamjlxfs" value="${zdryBean.gzryBean.lamjlxfs}" isPhone="true"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>管辖派出所：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="gxpcsdm" name="zdryBean.gzryBean.gxpcsdm" value="${zdryBean.gzryBean.gxpcsdm }"/>
				<cps:textfield id="gxpcsmc" value="${zdryBean.gzryBean.gxpcsmc}" name="zdryBean.gzryBean.gxpcsmc" readonly="true" ondblclick="openFwDwSelect('430000000000',callbackGxpcsdm)"></cps:textfield>
				<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackGxpcsdm)"></cps:button>
			</cps:tdContent>
			<cps:tdLabel>管辖警务区：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="gxjwqdm" name="zdryBean.gzryBean.gxjwqdm" value="${zdryBean.gzryBean.gxjwqdm }"/>
				<cps:textfield id="gxjwqmc" value="${zdryBean.gzryBean.gxjwqmc}" name="zdryBean.gzryBean.gxjwqmc" readonly="true" ondblclick="openJwsDwSelect(callbackGxjwqdm)"></cps:textfield>
				<cps:button value="选择" onclick="openJwsDwSelect(callbackGxjwqdm)"></cps:button>
			</cps:tdContent>
			<cps:tdLabel>管辖社区：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="gxsq" value="${zdryBean.gzryBean.gxsq}" name="zdryBean.gzryBean.gxsq"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel><font color="red">*</font>责任民警：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="zrmjjh" name="zdryBean.gzryBean.zrmjjh" value="${zdryBean.gzryBean.zrmjjh }"/>
				<cps:textfield id="zrmjxm" value="${zdryBean.gzryBean.zrmjxm}" name="zdryBean.gzryBean.zrmjxm" readonly="true" ondblclick="openDwRyxxSelect('430000000000',callbackZrmj)"></cps:textfield>
				<cps:button value="选择" onclick="openDwRyxxSelect('430000000000',callbackZrmj)"></cps:button>
			</cps:tdContent>
			<cps:tdLabel>民警联系电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zrmjlxdh" name="zdryBean.gzryBean.zrmjlxdh" value="${zdryBean.gzryBean.zrmjlxdh}" isPhone="true" minlength="7" maxlength="20"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>&nbsp;</cps:tdLabel>
			<cps:tdContent>
				&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>注销人姓名：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zxrxm" name="zdryBean.gzryBean.zxrxm" value="${zdryBean.gzryBean.zxrxm}" ondblclick="openDwRyxxSelect('430000000000',callbackZxdw)" readonly="true"></cps:textfield>
				<cps:button value="选择" onclick="openDwRyxxSelect('430000000000',callbackZxdw)"></cps:button>
			</cps:tdContent>
			<cps:tdLabel>注销单位名称：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="zxdwdm" name="zdryBean.gzryBean.zxdwdm" value="${zdryBean.gzryBean.zxdwdm }"/>
				<cps:textfield id="zxdwmc" name="zdryBean.gzryBean.zxdwmc" value="${zdryBean.gzryBean.zxdwmc}" ></cps:textfield>
			</cps:tdContent>
			
			<cps:tdLabel>注销时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="zxsj" name="zdryBean.gzryBean.zxsj" value="${zdryBean.gzryBean.zxsj}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>关注原因：</cps:tdLabel>
			<cps:tdContent  colspan="5">
				<s:textarea  id="gzyy" name="zdryBean.gzryBean.gzyy" rows="3" cssStyle="width:93%" cssClass="validate[maxSize[100]]"></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>简要情况：</cps:tdLabel>
			<cps:tdContent  colspan="5">
				<s:textarea  id="jyqk" name="zdryBean.gzryBean.jyqk" rows="3" cssStyle="width:93%"  cssClass="validate[maxSize[100]]"></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent  colspan="5">
				<s:textarea  id="bz" name="zdryBean.gzryBean.bz" rows="3" cssStyle="width:93%"  cssClass="validate[maxSize[100]]"></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>注销原因：</cps:tdLabel>
			<cps:tdContent  colspan="5">
				<s:textarea  id="zxyy" name="zdryBean.gzryBean.zxyy" rows="3" cssStyle="width:93%" cssClass="validate[maxSize[50]]"></s:textarea>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
				<cps:tdLabel>登记人姓名:</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="djrxm" name="zdryBean.gzryBean.djrxm" value="${loginInfo.realname}"></cps:textfield>	
				</cps:tdContent>
				<cps:tdLabel>登记单位名称:</cps:tdLabel>
				<cps:tdContent>
					<input id="djdwdm" name="zdryBean.gzryBean.djdwdm" value="${loginInfo.orgcode}" type="hidden"/>
					<cps:textfield id="djdwmc" name="zdryBean.gzryBean.djdwmc" value="${loginInfo.orgname}"></cps:textfield>	
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date  id="djsj" name="zdryBean.gzryBean.djsj" defaultSystemDate="true"></cps:date>
				</cps:tdContent>
			</cps:row>
				
	</cps:table>
</creator:panel>