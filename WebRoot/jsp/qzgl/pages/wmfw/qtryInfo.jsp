<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="流浪乞讨人员登记表">

<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js">
	
</script>

<style>
	body{margin:0;height:100%}
	html{height:100%}
	#left{width:800px;height:100%;float:left}
	#main{width:100%;height:100%;}
</style>
		<creator:tbar id="qtryInfotbar">
			<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:button value="确&nbsp;定" onclick="$.closeWindow()"></cps:button>
					<cps:button value="打&nbsp;印" onclick="printQtry(1)"></cps:button>
				</c:when>
				<c:when test="${operType=='add'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveQtry('true')" display="${displayAddBtn}"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()" ></cps:button>
				</c:when>
				<c:when test="${operType=='update'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveQtry('true')" display="${displayAddBtn}"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
			</c:choose>
		</creator:tbar>
		<!--startprint1-->
		<form id="qtryform" name="qtryform"  action="/qzgl/wmfwgl/saveQtryBean.action" method="post">
		<creator:panel id="addQtry" title="流浪乞讨人员登记表" tbarId="qtryInfotbar">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="id" name="qtrybean.id"></s:hidden>
			<div id="main"  style="height: 100%;width:100%">
				<div id ="left" >
				  <cps:table id="qtryTable">	
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>人员类别：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtrylbms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="qtrylb" name="qtrybean.qtrylb" zdlb="ZDY_RYLB" headerKey="" headerValue="--请选择--" value="${qtrybean.qtrylb}" cssClass="validate[required]">
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtryxm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qtryxm" name="qtrybean.qtryxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>曾用名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtrycym}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qtrycym" name="qtrybean.qtrycym" cssClass="validate[maxSize[30]]"></cps:textfield>								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>性别：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtryxbms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="qtryxb" name="qtrybean.qtryxb" zdlb="GB_XB" headerKey="" headerValue="--请选择--" value="${qtrybean.qtryxb}" cssClass="validate[required]">
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>年龄：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtrynl}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qtrynl" name="qtrybean.qtrynl" cssClass="validate[maxSize[3]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>籍贯：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtryjgms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="qtryjg" name="qtrybean.qtryjg" zdlb="GB_XZQH" headerKey="" headerValue="--请选择--" value="${qtrybean.qtryjg}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>民族：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtrymzms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="qtrymz" name="qtrybean.qtrymz" zdlb="GB_MZ" headerKey="" headerValue="--请选择--" value="${qtrybean.qtrymz}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>文化程度：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtrywhcdms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="qtrywhcd" name="qtrybean.qtrywhcd" zdlb="GB_WHCD" headerKey="" headerValue="--请选择--" value="${qtrybean.qtrywhcd}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>健康状况：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtryjkzkms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="qtryjkzk" name="qtrybean.qtryjkzk" zdlb="GB_JKZK" headerKey="" headerValue="--请选择--" value="${qtrybean.qtryjkzk}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>发现时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtrybfxsj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:date id="qtrybfxsj" name="qtrybean.qtrybfxsj" cssClass="validate[required]" value ="${qtrybean.qtrybfxsj}"  maxDate="${qtrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>发现地点：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtrybfxdd}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qtrybfxdd" name="qtrybean.qtrybfxdd" cssClass="validate[maxSize[120]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>户口地址：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtryhjxz}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qtryhjxz" name="qtrybean.qtryhjxz" cssClass="validate[maxSize[120]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>携带物品财物：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtrycw}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qtrycw" name="qtrybean.qtrycw" cssClass="validate[maxSize[200]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				</cps:table>	
			</div>
				<c:choose>
					<c:when test="${operType=='detail'}">
						<img id="qtryzp" height="185px;" src="<c:url value='/qzgl/wmfwgl/showQtryPh.action'/>?id=${qtrybean.id}"/>
					</c:when>
					<c:when test="${operType=='update'}">
						<img id="qtryzp" height="185px;" src="<c:url value='/qzgl/wmfwgl/showQtryPh.action'/>?id=${qtrybean.id}"/>
					</c:when>
					<c:when test="${operType=='add'}">
						<img id="qtryzp" height="185px;"/>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${operType =='update'}">
						<table>
							<tr>
								<td width="90%">
									&nbsp;
								</td>
								<td align="left">
									<input id="zpid" name="filezp" style="height:25px;width:65px"  type="file" />
								</td>
								<td>
									<input type="button" id="submid" style="height:25px;width:55px" value="保存图片" onclick="insertQtryzp()"/>
								</td>
								<td>
									<input type="button" id="delsubmid" style="height:25px;width:35px" value="清除" onclick="deleteQtryZp()"/>
								</td>
							</tr>
						</table>
					</c:when>
					<c:when test="${operType =='add'}">
						<table>
							<tr>
								<td width="90%">
									&nbsp;
								</td>
								<td align="left">
									<input id="zpid" name="filezp" style="height:25px;width:65px"  type="file" />
								</td>
								<td>
									<input type="button" id="submid" style="height:25px;width:55px" value="保存图片" onclick="insertQtryzp()"/>
								</td>
								<td>
									<input type="button" id="delsubmid" style="height:25px;width:35px" value="清除" onclick="deleteQtryZp()"/>
								</td>
							</tr>
						</table>
					</c:when>
				</c:choose>	
			</div>
			<cps:tabPanel id="">
				家庭成员和亲友信息
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;
				<c:choose>
					<c:when test="${operType!='detail'}">
						<cps:button id="saveqphy" value="新&nbsp;增" onclick="openqtryqphy()"></cps:button>
					</c:when>
				</c:choose>
			</cps:tabPanel>
			<!-- 
			<form id="qtrycxform">
				<input type="hidden" id="qtryid" name ="qtryqyquery.qtryid"/>
			</form>
			 -->
			<input type="hidden" id="qtryid" name ="qtryqyquery.qtryid" value="${qtryqyquery.qtryid}"/>
			<c:if test="${operType !='add'}">
				<cps:tableGrid id="qtryqueryqylist" 
					mutilSelect="true"
					url="/qzgl/wmfwgl/queryQtryqphyListAction.action?id=${qtrybean.id}" autoload="true">
					<cps:column isNumber="true" title="序号"></cps:column>
					<cps:column field="jtpyxm" title="姓名" maxlength="10"></cps:column>
					<cps:column field="jtpygxms" title="关系" maxlength="10"></cps:column>
					<cps:column field="jtpylxdh" title="联系电话" maxlength="10"></cps:column>
				</cps:tableGrid>
			</c:if>
			<c:if test="${operType =='add'}">
				<cps:tableGrid id="qtryqueryqylist" 
					mutilSelect="true"
					url="/qzgl/wmfwgl/queryQtryqphyListAction.action" autoload="false">
					<cps:column isNumber="true" title="序号"></cps:column>
					<cps:column field="jtpyxm" title="姓名" maxlength="10"></cps:column>
					<cps:column field="jtpygxms" title="关系" maxlength="10"></cps:column>
					<cps:column field="jtpylxdh" title="联系电话" maxlength="10"></cps:column>
				</cps:tableGrid>
			</c:if>
			<cps:table id="qtrytable2">
				<cps:row>
					<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>接收人：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtryjsrxm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qtryjsrxm" name="qtrybean.qtryjsrxm" cssClass="validate[maxSize[30]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>接收时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtryjssj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:date id="qtryjssj" name="qtrybean.qtryjssj" cssClass="validate[required]" value ="${qtrybean.qtryjssj}"  maxDate="${qtrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>接收单位：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtryjsdwmc}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qtryjsdwmc" name="qtrybean.qtryjsdwmc" cssClass="validate[maxSize[120]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>接收单位领导：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtrybean.qtryjsdwld}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qtryjsdwld" name="qtrybean.qtryjsdwld" cssClass="validate[maxSize[30]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%">备注：</cps:tdLabel>
					<cps:tdContent width="100%" colspan="5">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<s:textarea id="qtrybz" name="qtrybean.qtrybz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[200]]" readonly="true"></s:textarea>
							</c:when>
							<c:otherwise>
								<s:textarea id="qtrybz" name="qtrybean.qtrybz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if></c:if>所属警务区：</cps:tdLabel>
					<cps:tdContent width="15%" colspan="5">
						<c:if test="${operType=='detail'}">
							<cps:dicText value="${qtrybean.ssjwqmc}"></cps:dicText>
						</c:if>
						<c:if test="${operType=='update'}">
							<s:hidden id="ssjwqdm" name="qtrybean.ssjwqdm"></s:hidden>
							<cps:textfield id="ssjwqmc" name="qtrybean.ssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')" cssStyle="width:50%" value="${qtrybean.ssjwqmc}" required="true"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')"></cps:button>
						</c:if>
						<c:if test="${operType=='add'}">
							<s:hidden id="ssjwqdm" name="qtrybean.ssjwqdm"></s:hidden>
							<cps:textfield id="ssjwqmc" name="qtrybean.ssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')" cssStyle="width:50%" value="${qtrybean.ssjwqmc}" required="true"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')"></cps:button>
						</c:if>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>采集人：</cps:tdLabel>
					<cps:tdContent width="15%">
						<s:hidden id="djrxm" name="qtrybean.djrxm"></s:hidden>
						<s:hidden id="czrjh" name="qtrybean.czrjh"></s:hidden>
						${qtrybean.djrxm} &nbsp;
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>采集单位：</cps:tdLabel>
					<cps:tdContent width="15%">
						<s:hidden id="djdwdm" name="qtrybean.djdwdm"></s:hidden>
						<s:hidden id="djdwmc" name="qtrybean.djdwmc"></s:hidden>
						${qtrybean.djdwmc}
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>采集时间：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qtrybean.djsj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								&nbsp;${qtrybean.djsj}&nbsp;
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
	</form>	
	<!--endprint1-->
</creator:view>