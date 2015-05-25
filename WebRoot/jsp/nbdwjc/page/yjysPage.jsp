<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%--  内保单位安全检查 --%>
<creator:view>
	<creator:box>
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="关闭" onclick="window.close()"></cps:button>
			</cps:tbar>
			<cps:panel title="${aqjc.dwlbmc}安全检查信息">
				<form id="aqjcForm">
					<input type="hidden" name="operType" value="${operType}" id="opertype" />
					<input type="hidden" name="modename" value="内保单位安全检查" />
					
					<input type="hidden" name="aqjc.jgbh" value="${aqjc.jgbh}" id="jgbh" />
					<input type="hidden" name="aqjc.id" value="${aqjc.id}" id="aqjc_id" />
					<input type="hidden" name="aqjc.dwlb" value="${dwlb}" id="dwlb" />
					
					<cps:table>
						<cps:row>
							<cps:tdLabel width="15%">单位名称：</cps:tdLabel>
							<cps:tdContent width="35%">
								<cps:textfield name="aqjc.dwmc" value="${aqjc.dwmc}" id="dwmc"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="15%">所属派出所：</cps:tdLabel>
							<cps:tdContent width="35%">
								<cps:textfield name="aqjc.sspcsmc" value="${aqjc.sspcsmc}" id="sspcsmc"></cps:textfield>
								<input type="hidden" name="aqjc.sspcsdm" value="${aqjc. sspcsdm}" />
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color='red'>*</font>检查民警：</cps:tdLabel>
							<cps:tdContent>
								<!-- onclick="orgUserSelect('${loginInfo.rootOrgCode}','jcmjjh','jcmjxm')” appendPopuBtn="true" -->
								<cps:textfield name="aqjc.jcmjxm" value="${aqjc.jcmjxm}" id="jcmjxm" required="true" readonly="true" ></cps:textfield>
								<input type="hidden" name="aqjc.jcmjjh" value="${aqjc.jcmjjh}"  id="jcmjjh"/>
							</cps:tdContent>
							
							<cps:tdLabel><font color='red'>*</font>检查日期：</cps:tdLabel>
							<cps:tdContent>
								<cps:date name="aqjc.jcrq" value="${aqjc.jcrq}" id="jcrq" dateFmt="yyyy-MM-dd" required="true" maxDate="sysdate"></cps:date>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color='red'>*</font>检查情况描述：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<cps:textfield  name="aqjc.jcqkms" cssStyle="width:93.5%"  value="${aqjc.jcqkms}" id="jcqkms" required="true" maxlength="250"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row id="xczprow" cssStyle="display:none;">
							<cps:tdLabel><font color='red'>*</font>现场照片：</cps:tdLabel>
							
							<cps:tdContent colspan="3">
								<cps:button value="上传照片" onclick="tozpxxPage('xczp')" id="zpsc_xczp" cssStyle="display:none"></cps:button>
							</cps:tdContent>
						</cps:row>
					</cps:table>
					
					<!-- 检查项 -->
					<s:action name="toAqjcPageByDwlb" executeResult="true" ></s:action>
					
					<cps:table>
						<cps:row id="yhzprow" cssStyle="display:none;">
							<cps:tdLabel>隐患照片：</cps:tdLabel>
							<cps:tdContent  colspan="3">
								<cps:button value="上传照片" onclick="tozpxxPage('yhzp')" id="zpsc_yhzp" cssStyle="display:none"></cps:button>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>隐患描述：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<cps:textfield name="aqjc.yhms" cssStyle="width:93.5%" value="${aqjc.yhms}" id="yhms" maxlength="250"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>民警处理意见：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<cps:textfield name="aqjc.mjclyj"  cssStyle="width:93.5%" value="${aqjc.mjclyj}" id="mjclyj" maxlength="100"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel width="15%">民警处理：</cps:tdLabel>
							<cps:tdContent width="35%">
								<cps:textfield name="aqjc.mjcl" value="${aqjc.mjcl}" id="mjcl" maxlength="250"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel width="15%">民警限期整改期限(天)：</cps:tdLabel>
							<cps:tdContent width="35%">
								<cps:textfield name="aqjc.mjzgqx" value="${aqjc.mjzgqx}" id="mjzgqx" inputType="number" maxlength="2"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>提交所领导：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="aqjc.tjsldxm" value="${aqjc.tjsldxm}" id="tjsldxm" readonly="true" appendPopuBtn="true" onclick="orgUserSelect('${loginInfo.rootOrgCode}','tjsldjh','tjsldxm')"></cps:textfield>
								<input type="hidden" name="aqjc.tjsldjh" value="${aqjc.tjsldjh}" id="tjsldjh" />
							</cps:tdContent>
							
							<cps:tdLabel>隐患提交民警：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="aqjc.yhtjmjxm" value="${aqjc.yhtjmjxm}" id="yhtjmjxm" readonly="true" appendPopuBtn="true" onclick="orgUserSelect('${loginInfo.rootOrgCode}','yhtjmjjh','yhtjmjxm')"></cps:textfield>
								<input type="hidden" name="aqjc.yhtjmjjh" value="${aqjc.yhtjmjjh}" id="yhtjmjjh" />
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>民警处理时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date name="aqjc.mjclsj" value="${aqjc.mjclsj}" id="mjclsj" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
							</cps:tdContent>
							
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent>
								&nbsp;
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>所领导审批意见：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<cps:textfield cssStyle="width:93.5%" name="aqjc.sldspyj" value="${aqjc.sldspyj}" id="sldspyj" maxlength="100"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>所领导限期整改期限(天)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="aqjc.sldzgqx" value="${aqjc.sldzgqx}" id="sldzgqx" inputType="number" maxlength="2"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>所领导处理：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="aqjc.sldcl" value="${aqjc.sldcl}" id="sldcl" maxlength="250"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>所领导：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="aqjc.sldxm" value="${aqjc.sldxm}" id="sldxm" readonly="true" appendPopuBtn="true" onclick="orgUserSelect('${loginInfo.rootOrgCode}','sldjh','sldxm')"></cps:textfield>
								<input type="hidden" name="aqjc.sldjh" value="${aqjc.sldjh }" />
							</cps:tdContent>
							
							<cps:tdLabel>所领导审批时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date name="aqjc.sldspsj" value="${aqjc.sldspsj}" id="sldspsj" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
							</cps:tdContent>
						</cps:row>
					</cps:table>	
				</form>
			</cps:panel>
		</cps:PanelView>
	</creator:box>
</creator:view>