<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="派出所警务区信息管理">
	<creator:Script src="/jsp/gzgl/js/jws.js"></creator:Script>
	<creator:Script src="/jsp/xtgl/js/pcs.js"></creator:Script>
	<creator:Script src="/jsp/gzgl/js/userlxfs.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var ispcs = $("#ispcs").val();
			var orgcode = $("#orgcode").val();
			var logincode = $("#loginorgcode").val();
			var showSaveButton = ${pcsBean.showSaveButton};
			if(!showSaveButton)
			{
				$("#pcsdiv").displayInputForText();
			}
			/*if(ispcs =='1' && orgcode != logincode){
				$("#pcsdiv").displayInputForText();
			}*/
		})
	</script>
	<form id="hiddenform">
		<input type="hidden" id="rootParentDm" name="rootOrgCode" value="${rootParentDm}">
		<input type="hidden" id="rootParentMc" name="rootOrgname" value="${ rootParentMc}">
		<input type="hidden" id="loginorgcode"  value="${loginInfo.orgcode }">
		<input type="hidden" id="ispcs" name="ispcs" value="${ispcs}">
	</form>
	<c:if test="${ispcs=='1'}">
	<div id ="pcsdiv">
		<cps:PanelView>
			<cps:tbar  id="pcstbar">
				<c:if test="${pcsBean.showSaveButton}">
					<cps:button id="pcssavebtn" value="保&nbsp;存" onclick="savaPcsInfo()"></cps:button>
				</c:if>
			 </cps:tbar>
			<cps:panel id="pcsglpanel" title="派出所基本信息" width="99.5%">
				<form id="pcsform">
					<input type="hidden" id="id" name="pcsBean.id" value="${pcsBean.id }"/>
					<input type="hidden" id="orgid" name="pcsBean.orgid" value="${pcsBean.orgid}"/>
					<input type="hidden" id="orgcode" name="pcsBean.orgcode" value="${pcsBean.orgcode }"/>
					<input type="hidden" id="ispcs" name="pcsBean.ispcs" value="${pcsBean.ispcs }"/>
					<cps:table>
						<cps:row id="clear_row2">
							<cps:tdLabel width="20%"><font color="red">*</font>派出所名称：</cps:tdLabel>
							<cps:tdContent width="30%">
								<cps:textfield id="hhh" name="pcsBean.orgname" value="${pcsBean.orgname}" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="20%"><font color="red">*</font>级别：</cps:tdLabel>
							<cps:tdContent width="30%">
								<cps:select id="jb" name="pcsBean.jb" value="${pcsBean.jb}" zdlb="ZDY_PCSJB" headerKey="" headerValue=" " required="true"></cps:select>
							</cps:tdContent>
						</cps:row>
						
						<cps:row id="clear_row3">
							<cps:tdLabel><font color="red">*</font>派出所类别：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="lb" name="pcsBean.lb" value="${pcsBean.lb}" zdlb="ZDY_PCSLB" headerKey="" headerValue=" " required="true"></cps:select>
							</cps:tdContent>
							<cps:tdLabel width="20%"><font color='red'>*</font>派出所等级：</cps:tdLabel>
							<cps:tdContent width="30%">
								<input type="hidden" id="pcsjwqdj" name="pcsBean.pcsjwqdj" value="${pcsBean.pcsjwqdj}">
								<cps:select id="dj" name="pcsBean.dj" value="${pcsBean.dj}" zdlb="ZDY_PCSDJ" headerKey="" headerValue=" " required="true" onchange="document.getElementById('pcsjwqdj').value=this.value"></cps:select>
							</cps:tdContent>
						</cps:row>
							<cps:tdLabel><font color='red'>*</font>是否经省厅批准：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'1':'是','0':'否'}" headerKey=" " headerValue="" name="pcsBean.sfstpz" cssClass="cps-select validate[required]"></s:select>
							</cps:tdContent>
							
							<cps:tdLabel><font color='red'>*</font>派出所等级评定时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date name="pcsBean.pcsdjpdsj" value="${pcsBean.pcsdjpdsj}" maxDate="sysdate" dateFmt="yyyy-MM-dd" id="pcsdjpdsj" required="true"></cps:date>
							</cps:tdContent>
						<cps:row>
							
						</cps:row>
						
						<cps:row>
							<cps:tdLabel >队室名称(一队)：</cps:tdLabel>
							<cps:tdContent >
								<cps:select zdlb='ZDY_SDMC1'  id="dsmc1" name="pcsBean.dsmc1" value="${pcsBean.dsmc1}" headerKey="" headerValue=" " ></cps:select>
							</cps:tdContent>
							<cps:tdLabel >队室名称(二队)：</cps:tdLabel>
							<cps:tdContent >
								<cps:select zdlb='ZDY_SDMC1'  id="dsmc2" name="pcsBean.dsmc2" value="${pcsBean.dsmc2}" headerKey="" headerValue=" " ></cps:select>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row7">
							<cps:tdLabel >队室名称(三队)：</cps:tdLabel>
							<cps:tdContent >
								<cps:select zdlb='ZDY_SDMC1'  id="dsmc3" name="pcsBean.dsmc3" value="${pcsBean.dsmc3}" headerKey="" headerValue=" " ></cps:select>
							</cps:tdContent>
							<cps:tdLabel >队室名称(一室)：</cps:tdLabel>
							<cps:tdContent >
								<cps:select zdlb='ZDY_SDMC2'  id="dsmc4" name="pcsBean.dsmc4" value="${pcsBean.dsmc4}" headerKey="" headerValue=" " ></cps:select>
							</cps:tdContent>
						</cps:row>
						
						<cps:row id="clear_row7">
							<cps:tdLabel >队室名称(二室)：</cps:tdLabel>
							<cps:tdContent >
								<cps:select zdlb='ZDY_SDMC2'  id="dsmc5" name="pcsBean.dsmc5" value="${pcsBean.dsmc5}" headerKey="" headerValue=" " ></cps:select>
							</cps:tdContent>
							
							<cps:tdLabel><font color='red'>*</font>编制数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="bzs" name="pcsBean.bzs" value="${pcsBean.bzs}" inputType="number" required="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color='red'>*</font>警力数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="jls" name="pcsBean.jls" value="${pcsBean.jls}" inputType="number" readonly="true" required="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel><font color='red'>*</font>实有警力数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="syjls" name="pcsBean.syjls" value="${pcsBean.syjls}" inputType="number" required="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent colspan= '4'>
								<span style="color:red">
									实有警力数指实际在职在岗工作的警力数，不含半年以下基层锻炼民警和因病、外借、内退等原因半年以上不从事本所工作或不在本所上班的本所民警。
								</span>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row5">
							<cps:tdLabel>辅警数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="fjs" name="pcsBean.fjs" value="${pcsBean.fjs}" inputType="number" readonly="true"></cps:textfield>
							</cps:tdContent>
						
							<cps:tdLabel><font color='red'>*</font>社区数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="sqs" name="pcsBean.sqs" value="${pcsBean.sqs}" inputType="number" required="true" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>建立警务室数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="sqjwss" name="pcsBean.sqjwss" value="${pcsBean.sqjwss}" inputType="number" readonly="true"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>社区民警数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="sqmjs" name="pcsBean.sqmjs" value="${pcsBean.sqmjs}" inputType="number" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>社区民警占警力比(%)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="sqmjzjlb" name="pcsBean.sqmjzjlb" value="${pcsBean.sqmjzjlb}" inputType="number" readonly="true"></cps:textfield>
								<font color="red"></font>
							</cps:tdContent>
							
							<cps:tdLabel>社区民警配备辅警数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="sqmjpbfjs" name="pcsBean.sqmjpbfjs" value="${pcsBean.sqmjpbfjs}" readonly="true" inputType="number"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>社区民警人均配备辅警数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="sqmjrjpbfjs" name="pcsBean.sqmjrjpbfjs" value="${pcsBean.sqmjrjpbfjs}" readonly="true" inputType="number"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel><font color='red'>*</font>行政村数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="xzcs" name="pcsBean.xzcs" value="${pcsBean.xzcs}" inputType="number" maxlength="3" required="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>农村警务室数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="ncjwss" name="pcsBean.ncjwss" value="${pcsBean.ncjwss}" readonly="true" inputType="number" ></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>驻村民警数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="zcmjs" name="pcsBean.zcmjs" value="${pcsBean.zcmjs}" readonly="true" inputType="number" ></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>人均公用经费保障：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="rjgyjfbz" name="pcsBean.rjgyjfbz" value="${pcsBean.rjgyjfbz}" inputType="number" cssStyle="width:65%" required="true"></cps:textfield>
								<label>(万元)</label>
							</cps:tdContent>
							<cps:tdLabel><font color="red">*</font>实际拨付到位：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="sjbfdw" name="pcsBean.sjbfdw" value="${pcsBean.sjbfdw}" inputType="number" cssStyle="width:65%"></cps:textfield>
								<label>(万元)</label>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>所长姓名：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="pcsszxm" name="pcsBean.pcsszxm" value="${pcsBean.pcsszxm}" onclick="orgUserSelect('${pcsBean.orgcode }')" appendPopuBtn="true"></cps:textfield>
								<input type="hidden" id="pcsszsfzh"  name="pcsBean.pcsszsfzh" value="${pcsBean.pcsszsfzh}" />
							</cps:tdContent>
						
							<cps:tdLabel>所长警号：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="pcsszjh" name="pcsBean.pcsszjh" value="${pcsBean.pcsszjh}" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>所长职级：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="szzj" name="pcsBean.szzj" value="${pcsBean.szzj}" zdlb="ZDY_PCSJB" headerKey="" headerValue=" " required="true"></cps:select>
							</cps:tdContent>
							
							<cps:tdLabel><font color="red">*</font>所长是否进乡镇（街道）班子：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="szsfjrxzbz" name="pcsBean.szsfjrxzbz" value="${pcsBean.szsfjrxzbz}" zdlb="ZDY_ZDSF" headerKey="" headerValue=" " required="true"></cps:select>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>辖区面积(㎡)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="xqmj" name="pcsBean.xqmj" value="${pcsBean.xqmj}" inputType="number" required="true"></cps:textfield>
							<font color="red"></font>
							</cps:tdContent>
							<cps:tdLabel>户籍人口数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="hjrks" name="pcsBean.hjrks" value="${pcsBean.hjrks}" inputType="number" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>暂住人口数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="zzrks" name="pcsBean.zzrks" value="${pcsBean.zzrks}" inputType="number" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>重点对象数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="zddxs" name="pcsBean.zddxs" value="${pcsBean.zddxs}" inputType="number" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>重点单位数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="zddws" name="pcsBean.zddws" value="${pcsBean.zddws}" inputType="number" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel><font color="red">*</font>重点场所数：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="zdcss" name="pcsBean.zdcss" value="${pcsBean.zdcss}" inputType="number" required="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>汽车：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="pcsBean.qcs" value="${pcsBean.qcs}" id="qcs" inputType="integer" maxlength="3" required="true"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel><font color="red">*</font>电脑：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="pcsBean.dnts" value="${pcsBean.dnts}" id="dnts" inputType="integer" maxlength="3" required="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>单警装备(套)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="pcsBean.djzbs" value="${pcsBean.djzbs}" id="djzbs" inputType="integer" maxlength="3" required="true"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel><font color="red">*</font>防弹头盔(套)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="pcsBean.fdtks" value="${pcsBean.fdtks}" id="fdtks" inputType="integer" maxlength="3" required="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>防弹背心(套)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="pcsBean.fdbxs" value="${pcsBean.fdbxs}" required="true" id="fdbxs" inputType="integer" maxlength="3"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel><font color="red">*</font>防刺背心(套)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="pcsBean.fcbxs" value="${pcsBean.fcbxs}" required="true" id="fcbxs" inputType="integer" maxlength="3"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>操作人姓名：</cps:tdLabel>	
							<cps:tdContent> 
								<c:choose>
									<c:when test="${empty pcsBean.czrxm}">
											<cps:textfield id="czrxm" name="pcsBean.czrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
									</c:when>
									<c:otherwise>
											<cps:textfield id="czrxm" name="pcsBean.czrxm" value="${pcsBean.czrxm}" readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							
							<cps:tdLabel>操作时间：</cps:tdLabel>	
							<cps:tdContent> 
								<c:choose>
									<c:when test="${empty pcsBean.czsj}">
										<cps:date id="czsj" name="pcsBean.czsj" defaultSystemDate="true" readOnly="true"></cps:date>
									</c:when>
									<c:otherwise>
										<cps:date id="czsj" name="pcsBean.czsj" value="${pcsBean.czsj}" readOnly="true"></cps:date>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>操作人单位：</cps:tdLabel>	
							<cps:tdContent colspan="3">
								<c:choose>
									<c:when test="${empty pcsBean.czrdwdm}">
										<input type="hidden" name="pcsBean.czrdwdm" value="${loginInfo.orgcode }"/>
										<cps:textfield id="czrdwmc" name="pcsBean.czrdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										<input type="hidden" name="pcsBean.czrdwdm" value="${pcsBean.czrdwdm }"/>
										<cps:textfield id="czrdwmc" name="pcsBean.czrdwmc" value="${pcsBean.czrdwmc}" readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose> 
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</form>
				
				<div id="pcsRyDiv" style="display: none;width:100%">
					<cps:PanelView>
						<cps:tbar>
							<cps:button value="保存" onclick="savePcsry()"></cps:button>
						</cps:tbar>
						<cps:panel id="pcsryPanel" title="派出所获奖荣誉" width="95%">
							<form id="pcsryForm">
								<input type="hidden" id="pcsry_id" name="pcsry.id" value="${pcsry.id}" />
								<input type="hidden" id="pcsry_orgid" name="pcsry.orgid" value="${pcsBean.orgid}" />
								<input type="hidden" id="pcsry_orgcode" name="pcsry.orgcode" value="${pcsBean.orgcode}" />
								<cps:table>
									<cps:row>
										<cps:tdLabel width="20%"><font color="red">*</font>获奖类型：</cps:tdLabel>
										<cps:tdContent width="30%">
											<cps:select headerKey="" headerValue=" " name="pcsry.hjlx" value="${pcsry.hjlx}" id="pcsry_hjlx" zdlb="ZDY_HJRY" required="true"/>
										</cps:tdContent>
										
										<cps:tdLabel width="20%"><font color="red">*</font>获奖时间：</cps:tdLabel>
										<cps:tdContent>
											<cps:date name="pcsry.hjsj" value="${pcsry.hjsj}" id="pcsry_hjsj" dateFmt="yyyy-MM" required="true"/>
										</cps:tdContent>
									</cps:row>
									
									<cps:row>
										<cps:tdLabel>备注：</cps:tdLabel>
										<cps:tdContent colspan="3">
											<cps:textfield name="pcsry.bz" value="${pcsry.bz}" id="pcsry_bz" maxlength="100" cssStyle="width:94%"/>
										</cps:tdContent>
									</cps:row>
								</cps:table>
							</form>
						</cps:panel>
					</cps:PanelView>
				</div>
				
				<creator:tbar id="addRy">
					<cps:button value="添加荣誉" onclick="openPcsRyWin('add')"></cps:button>
				</creator:tbar>
				<cps:tableGrid id="pcsryList" tbarId="addRy"
		               url="/gzgl/gzjwsgl/queryPcsRyList.action?pcsry.orgid=${pcsBean.orgid}"
		               autoload="true"
		               usepager="false"
		               title="派出所获奖荣誉(双击可进行修改)"
		               dblclick="updatePcsry"
		               pageSize="50"
		               width="100%">
					<cps:column  isNumber="true" title="序号"></cps:column>
		        	<cps:column title="操作" field="cz" align="left" width="15%" ></cps:column>
		        	<cps:column field="hjlxmc" title="获奖类型" align="left" width="20%"></cps:column>
		      		<cps:column field="hjsj" title="获奖时间" width="20%"></cps:column>
		      		<cps:column field="bz" title="备注" align="left" maxlength="20"></cps:column>
				</cps:tableGrid>
			</cps:panel> 
		</cps:PanelView>
	</div>
	</c:if>
	<c:if test="${pcsBean.dwleve=='5'}">
		<form id="pcsform">
			<input type="hidden" id="id" name="pcsBean.id" value="${pcsBean.id }"/>
			<input type="hidden" id="orgid" name="pcsBean.orgid" value="${pcsBean.orgid}"/>
			<input type="hidden" id="orgcode" name="pcsBean.orgcode" value="${pcsBean.orgcode }"/>
			<input type="hidden" id="ispcs" name="pcsBean.ispcs" value="${pcsBean.ispcs }"/>
			<cps:PanelView>
				<cps:tbar>
					<c:if test="${pcsBean.showSaveButton}">
						<cps:button id="jwqsavebtn" value="保&nbsp;存" onclick="savaPcsInfo()"></cps:button>
					</c:if>
				</cps:tbar>
				<cps:panel title="警务区基本信息" width="99.8%">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="20%"><font color="red">*</font>警务区(室)名称：</cps:tdLabel>
							<cps:tdContent width="30%">
								<cps:textfield id="hhh" name="pcsBean.orgname" value="${pcsBean.orgname}" required="true" readonly="true"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel width="20%"><font color="red">*</font>所辖社区村：</cps:tdLabel>
							<cps:tdContent width="30%">
								<cps:textfield value="${pcsBean.sxsqcmc}" id="sxsq" readonly="true" required="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel width="20%"><font color="red">*</font>是否建有警务室：</cps:tdLabel>
							<cps:tdContent width="30%">
								<s:select list="#{'1':'是','0':'否'}" id="sfjljws" name="pcsBean.sfjljws" cssClass="cps-select validate[required]" headerKey="" headerValue=" " onchange="changeSfjyjws(this.value)"></s:select>
							</cps:tdContent>
							
							<cps:tdLabel width="20%"><font color="red">*</font>警务区(室)等级：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="pcsjwqdj" name="pcsBean.pcsjwqdj" value="${pcsBean.pcsjwqdj}" required="true" zdlb="KHKP_JWQFL" headerKey="" headerValue=" " ></cps:select>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>场所选址：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="bgddlx" name="pcsBean.bgddlx" value="${pcsBean.bgddlx}" zdlb="ZDY_BGDD" required="true" headerKey="" headerValue=" " ></cps:select>
							</cps:tdContent>
							
							<cps:tdLabel><font color="red">*</font>警务室用房：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="ywjws" name="pcsBean.ywjws" value="${pcsBean.ywjws}" zdlb="ZDY_BGDDLX" required="true" headerKey="" headerValue=" " ></cps:select>
							</cps:tdContent>
						</cps:row>
						
						<cps:row id="jtjzrow" cssStyle="display:${pcsBean.sfjljws=='0' ? 'none' : 'inline'}">
							<cps:tdLabel><font color="red">*</font>具体地址：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<input type="hidden" name="pcsBean.dzid" value="${pcsBean.dzid}" id="dzid"/> 
								<cps:textfield id="dzmc" name="pcsBean.dzmc" value="${pcsBean.dzmc}" readonly="true" required="true" appendPopuBtn="true" onclick="openFwSelect()"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>警务室类别：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'1':'农村警务室','0':'社区警务室'}" name="pcsBean.sfncjws" id="sfncjws" cssClass="validate[required] cps-select" headerKey="" headerValue=""></s:select>
							</cps:tdContent>
							
							<cps:tdLabel><font color="red">*</font>电脑(台)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="dnts" name="pcsBean.dnts" value="${pcsBean.dnts}" required="true" inputType="integer" maxlength="4"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel><font color="red">*</font>接入公安内网：</cps:tdLabel>
							<cps:tdContent>
								<s:radio list="#{'1':'是','0':'否'}" name="pcsBean.jrganw" cssClass="validate[required]" id="jrgaw"></s:radio>
							</cps:tdContent>
							
							<cps:tdLabel><font color="red">*</font>接入外网：</cps:tdLabel>
							<cps:tdContent>
								<s:radio list="#{'1':'是','0':'否'}" name="pcsBean.jrww" cssClass="validate[required]" id="jrww"></s:radio>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>交通工具：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<s:checkboxlist list="pcsBean.jtgjList" id="jtgjs" name="pcsBean.jtgjs" listKey="dm" required="true" listValue="mc"/>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>防护装备：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<s:checkboxlist list="pcsBean.fhzbList" id="fhzb" name="pcsBean.fhzbs"  listKey="dm" listValue="mc" />
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>其他防护装备：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="qtfhzb" name="pcsBean.qtfhzb" value="${pcsBean.qtfhzb}"  maxlength="50"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>操作人姓名：</cps:tdLabel>	
							<cps:tdContent> 
								<c:choose>
									<c:when test="${empty pcsBean.czrxm}">
										<cps:textfield id="czrxm" name="pcsBean.czrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										<cps:textfield id="czrxm" name="pcsBean.czrxm" value="${pcsBean.czrxm}" readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>操作时间：</cps:tdLabel>	
							<cps:tdContent> 
								<c:choose>
									<c:when test="${empty pcsBean.czsj}">
										<cps:date id="czsj" name="pcsBean.czsj" defaultSystemDate="true" readOnly="true"></cps:date>
									</c:when>
									<c:otherwise>
										<cps:date id="czsj" name="pcsBean.czsj" value="${pcsBean.czsj}" readOnly="true"></cps:date>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							
							<cps:tdLabel>操作人单位：</cps:tdLabel>	
							<cps:tdContent>
								<c:choose>
									<c:when test="${empty pcsBean.czrdwdm}">
										<input type="hidden" name="pcsBean.czrdwdm" value="${loginInfo.orgcode }"/>
										<cps:textfield id="czrdwmc" name="pcsBean.czrdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										<input type="hidden" name="pcsBean.czrdwdm" value="${pcsBean.czrdwdm }"/>
										<cps:textfield id="czrdwmc" name="pcsBean.czrdwmc" value="${pcsBean.czrdwmc}" readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose> 
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:panel>
			</cps:PanelView>
		</form>
	</c:if>
	<div id="userList">
	    <cps:tableGrid id="pcslist" 
	               url="/cps/queryUserListPageInfoByOrgCode.action"
	               autoload="true"
	               searchform="hiddenform" 
	               title="机构民警列表"
	               pageSize="5"
	               width="99%">
	      <cps:column  isNumber="true" title="序号"></cps:column>
	      <cps:column title="操作" field="cz" align="left" ></cps:column>
	      <cps:column field="username" title="警号"></cps:column>
	      <cps:column field="xm" title="姓名"></cps:column>
	      <cps:column field="sfzh" title="身份证号码"></cps:column>
	      <cps:column field="mobile" title="手机号码" ></cps:column>
	      <cps:column field="telephone" title="电话号码"></cps:column>
	      <cps:column field="zwms" title="职务"></cps:column>
	      <cps:column field="orgdwmc" title="所属单位"></cps:column>
	    </cps:tableGrid>
   </div>
   <creator:tbar id="addfj">
  		<c:if test="${pcsBean.orgcode == loginInfo.orgcode}">
  			<cps:button value="新增流口协管员" onclick="openFjPage('','add','1')"></cps:button>
  			<cps:button value="新增巡防队员" onclick="openFjPage('','add','2')"></cps:button>
			<cps:button value="添加协辅警" onclick="openFjPage('','add','3')"></cps:button>
			<cps:button value="刷新" onclick="$('#fjtableList').query('F','hiddenform')"></cps:button>
		</c:if>
  </creator:tbar>
  <div id="fjList" >
    <cps:tableGrid id="fjtableList"
             url="/gzgl/gzjwsgl/queryFjListPageInfo.action"
             usepager="true"
             autoload="true"
             searchform="hiddenform"
             title="辅警信息列表" tbarId="addfj"
             width="99.5%">
      <cps:column isNumber="true" title="序号"></cps:column>
      <cps:column title="操作" rowcallback="fjCallback" align="left" ></cps:column>       
      <cps:column field="fjxm" title="姓名"></cps:column>
      <cps:column field="fjjh" title="辅警编号"></cps:column>
      <cps:column field="sfzh" title="身份证号码"></cps:column>
      <cps:column field="xbms" title="性别"></cps:column>
      <cps:column field="fjlbms" title="辅警类别"></cps:column>
      <cps:column field="lxfs" title="联系方式"></cps:column>
    </cps:tableGrid>
  </div>
  <div style="display:none">
	<form id="exportform" target="exportiframe" method="post">
		<input type="hidden" id="exportid" name="pcsBean.id" value="${pcsBean.id }"/>
		<input type="hidden" id="exportispcs" name="ispcs" value="${ispcs}"/>
		<input type="hidden" id="orgcode" name="pcsBean.orgcode" value="${pcsBean.orgcode }"/>
	</form>
	<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
  </div>
</creator:view>