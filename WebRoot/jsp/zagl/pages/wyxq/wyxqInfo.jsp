<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/zagl/js/wyxq/wyxq.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${operType != 'detail'}">
				<cps:button value="保存" onclick="saveWyxq()"></cps:button>
			</c:if>
			<c:if test="${operType != 'add'}">
				<c:if test="${wyxq.ywwygs eq '1'}">
					<cps:button value="安全检查" onclick="openWyxqAJWin('${wyxq.id}','add')"></cps:button>
				</c:if>
			</c:if>
			<cps:button value="关闭" onclick="window.close();"></cps:button>
		</cps:tbar>
	
		<cps:panel title="小区信息管理" id="wyxqPanel">
		<div id="wyxqDiv">	
			<form id="wyxqForm">
				<input type="hidden" name="wyxq.id" value="${wyxq.id}" id="id" />
				<input type="hidden" name="operType" value="${operType}" id="operType" />
				<input type="hidden" name="modeName" value="物业小区" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>小区(组)名称：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:textfield name="wyxq.xqmc" value="${wyxq.xqmc}" id="xqmc" maxlength="100" required="true" onkeyup="createXqdz()"/>
						</cps:tdContent>
						
						<cps:tdLabel width="12%"><font color="red">*</font>所属社区(村)：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:textfield name="wyxq.sssqmc" value="${wyxq.sssqmc}" id="sssqmc" maxlength="100" required="true" readonly="true" appendPopuBtn="true" onclick="openSelectSqWin('sssqmc','sssqdm','ssjwqmc','ssjwqdm')" cssStyle="width:94.5%" />
							<input type="hidden" name="wyxq.sssqdm" value="${wyxq.sssqdm}" id="sssqdm" />
							<input type="hidden" name="wyxq.ssjwqdm" value="${wyxq.ssjwqdm}" id="ssjwqdm" />
							<input type="hidden" name="wyxq.ssjwqmc" value="${wyxq.ssjwqmc}" id="ssjwqmc" />
						</cps:tdContent>
						<cps:tdLabel width="12%"><font color='red'>*</font>有无物业公司：</cps:tdLabel>
						<cps:tdContent>
							<s:select name="wyxq.ywwygs" id="ywwygs" list="#{'0':'无','1':'有'}" cssClass="cps-select" onchange="wyxqChage(this.value)"></s:select>
							<%--
							<c:choose>
								<c:when test="${wyxq.ywwygs=='1'}">
									<input type="hidden" name="wyxq.ywwygs" value="1"/>
									<s:select  id="ywwygs" value="1" list="#{'0':'无','1':'有'}" cssClass="cps-select" onchange="wyxqChage(this.value)" disabled="true"></s:select>
								</c:when>
								<c:otherwise>
									<s:select name="wyxq.ywwygs" id="ywwygs" list="#{'0':'无','1':'有'}" cssClass="cps-select" onchange="wyxqChage(this.value)"></s:select>
								</c:otherwise>
							</c:choose>
							 --%>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="16%"><font color="red">*</font>小区(组)地址：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield name="wyxq.dzmc" value="${wyxq.dzmc}" id="dzmc" maxlength="200" required="true" readonly="true" cssStyle="width:97%" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
				
				<%-- 控制物业公司信息是否显示 --%>
				<c:choose>
					<c:when test="${wyxq.ywwygs eq '1'}">
						<c:set var="dislay" value="display:inline;" />
					</c:when>
					<c:otherwise>
						<c:set var="dislay" value="display:none;" />
					</c:otherwise>
				</c:choose>
				<div id="wygs_div" style="${dislay}">		
					<fieldset>
						<legend>单位信息 </legend>
						<cps:table>
							<cps:row>
								<cps:tdLabel><font color="red">*</font>物业公司：</cps:tdLabel>
								<cps:tdContent colspan="5">
									<cps:textfield name="wyxq.wygs" value="${wyxq.wygs}" id="wygs" required="true" maxlength="100" cssStyle="width:97%" />
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel width="16%">建立日期：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:date name="wyxq.jlrq" value="${wyxq.jlrq}" id="jlrq" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
								</cps:tdContent>
								
								<cps:tdLabel width="15%">小区面积(㎡)：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:textfield name="wyxq.xqmj" value="${wyxq.xqmj}" id="xqmj" inputType="number" maxlength="6"> </cps:textfield>
								</cps:tdContent>
								
								<cps:tdLabel width="15%"><font color="red">*</font>楼栋数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.lds" value="${wyxq.lds}" id="lds" inputType="integer" required="true" maxlength="3"/>
								</cps:tdContent>
							</cps:row>
							
							<cps:row>						
								<cps:tdLabel><font color="red">*</font>进出口数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.jcks" value="${wyxq.jcks}" id="jcks" inputType="integer" required="true" maxlength="3"/>
								</cps:tdContent>
								
								<cps:tdLabel><font color="red">*</font>否是有集中停车场：</cps:tdLabel>
								<cps:tdContent>
									<cps:select zdlb="ZDY_ZDSF" name="wyxq.sfyjztcc" value="${wyxq.sfyjztcc}" id="sfyjztcc" required="true" />
								</cps:tdContent>
								
								<cps:tdLabel>停车位数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.tcws" value="${wyxq.tcws}" id="tcws" maxlength="5" inputType="integer" />
								</cps:tdContent>
							</cps:row>
						</cps:table>	
					</fieldset>		
					
					<fieldset>
						<legend>管理人员信息</legend>
						<cps:table>
							<cps:row>
								<cps:tdLabel width="16%"><font color="red">*</font>单位负责人身份证：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:textfield name="wyxq.dwfzrsfzh" value="${wyxq.dwfzrsfzh}" id="dwfzrsfzh" maxlength="18" isSfzh="true"  onblur="queryRyBysfz(this.value)" required="true" />
								</cps:tdContent>
							
								<cps:tdLabel width="15%"><font color="red">*</font>单位负责人：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:textfield name="wyxq.dwfzr" value="${wyxq.dwfzr}" id="dwfzr" maxlength="15" required="true"  />
								</cps:tdContent>
								
								<cps:tdLabel width="15%">单位负责人联系方式：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:textfield name="wyxq.dwfzrlxdh" value="${wyxq.dwfzrlxdh}" id="dwfzrlxdh" maxlength="30" minlength="7" isPhone="true"/>
								</cps:tdContent>
							</cps:row>
							
							<cps:row>
								<cps:tdLabel><font color="red">*</font>安保工作主管领导：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.abfzr" value="${wyxq.abfzr}" id="abfzr" required="true" maxlength="15"/>
								</cps:tdContent>
							
								<cps:tdLabel><font color="red">*</font>安保工作领导联系电话：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.abfzrlxdh" value="${wyxq.abfzrlxdh}" id="abfzrlxdh" minlength="7" required="true" maxlength="30" isPhone="true"/>
								</cps:tdContent>
								
								<cps:tdLabel><font color="red">*</font>单位电话：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.dwdh" value="${wyxq.dwdh}" id="dwdh" required="true" minlength="7" maxlength="30" isPhone="true"/>
								</cps:tdContent>
							</cps:row>
							
							<cps:row>
								<cps:tdLabel>备注：</cps:tdLabel>
								<cps:tdContent colspan="5">
									<cps:textfield name="wyxq.dwbz" value="${wyxq.dwbz}" id="dwbz" maxlength="100" cssStyle="width:97%"/>
								</cps:tdContent>
							</cps:row>
						</cps:table>
					</fieldset>
					
					<fieldset>
						<legend>人防信息 </legend>
						<cps:table>
							<cps:row>
								<cps:tdLabel width="16%">从业人员：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:textfield name="wyxq.cyrs" value="${wyxq.cyrs}" id="cyrs" maxlength="6" inputType="integer" />
								</cps:tdContent>
								
								<cps:tdLabel width="15%">保卫力量：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:textfield name="wyxq.bwll" value="${wyxq.bwll}" id="bwll" maxlength="100"/>
								</cps:tdContent>
								
								<cps:tdLabel width="15%"><font color="red">*</font>保安数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.bas" value="${wyxq.bas}" id="bas" required="true" maxlength="3" inputType="integer" />
								</cps:tdContent>
							</cps:row>
							
							<cps:row>
								<cps:tdLabel><font color="red">*</font>50岁以上保安数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.wssysbas" value="${wyxq.wssysbas}" id="wssysbas" required="true" maxlength="3" inputType="integer"/>
								</cps:tdContent>
								
								<cps:tdLabel>防护装备数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.fhzbs" value="${wyxq.fhzbs}" id="fhzbs" inputType="integer" />
								</cps:tdContent>
								
								<cps:tdLabel>警棍数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.jgs" value="${wyxq.jgs}" id="jgs" maxlength="4" inputType="integer" />
								</cps:tdContent>
							</cps:row>
							
							<cps:row>
								<cps:tdLabel><font color="red">*</font>岗位数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.gws" value="${wyxq.gws}" id="gws" required="true" inputType="integer" maxlength="3"/>
								</cps:tdContent>
								
								<cps:tdLabel><font color="red">*</font>值班人数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.zbrs" value="${wyxq.zbrs}" id="zbrs" required="true" inputType="integer"  maxlength="3"/>
								</cps:tdContent>
								
								<cps:tdLabel><font color="red">*</font>岗位位置及其人数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.gwwzjrs" value="${wyxq.gwwzjrs}" id="gwwzjrs" required="true" inputType="integer" maxlength="3"/>
								</cps:tdContent>
							</cps:row>
						</cps:table>
					</fieldset>
					
					<fieldset>
						<legend>物防信息</legend>
						<cps:table>
							<cps:row>
								<cps:tdLabel width="16%"><font color="red">*</font>封闭式小区：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:select zdlb="ZDY_ZDSF" name="wyxq.fbsxq" value="${wyxq.fbsxq}" id="fbsxq" required="true" />
								</cps:tdContent>
								
								<cps:tdLabel width="15%">围墙：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:textfield name="wyxq.wq" value="${wyxq.wq}" id="wq" maxlength="100"/>
								</cps:tdContent>
								
								<cps:tdLabel width="15%">单元门禁：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.dymj" value="${wyxq.dymj}" id="dymj" maxlength="100"/>
								</cps:tdContent>
							</cps:row>
							
							<cps:row>
								<cps:tdLabel>其它：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.wfqt" value="${wyxq.wfqt}" id="wfqt"  maxlength="100"/>
								</cps:tdContent>
								
								<cps:tdLabel>备注：</cps:tdLabel>
								<cps:tdContent colspan="3">
									<cps:textfield name="wyxq.wfbz" value="${wyxq.wfbz}" id="wfbz"  maxlength="100" cssStyle="width:94.5%"/>
								</cps:tdContent>
							</cps:row>
						</cps:table>
					</fieldset>
					
					<fieldset>
						<legend>技防信息</legend>
						<cps:table>
							<cps:row>
								<cps:tdLabel width="16%">视频监控数：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:textfield name="wyxq.spjks" value="${wyxq.spjks}" id="spjks" maxlength="4" inputType="integer" />
								</cps:tdContent>
								
								<cps:tdLabel width="15%">电子围栏：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:textfield name="wyxq.dzwl" value="${wyxq.dzwl}" id="dzwl" maxlength="100"/>
								</cps:tdContent>
								
								<cps:tdLabel width="15%">门禁系统：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.mjxt" value="${wyxq.mjxt}" id="mjxt" maxlength="100"/>
								</cps:tdContent>
							</cps:row>
							
							<cps:row>
								<cps:tdLabel>监控中心：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.jkzx" value="${wyxq.jkzx}" id="jkzx" maxlength="100"/>
								</cps:tdContent>
								
								<cps:tdLabel>其它：</cps:tdLabel>
								<cps:tdContent colspan="3">
									<cps:textfield name="wyxq.jfqt" value="${wyxq.jfqt}" id="jfqt" maxlength="100" cssStyle="width:94.5%"/>
								</cps:tdContent>
							</cps:row>
						</cps:table>
					</fieldset>
					
					<fieldset>
						<legend>保安监管工作</legend>
						<cps:table>
							<cps:row>
								<cps:tdLabel width="16%"><font color="red">*</font>自行招用保安员单位：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:select zdlb="ZDY_ZDSF" name="wyxq.sfzxzpba" value="${wyxq.sfzxzpba}" id="sfzxzpba" required="true" />
								</cps:tdContent>
								
								<cps:tdLabel width="15%">聘请保安服务公司：</cps:tdLabel>
								<cps:tdContent width="18%">
									<cps:textfield name="wyxq.pqbafwgs" value="${wyxq.pqbafwgs}" id="pqbafwgs" maxlength="100"/>
								</cps:tdContent>
								
								<cps:tdLabel width="15%">聘请保安员人数：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.pqbas" value="${wyxq.pqbas}" id="pqbas" maxlength="4" inputType="integer"/>
								</cps:tdContent>
							</cps:row>
							
							<cps:row>
								<cps:tdLabel width="15%"><font color="red">*</font>自行招用保安员备案：</cps:tdLabel>
								<cps:tdContent>
									<cps:select zdlb="ZDY_ZDSF" name="wyxq.sfba" value="${wyxq.sfba}" id="sfba" required="true" />
								</cps:tdContent>
								
								<cps:tdLabel>备案证号：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="wyxq.bazh" value="${wyxq.bazh}" id="bazh" maxlength="50"/>
								</cps:tdContent>
								
								<cps:tdLabel><font color="red">*</font>保安服务区域：</cps:tdLabel>
								<cps:tdContent colspan="3">
									<cps:textfield name="wyxq.bafwqy" value="${wyxq.bafwqy}" id="bafwqy" required="true" maxlength="100"/>
								</cps:tdContent>
							</cps:row>
							
							<cps:row>
								<cps:tdLabel>备注：</cps:tdLabel>
								<cps:tdContent colspan="5">
									<cps:textfield name="wyxq.bajgbz" value="${wyxq.bajgbz}" id="bajgbz" maxlength="100" cssStyle="width:96.5%"/>
								</cps:tdContent>
							</cps:row>
						</cps:table>
					</fieldset>
				</div>
				
				<fieldset>
					<legend>管辖地/操作信息</legend>
					<cps:table>
						<cps:row>
							<cps:tdLabel width="16%"><font color="red">*</font>所属分区县市局：</cps:tdLabel>
							<cps:tdContent width="18%">
								<cps:textfield name="wyxq.ssfxsjmc" value="${wyxq.ssfxsjmc}" id="ssfxsjmc" required="true" readonly="true" />
								<input type="hidden" name="wyxq.ssfxsjdm" value="${wyxq.ssfxsjdm}" id="ssfxsjdm" />
							</cps:tdContent>
							
							<cps:tdLabel width="15%"><font color="red">*</font>所属派出所：</cps:tdLabel>
							<cps:tdContent width="18%">
								<cps:textfield name="wyxq.sspcsmc" value="${wyxq.sspcsmc}" id="sspcsmc" required="true" readonly="true" />
								<input type="hidden" name="wyxq.sspcsdm" value="${wyxq.sspcsdm}" id="sspcsdm" />
							</cps:tdContent>
							
							<cps:tdLabel width="15%"><font color="red">*</font>社区民警：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="wyxq.sqmjxm" value="${wyxq.sqmjxm}" id="sqmjxm" required="true" 
										readonly="true" appendPopuBtn="true" onclick="selectUser('${loginInfo.orgcode}',${loginInfo.leve})" />
								<input type="hidden" name="wyxq.sqmjjh" value="${wyxq.sqmjjh}" id="sqmjjh" />
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>登记人：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="wyxq.djrxm" value="${wyxq.djrxm}" id="djrxm" required="true" />
								<input type="hidden" name="wyxq.djrjh" value="${wyxq.djrjh}" id="djrjh" />
								<input type="hidden" name="wyxq.djrsfzh" value="${wyxq.djrsfzh}" id="djrsfzh" />
							</cps:tdContent>
							
							<cps:tdLabel><font color="red">*</font>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date name="wyxq.djsj" value="${wyxq.djsj}" id="djsj" required="true" dateFmt="yyyy-MM-dd HH:mm:ss" />
							</cps:tdContent>
							
							<cps:tdLabel><font color="red">*</font>登记单位：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="wyxq.djdwmc" value="${wyxq.djdwmc}" id="djdwmc" required="true" />
								<input type="hidden" name="wyxq.djdwdm" value="${wyxq.djdwdm}" id="djdwdm" />
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>操作人：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="wyxq.czrxm" value="${wyxq.czrxm}" id="czrxm" required="true" />
								<input type="hidden" name="wyxq.czrjh" value="${wyxq.czrjh}" id="czrjh" />
								<input type="hidden" name="wyxq.czrsfzh" value="${wyxq.czrsfzh}" id="czrsfzh" />
							</cps:tdContent>
	
							<cps:tdLabel><font color="red">*</font>操作时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="wyxq.czsj" value="${wyxq.czsj}" id="czsj" required="true" />
							</cps:tdContent>
							
							<cps:tdLabel><font color="red">*</font>操作单位：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="wyxq.czdwmc" value="${wyxq.czdwmc}" id="czdwmc" required="true" />
								<input type="hidden" name="wyxq.czdwdm" value="${wyxq.czdwdm}" id="czdwmc" />
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>是否注销：</cps:tdLabel>
							<cps:tdContent>
								<cps:select zdlb="ZDY_ZDSF" name="wyxq.zxbs" value="${wyxq.zxbs}" id="zxbs" required="true" onchange="zxbsChange(this.value)"/>
							</cps:tdContent>
							
							<cps:tdLabel>注销时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date name="wyxq.zxsj" id="zxsj" value="${wyxq.zxsj}" dateFmt="yyyy-MM-dd" maxDate="sysdate" disabled="true"></cps:date>
							</cps:tdContent>
							
							
							<cps:tdLabel>注销原因：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="wyxq.zxyy" value="${wyxq.zxyy}" id="zxyy" disabled="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</fieldset>
			</form>
		</div>	
		</cps:panel>
	</cps:PanelView>	
</creator:view>