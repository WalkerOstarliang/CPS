<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="rkjbxxsavetbar">
	<cps:button value="保存" onclick="submitFormZdryInfo(savezdryaftercallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="rkjbxx"  title="人员基本信息" tbarId="rkjbxxsavetbar">
	<%@include file="/jsp/lsgl/pages/zdry/newrkjbxx.jsp"%>
</creator:panel>
<creator:panel id="zdrygzdx"  title="重点人员信息"  >
		<input type="hidden" id="rybh1" name="zdryBean.rybh" value="${rkBean.jbxxBean.rybh }"/>
		
	<cps:table>
		<cps:row>
			
			<cps:tdLabel width="12%">重点人员编号：</cps:tdLabel>
			<cps:tdContent width="25%">	
				<cps:textfield id="zdrybh" name="zdryBean.zdrybh" readonly="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="12%">重点人员类别：</cps:tdLabel>
			<cps:tdContent width="25%">	
				<s:hidden name="zdryBean.zdrylbbj"></s:hidden>
				<cps:textfield id="zdrylbbj" name="zdryBean.zdrylbbjmc" readonly="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="12%">重点人员细类：</cps:tdLabel>
			<cps:tdContent width="22%">	
				<s:hidden name="zdryBean.zdryxl"></s:hidden>
				<cps:textfield id="zdryxl" name="zdryBean.zdryxlmc" readonly="true"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>管辖单位：</cps:tdLabel>
			<cps:tdContent>
				<s:hidden name="zdryBean.gxdwdm"></s:hidden>
				<cps:textfield id="zdryxl" name="zdryBean.gxdwmc" readonly="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="12%">纳入部级时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="nrbjzdrysj" name="zdryBean.nrbjzdryksj" value="${zdryBean.nrbjzdryksj}" readonly="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>最近立案时间：</cps:tdLabel>
			<cps:tdContent>	
				<cps:textfield id="zxlasj" name="zdryBean.zxlasj" readonly="true" value="${zdryBean.zxlasj}"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel><font color="red">*</font>对象类别：</cps:tdLabel>
			<cps:tdContent>
			<c:choose>
				<c:when test="${zdryBean.gzdxbh eq null}">
					<cps:select id="zdrydxlb" name="zdryBean.dxlb" zdlb="ZDDXLB" value="${zdryBean.dxlb}"   headerKey="" headerValue=" "  required="true"></cps:select>				
				</c:when>
				<c:otherwise>
					<cps:select id="zdrydxlb" name="zdryBean.dxlb" zdlb="ZDDXLB" value="${zdryBean.dxlb}"   headerKey="" headerValue=" "  required="true" disabled="true" ></cps:select>
				</c:otherwise>
			</c:choose>		
			</cps:tdContent>
			<cps:tdLabel>立案单位：</cps:tdLabel>
			<cps:tdContent>	
				<s:hidden name="zdryBean.ladwjgdm"></s:hidden>
				<cps:textfield id="ladw" name="zdryBean.ladw" value="${zdryBean.ladw}" readonly="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>刑满解教时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="xmjjzs" name="zdryBean.xmjjzs" value="${zdryBean.xmjjzs}" dateFmt="yyyy-MM-dd" ></cps:date>
			</cps:tdContent>
			
		</cps:row>
		<cps:row>
			<cps:tdLabel>涉案类别：</cps:tdLabel>
			<cps:tdContent >
				<cps:select id="salb" name="zdryBean.salb" zdlb="SALB" value="${zdryBean.salb}" headerKey="" headerValue=" " ></cps:select>
			</cps:tdContent >
			
			<cps:tdLabel>从业状况：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="cyzk" name="zdryBean.cyzk" zdlb="GB_CYZK"  value="${zdryBean.cyzk}"  headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
			<cps:tdLabel>在逃类别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="ztlx" name="zdryBean.ztlx" zdlb="ZDY_ZTLX" value="${zdryBean.ztlx}" headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>管理方法：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="glff" name="zdryBean.glff" zdlb="ZDRYGLFF"  value="${zdryBean.glff}" headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
			<cps:tdLabel>管理类别：</cps:tdLabel>
			<cps:tdContent  colspan="3">
				<cps:select id="gllb" name="zdryBean.gllb" zdlb="ZDRY_GLLB"  value="${zdryBean.gllb}" headerKey="" headerValue=" " cssStyle="width:94%"></cps:select>
			</cps:tdContent>
		</cps:row>		
		<cps:row>
			<cps:tdLabel>有无档案：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="ywda" name="zdryBean.ywda" zdlb="ZDY_ZDSF" value="${zdryBean.ywda}" headerKey="" headerValue=" " ></cps:select>
			</cps:tdContent>
			<cps:tdLabel>档案编号：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="dabh" name="zdryBean.dabh" value="${zdryBean.dabh}" maxlength="50" readonly="true"></cps:textfield>
			</cps:tdContent>
		
			<cps:tdLabel>是否指纹采集：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="iscjzw" name="zdryBean.iscjzw" zdlb="ZDY_ZDSF" value="${zdryBean.iscjzw}" headerKey="" headerValue=" " ></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			
			<cps:tdLabel>是否笔记采集：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="iscjbj" name="zdryBean.iscjbj" zdlb="ZDY_ZDSF" value="${zdryBean.iscjbj}" headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
			<cps:tdLabel>笔记采集类型：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="bjcjlx" name="zdryBean.bjcjlx" zdlb="ZDY_BJZL" value="${zdryBean.bjcjlx}" headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
			<cps:tdLabel>法律文书编号：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="flwsbh" name="zdryBean.flwsbh" value="${zdryBean.flwsbh}"  maxlength="30"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			
			<cps:tdLabel>法律文书名称：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="flwsmc" name="zdryBean.flwsmc" value="${zdryBean.flwsmc}" maxlength="50"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>签发机关：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="qfjg" name="zdryBean.qfjg" value="${zdryBean.qfjg}" maxlength="60"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>签发时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="qfsj" name="zdryBean.qfsj"  value="${zdryBean.qfsj}" dateFmt="yyyy-MM-dd" ></cps:date>
			</cps:tdContent>
		</cps:row>
	
		<cps:row>
			<cps:tdLabel width="12%">曾被处理情况：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="cbclqk" name="zdryBean.cbclqk"   cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[100]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel><font color="red">*</font>责任民警：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${empty zdryBean.sszrmjjh}">
						<input type="hidden" id="sszrmjjh" name="zdryBean.sszrmjjh" value="${loginInfo.username }" />
						<cps:textfield id="sszrmjxm" name="zdryBean.sszrmjxm"  value="${loginInfo.realname}"  required="true" readonly="true" appendPopuBtn="true" onclick="openZrmjSelectZdry('${loginInfo.rootOrgCode}');"></cps:textfield>
					</c:when>
					<c:otherwise>
						<input type="hidden" id="sszrmjjh" name="zdryBean.sszrmjjh" value="${zdryBean.sszrmjjh }" />
						<cps:textfield id="sszrmjxm" name="zdryBean.sszrmjxm"  value="${zdryBean.sszrmjxm}"  required="true" readonly="true" appendPopuBtn="true" onclick="openZrmjSelectZdry('${loginInfo.rootOrgCode}');"></cps:textfield>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>责任单位：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${empty zdryBean.sszrdwdm}">
						<input type="hidden" id="sszrdwdm" name="zdryBean.sszrdwdm" value="${loginInfo.orgcode }" />
						<cps:textfield id="sszrdwmc" name="zdryBean.sszrdwmc"  value="${loginInfo.orgname}" required="true" readonly="true"></cps:textfield>
					</c:when>
					<c:otherwise>
						<input type="hidden" id="sszrdwdm" name="zdryBean.sszrdwdm" value="${zdryBean.sszrdwdm }" />
						<cps:textfield id="sszrdwmc" name="zdryBean.sszrdwmc"  value="${zdryBean.sszrdwmc}" required="true" readonly="true"></cps:textfield>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel>联系电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="sszrmjlxdh" name="zdryBean.sszrmjlxdh" value="${zdryBean.sszrmjlxdh}" minlength="7" maxlength="20"  isPhone="true"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<%--
		<cps:row>
			<c:if test="${empty zdryBean.djrxm}">
				<cps:tdLabel><font color="red">*</font>登记人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="djrxm" name="zdryBean.djrxm" value="${loginInfo.realname}" required="true" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="djdwdm1" name="zdryBean.djdwdm" value="${loginInfo.orgcode}"/>
					<cps:textfield id="djdwmc" name="zdryBean.djdwmc" value="${loginInfo.orgname}"  required="true" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="djsj" name="zdryBean.djsj" defaultSystemDate="true" required="true" readOnly="true"></cps:date>
				</cps:tdContent>
			</c:if>
			<c:if test="${not empty zdryBean.djrxm}">
				<cps:tdLabel><font color="red">*</font>登记人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="djrxm" name="zdryBean.djrxm" value="${zdryBean.djrxm}" required="true" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="djdwdm1" name="zdryBean.djdwdm" value="${zdryBean.djdwdm}"/>
					<cps:textfield id="djdwmc" name="zdryBean.djdwmc" value="${zdryBean.djdwmc}"  required="true" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="djsj" name="zdryBean.djsj" value="${zdryBean.djsj}" required="true" readOnly="true"></cps:date>
				</cps:tdContent>
			</c:if>
		</cps:row>
		--%>
	</cps:table>
</creator:panel>

<%-- 
<creator:panel id="zdrylgxx" title="列撤管信息">
	<div style="width: 100%">
		<fieldset>
			<legend>列管信息</legend>
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%">列管状态：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:select id="lgzt" name="zdryBean.lgzt" zdlb="ZDY_LGZT" value="${zdryBean.lgzt}" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">列管来源：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:select id="lgly" name="zdryBean.lgly" zdlb="ZDRYLGLY" value="${zdryBean.lgly}" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent >
						<cps:tdLabel width="10%">列管时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="lgrq" name="zdryBean.lgrq" dateFmt="yyyy-MM-dd" value="${zdryBean.lgrq}"  ></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row >
						<cps:tdLabel rowspan="2" colspan="1">列管原因：</cps:tdLabel>
						<cps:tdContent colspan="5" rowspan="2">
							<s:textarea id="lgyy" name="zdryBean.lgyy"   cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[250]]" ></s:textarea>
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</fieldset>
	</div>
	<div style="width: 100%">
		<fieldset>
			<legend>撤管信息</legend>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%">撤管时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:date id="cgrq" name="zdryBean.cgrq" dateFmt="yyyy-MM-dd" value="${zdryBean.cgrq}"  ></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
					<cps:tdContent width="25%">&nbsp;</cps:tdContent>
					<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel rowspan="2">撤管原因：</cps:tdLabel>
					<cps:tdContent colspan="5" rowspan="2">
						<s:textarea id="cgly" name="zdryBean.cgly"   cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[250]]" ></s:textarea>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
	</div>
</creator:panel>
--%>
