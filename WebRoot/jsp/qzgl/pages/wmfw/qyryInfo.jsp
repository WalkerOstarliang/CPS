<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="弃婴信息登记表">

<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js">
	
</script>

<style>
	body{margin:0;height:100%}
	html{height:100%}
	#left{width:800px;height:100%;float:left}
	#main{width:100%;height:100%;}
</style>
		<creator:tbar id="qyryInfotbar">
			<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:button value="确&nbsp;定" onclick="$.closeWindow()"></cps:button>
					<cps:button value="打&nbsp;印" onclick="printQyry(1)"></cps:button>
				</c:when>
				<c:when test="${operType=='add'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveQyry('true')" display="${displayAddBtn}"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
				<c:when test="${operType=='update'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveQyry('true')" display="${displayAddBtn}"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
			</c:choose>
		</creator:tbar>
		<!--startprint1-->
		<form id="qyryform" name="qyryform"  action="/qzgl/wmfwgl/saveQyryBean.action" method="post">
		<creator:panel id="addQyry" title="弃婴信息登记表" tbarId="qyryInfotbar">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="id" name="qyrybean.id"></s:hidden>
			<div id="main"  style="height: 100%;width:100%">
				<div id ="left" >
				  <cps:table id="qyryTable">	
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyryxm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qyryxm" name="qyrybean.qyryxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>别名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyryxmbm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qyryxmbm" name="qyrybean.qyryxmbm" cssClass="validate[maxSize[30]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>性别：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyryxbms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="qyryxb" name="qyrybean.qyryxb" zdlb="GB_XB" headerKey="" headerValue="--请选择--" value="${qyrybean.qyryxb}" cssClass="validate[required]">
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>出生日期：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyrycsrq}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:date id="qyrycsrq" name="qyrybean.qyrycsrq" maxDate="${qyrybean.djsj}" dateFmt="yyyy-MM-dd" value ="${qyrybean.qyrycsrq}"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>年龄：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyrynl}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qyrynl" name="qyrybean.qyrynl" cssClass="validate[maxSize[3]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>籍贯：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyryjgms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="qyryjg" name="qyrybean.qyryjg" zdlb="GB_XZQH" headerKey="" headerValue="--请选择--" value="${qyrybean.qyryjg}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>衣着特征：</cps:tdLabel>
							<cps:tdContent width="40%" >
								<c:choose>
									<c:when test="${operType=='detail'}">
										<cps:dicText  value="${qyrybean.qyryyztz}"></cps:dicText>
									</c:when>
									<c:otherwise>
										<cps:textfield id="qyryyztz" name="qyrybean.qyryyztz" cssClass="validate[maxSize[400],required]" ></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>体貌特征：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyrytqyzms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="qyrytqyz" name="qyrybean.qyrytqyz" zdlb="ZDY_TSTZ" headerKey="" headerValue="--请选择--" value="${qyrybean.qyrytqyz}" cssClass="validate[required]">
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>来源：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyryly}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qyryly" name="qyrybean.qyryly" cssClass="validate[maxSize[10],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>指纹采集：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyryzwcj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qyryzwcj" name="qyrybean.qyryzwcj" cssClass="validate[maxSize[10]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>DNA采集：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyrydnacj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qyrydnacj" name="qyrybean.qyrydnacj" cssClass="validate[maxSize[10]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>血型：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyryxxms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="qyryxx" name="qyrybean.qyryxx" zdlb="GB_XX" headerKey="" headerValue="--请选择--" value="${qyrybean.qyryxx}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
					<cps:tdLabel width="9%"><font color="red">*</font>发现时间：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qyrybean.qyrybfxsj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:date id="qyrybfxsj" name="qyrybean.qyrybfxsj" cssClass="validate[required]" value ="${qyrybean.qyrybfxsj}"  maxDate="${qyrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>随身物品：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyrysswp}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qyrysswp" name="qyrybean.qyrysswp" cssClass="validate[maxSize[400],required]" ></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>体表标记：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyrytbbj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qyrytbbj" name="qyrybean.qyrytbbj" cssClass="validate[maxSize[10],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>身体状况：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyrystzk}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qyrystzk" name="qyrybean.qyrystzk" cssClass="validate[maxSize[30]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				</cps:table>	
				</div>
					<c:choose>
						<c:when test="${operType=='detail'}">
							<img id="qyryzmzp" height="185px;" src="<c:url value='/qzgl/wmfwgl/showQyryPh.action'/>?id=${qyrybean.id}"/>
						</c:when>
						<c:when test="${operType=='update'}">
							<img id="qyryzmzp" height="185px;" src="<c:url value='/qzgl/wmfwgl/showQyryPh.action'/>?id=${qyrybean.id}"/>
						</c:when>
						<c:when test="${operType=='add'}">
							<img id="qyryzmzp" height="185px;"/>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${operType=='update'}">
							<table>
								<tr>
									<td width="90%">
										&nbsp;
									</td>
									<td align="left">
										<input id="zpid" name="filezp" style="height:25px;width:65px"  type="file" />
									</td>
									<td>
										<input type="button" id="submid" style="height:25px;width:55px" value="保存图片" onclick="insertQyryzp()"/>
									</td>
									<td>
										<input type="button" id="delsubmid" style="height:25px;width:35px" value="清除" onclick="deleteQyryZp()"/>
									</td>
								</tr>
							</table>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${operType=='add'}">
							<table>
								<tr>
									<td width="90%">
										&nbsp;
									</td>
									<td align="left">
										<input id="zpid" name="filezp" style="height:25px;width:65px"  type="file" />
									</td>
									<td>
										<input type="button" id="submid" style="height:25px;width:55px" value="保存图片" onclick="insertQyryzp()"/>
									</td>
									<td>
										<input type="button" id="delsubmid" style="height:25px;width:35px" value="清除" onclick="deleteQyryZp()"/>
									</td>
								</tr>
							</table>
						</c:when>
					</c:choose>
			</div>
			<cps:table id="mtrytable2">
				
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>发现地点：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qyrybean.qyrybfxdd}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="qyrybfxdd" name="qyrybean.qyrybfxdd" cssClass="validate[maxSize[100],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>	
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%">发现经过：</cps:tdLabel>
					<cps:tdContent width="100%" colspan="5">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<s:textarea id="qyryqyjg" name="qyrybean.qyryqyjg" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400]]" readonly="true"></s:textarea>
							</c:when>
							<c:otherwise>
								<s:textarea id="qyryqyjg" name="qyrybean.qyryqyjg" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400]]"></s:textarea>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><font color="red">*</font>到所时间：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qyrybean.qyrydssj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:date id="qyrydssj" name="qyrybean.qyrydssj" cssClass="validate[required]" value ="${qyrybean.qyrydssj}"  maxDate="${qyrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>发现人：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qyrybean.qyryfxrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="qyryfxrxm" name="qyrybean.qyryfxrxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>发现人联系方式：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qyrybean.qyryfxrlxfs}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="qyryfxrlxfs" name="qyrybean.qyryfxrlxfs" cssClass="validate[maxSize[30]]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>	
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>发现人身份证：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qyrybean.qyryfxrsfzh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="qyryfxrzjhm" name="qyrybean.qyryfxrzjhm" cssClass="validate[maxSize[30]]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>	
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>发现人证件类别：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qyrybean.qyryfxrzjlbms}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="qyryfxrzjlb" name="qyrybean.qyryfxrzjlb" zdlb="GB_ZJZL" headerKey="" headerValue="--请选择--" value="${qyrybean.qyryfxrzjlb}" >
								</cps:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>发现人证件号码：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qyrybean.qyryfxrzjhm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="qyryfxrzjhm" name="qyrybean.qyryfxrzjhm" cssClass="validate[maxSize[30]]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>	
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>发现人住址：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qyrybean.qyryfxrzz}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="qyryfxrzz" name="qyrybean.qyryfxrzz" cssClass="validate[maxSize[200]]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>	
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>经办人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qyrybean.qyryjbrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="qyryjbrxm" name="qyrybean.qyryjbrxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%">备注：</cps:tdLabel>
					<cps:tdContent width="100%" colspan="5">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<s:textarea id="qyrybz" name="qyrybean.qyrybz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[200]]" readonly="true"></s:textarea>
							</c:when>
							<c:otherwise>
								<s:textarea id="qyrybz" name="qyrybean.qyrybz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if></c:if>所属警务区：</cps:tdLabel>
					<cps:tdContent width="15%" colspan="5">
						<c:if test="${operType=='detail'}">
							<cps:dicText value="${qyrybean.ssjwqmc}"></cps:dicText>
						</c:if>
						<c:if test="${operType=='update'}">
							<s:hidden id="ssjwqdm" name="qyrybean.ssjwqdm"></s:hidden>
							<cps:textfield id="ssjwqmc" name="qyrybean.ssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')" cssStyle="width:50%" value="${qyrybean.ssjwqmc}" required="true"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')"></cps:button>
						</c:if>
						<c:if test="${operType=='add'}">
							<s:hidden id="ssjwqdm" name="qyrybean.ssjwqdm"></s:hidden>
							<cps:textfield id="ssjwqmc" name="qyrybean.ssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')" cssStyle="width:50%" value="${qyrybean.ssjwqmc}" required="true"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')"></cps:button>
						</c:if>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>采集人：</cps:tdLabel>
					<cps:tdContent width="15%">
						<s:hidden id="djrxm" name="qyrybean.djrxm"></s:hidden>
						<s:hidden id="czrjh" name="qyrybean.czrjh"></s:hidden>
						${qyrybean.djrxm} &nbsp;
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>采集单位：</cps:tdLabel>
					<cps:tdContent width="15%">
						<s:hidden id="djdwdm" name="qyrybean.djdwdm"></s:hidden>
						<s:hidden id="djdwmc" name="qyrybean.djdwmc"></s:hidden>
						${qyrybean.djdwmc}
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>采集时间：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qyrybean.djsj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								&nbsp;${qyrybean.djsj}&nbsp;
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
	</form>
	<!--endprint1-->
</creator:view>