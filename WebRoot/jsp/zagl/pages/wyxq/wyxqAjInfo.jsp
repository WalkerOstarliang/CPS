<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/zagl/js/wyxq/wyxq.js"></creator:Script>
	<script type="text/javascript">
	$(function(){
		window.moveTo(0,0) ;
		window.resizeTo(screen.availWidth,screen.availHeight); 
	})
	</script>
	<cps:PanelView>
			<div id="wyxqaJlistDiv">
				<cps:tableGrid url="/zagl/wyxq/queryWyxqaJList.action" title="物业小区安全检查列表"
		id="wyxqaJList" autoload="true" pageSize="3" width="99.8%"
		usepager="true" searchform="wyxqaJForm" autothead="false" mutilSelect="true" click="formQueryList">
					<cps:column isNumber="true" title="序号"></cps:column>
					<cps:column title="小区名称" field="xqmc" align="left" ></cps:column>
					<cps:column title="检查日期" field="jcrq" align="left" ></cps:column>
					<cps:column title="检查情况" field="qkms" align="left" ></cps:column>
					<cps:column title="隐患描述" field="aqyhms" align="left" ></cps:column>
					<cps:column title="处理意见" field="mjclyj" align="left" ></cps:column>
				</cps:tableGrid>
			</div>
	</cps:PanelView>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="新增" onclick="crearWyxqaJ()"></cps:button>
			<c:choose>
				<c:when test="${operType=='add'}">
					<cps:button value="保存" onclick="saveWyxqaJ()"></cps:button>
				</c:when>	
			</c:choose>	
			<cps:button value="关闭" onclick="window.close();"></cps:button>
		</cps:tbar>
		<cps:panel title="物业小区信息" id="wyxqPanel">		 
		<div id="wyxqaJDiv">	
			<form id="wyxqaJForm">
			<fieldset>
				<legend>物业小区信息 </legend>
				<cps:table>
					<cps:row id="clear_row">
						<input id="id" name="wyxqajBean.id" value="${wyxqajBean.id}" type="hidden" />							
					</cps:row>
					<cps:row >
					<cps:tdLabel width="12%"><font color="red">*</font>物业小区名称：</cps:tdLabel>
					<cps:tdContent width="22%">
						<c:choose>
							<c:when test="${operType=='add'}">	
								<cps:textfield id="xqmc" name="wyxqajBean.xqmc" value="${wyxqajBean.xqmc}" readonly="true"></cps:textfield>
								<input id="jcrq" name="wyxqajBean.jcrq" value="${wyxqajBean.jcrq}" type="hidden" />
							</c:when>
							<c:otherwise>		
							 	<cps:textfield id="xqmc" name="wyxqajBean.xqmc" value="${wyxqajBean.xqmc}" readonly="true"></cps:textfield>
								<input id="jcrq" name="wyxqajBean.jcrq" value="${wyxqajBean.jcrq}" type="hidden" />
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="12%">所属派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='add'}">
								<cps:textfield id="sspcsmc" name="wyxqajBean.sspcsmc" value="${wyxqajBean.sspcsmc}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="sspcsmc" name="wyxqajBean.sspcsmc" value="${wyxqajBean.sspcsmc}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="12%">检查民警：</cps:tdLabel>
					<cps:tdContent width="22%">
						<c:choose>
							<c:when test="${operType=='add'}">
								<cps:textfield id="jcmjxm" name="wyxqajBean.jcmjxm" value="${wyxqajBean.jcmjxm}" readonly="true"></cps:textfield>
								<input id="jcmjjh" name="wyxqajBean.jcmjjh" value="${wyxqajBean.jcmjjh}" type="hidden" />
								<input id="wyxdwqid" name="wyxqajBean.wyxdwqid" value="${wyxqajBean.wyxdwqid}" type="hidden" />
							</c:when>
							<c:otherwise>	
								<cps:textfield id="jcmjxm" name="wyxqajBean.jcmjxm" value="${wyxqajBean.jcmjxm}" readonly="true"></cps:textfield>
								<input id="jcmjjh" name="wyxqajBean.jcmjjh" value="${wyxqajBean.jcmjjh}" type="hidden" />
								<input id="wyxdwqid" name="wyxqajBean.wyxdwqid" value="${wyxqajBean.wyxdwqid}" type="hidden" />
							</c:otherwise>
						</c:choose>					
					</cps:tdContent>
					</cps:row>	 
					<cps:row id="clear_row">
						<cps:tdLabel width="12%"><font color="red">*</font>检查情况描述：</cps:tdLabel>					
							<cps:tdContent colspan="5"  >
								<c:choose>
									<c:when test="${operType=='add'}">
										<cps:textfield id="qkms" name="wyxqajBean.qkms" type="textarea" value="${wyxqajBean.qkms}"  cssStyle="height:80px;width:95%" required="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										<cps:textfield id="qkms" name="wyxqajBean.qkms" type="textarea" value="${wyxqajBean.qkms}"  cssStyle="height:80px;width:95%" required="true"></cps:textfield>	
									</c:otherwise>
								</c:choose>
							</cps:tdContent>							
					</cps:row>
				</cps:table>
			</fieldset>	
			<fieldset>
				<legend title="333">检查项目（是否合格）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</legend>
			</fieldset>
			<fieldset>
				<legend>制度防范 </legend>
				<cps:table>
					<cps:row id="clear_row">		
					<cps:tdLabel width="20%"><font color='red'>*</font>制定和落实内部治安保卫制度：</cps:tdLabel>
					<cps:tdContent width="30%">
						<input type="radio" id="zdlsnbzabwzd1" name="wyxqajBean.zdlsnbzabwzd" value="1" /><label for="zdlsnbzabwzd1">是</label>
						<input type="radio" id="zdlsnbzabwzd0" name="wyxqajBean.zdlsnbzabwzd" value="0" /><label for="zdlsnbzabwzd0">否</label>
					</cps:tdContent>	
					<cps:tdLabel width="20%"><font color="red">*</font>落实内部治安保卫工作责任制：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="lsnbzabwzr1" name="wyxqajBean.lsnbzabwzr" value="1" /><label for="lsnbzabwzr1">是</label>
								<input type="radio" id="lsnbzabwzr0" name="wyxqajBean.lsnbzabwzr" value="0" /><label for="lsnbzabwzr0">否</label>
							</cps:tdContent>
					</cps:row>
					<cps:row id="clear_row">
							<cps:tdLabel width="20%"><font color="red">*</font>落实员工安全防范培训教育：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="lsygaqffpx1" name="wyxqajBean.lsygaqffpx" value="1" /><label for="lsygaqffpx1">是</label>
								<input type="radio" id="lsygaqffpx0" name="wyxqajBean.lsygaqffpx" value="0" /><label for="lsygaqffpx0">否</label>
							</cps:tdContent>
							<cps:tdLabel width="20%"><font color="red">*</font>来访人员及物品出入登记手续：</cps:tdLabel>
							<cps:tdContent width="20%">
								<input type="radio" id="lfrywpdjsx1" name="wyxqajBean.lfrywpdjsx" value="1" /><label for="lfrywpdjsx1">是</label>
								<input type="radio" id="lfrywpdjsx0" name="wyxqajBean.lfrywpdjsx" value="0" /><label for="lfrywpdjsx0">否</label>	
							</cps:tdContent>	
					</cps:row>
				</cps:table>
			</fieldset>	
			<fieldset>
				<legend>技防 </legend>
				<cps:table>
					<cps:row id="clear_row">						
					 <cps:tdLabel width="20%"><font color="red">*</font>单元门禁系统：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="dymjxt1" name="wyxqajBean.dymjxt" value="1" /><label for="dymjxt1">是</label>
								<input type="radio" id="dymjxt0" name="wyxqajBean.dymjxt" value="0" /><label for="dymjxt0">否</label>	
							</cps:tdContent>	
						<cps:tdLabel width="20%"><font color="red">*</font>监控或入侵报警系统是否正常：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="spbjxtyz1" name="wyxqajBean.spbjxtyz" value="1" /><label for="spbjxtyz1">是</label>
								<input type="radio" id="spbjxtyz0" name="wyxqajBean.spbjxtyz" value="0" /><label for="spbjxtyz0">否</label>	
							</cps:tdContent>		
					</cps:row>
				</cps:table>
			</fieldset>
			
			<fieldset>
				<legend>物防 </legend>
				<cps:table>
					<cps:row id="clear_row">
						<cps:tdLabel width="20%"><font color="red">*</font>是否有集中停车场：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="sfjztcc1" name="wyxqajBean.sfjztcc" value="1" /><label for="sfjztcc1">是</label>
								<input type="radio" id="sfjztcc0" name="wyxqajBean.sfjztcc" value="0" /><label for="sfjztcc0">否</label>
							</cps:tdContent>
						<cps:tdLabel width="20%"><font color="red">*</font>要害部位防盗门窗：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="yhbwfdcfdm1" name="wyxqajBean.yhbwfdcfdm" value="1" /><label for="yhbwfdcfdm1">是</label>
								<input type="radio" id="yhbwfdcfdm0" name="wyxqajBean.yhbwfdcfdm" value="0" /><label for="yhbwfdcfdm0">否</label>
							</cps:tdContent>		
					</cps:row>
					<cps:row id="clear_row">					
						<cps:tdLabel width="20%"><font color="red">*</font>小区围墙是否完好：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="wqsfwh1" name="wyxqajBean.wqsfwh" value="1" /><label for="wqsfwh1">是</label>
								<input type="radio" id="wqsfwh0" name="wyxqajBean.wqsfwh" value="0" /><label for="wqsfwh0">否</label>
							</cps:tdContent>
							
					</cps:row>
				</cps:table>
			</fieldset>
			
			<fieldset>
				<legend>人防 </legend>
				<cps:table>
					<cps:row id="clear_row">		
						<cps:tdLabel width="20%"><font color="red">*</font>足够数量的安保人员：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="sfzgabry1" name="wyxqajBean.sfzgabry" value="1" /><label for="sfzgabry1">是</label>
								<input type="radio" id="sfzgabry0" name="wyxqajBean.sfzgabry" value="0" /><label for="sfzgabry0">否</label>
							</cps:tdContent>	
						<cps:tdLabel width="20%"><font color="red">*</font>岗前培训、定期培训：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="sfgqpx1" name="wyxqajBean.sfgqpx" value="1" /><label for="sfgqpx1">是</label>
								<input type="radio" id="sfgqpx0" name="wyxqajBean.sfgqpx" value="0" /><label for="sfgqpx0">否</label>
							</cps:tdContent>		
					</cps:row>
					<cps:row id="clear_row">
						<cps:tdLabel width="20%"><font color="red">*</font>使用防卫、报警装备：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="sffwqxbj1" name="wyxqajBean.sffwqxbj" value="1" /><label for="sffwqxbj1">是</label>
								<input type="radio" id="sffwqxbj0" name="wyxqajBean.sffwqxbj" value="0" /><label for="sffwqxbj0">否</label>
							</cps:tdContent>
					</cps:row>
				</cps:table>
			</fieldset>
			
			<fieldset>
				<legend>保安监管 </legend>
				<cps:table>
					<cps:row id="clear_row">						
						<cps:tdLabel width="20%"><font color="red">*</font>保安员全部持《保安员证》上岗：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="sfcsgz1" name="wyxqajBean.sfcsgz" value="1" /><label for="sfcsgz1">是</label>
								<input type="radio" id="sfcsgz0" name="wyxqajBean.sfcsgz" value="0" /><label for="sfcsgz0">否</label>									
							</cps:tdContent>
						<cps:tdLabel width="20%"><font color="red">*</font>定期开展教育、培训：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="sfdqjy1" name="wyxqajBean.sfdqjy" value="1" /><label for="sfdqjy1">是</label>
								<input type="radio" id="sfdqjy0" name="wyxqajBean.sfdqjy" value="0" /><label for="sfdqjy0">否</label>	
							</cps:tdContent>
						</cps:row>						
					<cps:row id="clear_row">
						<cps:tdLabel width="20%"><font color="red">*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
							<cps:tdContent width="30%" >
								<input type="radio" id="sfybafz1" name="wyxqajBean.sfybafz" value="1" /><label for="sfybafz1">是</label>
								<input type="radio" id="sfybafz0" name="wyxqajBean.sfybafz" value="0" /><label for="sfybafz0">否</label>	
							</cps:tdContent>
							<cps:tdLabel width="2%" rowspan="4" colspan="1">隐患照片：</cps:tdLabel>	
							<cps:tdContent width="99%" rowspan="4" colspan="3">
								<!-- 上传照片 -->					
							</cps:tdContent>
					</cps:row>		
					<cps:row id="clear_row">
						<cps:tdLabel width="20%"><font color="red">*</font>保安员是否认真履职,有较强安全防范意识：</cps:tdLabel>
							<cps:tdContent width="30%" >
								<input type="radio" id="sfrzlz1" name="wyxqajBean.sfrzlz" value="1" /><label for="sfrzlz1">是</label>
								<input type="radio" id="sfrzlz0" name="wyxqajBean.sfrzlz" value="0" /><label for="sfrzlz0">否</label>	
							</cps:tdContent>
					</cps:row>	
					<cps:row id="clear_row">
						<cps:tdLabel width="20%"><font color="red">*</font>是否为自招保安员单位：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="sfzzabdw1" name="wyxqajBean.sfzzabdw" value="1" /><label for="sfzzabdw1">是</label>
								<input type="radio" id="sfzzabdw0" name="wyxqajBean.sfzzabdw" value="0" /><label for="sfzzabdw0">否</label>
							</cps:tdContent>
					</cps:row>
					
					<cps:row id="clear_row">
						<cps:tdLabel width="20%"><font color="red">*</font>是否办理自招保安员单位备案：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="radio" id="sfblzzba1" name="wyxqajBean.sfblzzba" value="1" /><label for="sfblzzba1">是</label>
								<input type="radio" id="sfblzzba0" name="wyxqajBean.sfblzzba" value="0" /><label for="sfblzzba0">否</label>
							</cps:tdContent>
					</cps:row>				
				</cps:table>
			</fieldset>			
			<fieldset>
				<cps:table>	
					<cps:row id="clear_row">						
						<cps:tdLabel width="4%"><font color="red">*</font>隐患描述：</cps:tdLabel>					
							<cps:tdContent width="25%" colspan="5"  >
								<c:choose>
									<c:when test="${operType=='add'}">
										<cps:textfield id="aqyhms" name="wyxqajBean.aqyhms" type="textarea" value="${wyxqajBean.aqyhms}"  cssStyle="height:80px;width:95%" required="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										<cps:textfield id="aqyhms" name="wyxqajBean.aqyhms" type="textarea" value="${wyxqajBean.aqyhms}"  cssStyle="height:80px;width:95%" required="true"></cps:textfield>									
									</c:otherwise>
								</c:choose>
							</cps:tdContent>							
					</cps:row>
					<cps:row id="clear_row">
						<cps:tdLabel width="4%"><font color="red">*</font>民警处理意见：</cps:tdLabel>
						<cps:tdContent width="25%" colspan="5">
							<c:choose>
								<c:when test="${operType=='add'}">
									<cps:textfield id="mjclyj" name="wyxqajBean.mjclyj" type="textarea" value="${wyxqajBean.mjclyj}"  cssStyle="height:80px;width:95%" required="true"></cps:textfield>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mjclyj" name="wyxqajBean.mjclyj" type="textarea" value="${wyxqajBean.mjclyj}"  cssStyle="height:80px;width:95%" required="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row id="clear_row">
						<cps:tdLabel width="4%">处理：</cps:tdLabel>					
							<cps:tdContent width="25%" colspan="1">
								<c:choose>
									<c:when test="${operType=='add'}">
										<cps:textfield id="aqcl" name="wyxqajBean.aqcl" type="textarea" value="${wyxqajBean.aqcl}"  cssStyle="height:20px;width:90%" maxlength="3" ></cps:textfield>
									</c:when>
									<c:otherwise>
										<cps:textfield id="aqcl" name="wyxqajBean.aqcl" type="textarea" value="${wyxqajBean.aqcl}"  cssStyle="height:20px;width:90%" maxlength="3" ></cps:textfield>										
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel width="4%">整改期限（天）：</cps:tdLabel>					
							<cps:tdContent width="25%" colspan="1">
								<c:choose>
									<c:when test="${operType=='add'}">
										<cps:textfield id="aqzgqx" name="wyxqajBean.aqzgqx" type="textarea" value="${wyxqajBean.aqzgqx}"  cssStyle="height:20px;width:90%" maxlength="3" inputType="integer"></cps:textfield>
									</c:when>
									<c:otherwise>
										<cps:textfield id="aqzgqx" name="wyxqajBean.aqzgqx" type="textarea" value="${wyxqajBean.aqzgqx}"  cssStyle="height:20px;width:90%" maxlength="3" inputType="integer"></cps:textfield>										
									</c:otherwise>
								</c:choose>
							</cps:tdContent>		
					</cps:row>
					<cps:row id="clear_row">
						<cps:tdLabel width="4%">所领导意见：</cps:tdLabel>					
							<cps:tdContent width="25%" colspan="5">
								<c:choose>
									<c:when test="${operType=='add'}">
										<cps:textfield id="sldspyj" name="wyxqajBean.sldspyj" type="textarea" value="${wyxqajBean.sldspyj}"  cssStyle="height:20px;width:90%" maxlength="6"></cps:textfield>
									</c:when>
									<c:otherwise>
										<cps:textfield id="sldspyj" name="wyxqajBean.sldspyj" type="textarea" value="${wyxqajBean.sldspyj}"  cssStyle="height:20px;width:90%" maxlength="6"></cps:textfield>										
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
					</cps:row>
					<cps:row id="clear_row">
						<cps:tdLabel width="4%">所领导：</cps:tdLabel>					
							<cps:tdContent width="25%" colspan="1">
								<c:choose>
									<c:when test="${operType=='add'}">
										<cps:textfield id="sldxm" name="wyxqajBean.sldxm"  value="${wyxqajBean.sldxm}"  cssStyle="height:20px;width:90%"  onclick="openZrmjSelect('${loginInfo.rootOrgCode}','sldjh','sldxm')" readonly="true" appendPopuBtn="true"></cps:textfield>
										<input id="sldjh" name="wyxqajBean.sldjh" value="${wyxqajBean.sldjh}" type="hidden" />
									</c:when>
									<c:otherwise>	
										<cps:textfield id="sldxm" name="wyxqajBean.sldxm"  value="${wyxqajBean.sldxm}"  cssStyle="height:20px;width:90%"  onclick="openZrmjSelect('${loginInfo.rootOrgCode}','sldjh','sldxm')" readonly="true" appendPopuBtn="true"></cps:textfield>
										<input id="sldjh" name="wyxqajBean.sldjh" value="${wyxqajBean.sldjh}" type="hidden" />
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel width="4%">审批时间：</cps:tdLabel>					
							<cps:tdContent width="25%" colspan="1">
								<c:choose>
									<c:when test="${operType=='add'}">
									 	<cps:date id="sldspsj" name="wyxqajBean.sldspsj" value="${wyxqajBean.sldspsj}" dateFmt='"yyyy-mm-dd"'></cps:date>
									</c:when>
									<c:otherwise>	
										<cps:date id="sldspsj" name="wyxqajBean.sldspsj" value="${wyxqajBean.sldspsj}" dateFmt='"yyyy-mm-dd"'></cps:date>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
					</cps:row>
				</cps:table>				
			</fieldset>
			</form>
			</div>		
		</cps:panel>			
	</cps:PanelView>	
</creator:view>