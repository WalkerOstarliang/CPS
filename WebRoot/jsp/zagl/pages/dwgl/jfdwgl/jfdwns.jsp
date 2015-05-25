<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/zagl/pages/dwgl/jfdwgl/js/jfdwns.js"></creator:Script>

	<cps:PanelView>
		<cps:tbar>
			<c:if test="${!(operType eq 'detail')}">
				<cps:button value="保存" onclick="saveNsxx()"></cps:button>
				<cps:button value="重置" onclick="resetNsxx()"></cps:button>
			</c:if>
			<cps:button value="关闭" onclick="window.close()"></cps:button>
		</cps:tbar>
		<cps:panel title="单位基本信息">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">单位名称：</cps:tdLabel>
					<cps:tdContent width="18%">${dw.dwjbxx.dwmc}</cps:tdContent>
					
					<cps:tdLabel width="15%">单位电话：</cps:tdLabel>
					<cps:tdContent width="18%">${dw.dwjbxx.dwdh}</cps:tdContent>
					
					<cps:tdLabel width="15%">从业人数：</cps:tdLabel>
					<cps:tdContent>${dw.dwjbxx.cyrs}</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>法人身份证：</cps:tdLabel>
					<cps:tdContent>${dw.dwjbxx.frsfzhm}</cps:tdContent>
					
					<cps:tdLabel>法人姓名：</cps:tdLabel>
					<cps:tdContent>${dw.dwjbxx.frdb}</cps:tdContent>
					
					<cps:tdLabel>法人联系电话：</cps:tdLabel>
					<cps:tdContent>${dw.dwjbxx.frlxdh}</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>单位地址：</cps:tdLabel>
					<cps:tdContent colspan="5">${dw.dwjbxx.dwdz}</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:panel>
		
		<creator:panel id="nsxx" title="年审信息">
			<form id="jfdwns_form">
				<input type="hidden" name="nsxx.id" value="${nsxx.id}" id="id" />
				<input type="hidden" name="nsxx.jgbh" value="${nsxx.jgbh}" id="jgbh" /> 
				<input type="hidden" name="operType" value="${operyType}" id="operType" />
				<input type="hidden" name="modename" value="技防单位年审" />
				
				<cps:table>
					<cps:row>
						<cps:tdLabel><font color='red'>*</font>审核时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="nsxx.nsrj" value="${nsxx.nsrj}" maxDate="sysdate" id="nsrj" dateFmt="yyyy-MM-dd" required="true" />
						</cps:tdContent>
						
						<cps:tdLabel><font color='red'>*</font>备案等级：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="ZDY_BADJ" name="nsxx.badj" value="${nsxx.badj}"  id="badj" required="true" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel><font color='red'>*</font>是否检测：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="ZDY_ZDSF" headerKey="" headerValue=" " name="nsxx.sfjc" value="${nsxx.sfjc}" id="sfjc" />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel><font color='red'></font>内容：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield type="textarea" name="nsxx.nr" id="nr" value="${nsxx.nr}" required="true" maxlength="250" cssStyle="width:93%;height:60px;"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>备注：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield type="textarea" id="bz" name="nsxx.bz" value="${nsxx.bz}" maxlength="250" cssStyle="width:93%;height:60px;"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>登记人：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="nsxx.djrjh" id="djrjh" value="${nsxx.djrjh}" />
							<input type="hidden" name="nsxx.djrsfzh" id="djrsfzh" value="${nsxx.djrsfzh}" />
							
							<cps:textfield name="nsxx.djrxm" value="${nsxx.djrxm}" id="djrxm" readonly="true"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="nsxx.djsj" id="djsj"  value="${nsxx.djsj}" readonly="true"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="nsxx.djdwdm" id="djdwdm" value="${nsxx.djdwdm}" />
							<cps:textfield name="nsxx.djdwmc" id="djdwmc" value="${nsxx.djdwmc}" readonly="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
	</cps:PanelView>
	
	<form id="nscx">
		<input type="hidden" name="jgbh" value="${jgbh}" />
	</form>
	<cps:tableGrid url="/zagl/dw/queryJfdwNsxxByJgbh.action" title="年审记录"
				id="nsxxlist" autoload="true" pageSize="10" width="99.8%" click="callBackRow"
				usepager="true" searchform="nscx" autothead="false" mutilSelect="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="单位名称" field="dwmc" align="left"  maxlength="15"></cps:column>
		<cps:column title="法人代表" field="frdb" align="left"></cps:column>
		<cps:column title="年审时间" field="nsrj"></cps:column>
		<cps:column title="备案等级" field="badjmc" align="left" maxlength="10"></cps:column>
		<cps:column title="登记时间" field="djsj"></cps:column>
	</cps:tableGrid>
</creator:view>