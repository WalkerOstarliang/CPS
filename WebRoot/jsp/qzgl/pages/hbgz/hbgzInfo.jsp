<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="汇报工作登记表">
	<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/hbgzInfo.js"></script>
	<creator:tbar id="hbgzInfotbar">
		<c:choose>
			<c:when test="${operType != 'detail'}">
				<cps:button value="保&nbsp;存" onclick="savehbgz()"></cps:button>
				<cps:button value="重&nbsp;置" onclick="resethbgz()"></cps:button>
			</c:when>
		</c:choose>
		<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
		</creator:tbar>
		<form id="hbgzform" action="<c:url value='/qzgl/hbgzgl/updateHybg.action'/>" method="post" enctype="application/x-www-form-urlencoded">
		<creator:panel id="hbgzInfo" title="向群众汇报工作登记表" tbarId="hbgzInfotbar">
			<s:hidden id="operType" name="operType"></s:hidden>
			<input type="hidden" id="bh" name="bean.bh" value="${bean.bh }"/>
				<cps:table id="hbgzTable">
					<cps:row>
						<cps:tdLabel width="12%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>汇报工作主题：</cps:tdLabel>
						<cps:tdContent width="25%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.bggzzt}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="bggzzt" cssStyle="width:93%"  name="bean.bggzzt" cssClass="validate[maxSize[30],required] cps-input" ></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">主持人姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.bggzzcrxm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="zcrxm" name="bean.bggzzcrxm" cssClass="validate[maxSize[30]] cps-input" ></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.bggzzcrlxdh}"  ></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="zcrlxdh" name="bean.bggzzcrlxdh" isPhone="true" minlength="7" maxlength="20" ></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>汇报时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.bggzsj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:date id="bgsj" name="bean.bggzsj" dateFmt="yyyy-MM-dd" value="${bean.bggzsj}" cssClass="validate[required] cps-input" cssStyle="width:74%"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
					<cps:tdLabel width="12%">汇报地点：</cps:tdLabel>
						<cps:tdContent width="25%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.bggzdd}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="bggzdd" name="bean.bggzdd" cssClass="validate[maxSize[20]] cps-input" cssStyle="width:93%;"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						</cps:row>
					<cps:row>
						<cps:tdLabel width="12%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>报告工作内容：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
																		<s:textarea  id="bgnr" name="bean.bggznr" rows="5" cssStyle="width:93%" cssClass="validate[required]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea  id="bgnr" name="bean.bggznr" rows="5" cssStyle="width:93%" cssClass="validate[required,maxSize[2000]]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>群众建议：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea  id="qzjy" name="bean.qzjy" rows="5" cssStyle="width:93%" cssClass="validate[required]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea  id="qzjy" name="bean.qzjy" rows="5" cssStyle="width:93%" cssClass="validate[required],,maxSize[2000]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">附件信息：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									${fjbean.fjmc }
								</c:when>
								<c:otherwise>
									<input type="file" name="fj" id="fj" class="cps-file" width="400%" />
									<c:if test="${operType=='update' && not empty fjbean.fjmc}">
										&nbsp;已保存附件：${fjbean.fjmc } <font color="blue" size="10"> 重新选择附件将会覆盖原附件！</font>&nbsp;
									</c:if>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>登记人姓名：</cps:tdLabel>
						<cps:tdContent>
							<s:hidden id="djrjh" name="bean.djrjh"></s:hidden>
							<cps:textfield value="${bean.djrxm}" name="bean.djrxm" id="djrxm" readonly="true" />
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date value="${bean.djsj}" name="bean.djsj" id="djsj" dateFmt="yyyy-MM-dd"  readOnly="true"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<s:hidden id="djdwdm" name="bean.djdwdm"></s:hidden>
							<cps:textfield value="${bean.djdwmc}" name="bean.djdwmc" id="djdwmc" readonly="true" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					</cps:table>
					
				</creator:panel>
</form>
		<creator:tbar id="hbgzinfoTbar">
		<cps:button value="新增" onclick="add('add','${bean.bh}','')"></cps:button>
	</creator:tbar>		
	<%-- <c:if test="${operType=='update'}">	
			<creator:tbar>
		<cps:button value="新增" onclick="add('add')"></cps:button>
	</creator:tbar>
	</c:if>
	<c:if test="${operType=='add'}">	
			<creator:tbar>
		<cps:button value="新增" onclick="add('')"></cps:button>
	</creator:tbar>
	</c:if>
 	<cps:table id="zcTable">
		<tr id="zcListTh">
			<td style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg');background-position: center bottom;background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE;color: #003F87;cursor: pointer;font-size: 12px; font-weight: bold;height: 22px; text-align: center;">
				姓名
			</td>
			<td style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg');background-position: center bottom;background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE;color: #003F87;cursor: pointer;font-size: 12px; font-weight: bold;height: 22px; text-align: center;">
				联系电话
			</td>
			<td style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg');background-position: center bottom;background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE;color: #003F87;cursor: pointer;font-size: 12px; font-weight: bold;height: 22px; text-align: center;">
				单位名称
			</td>
			<td style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg');background-position: center bottom;background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE;color: #003F87;cursor: pointer;font-size: 12px; font-weight: bold;height: 22px; text-align: center;">
			    职务
			</td>
		<c:if test="${operType!='detail'}">
			<td style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg');background-position: center bottom;background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE;color: #003F87;cursor: pointer;font-size: 12px; font-weight: bold;height: 22px; text-align: center;">
				操作
			</td>
			</c:if>
		</tr>
			<c:forEach items="${bean.yhrList}" var="bean" varStatus="st">
				<tr>
					<td align="center">
					<input type="hidden" name="bean.yhrList[${st.index}].bh" value="${bean.bh }"/>
					<input type="hidden" name="bean.yhrList[${st.index}].bgbh" value="${bean.bgbh }"/>
						${bean.xm }
							<input type="hidden" value="${bean.xm }"
								name="bean.yhrList[${st.index}].xm" />
					    
					</td>
					<td align="center">
					  ${bean.lxdh }
							<input type="hidden" value="${bean.lxdh }"
								name="bean.yhrList[${st.index}].lxdh" />
						
					</td>
					<td align="center">
						${bean.dwmc }
							<input type="hidden" value="${bean.dwmc }"
								name="bean.yhrList[${st.index}].dwmc" />
					</td>
					<td align="center">
						${bean.zw }
							<input type="hidden" value="${bean.zw }"
								name="bean.yhrList[${st.index}].zw" />
					</td>
					<c:if test="${operType!='detail'}">
						<td align="center">
							<a href="javascript:void(0);" onclick="deletehbgzxx(this.parentElement.parentElement.rowIndex,'${bean.bh }');">删除</a>
							<input type="hidden" value="${operType }"
								name="bean.yhrList[${st.index}].operType" />
						</td>
					</c:if>
				</tr>
			</c:forEach>
		
	</cps:table>--%>
	<c:choose>
	<c:when test="${operType != 'detail'}">
	<cps:tableGrid url="/qzgl/hbgzgl/queryHbgzcyrList.action?bh=${bean.bh}" id="cyrlist" pageSize="5" tbarId="hbgzinfoTbar" title="与会人信息" width="99.8%">
						<cps:column isNumber="true" title="序号"></cps:column>
						<cps:column field="xm" title="姓名"></cps:column>
						<cps:column field="lxdh" title="联系电话"></cps:column>
						<cps:column field="dwmc" title="单位名称"></cps:column>
						<cps:column field="zwmc" title="职务"></cps:column>
						<cps:column field="cz" title="操作" rowcallback="czRowCallback"></cps:column>
	</cps:tableGrid>
	</c:when>
	<c:otherwise>
		<cps:tableGrid url="/qzgl/hbgzgl/queryHbgzcyrList.action?bh=${bean.bh}" id="cyrlist" pageSize="5" title="与会人信息" width="99.8%">
						<cps:column isNumber="true" title="序号"></cps:column>
						<cps:column field="xm" title="姓名"></cps:column>
						<cps:column field="lxdh" title="联系电话"></cps:column>
						<cps:column field="dwmc" title="单位名称"></cps:column>
						<cps:column field="zwmc" title="职务"></cps:column>
	</cps:tableGrid>
	</c:otherwise>
	</c:choose>
			
</creator:view>