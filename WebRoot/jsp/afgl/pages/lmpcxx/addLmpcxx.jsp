<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="盘查信息">
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/lmpc.js"></script>
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/jQueryRotate.js"></script>
		  
		   <script type="text/javascript">
		   		var lnum = 0 ;
		   		var rnum = 0;		  				   		
		   		function toleft(){
		   				lnum ++;
		   				$("#lmpczpxximg").rotate(-90*lnum);
		   		}
		   		function torigth(){
		   			rnum ++;
		   			$("#lmpczpxximg").rotate(90*rnum);
		   		}
		   </script>
	<creator:tbar id="tbar">
		<c:if test="${operType != 'detail'}">
			<cps:button value="保存" onclick="addLmpcxx();"></cps:button>
		</c:if>
		<cps:button value="关闭" onclick="window.close();"></cps:button>
	</creator:tbar>
	<creator:panel id="lmpczpPanel">
		<cps:table id="lmpczptable">
			
			<cps:row id="lmpczprows">
				<cps:tdContent id="tdconlmpzzp" >
					<div align="center">
						<input name="lmpcinput" value="路面盘查照片" readOnly="true" size="10" align="middle" style="font-size:13px"/>
					</div>
					<div id="lmpczpxxdivs" style="text-align: center;background-color: #DFF0F8">
						<img id="lmpczpxximg" src="<c:url value='/afgl/lmpcxx/ShowLmpcZpxx.action'/>?jlbh=${lmpcBean.jlbh}" title="路面盘查照片" alt="路面盘查照片" height="140" width="130"/>
			        </div>
			         <div id="zpxuanzdiv" align="center">
						<cps:button id="lmpczzbut" value="向左转" onclick="toleft()"></cps:button>
						<cps:button id="lmpcyzbut" value="向右转" onclick="torigth()"></cps:button>
		   			</div>
				</cps:tdContent>
				<cps:tdContent valign="top" >
					<div align="center">
						<input name="qgrkzpinput" value="全国人口库照片" readOnly="true" size="12" align="middle" style="font-size:13px"/>
					</div>
					<div id="zpxx" style="text-align: center;background-color: #DFF0F8">
						<img src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${lmpcBean.pcdxsfzh}" title="全国人口库照片" alt="全国人口库照片" height="140" width="130"/>
			        </div>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
	<form id="add_lmpcxx_form"  action="${contextPath }/afgl/lmpcxx/addLmpcxx.action" method="post">
	<creator:panel id="lmpcxx" tbarId="tbar" title="盘查基本信息">
		<input type="hidden" id="jlbh" name="lmpcBean.jlbh" value="${lmpcBean.jlbh }">
		<input type="hidden" id="operType" name="operType" value="${operType}">
		<cps:table id="gbxxtable">
			<cps:row>
				<cps:tdContent width="85%">
			 		<cps:table>
			 		<cps:row id="sq_row">
						<cps:tdLabel width="15%"><font color="red">*</font>身份证号：</cps:tdLabel>
						<cps:tdContent width="35%">
							<c:choose>
							<c:when test="${operType=='add'}">
							<cps:textfield id="pcdxsfzh" name="lmpcBean.pcdxsfzh"   maxlength="18"
											onblur="queryRkBean(this.value,setlmpcxx)" value="${lmpcBean.pcdxsfzh }" isSfzh="true" required="true"></cps:textfield>
							</c:when>
							<c:otherwise>
							<cps:textfield id="pcdxsfzh" name="lmpcBean.pcdxsfzh" value="${lmpcBean.pcdxsfzh }" required="true"    readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="15%"><font color="red">*</font>	姓名：</cps:tdLabel>
						<cps:tdContent width="35%">
							<c:choose>
							<c:when test="${operType=='add'}">
							<cps:textfield id="pcdxxm" name="lmpcBean.pcdxxm"  value="${kkpcxxBean.pcdxxm }" required="true" maxlength="15"></cps:textfield>
							</c:when>
							<c:otherwise>
							<cps:textfield id="pcdxxm" name="lmpcBean.pcdxxm"  value="${kkpcxxBean.pcdxxm }" required="true" maxlength="15" readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>
						</cps:tdContent>
						
					</cps:row>
					<cps:row >
					
						<cps:tdLabel><font color="red">*</font>盘查时间：</cps:tdLabel>
						<cps:tdContent>
						   
					       <c:if test="${operType=='add'}">
							<cps:date id="pcsj" name="lmpcBean.pcsj" dateFmt="yyyy-MM-dd HH:mm:ss"  required="true"></cps:date>
						   </c:if>
						   <c:if test="${operType=='detail'}">
						   <cps:textfield id="pcsj" name="lmpcBean.pcsj"  value="${lmpcBean.pcsj }" readonly="true"></cps:textfield>
						   </c:if>
							<c:if test="${operType=='update'}">
							<cps:date id="pcsj" name="lmpcBean.pcsj" dateFmt="yyyy-MM-dd HH:mm:ss"  required="true" value="${lmpcBean.pcsj }"></cps:date>
							</c:if>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>盘查地点：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
							<c:when test="${operType!='detail'}">
							<cps:textfield id="pcdd" name="lmpcBean.pcdd" value="${lmpcBean.pcdd}" required="true"  maxlength="60"></cps:textfield>
							</c:when>
							<c:otherwise>
							<cps:textfield id="pcdd" name="lmpcBean.pcdd" value="${lmpcBean.pcdd}" required="true" maxlength="60"  readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>
						</cps:tdContent>
						
				</cps:row>
					<cps:row>
						<cps:tdLabel >可疑物品类型：</cps:tdLabel>
						<cps:tdContent>
						<c:choose>
							<c:when test="${operType!='detail'}">
							<cps:select id="kywplx" name="lmpcBean.kywplx"  
									zdlb="AF_KYWPLX" headerValue="  " headerKey=""  value="${lmpcBean.kywplx }" ></cps:select>
							</c:when>
							<c:otherwise>
							<cps:textfield id="kywplx"  name="lmpcBean.kywplx"  value="${lmpcBean.kywplx }"  readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
						<cps:tdLabel >可疑物品：</cps:tdLabel>
						<cps:tdContent >
						<c:choose>
							<c:when test="${operType!='detail'}">
								<cps:textfield id="kywpmc" name="lmpcBean.kywpmc"  value="${lmpcBean.kywpmc  }" maxlength="60" ></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="kywpmc" name="lmpcBean.kywpmc"  value="${lmpcBean.kywpmc  }" maxlength="60"  readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>
						
						
						</cps:tdContent>
						
					</cps:row>
				<cps:row>
				
						<cps:tdLabel><font color="red">*</font>处理结果：</cps:tdLabel>
						<cps:tdContent>	
							<c:choose>
							<c:when test="${operType!='detail'}">
							<cps:select id="cljg" name="lmpcBean.cljg" zdlb="LMPC_CLJG" value="${lmpcBean.cljg}" required="true"  headerKey=""  headerValue="  " ></cps:select>
							</c:when>
							<c:otherwise>
							<cps:select id="cljg" name="lmpcBean.cljg" zdlb="LMPC_CLJG" value="${lmpcBean.cljg}" required="true" headerKey=""  headerValue=" "  disabled="true"></cps:select>
							</c:otherwise>
							</c:choose>
						</cps:tdContent>
						
						<cps:tdLabel >登记人：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${operType=='add'}">
								<cps:textfield id="djrxm" name="lmpcBean.djrxm"  
								value="${loginInfo.realname}" readonly="true"></cps:textfield>
								</c:when>
								<c:otherwise>
								<cps:textfield id="djrxm" name="lmpcBean.djrxm"   
								value="${lmpcBean.djrxm}" readonly="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
					</cps:row>
					
				
					<cps:row>
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${operType=='add'}">
								<cps:textfield id="djrdwmc" name="lmpcBean.djrdwmc"   value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							    <input id="djrdwdm" name="lmpcBean.djrdwdm" type="hidden" value="${loginInfo.orgcode }" />
								</c:when>
								<c:otherwise>
								<cps:textfield id="djrdwmc" name="lmpcBean.djrdwmc"   value="${lmpcBean.djrdwmc }" readonly="true"></cps:textfield>
							    <input id="djrdwdm" name="lmpcBean.djrdwdm" type="hidden" value="${lmpcBean.djrdwdm }" />
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel >登记时间：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${operType=='add'}">
								<cps:date id="djsj" name="lmpcBean.djsj"   defaultSystemDate="true"></cps:date>
								</c:when>
								<c:otherwise>
								<cps:textfield id="djsj" name="lmpcBean.djsj" value="${lmpcBean.djsj}" readonly="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						
					</cps:row>
				</cps:table>
				</cps:tdContent>
				<!--  
				<cps:tdContent valign="top" >
					<div id="zpxx" style="text-align: center;background-color: #DFF0F8">
						<img src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${lmpcBean.pcdxsfzh}" title="全国人口库照片" alt="全国人口库照片" height="140" width="130"/>
			        </div>
				</cps:tdContent>
				-->
				</cps:row>
				</cps:table>
				
					</creator:panel>
					
				<creator:panel id="bpccl" title="被盘查车辆">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%">车辆类型：</cps:tdLabel>
						<cps:tdContent width="35%">
							<c:choose>
							<c:when test="${operType!='detail'}">
								<cps:select  id="cllx" name="lmpcBean.cllx"  value="${lmpcBean.cllx }"  zdlb="GB_CLLX" headerValue=" " headerKey="" ></cps:select>
							</c:when>
							<c:otherwise>
								<cps:textfield id="cllx" name="lmpcBean.cllx"  value="${lmpcBean.cllx }"  readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>	
						</cps:tdContent>	
						<cps:tdLabel width="12%">车牌号：</cps:tdLabel>
						<cps:tdContent width="35%">
						<c:choose>
							<c:when test="${operType!='detail'}">
								<cps:textfield id="cph" name="lmpcBean.cph"   value="${lmpcBean.cph }" maxlength="10"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="cph" name="lmpcBean.cph"   value="${lmpcBean.cph }" maxlength="10" readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
						</cps:row>
						<cps:row>
						<cps:tdLabel width="12%">发动机号：</cps:tdLabel>
						<cps:tdContent width="35%">
								<c:choose>
							<c:when test="${operType!='detail'}">
								<cps:textfield id="fdjh" name="lmpcBean.fdjh"   value="${lmpcBean.fdjh }" maxlength="25"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="fdjh" name="lmpcBean.fdjh"   value="${lmpcBean.fdjh }" maxlength="25" readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
						<cps:tdLabel width="12%">车架号：</cps:tdLabel>
						<cps:tdContent width="35%">
							<c:choose>
							<c:when test="${operType!='detail'}">
								<cps:textfield id="cjh" name="lmpcBean.cjh"   value="${lmpcBean.cjh }" maxlength="25"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="cjh" name="lmpcBean.cjh"   value="${lmpcBean.cjh }" maxlength="25" readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
					</cps:row>
					</cps:table>
					</creator:panel>
					<creator:panel id="bpcry" title="被盘查人员">
					<cps:table>
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>盘查原因：</cps:tdLabel>
						<cps:tdContent width="35%">
						<c:choose>
							<c:when test="${operType!='detail'}">
								<cps:select id="pcyy" name="lmpcBean.pcyy"  zdlb="ZDY_LMPCYY" value="${lmpcBean.pcyy }"  required="true"  headerKey="" headerValue=" "></cps:select>
							</c:when>
							<c:otherwise>
								<cps:select id="pcyy" name="lmpcBean.pcyy"  zdlb="ZDY_LMPCYY" value="${lmpcBean.pcyy }"  required="true" disabled="true"></cps:select>
							</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%"><font color="red">*</font>联系方式：</cps:tdLabel>
						<cps:tdContent width="35%">
							<c:choose>
							<c:when test="${operType!='detail'}">
							<cps:textfield id="lxfs"  name="lmpcBean.lxfs"  value="${lmpcBean.lxfs}" required="true" isPhone="true" maxlength="11" ></cps:textfield>
							</c:when>
							<c:otherwise>
							<cps:textfield id="lxfs"  name="lmpcBean.lxfs"  value="${lmpcBean.lxfs}" required="true" isPhone="true" readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
						</cps:row>
						<cps:row>
						<cps:tdLabel width="12%">落脚点：</cps:tdLabel>
						<cps:tdContent width="35%">
							<c:choose>
							<c:when test="${operType!='detail'}">
								<cps:textfield id="ljd" name="lmpcBean.ljd"    value="${lmpcBean.ljd }" cssStyle="height:30px;" maxlength="60" type="textarea"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="ljd" name="lmpcBean.ljd"    value="${lmpcBean.ljd }" cssStyle="height:30px;" maxlength="60" readonly="true" type="textarea"></cps:textfield>
							</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
							<cps:tdLabel width="12%">备注：</cps:tdLabel>
						<cps:tdContent width="35%">
							<c:choose>
							<c:when test="${operType!='detail'}">
								<cps:textfield id="bz" name="lmpcBean.bz"   value="${lmpcBean.bz }" cssStyle="height:30px;" maxlength="150" type="textarea"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="bz" name="lmpcBean.bz"   value="${lmpcBean.bz }" cssStyle="height:30px;" maxlength="150" type="textarea" readonly="true"></cps:textfield>
							</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
					</cps:row>
				</cps:table>
				</creator:panel>
				<creator:panel id="pcyxx" title="有效标识">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="12%">有效性：</cps:tdLabel>
							<cps:tdContent width="35%">
								<cps:textfield id="yxxms" name="lmpcBean.yxxms"   value="${lmpcBean.yxxms}" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="12%">注销人：</cps:tdLabel>
							<cps:tdContent width="35%">
								<cps:textfield id="zxrxm" name="lmpcBean.zxrxm"   value="${lmpcBean.zxrxm}" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel width="12%">注销时间：</cps:tdLabel>
							<cps:tdContent width="35%">
								<cps:textfield id="zxsj" name="lmpcBean.zxsj"   value="${lmpcBean.zxsj}" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</creator:panel>	
		 <c:if test="${operType!='detail'}">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="cps-panel-box-title">
				   <tr>
		           <td align="left">&nbsp;同行人信息</td>
		           <td><cps:button value="新增" onclick="pageAddLmpcxx()" cssStyle="float:right"></cps:button></td>
		       </tr>
		  </table>
		<table id="txrtable" width="100%" class="cps-table-list" cellpadding="0" cellspacing="0">
		</table>
		 </c:if>    
		 	</form>	 
		<c:if test="${operType=='update'}">
	 	<cps:tableGrid id="txrxxList" 
			searchform="add_lmpcxx_form"
			url="/afgl/lmpcxx/queryLmpctxrList.action?jlbh=${lmpcBean.jlbh}"   width="99.8%" >
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="同行人姓名" field="txrxm"></cps:column>
			<cps:column title="身份证号" field="txrsfzh"></cps:column>
			<cps:column title="操作" field="cz"></cps:column>
		</cps:tableGrid>
		</c:if>
		<c:if test="${operType=='detail'}">
	 	<cps:tableGrid id="txrxxList" 
			searchform="add_lmpcxx_form"
			url="/afgl/lmpcxx/queryLmpctxrList.action?jlbh=${lmpcBean.jlbh}" mutilSelect="true" autoload="true" width="99.8%">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="同行人姓名" field="txrxm"></cps:column>
			<cps:column title="身份证号" field="txrsfzh"></cps:column>
		</cps:tableGrid>
		</c:if>
		<!--  
		
		<cps:table id="lmpczptable">
			<cps:row id="lmpczprows">
				<cps:tdContent>
					<div id="lmpczpxxdivs" style="text-align: center;background-color: #DFF0F8">
						<img id="lmpczpxximg" src="<c:url value='/afgl/lmpcxx/ShowLmpcZpxx.action'/>?jlbh=${lmpcBean.jlbh}" title="路面盘查照片" alt="路面盘查照片" height="140" width="130"/>
			        </div>
				</cps:tdContent>
			</cps:row>
			
		</cps:table>
		 
		   <div id="zpxuanzdiv" align="center">
				<cps:button id="lmpczzbut" value="向左转" onclick="toleft()"></cps:button>
				<cps:button id="lmpcyzbut" value="向右转" onclick="torigth()"></cps:button>
		   </div>	
		-->   	 		  
</creator:view>