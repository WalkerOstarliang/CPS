<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="技防物防设施信息">
	<creator:Script src="/jsp/afgl/js/xqjfwfssxxwin.js"></creator:Script>
	
	<form id="add_xqjfwfssxx_form" action="${contextPath}/xqjfwfssxx/saveXqjfwfssxx.action" method="post">
	<creator:tbar id="addxqjfwfssxxtbar">
					<cps:button value="保存" onclick="addXqjfwfssxx();"></cps:button>
					<cps:button value="关闭" onclick="window.close();"></cps:button>
	</creator:tbar>
	<creator:panel id="head_djxqjfwfssxx" title="${operType=='add' ? '登记技防物防设施信息' : '修改技防物防设施信息'}"  tbarId="addxqjfwfssxxtbar">
		<s:hidden id="operType" name="operType"/>
		<input type="hidden" id="ssbh" name="xqjfwfssxxBean.ssbh" value="${xqjfwfssxxBean.ssbh }"/>
		<input type="hidden" id="czbs" name="xqjfwfssxxBean.czbs" value="${xqjfwfssxxBean.czbs }"/>
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>所在社区：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<input type="hidden" id="sqbh" name="xqjfwfssxxBean.sqbh" value="${xqjfwfssxxBean.sqbh}">
					<c:choose>
						<c:when test="${operType=='detail'}">
						<cps:textfield id="sqmc"  name="xqjfwfssxxBean.sqmc" cssClass="validate[required] cps-input" cssStyle="width:80%"  readonly="true" />
						</c:when>
						<c:otherwise>
								<cps:textfield id="sqmc"  name="xqjfwfssxxBean.sqmc" cssClass="validate[required] cps-input" cssStyle="width:80%"  readonly="true" ondblclick="openSqxxSelectWin(callbackSelectSqxx)"/>
								<cps:button value="选择" onclick="openSqxxSelectWin(callbackSelectSqxx)"></cps:button>
						</c:otherwise>
					</c:choose>
				
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:12%">所在小区：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
						<c:choose>
						<c:when test="${operType=='detail'}">
						<cps:textfield id="xqmc"  name="xqjfwfssxxBean.xqmc"  value="${xqjfwfssxxBean.xqmc}"   readonly="true" />
						</c:when>
						<c:otherwise>
								<input type="hidden" id="xqbhhidden" value="${xqjfwfssxxBean.xqbh}"/>
					 			<cps:select id="xqbhlist" name="xqjfwfssxxBean.xqbh" headerKey="" headerValue="--请选择--" cssStyle="width:80%"></cps:select>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="width:13%"><font color="red">*</font>设施类型：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<c:choose>
						<c:when test="${operType=='detail'}">
						<cps:textfield id="sslx" name="xqjfwfssxxBean.sslx"  value="${xqjfwfssxxBean.sslx }" cssStyle="width:80%"  readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
						<cps:select id="sslx" name="xqjfwfssxxBean.sslx" cssClass="validate[required] cps-select" value="${xqjfwfssxxBean.sslx }" cssStyle="width:80%" zdlb="AF_SSLX" headerKey="" headerValue="--请选择--" onchange="setSbmc(this)"></cps:select>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:13%"><font color="red">*</font>设施名称：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
				<c:choose>
						<c:when test="${operType=='detail'}">
							<cps:textfield id="ssmc" name="xqjfwfssxxBean.ssmc" value="${xqjfwfssxxBean.ssmc }"  cssClass="validate[required] cps-input" cssStyle="width:80%" maxlength="60" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="ssmc" name="xqjfwfssxxBean.ssmc" value="${xqjfwfssxxBean.ssmc }"  cssClass="validate[required] cps-input" cssStyle="width:80%" maxlength="60"></cps:textfield>
						</c:otherwise>
					</c:choose>
				
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:12%">运行情况：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<c:choose>
						<c:when test="${operType=='detail'}">
						<cps:textfield id="sbyxqk" name="xqjfwfssxxBean.sbyxqk"  value="${xqjfwfssxxBean.sbyxqk }" cssStyle="width:80%"  readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
						<cps:select id="sbyxqk" name="xqjfwfssxxBean.sbyxqk" zdlb="ZAGL_SBYXQK" value="${xqjfwfssxxBean.sbyxqk }" cssStyle="width:80%"></cps:select>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
				
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="width:13%">位置类型：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<c:choose>
						<c:when test="${operType=='detail'}">
						<cps:textfield id="wzlx" name="xqjfwfssxxBean.wzlx" value="${xqjfwfssxxBean.wzlx }"  cssStyle="width:80%"  readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
						<cps:select id="wzlx" name="xqjfwfssxxBean.wzlx" value="${xqjfwfssxxBean.wzlx }" cssStyle="width:80%" zdlb="AF_WZLX" headerKey="" headerValue="--请选择--"></cps:select>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
				
				<cps:tdLabel cssStyle="width:13%">是否发挥作用：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
						<c:choose>
						<c:when test="${operType=='detail'}">
						<cps:textfield id="isfhzy" name="xqjfwfssxxBean.isfhzy" value="${xqjfwfssxxBean.isfhzy }" cssStyle="width:80%"  readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
					<cps:select id="isfhzy" name="xqjfwfssxxBean.isfhzy" zdlb="AF_ISFHZY" value="${xqjfwfssxxBean.isfhzy }" cssStyle="width:80%"  headerKey="" headerValue="--请选择--"></cps:select>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:12%">报警设施连接：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<c:choose>
						<c:when test="${operType=='detail'}">
						<cps:textfield id="bjsslj" name="xqjfwfssxxBean.bjsslj" value="${xqjfwfssxxBean.bjsslj }" cssStyle="width:80%"  readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
					<cps:select id="bjsslj" name="xqjfwfssxxBean.bjsslj" zdlb="AF_BJSSLJ" value="${xqjfwfssxxBean.bjsslj }" cssStyle="width:80%" headerKey="" headerValue="--请选择--"></cps:select>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="width:12%"><font color="red">*</font>设备数量：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<c:choose>
						<c:when test="${operType=='detail'}">
							<cps:textfield id="sssl" name="xqjfwfssxxBean.sssl" inputType="integer" cssClass="validate[required] cps-input" value="${xqjfwfssxxBean.sssl }" cssStyle="width:80%" readonly="true" ></cps:textfield>
						</c:when>
						<c:otherwise>
						<cps:textfield id="sssl" name="xqjfwfssxxBean.sssl" inputType="integer" cssClass="validate[required] cps-input" value="${xqjfwfssxxBean.sssl }" cssStyle="width:80%"></cps:textfield>
						</c:otherwise>
					</c:choose>
				
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:12%">安装位置：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
						<c:choose>
						<c:when test="${operType=='detail'}">
						<cps:textfield id="azwz" name="xqjfwfssxxBean.azwz"  value="${xqjfwfssxxBean.azwz }" cssStyle="width:80%" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
						<cps:textfield id="azwz" name="xqjfwfssxxBean.azwz"  value="${xqjfwfssxxBean.azwz }" cssStyle="width:80%"></cps:textfield>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:12%">安装时间：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<c:choose>
						<c:when test="${operType=='detail'}">
						<cps:textfield id="azsj" name="xqjfwfssxxBean.azsj"  value="${xqjfwfssxxBean.azsj }" cssStyle="width:80%" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
						<cps:date id="azsj" name="xqjfwfssxxBean.azsj"  cssStyle="width:80%" value="${xqjfwfssxxBean.azsj }" dateFmt="yyyy-MM-dd" />
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<c:choose>
					<c:when test="${operType=='add' }">
					<cps:textfield id="djrxm" name="xqjfwfssxxBean.djrxm"  value="${loginInfo.realname}" readonly="true" cssStyle="width:80%"></cps:textfield>
					<input type="hidden" id="djrjh" name="xqjfwfssxxBean.djrjh"
						value="${loginInfo.username }" />
					</c:when>
						<c:otherwise>
							<cps:textfield id="djrxm" name="xqjfwfssxxBean.djrxm"  value="${xqjfwfssxxBean.djrxm}" readonly="true" cssStyle="width:80%"></cps:textfield>
					<input type="hidden" id="djrjh" name="xqjfwfssxxBean.djrjh"
						value="${xqjfwfssxxBean.djrjh }" />
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
					<c:choose>
						<c:when test="${operType=='add' }">
							<cps:date id="djsj" name="xqjfwfssxxBean.djsj" cssStyle="width:80%" dateFmt="yyyy-MM-dd HH:mm:ss" readOnly="true" defaultSystemDate="true"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:textfield id="djsj" name="xqjfwfssxxBean.djsj" cssStyle="width:80%" readonly="true"  value="${xqjfwfssxxBean.djsj}"></cps:textfield>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
				<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
				<cps:tdContent cssStyle="width:20%">
						<c:choose>
					<c:when test="${operType=='add' }">
					<cps:textfield id="djdwmc" name="xqjfwfssxxBean.djdwmc" cssStyle="width:80%"
						value="${loginInfo.orgname }" readonly="true"></cps:textfield>
					<input id="djdwdm" name="xqjfwfssxxBean.djdwdm" type="hidden""
						value="${loginInfo.orgcode }" />
					</c:when>
					<c:otherwise>
						<cps:textfield id="djdwmc" name="xqjfwfssxxBean.djdwmc" cssStyle="width:80%"
						value="${xqjfwfssxxBean.djdwmc }" readonly="true"></cps:textfield>
					<input id="djdwdm" name="xqjfwfssxxBean.djdwdm" type="hidden""
						value="${xqjfwfssxxBean.djdwdm }" />
					</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			
		</cps:table>
	
	</creator:panel>
	<c:if test="${operType!='detail'}">
	<creator:tbar id="wfstbar">
 	 	<div style="width: 100%;text-align: right;">
 	 		<cps:button value="新增" onclick="addFjTrObj()"></cps:button>
 	 	</div>
 	</creator:tbar>
 	</c:if>
 	 <creator:panel id="wfsqpanel" title="设备附件" tbarId="wfstbar">
 	 	
 		<cps:table id="fjtable" cssClass="cps-tablegrid ">
 			<c:choose>
 			<c:when test="${operType!='detail'}">
 				<tr>
 				<th align="center" width="40%">附件</th>
 				<th align="center" width="50%">附件描述</th>
 				<th align="center" width="10%">操作</th>
 			</tr>
 			<c:forEach items="${sqwfsszpxxList}" var="bean">
 				<tr>
 					<td>
 						<span onclick="dbFileDown('t_af_sqjfwfsszpxx','id','zp','${bean.id}','${bean.zpmc}')" style="cursor: pointer;" class="cps_span_href">${bean.zpmc}</span>
					</td>
					<td>
						${bean.zpms }
					</td>
					 <td align="center">
						<cps:button value="删除" onclick="deleteTjTrObj(this, '${bean.id}')"></cps:button>
					</td>
 				</tr>
 			</c:forEach>
 			</c:when>
 			<c:otherwise>
 				<tr>
 				<th align="center" width="40%">附件</th>
 				<th align="center" width="60%">附件描述</th>
 			</tr>
 			<c:forEach items="${sqwfsszpxxList}" var="bean">
 				<tr>
 					<td>
						<a class="cps_span_href" onclick="showFjxx('${bean.id}','${bean.zpmc}')">${bean.zpmc}</a>
					</td>
					<td>
						${bean.zpms }
					</td>
 				</tr>
 			</c:forEach>
 			</c:otherwise>
 			</c:choose>
 			
		</cps:table>
	</creator:panel>	

	<%-- <div id="displayimg" style="display: none;width:400px;height: 400px;text-align: center;">
		<img id="imagedisplay" alt="没有找到图片" src="" width="100%" height="80%"/>
	</div>
	<div id="trtempcontent" style="display: none;">
		<td width="40%">
			<input type="file" id="upload" name="upload" accept="image/*" class="validate[required] cps-file">
		</td>
		<td width="50%">
			<input type="text" name="zpms" class="cps-input" style="width:98%">
		</td>
		 <td align="center" width="10%">
			<cps:button value="删除" onclick="deleteTjTrObj(this)"></cps:button>
		</td>
	</div>
	--%>
	</form>
</creator:view>