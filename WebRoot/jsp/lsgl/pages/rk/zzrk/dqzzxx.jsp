<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="dqzzxx">
	<input type="hidden" id="zzbh" name="rkBean.ldrkBean.zzbh" value="${rkBean.ldrkBean.zzbh}">
	<fieldset>
		<legend>居住信息</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>居住地址：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<input type="hidden" id="fwid"  name="rkBean.fwxxBean.fwid" value="${rkBean.fwxxBean.fwid}"/>
					<input type="hidden" id="dzid"  name="rkBean.fwxxBean.dzid" value="${rkBean.fwxxBean.dzid}"/>
					<input type="hidden" id="sssq"  name="rkBean.fwxxBean.sssq" value="${rkBean.fwxxBean.sssq}"/>
					<input type="hidden" id="ssxzqh" name="rkBean.fwxxBean.ssxzqh" value="${rkBean.fwxxBean.ssxzqh}"/>
					<input type="hidden" id="sszrdwdm" name="rkBean.fwxxBean.sszrdwdm" value="${rkBean.fwxxBean.sszrdwdm}"/>
					<input type="hidden" id="rkfwglid" name="rkBean.ldrkBean.rkfwglid" value="${rkBean.ldrkBean.rkfwglid}"/>
					 <%--
					<cps:textfield id="dzmc" name="rkBean.fwxxBean.dzmc" value="${rkBean.fwxxBean.dzmc}" required="true" cssStyle="width:94%" readonly="true" onclick="openSelectFwWin(updateSelectFwCallback,'select','2')" appendPopuBtn="true"></cps:textfield>
					--%>
					<cps:textfield id="dzmc" name="rkBean.fwxxBean.dzmc" value="${rkBean.fwxxBean.dzmc}" required="true" cssStyle="width:94%" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>来本地时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="lbdrq" name="rkBean.ldrkBean.lbdrq" value="${rkBean.ldrkBean.lbdrq}" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}" required="true"></cps:date>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>房主证件号码：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fzsfzh" name="rkBean.ldrkBean.fzsfzh" onblur="queryRkBean(this.value,callbackSetFzInfo)" value="${rkBean.fwxxBean.hzsfzh}" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>房主姓名：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fzxm" name="rkBean.ldrkBean.fzxm" value="${rkBean.fwxxBean.hzxm}" maxlength="15" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>与房主关系：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="yhzgx" name="rkBean.ldrkBean.yhzgx" value="${rkBean.ldrkBean.yhzgx}" enableEdit="true" zdlb="ZDY_LDRK_YHZGX" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel><font color="red">*</font>居住处所：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="GA_ZZCS" id="zzcs" name="rkBean.ldrkBean.zzcs" value="${rkBean.ldrkBean.zzcs}"  headerKey="" headerValue=" " required="true" enableEdit="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>暂住事由：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_ZZSY" id="zzsy" name="rkBean.ldrkBean.zzsy" enableEdit="true" value="${rkBean.ldrkBean.zzsy}" headerKey="" headerValue=" " required="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>拟居期限：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_NJZQX" id="njzqx" name="rkBean.ldrkBean.njzqx" enableEdit="true" value="${rkBean.ldrkBean.njzqx}" required="true" headerKey="" headerValue=" " onchange="getYxDate(this.value);"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>户籍地类型：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_HJDLX" id="hjdlx" name="rkBean.ldrkBean.hjdlx" enableEdit="true" value="${rkBean.ldrkBean.hjdlx}" required="true" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>函调情况：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_HDQK" id="hdqk" name="rkBean.ldrkBean.hdqk" enableEdit="true" value="${rkBean.ldrkBean.hdqk}"  headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>拟居住日期：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="njzrq" name="rkBean.ldrkBean.njzrq" value="${rkBean.ldrkBean.njzrq}"  readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>现从事职业：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZAGL_RY_ZY" id="xcszy" name="rkBean.ldrkBean.xcszy" enableEdit="true" value="${rkBean.ldrkBean.xcszy}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>服务处所：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="xfwcs" name="rkBean.ldrkBean.xfwcs" value="${rkBean.ldrkBean.xfwcs}"  maxlength="50"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>部门职务：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="bmzw" name="rkBean.ldrkBean.bmzw" value="${rkBean.ldrkBean.bmzw}" maxlength="25"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			
			<cps:row>
				<cps:tdLabel>是否综合保险：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_ZDSF" id="sfzhbx" name="rkBean.ldrkBean.sfzhbx" enableEdit="true" value="${rkBean.ldrkBean.sfzhbx}"  headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>健康证明：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_ZDSF" id="sfjkzm" name="rkBean.ldrkBean.sfjkzm" enableEdit="true" value="${rkBean.ldrkBean.sfjkzm}"  headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>计划生育证明：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_ZDSF" id="sfjhsy" name="rkBean.ldrkBean.sfjhsy" enableEdit="true" value="${rkBean.ldrkBean.sfjhsy}"  headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>责任人身份证号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zaglzrrsfzh" name="rkBean.ldrkBean.zaglzrrsfzh" onblur="queryRkBean(this.value,callbackSetZazrrInfo)" value="${rkBean.ldrkBean.zaglzrrsfzh}" isSfzh="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>治安责任人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zaglzrrxm" name="rkBean.ldrkBean.zaglzrrxm" value="${rkBean.ldrkBean.zaglzrrxm}" maxlength="15"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>工作关系：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_GZGX" id="gzgx" name="rkBean.ldrkBean.gzgx" enableEdit="true" value="${rkBean.ldrkBean.gzgx}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<%--
			<cps:row>
				<cps:tdLabel>暂住证编号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zzzbh" name="rkBean.ldrkBean.zzzbh" value="${rkBean.ldrkBean.zzzbh}" maxlength="50"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>签发日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="zzzqfrq" name="rkBean.ldrkBean.zzzqfrq" value="${rkBean.ldrkBean.zzzqfrq}" dateFmt="yyyy-MM-dd" ></cps:date>
				</cps:tdContent>
				<cps:tdLabel>有效期至：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zzzyxqjzrq" readonly="true" name="rkBean.ldrkBean.zzzyxqjzrq" value="${rkBean.ldrkBean.zzzyxqjzrq}"  ></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>流动人口类别：</cps:tdLabel>
				<cps:tdContent >
					<cps:select zdlb="ZDY_JZZDYZT" id="ldrklb" name="rkBean.ldrkBean.ldrklb" value="${rkBean.ldrkBean.ldrklb}" headerKey="" headerValue=" "  disabled="true" enableEdit="true"></cps:select>
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
					<cps:textfield type="textarea" id="bz" name="rkBean.ldrkBean.bz" value="${rkBean.ldrkBean.bz}" cssStyle="width:98%;height:50px" maxlength="240"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<%-- 
			<cps:row>
				<cps:tdLabel>暂住地区划：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="zzdqh" name="rkBean.ldrkBean.zzdqh" value="${rkBean.ldrkBean.zzdqh}">
					<cps:textfield id="zzdqhms" name="rkBean.ldrkBean.zzdqhms" value="${rkBean.ldrkBean.zzdqhms}" readonly="true"></cps:textfield>
					<cps:button value="选择" onclick="openSelectXzqh('430000',callbackZzdqh)"></cps:button>
				</cps:tdContent>
				<cps:tdLabel>暂住地详址：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield id="zzdxz" name="rkBean.ldrkBean.zzdxz" value="${rkBean.ldrkBean.zzdxz}"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel><font color="red">*</font>所属公安机关：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="ssgajgjgdm" name="rkBean.ldrkBean.ssgajgjgdm" value="${loginInfo.ssgajgjgdm}"/>
					<cps:textfield id="ssgajgjgmc" name="rkBean.ldrkBean.ssgajgjgmc" required="true" readonly="true" value="${loginInfo.ssgajgjgmc}" ondblclick="openRkDwSelect('430000000000',callbackSsgajgjg)"></cps:textfield>
					<cps:button value="选择" onclick="openRkDwSelect('430000000000',callbackSsgajgjg)"></cps:button>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>所属派出所：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<input type="hidden" id="sspcsdm" name="rkBean.ldrkBean.sspcsdm" value="${loginInfo.pcsdm }">
					<cps:textfield id="sspcsmc" name="rkBean.ldrkBean.sspcsmc" required="true" value="${loginInfo.pcsmc}" readonly="true" ondblclick="openRkPcsDwSelect(callbackSspcs)"></cps:textfield>
					<cps:button value="选择" onclick="openRkPcsDwSelect(callbackSspcs)"></cps:button>
				</cps:tdContent>
			</cps:row>
			--%>
			<cps:row>
				<cps:tdLabel  width="12%">注销标识：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="zxbs" zdlb="ZDY_ZXBS"  name="rkBean.ldrkBean.zxbs" value="${rkBean.ldrkBean.zxbs}"  disabled="true" enableEdit="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="12%">注销时间：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:date id="zxsj" disabled="true" name="rkBean.ldrkBean.zxsj" value="${rkBean.ldrkBean.zxsj}" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}"></cps:date>
				</cps:tdContent>
				<cps:tdLabel width="12%">注销原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:select disabled="true" zdlb="ZDY_ZXYY" id="zxyy" name="rkBean.ldrkBean.zxyy" value="${rkBean.ldrkBean.zxyy}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</fieldset>
</div>
<div id="jhsydiv" style="display: none">
	<fieldset>
		<legend>计划生育</legend>
		<input id="id" name="rkBean.jhsyBean.id" value="${rkBean.jhsyBean.id }"
				type="hidden">
			<input id="rybh" name="rkBean.jhsyBean.rybh" value="${rkBean.jbxxBean.rybh }"
				type="hidden">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%">记录编号：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="jlbh" name="rkBean.jhsyBean.jlbh"
							value="${rkBean.jhsyBean.jlbh}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">计划生育孕情：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:select id="jhsyyq" name="rkBean.jhsyBean.jhsyyq"
							value="${rkBean.jhsyBean.jhsyyq}" zdlb="ZDY_JHSYYQ" headerKey=""
							headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%" id="jszhmLabel">
						计生证号码：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield id="jszhm" name="rkBean.jhsyBean.jszhm"
							value="${rkBean.jhsyBean.jszhm}"  maxlength="16"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>发证日期：</cps:tdLabel>
					<cps:tdContent >
						<cps:date id="fzrq" name="rkBean.jhsyBean.fzrq" value="${rkBean.jhsyBean.fzrq}" maxDate="${currentSystemDate}"></cps:date>
					</cps:tdContent>
					<cps:tdLabel >子女情况：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="znqk" name="rkBean.jhsyBean.znqk"
							value="${rkBean.jhsyBean.znqk}" zdlb="ZDY_ZDSF" headerKey=""
							headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel >避孕节育措施：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="byjycs" name="rkBean.jhsyBean.byjycs"
							value="${rkBean.jhsyBean.byjycs}" zdlb="ZDY_BYJYCS" headerKey=""
							headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				<%--
				<cps:row>
					<cps:tdLabel width="10%">登记人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input id="djrjh" name="jhsyBean.djrjh" value="${jhsyBean.djrjh}"
							type="hidden">
						<cps:textfield id="djrxm" name="jhsyBean.djrxm"
							value="${jhsyBean.djrxm}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input id="djdwdm" name="jhsyBean.djdwdm"
							value="${jhsyBean.djdwdm }" type="hidden">
						<cps:textfield id="djdwmc" name="jhsyBean.djdwmc"
							value="${jhsyBean.djdwmc}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="djsj" name="jhsyBean.djsj"
							value="${jhsyBean.djsj}"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				--%>
			</cps:table>
	</fieldset>
</div>

<div id="djdwdmdiv">
	<fieldset>
		<legend>责任/登记单位信息</legend>	
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%">责任民警：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty rkBean.ldrkBean.zrmjjh}">
							<input type="hidden" id="zrmjjh" name="rkBean.ldrkBean.zrmjjh" value="${loginInfo.username }">
							<cps:textfield appendPopuBtn="true" onclick="selectZrmjWin('${loginInfo.rootOrgCode}')" id="zrmjxm" name="rkBean.ldrkBean.zrmjxm" value="${loginInfo.realname}" ondblclick="selectZrmjWin('${loginInfo.rootOrgCode}')" readonly="true" required="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrmjjh" name="rkBean.ldrkBean.zrmjjh" value="${rkBean.ldrkBean.zrmjjh }">
							<cps:textfield appendPopuBtn="true" onclick="selectZrmjWin('${loginInfo.rootOrgCode}')" id="zrmjxm" name="rkBean.ldrkBean.zrmjxm" value="${rkBean.ldrkBean.zrmjxm}" ondblclick="selectZrmjWin()" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">责任单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty rkBean.ldrkBean.zrdwdm}">
							<input type="hidden" id="zrdwdm" name="rkBean.ldrkBean.zrdwdm" value="${loginInfo.orgcode }"/>
							<cps:textfield id="zrdwmc" name="rkBean.ldrkBean.zrdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrdwdm" name="rkBean.ldrkBean.zrdwdm" value="${rkBean.ldrkBean.zrdwdm }">
							<cps:textfield id="zrdwmc" name="rkBean.ldrkBean.zrdwmc" value="${rkBean.ldrkBean.zrdwmc}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="12%">联系电话：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.ldrkBean.zrmjlxdh}">
							<cps:textfield id="zrmjlxdh" name="rkBean.ldrkBean.zrmjlxdh" value="${loginInfo.moblie}" maxlength="20" isPhone="true" minlength="7"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="zrmjlxdh" name="rkBean.ldrkBean.zrmjlxdh" value="${rkBean.ldrkBean.zrmjlxdh}" maxlength="20" isPhone="true" minlength="7"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			<c:if test="${operType == 'add'  || operType == ''}">
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djrxm" name="rkBean.ldrkBean.djrxm" value="${loginInfo.realname}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="djdwdm" name="rkBean.ldrkBean.djdwdm" value="${loginInfo.orgcode }">
						<cps:textfield id="djdwmc" name="rkBean.ldrkBean.djdwmc" value="${loginInfo.orgname}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="djsj" name="rkBean.ldrkBean.djsj" defaultSystemDate="true" dateFmt="yyyy-MM-dd HH:mm:ss" readOnly="true" maxDate="${currentSystemDate}" ></cps:date>
					</cps:tdContent>
				</cps:row>
			</c:if>
			<c:if test="${operType != 'add' && operType != ''}">
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty rkBean.ldrkBean.djrxm}">
								<cps:textfield id="djrxm" name="rkBean.ldrkBean.djrxm" value="${loginInfo.realname}"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="djrxm" name="rkBean.ldrkBean.djrxm" value="${rkBean.ldrkBean.djrxm}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty rkBean.ldrkBean.djdwdm}">
								<input type="hidden" name="rkBean.ldrkBean.djdwdm" value="${loginInfo.orgcode }">
								<cps:textfield id="djdwmc" name="rkBean.ldrkBean.djdwmc" value="${loginInfo.orgname}"></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="rkBean.ldrkBean.djdwdm" value="${rkBean.ldrkBean.djdwdm}">
								<cps:textfield id="djdwmc" name="rkBean.ldrkBean.djdwmc" value="${rkBean.ldrkBean.djdwmc}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty rkBean.ldrkBean.djsj}">
								<cps:date id="djsj" name="rkBean.ldrkBean.djsj" defaultSystemDate="true" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}"></cps:date>
							</c:when>
							<c:otherwise>
								<cps:date id="djsj" name="rkBean.ldrkBean.djsj" value="${rkBean.ldrkBean.djsj}" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</c:if>
		</cps:table>
	</fieldset>
</div>