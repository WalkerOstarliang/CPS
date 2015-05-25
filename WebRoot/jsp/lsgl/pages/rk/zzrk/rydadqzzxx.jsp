<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="dqzzxx">
	<input type="hidden" id="zzbh" name="rkBean.ldrkzzxxBeans[0].zzbh" value="${rkBean.ldrkzzxxBeans[0].zzbh}">
	<fieldset>
		<legend>居住信息</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>居住地址：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield id="dzmc" name="rkBean.ldrkzzxxBeans[0].dzmc" value="${rkBean.ldrkzzxxBeans[0].dzmc}" required="true" cssStyle="width:94%" readonly="true" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>来本地时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="lbdrq" name="rkBean.ldrkzzxxBeans[0].lbdrq" value="${rkBean.ldrkzzxxBeans[0].lbdrq}" dateFmt="yyyy-MM-dd"></cps:date>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>房主身份证号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fzsfzh" name="rkBean.ldrkzzxxBeans[0].fzsfzh" onblur="queryRkBean(this.value,callbackSetFzInfo)" value="${rkBean.ldrkzzxxBeans[0].fzsfzh}" isSfzh="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>房主姓名：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fzxm" name="rkBean.ldrkzzxxBeans[0]s[0].fzxm" value="${rkBean.ldrkzzxxBeans[0].fzxm}" maxlength="15" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>与房主关系：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="yhzgx" name="rkBean.ldrkzzxxBeans[0].yhzgx" value="${rkBean.ldrkzzxxBeans[0].yhzgx}" zdlb="ZDY_LDRK_YHZGX" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel><font color="red">*</font>居住处所：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="GA_ZZCS" id="zzcs" name="rkBean.ldrkzzxxBeans[0].zzcs" value="${rkBean.ldrkzzxxBeans[0].zzcs}" headerKey="" headerValue=" " required="true" ></cps:select>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>暂住事由：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_ZZSY" id="zzsy" name="rkBean.ldrkzzxxBeans[0].zzsy" value="${rkBean.ldrkzzxxBeans[0].zzsy}" headerKey="" headerValue=" " required="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>部门职务：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="bmzw" name="rkBean.ldrkzzxxBeans[0].bmzw" value="${rkBean.ldrkzzxxBeans[0].bmzw}" maxlength="25"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>现从事职业：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZAGL_RY_ZY" id="xcszy" name="rkBean.ldrkzzxxBeans[0].xcszy" value="${rkBean.ldrkzzxxBeans[0].xcszy}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>服务处所：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="xfwcs" name="rkBean.ldrkzzxxBeans[0].xfwcs" value="${rkBean.ldrkzzxxBeans[0].xfwcs}"  maxlength="50"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>拟居期限：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_NJZQX" id="njzqx" name="rkBean.ldrkzzxxBeans[0].njzqx" value="${rkBean.ldrkzzxxBeans[0].njzqx}" required="true" headerKey="" headerValue=" " onchange="getYxDate(this.value);"></cps:select>
				</cps:tdContent>
				
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>户籍地类型：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_HJDLX" id="hjdlx" name="rkBean.ldrkzzxxBeans[0].hjdlx" value="${rkBean.ldrkzzxxBeans[0].hjdlx}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>函调情况：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_HDQK" id="hdqk" name="rkBean.ldrkzzxxBeans[0].hdqk" value="${rkBean.ldrkzzxxBeans[0].hdqk}"  headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>拟居住日期：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="njzrq" name="rkBean.ldrkzzxxBeans[0].njzrq" value="${rkBean.ldrkzzxxBeans[0].njzrq}"  readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>是否综合保险：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_ZDSF" id="sfzhbx" name="rkBean.ldrkzzxxBeans[0].sfzhbx" value="${rkBean.ldrkzzxxBeans[0].sfzhbx}"  headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>健康证明：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_ZDSF" id="sfjkzm" name="rkBean.ldrkzzxxBeans[0].sfjkzm" value="${rkBean.ldrkzzxxBeans[0].sfjkzm}"  headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>计划生育证明：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_ZDSF" id="sfjhsy" name="rkBean.ldrkzzxxBeans[0].sfjhsy" value="${rkBean.ldrkzzxxBeans[0].sfjhsy}"  headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>责任人身份证号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zaglzrrsfzh" name="rkBean.ldrkzzxxBeans[0].zaglzrrsfzh" onblur="queryRkBean(this.value,callbackSetZazrrInfo)" value="${rkBean.ldrkzzxxBeans[0].zaglzrrsfzh}" isSfzh="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>治安责任人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zaglzrrxm" name="rkBean.ldrkzzxxBeans[0].zaglzrrxm" value="${rkBean.ldrkzzxxBeans[0].zaglzrrxm}" maxlength="15"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>工作关系：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_GZGX" id="gzgx" name="rkBean.ldrkzzxxBeans[0].gzgx" value="${rkBean.ldrkzzxxBeans[0].gzgx}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<%--
			<cps:row>
				<cps:tdLabel>暂住证编号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zzzbh" name="rkBean.ldrkzzxxBeans[0].zzzbh" value="${rkBean.ldrkzzxxBeans[0].zzzbh}" maxlength="50"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>签发日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="zzzqfrq" name="rkBean.ldrkzzxxBeans[0].zzzqfrq" value="${rkBean.ldrkzzxxBeans[0].zzzqfrq}" dateFmt="yyyy-MM-dd" ></cps:date>
				</cps:tdContent>
				<cps:tdLabel>有效期至：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zzzyxqjzrq" readonly="true" name="rkBean.ldrkzzxxBeans[0].zzzyxqjzrq" value="${rkBean.ldrkzzxxBeans[0].zzzyxqjzrq}"  ></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>流动人口类别：</cps:tdLabel>
				<cps:tdContent >
					<cps:select zdlb="ZDY_JZZDYZT" id="ldrklb" name="rkBean.ldrkzzxxBeans[0].ldrklb" value="${rkBean.ldrkzzxxBeans[0].ldrklb}" headerKey="" headerValue=" "  disabled="true" enableEdit="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent >
					&nbsp;				
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent >
					&nbsp;				
				</cps:tdContent>
			</cps:row>
			--%>
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" id="bz" name="rkBean.ldrkzzxxBeans[0].bz" value="${rkBean.ldrkzzxxBeans[0].bz}" cssStyle="width:94%;height:50px" maxlength="240"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<%-- 
			<cps:row>
				<cps:tdLabel>暂住地区划：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="zzdqh" name="rkBean.ldrkzzxxBeans[0].zzdqh" value="${rkBean.ldrkzzxxBeans[0].zzdqh}">
					<cps:textfield id="zzdqhms" name="rkBean.ldrkzzxxBeans[0].zzdqhms" value="${rkBean.ldrkzzxxBeans[0].zzdqhms}" readonly="true"></cps:textfield>
					<cps:button value="选择" onclick="openSelectXzqh('430000',callbackZzdqh)"></cps:button>
				</cps:tdContent>
				<cps:tdLabel>暂住地详址：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield id="zzdxz" name="rkBean.ldrkzzxxBeans[0].zzdxz" value="${rkBean.ldrkzzxxBeans[0].zzdxz}"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel><font color="red">*</font>所属公安机关：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="ssgajgjgdm" name="rkBean.ldrkzzxxBeans[0].ssgajgjgdm" value="${loginInfo.ssgajgjgdm}"/>
					<cps:textfield id="ssgajgjgmc" name="rkBean.ldrkzzxxBeans[0].ssgajgjgmc" required="true" readonly="true" value="${loginInfo.ssgajgjgmc}" ondblclick="openRkDwSelect('430000000000',callbackSsgajgjg)"></cps:textfield>
					<cps:button value="选择" onclick="openRkDwSelect('430000000000',callbackSsgajgjg)"></cps:button>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>所属派出所：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<input type="hidden" id="sspcsdm" name="rkBean.ldrkzzxxBeans[0].sspcsdm" value="${loginInfo.pcsdm }">
					<cps:textfield id="sspcsmc" name="rkBean.ldrkzzxxBeans[0].sspcsmc" required="true" value="${loginInfo.pcsmc}" readonly="true" ondblclick="openRkPcsDwSelect(callbackSspcs)"></cps:textfield>
					<cps:button value="选择" onclick="openRkPcsDwSelect(callbackSspcs)"></cps:button>
				</cps:tdContent>
			</cps:row>
			--%>
			<cps:row>
				<cps:tdLabel width="12%">责任民警：</cps:tdLabel>
				<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='add'}">
								<input type="hidden" id="zrmjjh" name="rkBean.ldrkzzxxBeans[0].zrmjjh" value="${loginInfo.username }">
								<cps:textfield appendPopuBtn="true" onclick="selectZrmjWin('${loginInfo.rootOrgCode}')" id="zrmjxm" name="rkBean.ldrkzzxxBeans[0].zrmjxm" value="${loginInfo.realname}" ondblclick="selectZrmjWin('${loginInfo.rootOrgCode}')" readonly="true" required="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" id="zrmjjh" name="rkBean.ldrkzzxxBeans[0].zrmjjh" value="${rkBean.ldrkzzxxBeans[0].zrmjjh }">
								<cps:textfield appendPopuBtn="true" onclick="selectZrmjWin('${loginInfo.rootOrgCode}')" id="zrmjxm" name="rkBean.ldrkzzxxBeans[0].zrmjxm" value="${rkBean.ldrkzzxxBeans[0].zrmjxm}" ondblclick="selectZrmjWin()" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">责任单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${operType=='add'}">
							<input type="hidden" id="zrdwdm" name="rkBean.ldrkzzxxBeans[0].zrdwdm" value="${loginInfo.orgcode }"/>
							<cps:textfield id="zrdwmc" name="rkBean.ldrkzzxxBeans[0].zrdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrdwdm" name="rkBean.ldrkzzxxBeans[0].zrdwdm" value="${rkBean.ldrkzzxxBeans[0].zrdwdm }">
							<cps:textfield id="zrdwmc" name="rkBean.ldrkzzxxBeans[0].zrdwmc" value="${rkBean.ldrkzzxxBeans[0].zrdwmc}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="12%">联系电话：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.ldrkzzxxBeans[0].zrmjlxdh}">
							<cps:textfield id="zrmjlxdh" name="rkBean.ldrkzzxxBeans[0].zrmjlxdh" value="${loginInfo.moblie}" maxlength="20" isPhone="true" minlength="7"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="zrmjlxdh" name="rkBean.ldrkzzxxBeans[0].zrmjlxdh" value="${rkBean.ldrkzzxxBeans[0].zrmjlxdh}" maxlength="20" isPhone="true" minlength="7"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>注销标识：</cps:tdLabel>
				<cps:tdContent >
					<s:select id="zxbs" list="#{'0':'正常','1' : '注销'}" name="rkBean.ldrkzzxxBeans[0].zxbs" cssClass="cps-select" onchange="changeZxbs(this.value)"/>
				</cps:tdContent>
				<cps:tdLabel>注销时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="zxsj" name="rkBean.ldrkzzxxBeans[0].zxsj" value="${rkBean.ldrkzzxxBeans[0].zxsj}" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>注销原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_ZXYY" id="zxyy" name="rkBean.ldrkzzxxBeans[0].zxyy" value="${rkBean.ldrkzzxxBeans[0].zxyy}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			<c:if test="${operType == 'add'  || operType == ''}">
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djrxm" name="rkBean.ldrkzzxxBeans[0].djrxm" value="${loginInfo.realname}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="djdwdm" name="rkBean.ldrkzzxxBeans[0].djdwdm" value="${loginInfo.orgcode }">
						<cps:textfield id="djdwmc" name="rkBean.ldrkzzxxBeans[0].djdwmc" value="${loginInfo.orgname}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="djsj" name="rkBean.ldrkzzxxBeans[0].djsj" defaultSystemDate="true" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
					</cps:tdContent>
				</cps:row>
			</c:if>
			<c:if test="${operType != 'add' && operType != ''}">
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djrxm" name="rkBean.ldrkzzxxBeans[0].djrxm" value="${rkBean.ldrkzzxxBeans[0].djrxm}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<s:hidden id="djdwdm" name="rkBean.ldrkzzxxBeans[0].djdwdm"></s:hidden>
						<cps:textfield id="djdwmc" name="rkBean.ldrkzzxxBeans[0].djdwmc" value="${rkBean.ldrkzzxxBeans[0].djdwmc}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="djsj" name="rkBean.ldrkzzxxBeans[0].djsj" value="${rkBean.ldrkzzxxBeans[0].djsj}" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
					</cps:tdContent>
				</cps:row>
			</c:if>
		</cps:table>
	</fieldset>
</div>
