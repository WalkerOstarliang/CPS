<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="迷途人员登记表">

<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js">
	
</script>

<style>
	body{margin:0;height:100%}
	html{height:100%}
	#left{width:800px;height:100%;float:left}
	#main{width:100%;height:100%;}
</style>
		<creator:tbar id="mtryInfotbar">
			<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:button value="确&nbsp;定" onclick="$.closeWindow()" display="${displayAddBtn}"></cps:button>
					<cps:button value="打&nbsp;印" onclick="printMtry(1)"></cps:button>
				</c:when>
				<c:when test="${operType=='add'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveMtry('true')"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
				<c:when test="${operType=='update'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveMtry('true')"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
			</c:choose>
		</creator:tbar>
		<!--startprint1-->
		<form id="mtryform" name="mtryform"  action="/qzgl/wmfwgl/saveMtryBean.action" method="post">
		<creator:panel id="addMtry" title="迷途人员登记表" tbarId="mtryInfotbar">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="id" name="mtrybean.id"></s:hidden>
			<div id="main"  style="height: 100%;width:100%">
				<div id ="left" >
				  <cps:table id="mtryTable">	
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtryxm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtryxm" name="mtrybean.mtryxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>别名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtryxmbm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtryxmbm" name="mtrybean.mtryxmbm" cssClass="validate[maxSize[30],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>性别：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtryxbms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="mtryxb" name="mtrybean.mtryxb" zdlb="GB_XB" headerKey="" headerValue="--请选择--" value="${mtrybean.mtryxb}" cssClass="validate[required]">
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>年龄：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtrynl}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtrynl" name="mtrybean.mtrynl" cssClass="validate[maxSize[3],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>出生日期：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtrycsrq}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:date id="mtrycsrq" name="mtrybean.mtrycsrq" maxDate="${mtrybean.djsj}" dateFmt="yyyy-MM-dd" value ="${mtrybean.mtrycsrq}"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>证件类型：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtryzjlbms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="mtryzjlb" name="mtrybean.mtryzjlb" zdlb="GB_ZJZL" headerKey="" headerValue="--请选择--" value="${mtrybean.mtryzjlb}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>证件号码：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtryzjhm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtryzjhm" name="mtrybean.mtryzjhm" cssClass="validate[maxSize[30],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>籍贯：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtryjgms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="mtryjg" name="mtrybean.mtryjg" zdlb="GB_XZQH" headerKey="" headerValue="--请选择--" value="${mtrybean.mtryjg}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>体貌特征：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtrytmtzms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="mtrytmtz" name="mtrybean.mtrytmtz" zdlb="ZDY_TSTZ" headerKey="" headerValue="--请选择--" value="${mtrybean.mtrytmtz}" cssClass="validate[required]">
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>口音：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtrykyms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="mtryky" name="mtrybean.mtryky" zdlb="GB_KY" headerKey="" headerValue="--请选择--" value="${mtrybean.mtryky}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>身高：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtrysg}"></cps:dicText>CM
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtrysg" name="mtrybean.mtrysg" cssClass="validate[maxSize[3],required]"></cps:textfield>CM
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>体表标记：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtrytbbj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtrytbbj" name="mtrybean.mtrytbbj" cssClass="validate[maxSize[10],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>身体状况：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtrystzk}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtrystzk" name="mtrybean.mtrystzk" cssClass="validate[maxSize[30]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>来源：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtryly}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtryly" name="mtrybean.mtryly" cssClass="validate[maxSize[10],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>指纹采集：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtryzwcj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtryzwcj" name="mtrybean.mtryzwcj" cssClass="validate[maxSize[10]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>DNA采集：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtrydnacj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtrydnacj" name="mtrybean.mtrydnacj" cssClass="validate[maxSize[10]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>血型：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtryxxms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="mtryxx" name="mtrybean.mtryxx" zdlb="GB_XX" headerKey="" headerValue="--请选择--" value="${mtrybean.mtryxx}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				</cps:table>	
				</div>
					<c:choose>
						<c:when test="${operType=='detail'}">
							<img id="mtryzmzp" height="185px;" src="<c:url value='/qzgl/wmfwgl/showMtryPh.action'/>?id=${mtrybean.id}"/>
						</c:when>
						<c:when test="${operType=='update'}">
							<img id="mtryzmzp" height="185px;" src="<c:url value='/qzgl/wmfwgl/showMtryPh.action'/>?id=${mtrybean.id}"/>
						</c:when>
						<c:when test="${operType=='add'}">
							<img id="mtryzmzp" height="185px;"/>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${operType!='detail'}">
							<table>
								<tr>
									<td width="90%">
										&nbsp;
									</td>
									<td align="left">
										<input id="zpid" name="filezp" style="height:25px;width:65px"  type="file" />
									</td>
									<td>
										<input type="button" id="submid" style="height:25px;width:55px" value="保存图片" onclick="insertMtryzp()"/>
									</td>
									<td>
										<input type="button" id="delsubmid" style="height:25px;width:35px" value="清除" onclick="deleteMtryZp()"/>
									</td>
								</tr>
							</table>
						</c:when>
					</c:choose>	
			</div>
			<cps:table id="mtrytable2">
				<cps:row>
					<cps:tdLabel width="9%"><font color="red">*</font>衣着特征：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea id="mtryyztz" name="mtrybean.mtryyztz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400],required]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea id="mtryyztz" name="mtrybean.mtryyztz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400],required]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><font color="red">*</font>随身物品：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea id="mtrysswp" name="mtrybean.mtrysswp" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400],required]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea id="mtrysswp" name="mtrybean.mtrysswp" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400],required]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><font color="red">*</font>发现时间：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${mtrybean.mtrybfxsj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:date id="mtrybfxsj" name="mtrybean.mtrybfxsj" cssClass="validate[required]" value ="${mtrybean.mtrybfxsj}"  maxDate="${mtrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>发现地点：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtrybfxdd}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mtrybfxdd" name="mtrybean.mtrybfxdd" cssClass="validate[maxSize[100],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>	
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%">迷途经过：</cps:tdLabel>
					<cps:tdContent width="100%" colspan="5">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<s:textarea id="mtrymtjg" name="mtrybean.mtrymtjg" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400],required]" readonly="true"></s:textarea>
							</c:when>
							<c:otherwise>
								<s:textarea id="mtrymtjg" name="mtrybean.mtrymtjg" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400],required]"></s:textarea>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><font color="red">*</font>到所时间：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${mtrybean.mtrydssj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:date id="mtrydssj" name="mtrybean.mtrydssj" cssClass="validate[required]" value ="${mtrybean.mtrydssj}"  maxDate="${mtrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>经办人：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${mtrybean.mtryjbrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="mtryjbrxm" name="mtrybean.mtryjbrxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>	
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>送交人姓名：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${mtrybean.mtrysjrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="mtrysjrxm" name="mtrybean.mtrysjrxm" cssClass="validate[maxSize[30]]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>送交人证件类别：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${mtrybean.mtrysjrzjlbms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="mtrysjrzjlb" name="mtrybean.mtrysjrzjlb" zdlb="GB_ZJZL" headerKey="" headerValue="--请选择--" value="${mtrybean.mtryxx}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>证件号码：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${mtrybean.mtrysjrzjhm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="mtrysjrzjhm" name="mtrybean.mtrysjrzjhm" cssClass="validate[maxSize[30]]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>送交人联系方式：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${mtrybean.mtrysjrlxfs}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="mtrysjrlxfs" name="mtrybean.mtrysjrlxfs" cssClass="validate[maxSize[30]]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>送交人住址：</cps:tdLabel>
					<cps:tdContent width="15%" colspan="5">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${mtrybean.mtrysjrzz}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="mtrysjrzz" name="mtrybean.mtrysjrzz" cssClass="validate[maxSize[120]]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%">备注：</cps:tdLabel>
					<cps:tdContent width="100%" colspan="5">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<s:textarea id="mtrybz" name="mtrybean.mtrybz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[200],required]" readonly="true"></s:textarea>
							</c:when>
							<c:otherwise>
								<s:textarea id="mtrybz" name="mtrybean.mtrybz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[200],required]"></s:textarea>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if></c:if>所属警务区：</cps:tdLabel>
					<cps:tdContent width="15%" colspan="5">
						<c:if test="${operType=='detail'}">
							<cps:dicText value="${mtrybean.ssjwqmc}"></cps:dicText>
						</c:if>
						<c:if test="${operType=='update'}">
							<s:hidden id="ssjwqdm" name="mtrybean.ssjwqdm"></s:hidden>
							<cps:textfield id="ssjwqmc" name="mtrybean.ssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')" cssStyle="width:50%" value="${mtrybean.ssjwqmc}" required="true"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')"></cps:button>
						</c:if>
						<c:if test="${operType=='add'}">
							<s:hidden id="ssjwqdm" name="mtrybean.ssjwqdm"></s:hidden>
							<cps:textfield id="ssjwqmc" name="mtrybean.ssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')" cssStyle="width:50%" value="${mtrybean.ssjwqmc}" required="true"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')"></cps:button>
						</c:if>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>采集人：</cps:tdLabel>
					<cps:tdContent width="15%">
						<s:hidden id="djrxm" name="mtrybean.djrxm"></s:hidden>
						<s:hidden id="czrjh" name="mtrybean.czrjh"></s:hidden>
						${mtrybean.djrxm} &nbsp;
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>采集单位：</cps:tdLabel>
					<cps:tdContent width="15%">
						<s:hidden id="djdwdm" name="mtrybean.djdwdm"></s:hidden>
						<s:hidden id="djdwmc" name="mtrybean.djdwmc"></s:hidden>
						${mtrybean.djdwmc}
					</cps:tdContent>
					<cps:tdLabel width="9%"><c:if test="${operType!='detail'}"></c:if>采集时间：</cps:tdLabel>
					<cps:tdContent width="15%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${mtrybean.djsj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								&nbsp;${mtrybean.djsj}&nbsp;
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
	</form>
	<!--endprint1-->
</creator:view>