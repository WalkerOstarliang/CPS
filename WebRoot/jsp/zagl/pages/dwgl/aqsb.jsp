<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="dw_op">
	<cps:button value="保存" onclick="saveDwAqsb();"></cps:button>
	<cps:button value="关闭" onclick="window.close();"></cps:button>
</creator:tbar>
<div id="aqsb_div">
	<creator:panel id="dwjbxx_panel" title="安全设备" height="window"tbarId="dw_op">
		<cps:table>
			<input type="hidden" name="dw.aqsb.sbbh" value="${dw.aqsb.sbbh}" />
			<input type="hidden" name="dw.aqsb.jgbh" value="${dw.aqsb.jgbh}" />
			
			<cps:row>
				<cps:tdLabel width="15%">宣传牌：</cps:tdLabel>
				<cps:tdContent width="18%">
					&nbsp;<s:radio name="dw.aqsb.xcp" list="#{'0':'无','1':'有'}" 
						listKey="key" listValue="value"  id="xcp"  
						value = "dw.aqsb.xcp"></s:radio>
				</cps:tdContent>
				
				<cps:tdLabel width="15%">亮照经营：</cps:tdLabel>
				<cps:tdContent width="18%">
					&nbsp;<s:radio name="dw.aqsb.lzjy" list="#{'0':'无','1':'有'}" 
						listKey="key" listValue="value"  id="lzjy" 
						value = "dw.aqsb.lzjy"></s:radio>
				</cps:tdContent>
				
				<cps:tdLabel width="15%">疏散电梯：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;<s:radio name="dw.aqsb.ssdt" list="#{'0':'无','1':'有'}" 
						listKey="key" listValue="value"  id="ssdt"  
						value = "dw.aqsb.ssdt"></s:radio>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>简易喷淋：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;<s:radio name="dw.aqsb.jyplq" list="#{'0':'无','1':'有'}" 
						listKey="key" listValue="value" id="jyplq"  
						value = "dw.aqsb.jyplq"></s:radio>
				</cps:tdContent>
				
				<cps:tdLabel>消火栓：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;<s:radio name="dw.aqsb.xhs" list="#{'0':'无','1':'有'}" 
						listKey="key" listValue="value" id="xhs"  
						value = "dw.aqsb.xhs"></s:radio>
				</cps:tdContent>
				
				<cps:tdLabel>阁楼：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;<s:radio name="dw.aqsb.gl" list="#{'0':'无','1':'有'}" 
						listKey="key" listValue="value" id="gl"  
						value = "dw.aqsb.gl"></s:radio>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>电线套管：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;<s:radio name="dw.aqsb.dxtg" list="#{'0':'无','1':'有'}" 
						listKey="key" listValue="value" id="dxtg"  
						value = "dw.aqsb.dxtg"></s:radio>
				</cps:tdContent>
				
				<cps:tdLabel>逃生出口：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;<s:radio name="dw.aqsb.tsck" list="#{'0':'无','1':'有'}" 
						listKey="key" listValue="value" id="tsck"  
						value = "dw.aqsb.tsck"></s:radio>
				</cps:tdContent>
				
				<cps:tdLabel>火灾报警系统：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;<s:radio name="dw.aqsb.hzbjxt" list="#{'0':'无','1':'有'}" 
						listKey="key" listValue="value" id="hzbjxt"  
						value = "dw.aqsb.hzbjxt"></s:radio>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>安全出口指示牌：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;<s:radio name="dw.aqsb.aqckzsp" list="#{'0':'无','1':'有'}" 
						listKey="key" listValue="value" id="aqckzsp"  
						value = "dw.aqsb.aqckzsp"></s:radio>
				</cps:tdContent>
				
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>&nbsp;</cps:tdContent>
				
				<cps:tdLabel>逃生梯(具)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.tst" value="${dw.aqsb.tst}" maxlength="2" id="tst" inputType="integer" />
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>监控系统(个)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.jkxt" value="${dw.aqsb.jkxt}" id="jkxt" maxlength="2" inputType="integer"  />
				</cps:tdContent>
				
				<cps:tdLabel>视频摄像头(个)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.spsxt" value="${dw.aqsb.spsxt}" id="spsxt" maxlength="4" inputType="integer"   />
				</cps:tdContent>
				
				<cps:tdLabel>灭火器(瓶)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.mhq" value="${dw.aqsb.mhq}" id="mhq" maxlength="4" inputType="integer"  />
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" cssStyle="width:93.5%;height:60px;" maxlength="250" name="dw.aqsb.bz" id="bz" value="${dw.aqsb.bz}" />
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="15%">登记人姓名</cps:tdLabel>
				<cps:tdContent width="18%">
					<cps:textfield name="dw.aqsb.djrxm" value="${dw.aqsb.djrxm}" id="djrxm" readonly="true" />
				</cps:tdContent>
				
				<cps:tdLabel width="15%">登记时间</cps:tdLabel>
				<cps:tdContent width="18%">
					<cps:textfield name="dw.aqsb.djsj" value="${dw.aqsb.djsj}" id="djsj" readonly="true" />
				</cps:tdContent>
				
				<cps:tdLabel width="15%">登记单位</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.djdwmc" value="${dw.aqsb.djdwmc}" id="djdwmc"  readonly="true"/>
					
					<input type="hidden" name="dw.aqsb.djdwdm" value="${dw.aqsb.djdwdm}" id="djdwdm" />
				</cps:tdContent>
			</cps:row>
			<%-- 
			<cps:row>
				<cps:tdLabel>操作人姓名</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.czrxm" value="${dw.aqsb.czrxm}" id="czrxm" readonly="true" />
				</cps:tdContent>
				
				<cps:tdLabel>操作时间</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.czsj" value="${dw.aqsb.czsj}" id="czsj" readonly="true" />
				</cps:tdContent>
				
				<cps:tdLabel>操作单位</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.aqsb.czdwmc" value="${dw.aqsb.czdwmc}" id="czdwmc" readonly="true" />
					
					<input type="hidden" name="dw.aqsb.czdwdm" value="${dw.aqsb.czdwdm}" id="czdwdm" />
				</cps:tdContent>
			</cps:row>
			--%>
		</cps:table>	
	</creator:panel>
</div>
