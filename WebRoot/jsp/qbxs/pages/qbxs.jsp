<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/qbxs/js/qbxs.js"></creator:Script>
	<creator:tbar id="op">
		<c:if test="${operType != 'detail'}">
			<cps:button value="保存" onclick="saveQbxs()"></cps:button>
		</c:if>
		<cps:button value="关闭" onclick="window.close()"></cps:button>
	</creator:tbar>
	<creator:tbar id="qbxsggxx">
		<c:if test="${operType != 'detail'}">
			<cps:button value="新增涉事骨干" onclick="openQbxsGgxxWin('add','')"></cps:button>
		</c:if>
	</creator:tbar>
	<div id="qbxs_div">
	<creator:panel id="qbxs" title="情报线索采集" tbarId="op">
	<form id="qbxs_form">
		<input type="hidden" name="qbxs.id" value="${qbxs.id}" id="id" />
		<input type="hidden" name="qbxs.ldxxbh" value="${qbxs.ldxxbh}" id="ldxxbh" />
		<input type="hidden" name="qbxs.yldxxbh" value="${qbxs.yldxxbh}" id="yldxxbh" />
		
		<input type="hidden" name="operType" value="${operType}" id="operType" />
		<input type="hidden" name="modename" value="情报线索" /> 
 		<input type="hidden" id="sjid" name="queryBean.sjid" value="${qbxs.id}"  />
 			
		<cps:table>
			<c:choose>
				<c:when test="${qbxs.bgcx eq '1'}">
					<cps:row>
						<cps:tdLabel>报告次序：</cps:tdLabel>
						<cps:tdContent>
							${qbxs.bgcxmc}
							<input type="hidden" name="qbxs.bgcx" value="${qbxs.bgcx}" id="bgcx" />
						</cps:tdContent>
						
						<cps:tdLabel>源联动信息编号：</cps:tdLabel>
						<cps:tdContent colspan="3">
							${qbxs.yldxxbh}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>标题：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield name="qbxs.bt" value="${qbxs.bt}" id="bt" maxlength="100" required="true" cssStyle="width:97%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</c:when>
				<c:otherwise>
					<cps:row>
						<cps:tdLabel>报告次序：</cps:tdLabel>
						<cps:tdContent>
							${qbxs.bgcxmc}
							<input type="hidden" name="qbxs.bgcx" value="${qbxs.bgcx}" id="bgcx" />
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>标题：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="qbxs.bt" value="${qbxs.bt}" id="bt" maxlength="100" required="true" cssStyle="width:95%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</c:otherwise>
			</c:choose>
			
			<cps:row>
				<cps:tdLabel><font color="red">*</font>关键词：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield name="qbxs.gjc" value="${qbxs.gjc}" id="gjc" maxlength="250" required="true" cssStyle="width:97%"></cps:textfield>				
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="15%"><font color="red">*</font>紧急程度：</cps:tdLabel>
				<cps:tdContent width="18%">
					<cps:select zdlb="QBXS_JJCD" name="qbxs.jjcd" headerKey="" headerValue=" " value="${qbxs.jjcd}" id="jjcd" required="true"></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel width="16%"><font color="red">*</font>线索信息来源：</cps:tdLabel>
				<cps:tdContent width="18%">
					<cps:select zdlb="QBXS_XXLY" name="qbxs.xsxxly" value="${qbxs.xsxxly}" headerKey="" headerValue=" " id="xsxxly" required="true"></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel width="15%"><font color="red">*</font>涉事类别：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="QBXS_SSLB" name="qbxs.sslb1" value="${qbxs.sslb1}" headerKey="" headerValue=" " id="sslb" required="true"></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel><font color="red">*</font>涉事主体：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="QBXS_SSZT" name="qbxs.sszt" value="${qbxs.sszt}" headerKey="" headerValue=" " id="sszt" required="true"></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel>涉及敏感时点：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="QBXS_SJMGSD" name="qbxs.sjmgsd" value="${qbxs.sjmgsd}" headerKey="" headerValue=" " id="sjmgsd" ></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel>涉及人数规模：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="QBXS_SJRSGM" name="qbxs.sjrsgm" value="${qbxs.sjrsgm}" headerKey="" headerValue=" " id="sjrsgm" ></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>涉及重大活动：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="QBXS_ZDHD" name="qbxs.sjzdhd" headerKey="" headerValue=" " value="${qbxs.sjzdhd}" id="zdhd"></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel>涉及财产损失规模：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="QBXS_SSGM" name="qbxs.sjccssgm" headerKey="" headerValue=" " value="${qbxs.sjccssgm}" id="ssgm" ></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel><font color="red">*</font>表现形式：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="QBXS_BXXS" name="qbxs.bxxs" headerKey="" headerValue=" " value="${qbxs.bxxs}" id="sjrsgm" required="true"></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel><font color="red">*</font>涉事诱因：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="QBXS_SSYY" headerKey="" headerValue=" " name="qbxs.ssyy" value="${qbxs.ssyy}" id="ssyy" required="true"></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel>发生状态：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="qbxs.fszt" headerKey="" headerValue=" " value="${qbxs.fszt}" id="fszt" zdlb="QBXS_FSZT" onchange="fsztChange(this.value)"></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel>案(事)件发生时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date name="qbxs.asjfssj" value="${qbxs.asjfssj}" id="fssj" maxDate="sysdate" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>案(事)件发生地类别：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="qbxs.asjdlb" value="${qbxs.asjdlb}" id="asjfsdlb" headerKey="" headerValue=" " zdlb="QBXS_ASJDDLB"></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel>案(事)件发生地所属省市：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" name="qbxs.sasfsdsxq" value="${qbxs.sasfsdsxq}" id="sasfsdsxq" />
					<cps:textfield name="qbxs.sasfsdsxqmc" value="${qbxs.sasfsdsxqmc}" id="fsdssssmc"  readonly="true" appendPopuBtn="true" onclick="xzqhSelect('fsdssssmc','sasfsdsxq')"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel>案(事)件发生地详址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="qbxs.sasfsdxz" value="${qbxs.sasfsdxz}" id="fsdxz" maxlength="50" disabled="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel><font color="red">*</font>信息正文：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" name="qbxs.xxzw" value="${qbxs.xxzw}" maxlength="2000" id="xxzw" required="true" cssStyle="height:60px;width:97%"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		
			<cps:row>
				<cps:tdLabel>填报人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="qbxs.tbr" value="${qbxs.tbr}" id="tbr" maxlength="15" readonly="true"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel>填报时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date name="qbxs.bssj" value="${qbxs.bssj}" id="tbsj" maxDate="sysdate" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
				</cps:tdContent>
				
				<cps:tdLabel>填报单位：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="qbxs.tbdw" value="${qbxs.tbdw}" id="tbdwdmmc" readonly="true"></cps:textfield>
					
					<input type="hidden" name="qbxs.tbdwjgdm" value="${qbxs.tbdwjgdm}" id="tbdwdm" />
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>采集人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="qbxs.cjr" value="${qbxs.cjr}" id="cjr" readonly="true"></cps:textfield>
					
					<input type="hidden" name="qbxs.cjrid" value="${qbxs.cjrid}" id="cjrid" />
				</cps:tdContent>
				
				<cps:tdLabel>采集时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date name="qbxs.cjsj" value="${qbxs.cjsj}" id="cjsj" maxDate="sysdate" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
				</cps:tdContent>
				
				<cps:tdLabel>采集单位</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="qbxs.cjdw" value="${qbxs.cjdw}" id="cjdw" readonly="true"></cps:textfield>
					<input type="hidden" name="qbxs.cjdwjgdm" value="${qbxs.cjdwjgdm}" id="cjdwdm" />
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
	</creator:panel>
	</div>
	
	<cps:tableGrid id="qbxsggxxlist" title="情报线索涉事骨干列表"
				mutilSelect="false"
				url="/qbxs/queryQbxxGgxxListPage.action" 
				searchform="qbxs_form"
				width="99.6%"
				autoload="true"
				tbarId="qbxsggxx">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" align="left" width="15%"></cps:column>
		<cps:column field="gmsfhm" title="身份证号码"></cps:column>
		<cps:column field="xm" title="姓名"></cps:column>
		<cps:column field="xbms" title="性别"></cps:column>
		<cps:column field="xzdxz" title="现住地详址" align="left" maxlength="20"></cps:column>
		<cps:column field="sjhm" title="手机号码"></cps:column>
	</cps:tableGrid>
	
</creator:view>