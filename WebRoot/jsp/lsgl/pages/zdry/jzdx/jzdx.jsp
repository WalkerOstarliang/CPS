<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="tbar">
		<cps:button value="保存" onclick="submitFormZdryGzdxInfo(saveGzdxAfterCallback);"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow();"></cps:button>
</creator:tbar>
<creator:panel id="xsbxPanel" tbarId="tbar" title="矫正对象信息">
	<input type="hidden" id="gzdxbh" name="zdryBean.jzdxBean.gzdxbh" value="${zdryBean.gzdxbh }"/>
	<input type="hidden" id="jzdxbh" name="zdryBean.jzdxBean.jzdxbh" value="${zdryBean.jzdxBean.jzdxbh }"/>
	<input type="hidden" id="rybh" name="zdryBean.jzdxBean.rybh" value="${queryBean.rybh }"/>
	<input type="hidden" id="sfzh" name="zdryBean.jzdxBean.sfzh" value="${queryBean.sfzh }"/> 
	<cps:table>
		<cps:row>
			<cps:tdLabel width="10%"><font color="red">*</font>处罚类别：</cps:tdLabel>
			<cps:tdContent width="24%">
				<cps:select id="cflb" name="zdryBean.jzdxBean.cflb" value="${zdryBean.jzdxBean.cflb}" headerValue="--请选择--" zdlb="ZDRY_JZDX_CFLB" required="true"></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>涉案类别：</cps:tdLabel>
			<cps:tdContent width="24%">
				<cps:select id="salb" name="zdryBean.jzdxBean.salb" value="${zdryBean.jzdxBean.salb}" headerValue="--请选择--" zdlb="SALB" required="true"></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="8%">判决机关：</cps:tdLabel>
			<cps:tdContent width="25%"> 
				<cps:textfield id="pjjg" value="${zdryBean.jzdxBean.pjjg}" name="zdryBean.jzdxBean.pjjg" readonly="true" ondblclick="openFwDwSelect('430000000000',callbackPjjg)"></cps:textfield>
				<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackPjjg)"></cps:button>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>刑期起始日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="xqqsrq" name="zdryBean.jzdxBean.xqqsrq" value="${zdryBean.jzdxBean.xqqsrq}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>刑期结束日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="xqjsrq" name="zdryBean.jzdxBean.xqjsrq" value="${zdryBean.jzdxBean.xqjsrq}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>刑期年限：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="xqnx" name="zdryBean.jzdxBean.xqnx" value="${zdryBean.jzdxBean.xqnx}" inputType="number" ></cps:textfield>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>剥夺政治权利：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="sfbdzzql" name="zdryBean.jzdxBean.sfbdzzql" zdlb="GB_ZT" value="${zdryBean.jzdxBean.sfbdzzql}" headerKey=""
									headerValue="--请选择--"></cps:select>
			</cps:tdContent>
			<cps:tdLabel>剥夺权利年限：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="bdzzqlnx" name="zdryBean.jzdxBean.bdzzqlnx" value="${zdryBean.jzdxBean.bdzzqlnx}" inputType="number" ></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>批准机关：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="pzjg" value="${zdryBean.jzdxBean.pzjg}" name="zdryBean.jzdxBean.pzjg" readonly="true" ondblclick="openFwDwSelect('430000000000',callbackPzjg)"></cps:textfield>
				<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackPzjg)"></cps:button>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>考察起始日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="jdkcqsrq" name="zdryBean.jzdxBean.jdkcqsrq" value="${zdryBean.jzdxBean.jdkcqsrq}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>考察终止日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="jdkczzrq" name="zdryBean.jzdxBean.jdkczzrq" value="${zdryBean.jzdxBean.jdkczzrq}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>委托单位：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="wtzxdw" value="${zdryBean.jzdxBean.wtzxdw}" name="zdryBean.jzdxBean.wtzxdw" readonly="true" ondblclick="openFwDwSelect('430000000000',callbackWtzxdw)"></cps:textfield>
				<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackWtzxdw)"></cps:button>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>宣布起始日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="xbkcqsrq" name="zdryBean.jzdxBean.xbkcqsrq" value="${zdryBean.jzdxBean.xbkcqsrq}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>宣布截止日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="xbkcjzrq" name="zdryBean.jzdxBean.xbkcjzrq" value="${zdryBean.jzdxBean.xbkcjzrq}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>原执行机关：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="yzxjg" value="${zdryBean.jzdxBean.yzxjg}" name="zdryBean.jzdxBean.yzxjg" readonly="true" ondblclick="openFwDwSelect('430000000000',callbackYzxjg)"></cps:textfield>
				<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackYzxjg)"></cps:button>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>文书日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="wsrq" name="zdryBean.jzdxBean.wsrq" value="${zdryBean.jzdxBean.wsrq}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>文书字号：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="wszh" name="zdryBean.jzdxBean.wszh" value="${zdryBean.jzdxBean.wszh}" maxlength="30"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>管辖派出所：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="gxpcsdm" name="zdryBean.jzdxBean.gxpcsdm" value="${zdryBean.jzdxBean.gxpcsdm }"/>
				<cps:textfield id="gxpcsmc" value="${zdryBean.jzdxBean.gxpcsmc}" name="zdryBean.jzdxBean.gxpcsmc" readonly="true" ondblclick="openFwDwSelect('430000000000',callbackGxpcsdm)"></cps:textfield>
				<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackGxpcsdm)"></cps:button>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>管辖警务区：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="gxjwqdm" name="zdryBean.jzdxBean.gxjwqdm" value="${zdryBean.jzdxBean.gxjwqdm }"/>
				<cps:textfield id="gxjwqmc" value="${zdryBean.jzdxBean.gxjwqmc}" name="zdryBean.jzdxBean.gxjwqmc" readonly="true" ondblclick="openJwsDwSelect(callbackGxjwqdm)"></cps:textfield>
				<cps:button value="选择" onclick="openJwsDwSelect(callbackGxjwqdm)"></cps:button>
			</cps:tdContent>
			<cps:tdLabel>管辖社区：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="gxsq" value="${zdryBean.jzdxBean.gxsq}" name="zdryBean.jzdxBean.gxsq" ></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>民警姓名：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="zrmjjh" name="zdryBean.jzdxBean.zrmjjh" value="${zdryBean.jzdxBean.zrmjjh }"/>
				<cps:textfield id="zrmjxm" value="${zdryBean.jzdxBean.zrmjxm}" name="zdryBean.jzdxBean.zrmjxm" readonly="true" ondblclick="openDwRyxxSelect('430000000000',callbackZrmj)"></cps:textfield>
				<cps:button value="选择" onclick="openDwRyxxSelect('430000000000',callbackZrmj)"></cps:button>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>民警联系电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zrmjlxdh" name="zdryBean.jzdxBean.zrmjlxdh" value="${zdryBean.jzdxBean.zrmjlxdh}" isPhone="true" minlength="7" maxlength="20"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>注销单位名称：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="zxdwdm" name="zdryBean.jzdxBean.zxdwdm" value="${zdryBean.jzdxBean.zxdwdm }"/>
				<cps:textfield id="zxdwmc" name="zdryBean.jzdxBean.zxdwmc" value="${zdryBean.jzdxBean.zxdwmc}" ondblclick="openFwDwSelect('430000000000',callbackZxdwmc)" readonly="true"></cps:textfield>
				<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackZxdwmc)"></cps:button>
			</cps:tdContent>
			<cps:tdLabel>注销时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="zxsj" name="zdryBean.jzdxBean.zxsj" value="${zdryBean.jzdxBean.zxsj}" ></cps:date>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>监外执行原因：</cps:tdLabel>
			<cps:tdContent  colspan="5">
				<s:textarea  id="jwzxyy" name="zdryBean.jzdxBean.jwzxyy" rows="3" cssStyle="width:93%"  cssClass="validate[maxSize[80]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>主要犯罪事实：</cps:tdLabel>
			<cps:tdContent  colspan="5">
				<s:textarea  id="zyfzss" name="zdryBean.jzdxBean.zyfzss" rows="3" cssStyle="width:93%" cssClass="validate[maxSize[100]]"></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>注销原因：</cps:tdLabel>
			<cps:tdContent  colspan="5">
				<s:textarea  id="zxyy" name="zdryBean.jzdxBean.zxyy" rows="3" cssStyle="width:93%"   cssClass="validate[maxSize[50]]"></s:textarea>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
				<cps:tdLabel>登记人姓名:</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="djrxm" name="zdryBean.jzdxBean.djrxm" value="${loginInfo.realname}"></cps:textfield>	
				</cps:tdContent>
				<cps:tdLabel>登记单位名称:</cps:tdLabel>
				<cps:tdContent>
					<input id="djdwdm" name="zdryBean.jzdxBean.djdwdm" value="${loginInfo.orgcode}" type="hidden"/>
					<cps:textfield id="djdwmc" name="zdryBean.jzdxBean.djdwmc" value="${loginInfo.orgname}"></cps:textfield>	
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date  id="djsj" name="zdryBean.jzdxBean.djsj" defaultSystemDate="true"></cps:date>
				</cps:tdContent>
			</cps:row>
				
	</cps:table>
</creator:panel>