<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="安全设备信息">
<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
<form id="dw_form">
<creator:tbar id="dw_op">
	<cps:button value="保存" onclick="saveDwAqsb();"></cps:button>
	<cps:button value="关闭" onclick="window.close();"></cps:button>
</creator:tbar>
<div id="aqsb_div">
	<creator:panel id="dwjbxx_panel" title="安全设备" height="window"tbarId="dw_op">
		<cps:table>
			<input type="hidden" name="dw.aqsb.sbbh" value="${dw.aqsb.sbbh}" />
			<input type="hidden" name="dw.aqsb.jgbh" value="${dwBean.dwjbxx.jgbh}" />
			<input type="hidden" name="dw.dwjbxx.jgbh" id="jgbh" value="${dwBean.dwjbxx.jgbh}" />
			<cps:row>
				<cps:tdLabel width="15%">宣传牌：</cps:tdLabel>
				<cps:tdContent width="18%">
					<s:select id="xcp" list="#{'0':'无','1':'有'}" name="dw.aqsb.xcp" listKey="key" listValue="value" cssClass="cps-select"></s:select>
				</cps:tdContent>
				
				<cps:tdLabel width="15%">亮照经营：</cps:tdLabel>
				<cps:tdContent width="18%">
					<s:select id="lzjy" list="#{'0':'无','1':'有'}" name="dw.aqsb.lzjy" listKey="key" listValue="value" cssClass="cps-select"></s:select>
				</cps:tdContent>
				
				<cps:tdLabel width="15%">疏散电梯：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="ssdt" list="#{'0':'无','1':'有'}" name="dw.aqsb.ssdt" listKey="key" listValue="value" cssClass="cps-select"></s:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>简易喷淋：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="jyplq" list="#{'0':'无','1':'有'}" name="dw.aqsb.jyplq" listKey="key" listValue="value" cssClass="cps-select"></s:select>
				</cps:tdContent>
				
				<cps:tdLabel>消火栓：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="xhs" list="#{'0':'无','1':'有'}" name="dw.aqsb.xhs" listKey="key" listValue="value" cssClass="cps-select"></s:select>
				</cps:tdContent>
				
				<cps:tdLabel>阁楼：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="gl" list="#{'0':'无','1':'有'}" name="dw.aqsb.gl" listKey="key" listValue="value" cssClass="cps-select"></s:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>电线套管：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="dxtg" list="#{'0':'无','1':'有'}" name="dw.aqsb.dxtg" listKey="key" listValue="value" cssClass="cps-select"></s:select>
				</cps:tdContent>
				
				<cps:tdLabel>逃生出口：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="tsck" list="#{'0':'无','1':'有'}" name="dw.aqsb.tsck" listKey="key" listValue="value" cssClass="cps-select"></s:select>
				</cps:tdContent>
				
				<cps:tdLabel>火灾报警系统：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="hzbjxt" list="#{'0':'无','1':'有'}" name="dw.aqsb.hzbjxt" listKey="key" listValue="value" cssClass="cps-select"></s:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>安全出口指示牌：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="aqckzsp" list="#{'0':'无','1':'有'}" name="dw.aqsb.aqckzsp" listKey="key" listValue="value" cssClass="cps-select"></s:select>
				</cps:tdContent>
				
				<cps:tdLabel>监控系统(个)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.jkxt" value="${dw.aqsb.jkxt}" id="jkxt" maxlength="2" inputType="integer"  />
				</cps:tdContent>
				
				<cps:tdLabel>逃生梯(具)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.tst" value="${dw.aqsb.tst}" maxlength="2" id="tst" inputType="integer" />
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>视频摄像头(个)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.spsxt" value="${dw.aqsb.spsxt}" id="spsxt" maxlength="4" inputType="integer"   />
				</cps:tdContent>
				<cps:tdLabel>灭火器(瓶)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.mhq" value="${dw.aqsb.mhq}" id="mhq" maxlength="4" inputType="integer"  />
				</cps:tdContent>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield  maxlength="250" name="dw.aqsb.bz" id="bz" value="${dw.aqsb.bz}" />
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>登记人姓名</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${dw.aqsb.djrxm != null}">
							<cps:textfield name="dw.aqsb.djrxm" value="${dw.aqsb.djrxm}" id="djrxm" readonly="true" />
						</c:when>
						<c:otherwise>
							<cps:textfield name="dw.aqsb.djrxm" value="${loginInfo.realname}" id="djrxm" readonly="true" />
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				
				<cps:tdLabel>登记时间</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${dw.aqsb.djsj != null}">
							<cps:date name="dw.aqsb.djsj"  id="djsj" readOnly="true" value="${dw.aqsb.djsj}"  dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date name="dw.aqsb.djsj"  id="djsj" readOnly="true"  dateFmt="yyyy-MM-dd HH:mm:ss" defaultSystemDate="true"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				
				<cps:tdLabel>登记单位</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${dw.aqsb.djdwdm != null}">
							<cps:textfield name="dw.aqsb.djdwmc" value="${dw.aqsb.djdwmc}" id="djdwmc"  readonly="true"/>
							<input type="hidden" name="dw.aqsb.djdwdm" value="${dw.aqsb.djdwdm}" id="djdwdm" />
						</c:when>
						<c:otherwise>
							<cps:textfield name="dw.aqsb.djdwmc" value="${loginInfo.orgname}" id="djdwmc"  readonly="true"/>
							<input type="hidden" name="dw.aqsb.djdwdm" value="${loginInfo.orgcode}" id="djdwdm" />
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
			</cps:row>
		</cps:table>	
	</creator:panel>
</div>
</form>
</creator:view>