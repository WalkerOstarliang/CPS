<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/gongzuogl.js"></script>
	<creator:tbar  id="addnewrwtbar">
		<s:if test="renwuBean.op!='detail'">
			<cps:button value="保&nbsp;存" onclick="submitNewBean();"></cps:button>
		</s:if>
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow();"></cps:button>
	</creator:tbar>
	<creator:panel title="任务登记" id="rwdj"  tbarId="addnewrwtbar">
		<form action="${contextPath}/gzgl/rwgl/submitRenwuBean.action" method="post" id="beanform">
			<cps:table>
				<cps:row>
					<cps:tdLabel>
						<font color="red" width="10%">*&nbsp;</font>任务标题：
					</cps:tdLabel>
					<cps:tdContent colspan="3">
						<input type="hidden" name="renwuBean.op" value="${renwuBean.op}"/>
						
						<s:if test="renwuBean.op=='add'">
							<input type="hidden" name="renwuBean.rwfkzt" value="0"/>
							<input type="hidden" name="renwuBean.rwwcqk" value="0"/>
							
							<cps:textfield  name="renwuBean.rwbt" value="${renwuBean.rwbt}" id="rwbt" cssClass="validate[required,maxSize[50]] cps-input" cssStyle="width:90%" ></cps:textfield>
						</s:if>
						
						<s:if test="renwuBean.op=='update' || renwuBean.op=='detail' || renwuBean.op=='fk'">
							<input type="hidden" name="renwuBean.rwfkzt" value="${renwuBean.rwfkzt}"/>
							<input type="hidden" name="renwuBean.rwwcqk" value="${renwuBean.rwwcqk}"/>
							<input type="hidden" name="renwuBean.bh" value="${renwuBean.bh}"/>
							
							<cps:textfield  readonly="true" name="renwuBean.rwbt" value="${renwuBean.rwbt}" id="rwbt" cssClass="validate[required] cps-input" cssStyle="width:90%"></cps:textfield>
						</s:if>
						
					</cps:tdContent>
					
					<cps:tdLabel width="13%">
						<font color="red">*&nbsp;</font>要求完成时间：
					</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:if test="renwuBean.op=='add' || renwuBean.op=='update'">
							<cps:date name="renwuBean.yqclwcrq" value="${renwuBean.yqclwcrq}"  id="yqclwcrq" cssClass="validate[required] cps-input" readOnly="true" dateFmt="yyyy-MM-dd"></cps:date>
						</s:if>
						<s:if test="renwuBean.op=='detail' || renwuBean.op=='fk'">
							<cps:textfield name="renwuBean.yqclwcrq" value="${renwuBean.yqclwcrq}"  id="yqclwcrq" cssClass="validate[required] cps-input" readonly="true" ></cps:textfield>
						</s:if>
					</cps:tdContent>
				</cps:row>
				
				
				<cps:row>
					<cps:tdLabel width="10%">
						<font color="red">*&nbsp;</font>任务说明：
					</cps:tdLabel>
					<cps:tdContent colspan="5" width="25%" >
						<s:if test="renwuBean.op=='detail' || renwuBean.op=='fk'">
							<s:textarea name="renwuBean.rwms" id="rwms" readonly="true" cssClass="validate[required,maxSize[1500]] textarea" cssStyle="width:94%;height:80px;" ></s:textarea>
						</s:if>
						<s:else>
							<s:textarea name="renwuBean.rwms" id="rwms" cssClass="validate[required] textarea" cssStyle="width:94%;height:80px;" ></s:textarea>
						</s:else>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>任务附件：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<c:if test="${renwuQuery.op=='detail'}">
							${fjBean.title }
						</c:if>
						<c:if test="${renwuQuery.op=='fk'}">
							<span onclick="dbFileDown('t_gzgl_rwfjxx','id','fj','${fjBean.id}','${fjBean.title}')" style="cursor: pointer;" class="cps_span_href">${fjBean.title}</span>
						</c:if>
					    <c:if test="${renwuBean.op=='add'}">
							<input type="file" name="rwUploads" class="cps-file" id="rwUploads"/>
						</c:if>
						<c:if test="${renwuQuery.op=='update' && not empty (fjBean)}">
							<input type="file" name="rwUploads" class=" cps-file" id="rwUploads"/>
							<input type="hidden" name="fjBean.id"  value="${fjBean.id }"/>	&nbsp;已保存附件：${fjBean.title } <font color="blue" size="10"> 重新选择附件将会覆盖原附件！</font>&nbsp;
						</c:if>
						
					</cps:tdContent>
				</cps:row>
				</cps:table>
				
				 
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_title">
				   <tr>
		           <td width="23"><img src="/CPS/template/cps/images/img_title.jpg" width="23" height="28" /></td>
		           <td align="left">添加执行民警</td>
		           <td><s:if test="renwuBean.op!='detail' && renwuBean.op!='fk'">
							<cps:button value="增&nbsp;加" onclick="selectZhixMjs('${loginInfo.rootOrgCode}');" cssStyle="float:right"></cps:button>
							<%--<cps:textfield id="zxmj" name="renwuBean.mjins" ondblclick="selectZhixMjs('${loginInfo.rootOrgCode}');"></cps:textfield>--%>
						</s:if></td>
		       </tr>
		       </table>
		       
		       <cps:table>
				<cps:row>
					<cps:tdContent colspan="6" >
						<div style="overflow:auto; height:100px; width:99.8%;border: 0px;">
							<table class="cps-tablegrid" id="zxmjs" width="99.8%" cellpadding="0" cellspacing="0" >
								<thead>
									<tr>
										<th width="40%" style="text-align:center">执行民警姓名</th>
										<th width="40%" style="text-align:center">所属单位</th>
										<s:if test="renwuBean.op != 'detail' && renwuBean.op!='fk' ">
										<th width="20%" style="text-align:center">操作</th>
										</s:if>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="renwuBean.mjins" id="zxmj" status="s">
										<tr>
											<input type="hidden" name='renwuBean.mjins[${s.index}].id' value="${zxmj.id}" id="clmjid"/>
											<input type="hidden" name='renwuBean.mjins[${s.index}].rwbh' value="${zxmj.rwbh}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].clmjxm' value="${zxmj.clmjxm}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].clmjjh' value="${zxmj.clmjjh}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].clmjsfzh' value="${zxmj.clmjsfzh}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].clmjdwdm' value="${zxmj.clmjdwdm}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].clmjdwmc' value="${zxmj.clmjdwmc}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].op' value='${renwuBean.op}' />
											
											<td><s:property value="#zxmj.clmjxm" /></td>
											<td><s:property value="#zxmj.clmjdwmc" /></td>
											<s:if test="renwuBean.op != 'detail' && renwuBean.op!='fk'">
												<td><input type="button" value="删除" onclick="delRecord(this)" /></td>
											</s:if>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</cps:tdContent>
				</cps:row>
				</cps:table>
				
				
				<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*&nbsp;</font>登记人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:if test="${renwuBean.op == 'update' || renwuBean.op=='detail' || renwuBean.op=='fk'}">
							<cps:textfield id="djrxm" readonly="true" value="${renwuBean.djrxm}" cssClass="validate[required] cps-input" name="renwuBean.djrxm"></cps:textfield>
						</c:if>
						<c:if test="${renwuBean.op == 'add'}">
							<input type="hidden" value="${loginInfo.username}" name="renwuBean.djrjh"/>
							<cps:textfield id="djrxm" readonly="true" value="${loginInfo.realname}"  cssClass="validate[required] cps-input" name="renwuBean.djrxm"></cps:textfield>
						</c:if>
					</cps:tdContent>
					
					<cps:tdLabel width="12%"><font color="red">*&nbsp;</font>登记单位：</cps:tdLabel>
					<cps:tdContent  width="25%">
						<c:if test="${renwuBean.op == 'update' || renwuBean.op=='detail' || renwuBean.op=='fk'}">
							<cps:textfield id="djdwmc" value="${renwuBean.djdwmc}" readonly="true"  cssClass="validate[required] cps-input" name="renwuBean.djdwmc"></cps:textfield>
						</c:if>
						<c:if test="${renwuBean.op == 'add'}">
							<input type="hidden" value="${loginInfo.orgcode}" name="renwuBean.djdwdm"/>
							<cps:textfield id="djdwmc" value="${loginInfo.orgname}" readonly="true"  cssClass="validate[required] cps-input" name="renwuBean.djdwmc"></cps:textfield>
						</c:if>
					</cps:tdContent>
					
					<cps:tdLabel width="12%"><font color="red">*&nbsp;</font>登记日期：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:if test="${renwuBean.op == 'update' || renwuBean.op=='detail' || renwuBean.op=='fk'}">
							<cps:textfield id="djsj" name="renwuBean.djsj" readonly="true" value="${renwuBean.djsj}" cssClass="validate[required] cps-input"/>
						</c:if>
						<c:if test="${renwuBean.op == 'add'}">
							<cps:date id="djsj" name="renwuBean.djsj" defaultSystemDate="true" readOnly="true" dateFmt="yyyy-MM-dd"></cps:date>
						</c:if>
					</cps:tdContent>
				</cps:row>	
			</cps:table>
			<c:if test="${(renwuBean.op=='detail' && renwuBean.rwfkzt =='1') || renwuBean.op=='fk'}">
				<creator:panel title="任务反馈" id="rwfk">
					<c:forEach items="${renwuBean.rwCljg}" var="cljg" varStatus="cljgAttr">
						<c:set var="cljgIndex" value="${cljgAttr.index}" scope="page" />
						<cps:table>
							<cps:row>
								<cps:tdLabel width="10%">完成情况：</cps:tdLabel>
								<cps:tdContent width="25%">
									<input type="hidden" name="renwuBean.rwCljg[${cljgAttr.index}].id" value="${cljg.id}" />
									<cps:select name="renwuBean.rwCljg[${cljgAttr.index}].cljg"  value="${cljg.cljg}" zdlb="GZGL_RWWCQK" disabled="true" />
								</cps:tdContent>
								
								<cps:tdLabel width="12%">实际完成时间：</cps:tdLabel>
								<cps:tdContent  width="25%">
									<cps:textfield name="renwuBean.rwCljg[${cljgAttr.index}].wcsj"  value="${cljg.wcsj}" readonly="true" />
								</cps:tdContent>
									
								<cps:tdLabel width="10%">处理民警：</cps:tdLabel>
								<cps:tdContent width="25%">
									<cps:textfield name="renwuBean.rwCljg[${cljgAttr.index}].djrxm" value="${cljg.djrxm}" readonly="true"/>
								</cps:tdContent>
							</cps:row>
								
							<cps:row >
								<cps:tdLabel width="12%">完成情况描述：</cps:tdLabel>
								<cps:tdContent colspan="5" width="25%">
									<textarea name="renwuBean.rwCljg[${cljgAttr.index}].wcqkms" style="width: 95%;height: 50px;" readonly="readonly">${cljg.wcqkms}</textarea>
	 							</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>反馈任务附件：</cps:tdLabel>
								<cps:tdContent colspan="5">
									${cljg.fjtitle }
								</cps:tdContent>
							</cps:row>
						</cps:table>
						<div style="height: 5px"></div>
					</c:forEach>
					
					<c:if test="${renwuBean.op=='fk'}">
						<cps:table>
							<cps:row>
								<cps:tdLabel width="12%"><font color="red">*</font>任务完成情况：</cps:tdLabel>
								<cps:tdContent width="25%">
									<cps:select name="renwuBean.rwCljg[${cljgIndex + 1}].cljg" zdlb="GZGL_RWWCQK" headerKey="" headerValue="--请选择--" 
										cssClass="validate[required]"  id="rwwcqk_fk" />
								</cps:tdContent>
								
								<cps:tdLabel width="12%"><font color="red">*</font>实际完成时间：</cps:tdLabel>
								<cps:tdContent width="25%">
									<cps:date name="renwuBean.rwCljg[${cljgIndex + 1}].wcsj" cssClass="validate[required]" id="sjwcsj_fk" dateFmt="yyyy-MM-dd" defaultSystemDate="true"></cps:date>
								</cps:tdContent>
								
								<cps:tdLabel width="10%"><font color="red">*</font>处理民警：</cps:tdLabel>
								<cps:tdContent width="25%">
									<cps:textfield name="renwuBean.rwCljg[${cljgIndex + 1}].djrxm" value="${loginInfo.realname}" id="clmj_fk" ></cps:textfield>
									
									<input type="hidden" name="renwuBean.rwCljg[${cljgIndex + 1}].djsj" value="${now}" />
									<input type="hidden" name="renwuBean.rwCljg[${cljgIndex + 1}].djdwdm" value="${loginInfo.orgcode}" />
									<input type="hidden" name="renwuBean.rwCljg[${cljgIndex + 1}].djdwmc" value="${loginInfo.orgname}" />
									<input type="hidden" name="renwuBean.rwCljg[${cljgIndex + 1}].djrjh" value="${loginInfo.username}" />
									<input type="hidden" name="renwuBean.rwCljg[${cljgIndex + 1}].clmjid" value="${loginInfo.userid}" />
								</cps:tdContent>
							</cps:row>
							
							<cps:row>
								<cps:tdLabel width="12%">完成情况描述：</cps:tdLabel>
								<cps:tdContent colspan="5" width="25%">
									<textarea name="renwuBean.rwCljg[${cljgIndex + 1}].wcqkms" style="width: 95%;height:150px;" id="wcqkms_fk" cssClass="validate[maxSize[500]]"></textarea>
		 						</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>反馈任务附件：</cps:tdLabel>
								<cps:tdContent colspan="5">
									<input type="file" name="fkUploads" class="cps-file" id="fkUploads"/>
								</cps:tdContent>
							</cps:row>
						</cps:table>
					</c:if>
				</creator:panel>
			</c:if>

		</form>
		</creator:panel>
		
</creator:view>