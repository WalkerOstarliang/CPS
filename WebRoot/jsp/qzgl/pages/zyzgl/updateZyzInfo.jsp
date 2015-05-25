<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
var i =${size};
function addzc(operType){
	$.openDialogWindow({
		url : contextPath + "/qzgl/zyzgl/toAddZcxx.action",
		data : {"operType":operType,t:new Date().getTime()},
		width : 600,
		height : 300,
		callback : function(zcxx)
		{
			if(zcxx) 
			{
				var json = eval(zcxx);
				var zcTableHtml = "<tr>";
				zcTableHtml += "<td align='center'><input type='text' value='"+zcxx.zcmc+"' name='zyzdjxxBean.zyzzList["+i+"].zcmc'/><input type='hidden' value='"+zcxx.zc+"' name='zyzdjxxBean.zyzzList["+i+"].zcdm'/></td> ";
				zcTableHtml += "<td align='center'><input type='text' value='"+zcxx.jysm+"' name='zyzdjxxBean.zyzzList["+i+"].jysm'/></td>";
				zcTableHtml += "<td><a href='javascript:void(0);' onclick='deleteZc(this.parentElement.parentElement.rowIndex)'>删除</a><input type='hidden' value='"+zcxx.operType+"' name='zyzdjxxBean.zyzzList["+i+"].operType'/></td>";
				zcTableHtml += "</tr>";
				$("#zcListTh").append(zcTableHtml);
				i = i+1;
			}
		}
	});	
}
</script>
<creator:view title="志愿者登记表">
<creator:tbar id="updatezyzInfotbar">
					<c:choose>
						<c:when test="${operType != 'detail'}">
							<cps:button value="保&nbsp;存" onclick="save()"></cps:button>
							<cps:button value="重&nbsp;置" type="reset"></cps:button>
						</c:when>
					</c:choose>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
		</creator:tbar>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/zyzgl.js"></script>
	<form id="Zyzform" action="<c:url value='/qzgl/zyzgl/saveZyz.action'/>"
		method="post">
		<s:hidden id="operType" name="operType"></s:hidden>
		<s:hidden id="bh" name="zyzdjxxBean.bh"></s:hidden>

		<creator:panel id="zyzjbxx" title="志愿者基本信息"  tbarId="updatezyzInfotbar">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">姓名：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.xm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="xm" name="zyzdjxxBean.xm"
									value="${zyzdjxxBean.xm}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">身份证号：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.sfzh}" ></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="sfzh" name="zyzdjxxBean.sfzh"
									value="${zyzdjxxBean.sfzh}" cssClass="validate[required funcCall[checkIDC]] cps-input"  maxlength="18"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">性别：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.xb}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<s:select list="xbList" id="zc" cssStyle="width:70%"
									listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
									cssClass="cps-input" name="zyzdjxxBean.xb"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">出生日期：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.csrq}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:date id="csrq" name="zyzdjxxBean.csrq"
									value="${zyzdjxxBean.csrq}" dateFmt="yyyy-MM-dd"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">家庭住址：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.jtzz}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jtzz" name="zyzdjxxBean.jtzz"
									value="${zyzdjxxBean.jtzz}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">文化程度：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.whcd}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<s:select list="whcdList" id="zc" cssStyle="width:70%"
									listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
									cssClass="cps-input" name="zyzdjxxBean.whcd"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">手机号码：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.lxdh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="lxdh" name="zyzdjxxBean.lxdh"
									value="${zyzdjxxBean.lxdh}"  cssClass="validate[custom[phone]] cps-input" maxlength="20"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">邮箱：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.email}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="email" name="zyzdjxxBean.email"
									value="${zyzdjxxBean.email}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">QQ号码：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.qqhm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="qqhm" name="zyzdjxxBean.qqhm"
									value="${zyzdjxxBean.qqhm}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">所属派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.sspcsmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
							<input type="hidden" name="zyzdjxxBean.sspcsdm" value="${zyzdjxxBean.sspcsdm}" 
							id="sspcsdm"/>
 					<cps:textfield name="zyzdjxxBean.sspcsmc" cssStyle="width:70%;" id="sspcsmc"
 							value="${zyzdjxxBean.sspcsmc}" cssClass="validate[required]"
 							ondblclick="selectOrg('${loginInfo.orgcode}','sspcsdm','sspcsmc')">
 					</cps:textfield>
					<cps:button value="选择" cssStyle="width:10px;"
						onclick="selectOrg('${loginInfo.orgcode}','sspcsdm','sspcsmc')" />
								<!--<cps:textfield id="sspcsmc" name="zyzdjxxBean.sspcsmc"
									value="${zyzdjxxBean.sspcsmc}"></cps:textfield>-->
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">所属警务区：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.ssjwqsmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
							<input type="hidden" name="zyzdjxxBean.ssjwqsdm" value="${zyzdjxxBean.ssjwqsdm}" 
							id="ssjwsdm"/>
					<cps:textfield name="zyzdjxxBean.ssjwqsmc" value="${zyzdjxxBean.ssjwqsmc}" 
							ondblclick="selectOrg('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')"
							id="ssjwqmc" cssStyle="width:70%;"></cps:textfield>
					<cps:button value="选择" cssStyle="width:10px;"
						onclick="selectOrg('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')" />
								<!--<cps:textfield id="ssjwqsmc" name="zyzdjxxBean.ssjwqsmc"
									value="${zyzdjxxBean.ssjwqsmc}"></cps:textfield>-->
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.djrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="djrxm" name="zyzdjxxBean.djrxm"
									value="${zyzdjxxBean.djrxm}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.djsj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:date id="djsj" name="zyzdjxxBean.djsj"
									value="${zyzdjxxBean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记单位名称：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.djdwmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="djdwmc" name="zyzdjxxBean.djdwmc"
									value="${zyzdjxxBean.djdwmc}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
					<cps:tdContent width="25%">
					&nbsp;
				</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
		<br/>
		<creator:panel id="zcxx" title="志愿者专长信息">
		<c:if test="${operType!='detail'}">
			<creator:tbar>
				<cps:button value="新增" onclick="addzc('add')"></cps:button>
			</creator:tbar>
		</c:if>
		<cps:table id="zcTable">
			<tr id="zcListTh">
				<td
					style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg'); background-position: center bottom; background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE; color: #003F87; cursor: pointer; font-size: 12px; font-weight: bold; height: 22px; text-align: center;">
					专长
				</td>
				<td
					style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg'); background-position: center bottom; background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE; color: #003F87; cursor: pointer; font-size: 12px; font-weight: bold; height: 22px; text-align: center;">
					专长说明
				</td>
				<c:if test="${operType!='detail'}">
					<td
						style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg'); background-position: center bottom; background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE; color: #003F87; cursor: pointer; font-size: 12px; font-weight: bold; height: 22px; text-align: center;">
						操作
					</td>
				</c:if>
			</tr>
			<c:forEach items="${zyzdjxxBean.zyzzList}" var="bean" varStatus="st">
				<tr>
					<td align="center">
						<input type="hidden" name="zyzdjxxBean.zyzzList[${st.index}].bh"
							value="${bean.bh }" />
						<input type="hidden"
							name="zyzdjxxBean.zyzzList[${st.index}].zyzbh"
							value="${bean.zyzbh }" />
						<c:if test="${operType=='detail'}">
		${bean.zcmc }
		</c:if>
						<c:if test="${operType!='detail'}">
						<cps:select id="zcdm" name="zyzdjxxBean.zyzzList[${st.index}].zcdm" zdlb="GB_ZC" headerKey="" headerValue="--请选择--" cssClass="validate[required] cps-input" value="${bean.zcdm}"></cps:select>
						<!-- 	<input type="text" value="${bean.zcmc }"
								name="zyzdjxxBean.zyzzList[${st.index}].zcmc" /> -->
						</c:if>
					</td>
					<td align="center">
						<c:if test="${operType=='detail'}">
		${bean.jysm }
		</c:if>
						<c:if test="${operType!='detail'}">
						<cps:textfield id="djdwmc" name="zyzdjxxBean.zyzzList[${st.index}].jysm"
									value="${bean.jysm }" cssStyle="cps-input"></cps:textfield>
						<!--  	<input type="text" value="${bean.jysm }"
								name="zyzdjxxBean.zyzzList[${st.index}].jysm" size="80%"/>-->
						</c:if>
					</td>
					<c:if test="${operType!='detail'}">
						<td>
							<a href="javascript:void(0);"
								onclick="deleteZcxx(this.parentElement.parentElement.rowIndex,'${bean.bh }');">删除</a>
							<input type="hidden" value="${operType }"
								name="zyzdjxxBean.zyzzList[${st.index}].operType" />
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</cps:table>
		</creator:panel>
		
	</form>
</creator:view>