<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view title="电动车信息">
<creator:Script src="/jsp/zagl/pages/ddccj/js/ddcinfo.js"></creator:Script>
	<creator:box>
	
		<div id="ddc_div">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="保存" onclick="saveDdcInfo()"></cps:button>
				<cps:button value="关闭" onclick="window.close();"></cps:button>
			</cps:tbar>
			
			<cps:panel title="电动车信息">
				<form id="ddcform">
					<input type="hidden" name="ddc.ddcid" value="${ddc.ddcid}" id="ddcid" />
					<input type="hidden" name="modename" value="电动车采集" />
					<input type="hidden" name="operType" value="${operType}" id="opertype" />
				
					<cps:table>
						<cps:row>
							<cps:tdLabel width="13%">电动车类型：</cps:tdLabel>
							<cps:tdContent width="20%">
								<cps:select zdlb="DDCLX" name="ddc.ddclx" value="${ddc.ddclx}" headerKey="" headerValue=" " />
							</cps:tdContent>
							
							<cps:tdLabel width="13%">电动车品牌：</cps:tdLabel>
							<cps:tdContent width="20%">
								<cps:textfield name="ddc.pp" value="${ddc.pp}" maxlength="25" id="pp" ></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel width="13%"><font color='red'>*</font>电动车车架号：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ddc.clsbm"  id="clsbm" value="${ddc.clsbm}" maxlength="50" required="true" ></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color='red'>*</font>电动车电机号：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ddc.djh" id="djh" value="${ddc.djh}" maxlength="50" required="true" ></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>颜色：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ddc.ys" id="ys" value="${ddc.ys}" maxlength="15"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>号牌号码：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ddc.hphm" id="hphm" value="${ddc.hphm}" maxlength="25"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>销售时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date name="ddc.xssj" id="xssj" value="${ddc.xssj}"  dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
							</cps:tdContent>
							
							<cps:tdLabel><font color='red'>*</font>经销商名称：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<cps:textfield name="ddc.jxdmc" id="dwmc" value="${ddc.jxdmc}" readonly="true" onclick="openDwSelect()" appendPopuBtn="true" cssStyle="width:94%"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>门店地址：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<cps:textfield name="ddc.mddz" id="dwdz" cssStyle="width:96.5%" value="${ddc.mddz}" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>购买者身份证号码：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ddc.gmzsfzh" value="${ddc.gmzsfzh}" maxlength="18" id="gmzsfzh" onblur="queryRyBysfz(this.value,'gmzxm','gmzdh')"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>购买者姓名：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ddc.gmzxm" value="${ddc.gmzxm}" maxlength="25" id="gmzxm"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>购买者电话：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ddc.gmzdh" value="${ddc.gmzdh}" maxlength="25" isPhone="true" id="gmzdh"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>采集人：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ddc.djrxm" value="${ddc.djrxm}" readonly="true"></cps:textfield>
								<input type="hidden" name="ddc.djrjh" value="${ddc.djrjh }" />
							</cps:tdContent>
							
							<cps:tdLabel>采集人身份证号：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ddc.djrsfzh" value="${ddc.djrsfzh}" readonly="true"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>采集时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ddc.djsj" value="${ddc.djsj}" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>采集单位：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<cps:textfield name="ddc.djdwmc" value="${ddc.djdwmc}" readonly="true" cssStyle="width:96.5%"></cps:textfield>
								<input type="hidden" name="ddc.djdwdm" value="${ddc.djdwdm}" />
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</form>
			</cps:panel>
		</cps:PanelView>
		</div>
	</creator:box>
</creator:view>	