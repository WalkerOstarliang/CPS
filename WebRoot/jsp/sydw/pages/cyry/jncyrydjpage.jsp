<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="从业人员登记查询">
	<creator:Script src="/jsp/sydw/js/cyrydjpage.js"></creator:Script>
	<form id="cyrydjform" method="post">
	<cps:PanelView>
		<cps:tbar>
			<cps:button id="savebtn" value="保存" onclick="saveJnrkCyryInfo()"></cps:button>
			<cps:button value="重置" type="reset"></cps:button>
			<cps:button value="关闭" onclick="window.close()"></cps:button>
		</cps:tbar>
		<c:if test="${not empty cyryBean.zdrylbmc}">
			<c:set var="title" value="(${cyryBean.zdrylbmc})"></c:set>
		</c:if>
		
		<cps:panel title="人员基本信息<span style='color:red'>${title}</span>" scroll="false">
			<input type="hidden" id="rybh" name="jbxxBean.rybh" value="${jbxxBean.rybh}" />
			<input type="hidden" id="sfzdry" value="${cyryBean.sfZdry}" />
			<cps:table id="rkjbxxtable">
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>身份证号：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:textfield id="sfzh" name="jbxxBean.sfzh" value="${jbxxBean.sfzh}" isSfzh="true" readonly="true" required="true"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel width="10%"><font color="red">*</font>姓名：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:textfield id="xm" name="jbxxBean.xm" value="${jbxxBean.xm}" required="true" readonly="true" maxlength="15"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel width="10%">性别：</cps:tdLabel>
					<cps:tdContent width="18%">
						<input type="hidden" id="xb_hidden" name="jbxxBean.xb" value="${jbxxBean.xb}"/>
						<cps:select zdlb="GB_XB" id="xb" name="jbxxBean.xbms" value="${jbxxBean.xb}" disabled="true" headerKey=""  headerValue=" " onchange="xb_hidden.value=this.value"></cps:select>
					</cps:tdContent>
					
					<cps:tdLabel rowspan="6">
						<div>
							<div style="text-align: center;">
								<s:if test="jbxxBean.sfzh == '' or jbxxBean.sfzh == null">
									<img id="rkzpxx" src="<c:url value='/template/default/images/default_zp.png'/>" width="120px" height="130px" title="暂无照片" alt="暂无照片"/>
								</s:if>
								<s:else>
									<img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${jbxxBean.sfzh}" width="120px" height="130px" title="全国人口库照片" alt="全国人口库照片"/>
								</s:else>
							</div>
						</div> 
					</cps:tdLabel>
				</cps:row>
				<cps:row>
					<cps:tdLabel>出生日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="csrq" name="jbxxBean.csrq" value="${jbxxBean.csrq}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>民族：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="mz_hidden" name="jbxxBean.mz" value="${jbxxBean.mz}"/>
						<cps:select zdlb="GB_MZ" id="mz" name="jbxxBean.mzms" value="${jbxxBean.mz}" headerKey="" headerValue=" " disabled="true" onchange="mz_hidden.value=this.value"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>婚姻状况：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="AF_HYZK" id="hyzk" name="jbxxBean.hyzk" value="${jbxxBean.hyzk}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">别名/绰号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="bmch" name="jbxxBean.bmch" value="${jbxxBean.bmch}" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>兵役状况：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_BYZK" id="byzk" name="jbxxBean.byzk" value="${jbxxBean.byzk}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel>文化程度：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_WHCD" id="whcd" name="jbxxBean.whcd" value="${jbxxBean.whcd}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>政治面貌：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_ZZMM" id="zzmm" name="jbxxBean.zzmm" value="${jbxxBean.zzmm}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel>宗教信仰：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZJXY" id="zzxy" name="jbxxBean.zzxy" value="${jbxxBean.zzxy}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel>血型：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_XX" id="xx" name="jbxxBean.xx" value="${jbxxBean.xx}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>身高(㎝)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sg" inputType="number" name="jbxxBean.sg" value="${jbxxBean.sg}" maxlength="3"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel><font color="red" id="lxdh_tag">*</font>联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="lxdh" name="jbxxBean.lxdh" value="${jbxxBean.lxdh != null ? jbxxBean.lxdh : cyryBean.sjhm }" maxlength="20" minlength="7" isPhone="true" required="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>电话备注：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="lxdhbz" name="jbxxBean.lxdhbz" value="${jbxxBean.lxdhbz}" maxlength="50" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>身份：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GA_SF" id="sf" name="jbxxBean.sf" value="${jbxxBean.sf}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					
					<cps:tdLabel>职业：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="zydm" zdlb="ZAGL_RY_ZY" name="jbxxBean.zydm" value="${jbxxBean.zydm}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					
					<cps:tdLabel>服务处所：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="fwcs" name="jbxxBean.fwcs" value="${jbxxBean.fwcs}" maxlength="60"></cps:textfield>
					</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdLabel>户籍地区划：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="hjdqh" name="jbxxBean.hjdqh" value="${jbxxBean.hjdqh}">
						<cps:textfield id="hjdqhmc" name="jbxxBean.hjdqhmc" value="${jbxxBean.hjdqhmc}" readonly="true"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel>户籍责任区：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="ssgajgjgdm" name="jbxxBean.ssgajgjgdm" value="${jbxxBean.ssgajgjgdm}">
						<input type="hidden" id="ssgajgjgmc" name="jbxxBean.ssgajgjgmc" value="${jbxxBean.ssgajgjgmc}">
						<input type="hidden" id="sspcsdm" name="jbxxBean.sspcsdm" value="${jbxxBean.sspcsdm}">
						<cps:textfield id="sspcsmc" name="jbxxBean.sspcsmc" value="${jbxxBean.sspcsmc}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>户籍地详址：</cps:tdLabel>
					<cps:tdContent colspan="2">
						<cps:textfield id="hjdxz" name="jbxxBean.hjdxz" value="${jbxxBean.hjdxz}" readonly="true" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">现住区划：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="xzzzrq"  name="jbxxBean.xzzzrq" value="${jbxxBean.xzzzrq}"/>
						<input type="hidden" id="xzzqh"  name="jbxxBean.xzzqh" value="${jbxxBean.xzzqh}"/>
						<cps:textfield id="xzzqhmc" name="jbxxBean.xzzqhmc" value="${jbxxBean.xzzqhmc}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">现住地址：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield id="xzzxz" name="jbxxBean.xzzxz" value="${jbxxBean.xzzxz}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>出生地：</cps:tdLabel>
					<cps:tdContent colspan="2">
						<input type="hidden" name="jbxxBean.csd" value="${jbxxBean.csd}">
						<cps:textfield id="xzzxz" name="jbxxBean.csdms" value="${jbxxBean.csdms}" readonly="true" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:panel>
	</cps:PanelView>
		<creator:panel id="cyryinfopanel" title="从业人员信息">
			<input type="hidden" name="cyryBean.cyrybh" id="cyrybh" value="${ cyryBean.cyrybh}" />
			<input type="hidden" name="cyryBean.rybh" value="${jbxxBean.rybh}" id="cyry_rybh" />
			<input type="hidden" name="cyryBean.jgbh" value="${cyryBean.jgbh}" id="cyry_jgbh" />
			<input type="hidden" name="cyryBean.sfjwry" value="0" id="sfcyry" />
			<input type="hidden" id="xzdjwq" name="cyryBean.xzdjwq" value="${cyryBean.xzdjwq}">
			<input type="hidden" id="xzdjwqmc" name="cyryBean.xzdjwqmc" value="${cyryBean.xzdjwqmc}" />
			<input type="hidden" id="jzdsqdm" name="cyryBean.jzdsqdm" value="${cyryBean.jzdsqdm}">
			<cps:table>
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>居住地派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty cyryBean.pfsj}">
								<input type="hidden" id="jzdpcsdm" name="cyryBean.jzdpcsdm" value="${cyryBean.jzdpcsdm}" />
								<cps:textfield id="jzdpcsmc" name="cyryBean.jzdpcsmc" value="${cyryBean.jzdpcsmc}" readonly="true" appendPopuBtn="true" onclick="orgSelect('${loginInfo.orgcode}','jzdpcsdm','jzdpcsmc')" required="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" id="jzdpcsdm" name="cyryBean.jzdpcsdm" value="${cyryBean.jzdpcsdm}" />
								<cps:textfield id="jzdpcsmc" name="cyryBean.jzdpcsmc" value="${cyryBean.jzdpcsmc}" readonly="true" required="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>居住地社区：</cps:tdLabel>
					<cps:tdContent>
						 <c:choose>
							<c:when test="${empty cyryBean.pfsj}">
								<cps:textfield id="jzdsqmc" name="cyryBean.jzdsqmc" value="${cyryBean.jzdsqmc}" readonly="true"  appendPopuBtn="true" onclick="openSqxxSelectWin('xzdjwq','jzdsqdm','jzdsqmc','xzdjwqmc')"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jzdsqmc" name="cyryBean.jzdsqmc" value="${cyryBean.jzdsqmc}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel><font color='red'>*</font>居住地址：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xzdz" name="cyryBean.xzdz"  value="${cyryBean.xzdz}" required="true"  maxlength="100"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="11%"><font color="red">*</font>职务：</cps:tdLabel>
					<cps:tdContent width="23%">
						<cps:select zdlb="ZAGL_RY_ZW" headerKey="" headerValue=" " name="cyryBean.zw" id="zw" value="${cyryBean.zw}" required="true" />
					</cps:tdContent>
					<cps:tdLabel><font color="red" id="sjhm_tag">*</font>手机号码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.sjhm" id="sjhm" required="true" isPhone="true" minlength="7" value="${cyryBean.sjhm}" maxlength="15" />
					</cps:tdContent>
					<cps:tdLabel width="11%"> 所在部门： </cps:tdLabel>
					 <cps:tdContent width="22%">
						<cps:textfield name="cyryBean.bmmc" id="bmmc" maxlength="30" value="${cyryBean.bmmc}"  />
					 </cps:tdContent>
				</cps:row>
			
				<cps:row>
					<cps:tdLabel>聘用期限(年)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.pynx" id="pynx" value="${cyryBean.pynx}" maxlength="2" inputType="integer" />
					</cps:tdContent>
					<cps:tdLabel>其他联系方式：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.qtlxdh" id="qtlxdh" value="${cyryBean.qtlxdh}" maxlength="20" />
					</cps:tdContent>
					<cps:tdLabel>奖惩情况：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield name="cyryBean.jcqk" id="jcqk" value="${cyryBean.jcqk}" maxlength="150"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>政审情况：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.zsqk" id="zsqk" value="${cyryBean.zsqk}" maxlength="25" />
					</cps:tdContent>
					<cps:tdLabel>员工号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.cyryygh" id="cyryygh" value="${cyryBean.cyryygh}" inputType="onlychar" maxlength="20" />
					</cps:tdContent>
					<cps:tdLabel>入职时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="rzsj" name="cyryBean.rzsj" value="${cyryBean.rzsj}" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					 <cps:tdLabel>离职时间：</cps:tdLabel>
					 <cps:tdContent>
					 	<cps:date id="lzsj" name="cyryBean.lzsj" value="${cyryBean.lzsj}" dateFmt="yyyy-MM-dd"></cps:date>
					 </cps:tdContent>
					<cps:tdLabel>工资来源：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.gzly" id="gzly" value="${cyryBean.gzly}" cssClass="validate[maxSize[25]]" />
					</cps:tdContent>
					<cps:tdLabel>保卫措施：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.bwcs" value="${cyryBean.bwcs}" id="bwcs" maxlength="15"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>培训证书：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.pxzs" id="pxzs" inputType="onlychar" value="${cyryBean.pxzs}" maxlength="25" />
					</cps:tdContent>
					<cps:tdLabel>培训证号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.pxzh" id="pxzh" value="${cyryBean.pxzh}" inputType="onlychar" maxlength="20" />
					</cps:tdContent>
					<cps:tdLabel>服务对象：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.zdfwdxlb" value="${cyryBean.pxzh}" id="fwdx" maxlength="25"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>控制措施：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.kzcs" value="${cyryBean.kzcs}" id="kzcs" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>主要贡献：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.zygx" value="${cyryBean.zygx}" id="zygx" maxlength="15"></cps:textfield>
					</cps:tdContent>
			
					<cps:tdLabel>主要问题：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="cyryBean.zywt" value="${cyryBean.zywt}" id="zywt" maxlength="15"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5" width="15%">
						<cps:textfield name="cyryBean.bz" id="bz" maxlength="250" cssStyle="width:96%;" value="${cyryBean.bz}"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>注销标识：</cps:tdLabel>
					<cps:tdContent >
						<s:select list="#{'0':'正常','1':'注销'}" name="cyryBean.zxbs" id="zxbs" value="cyryBean.zxbs" cssClass="cps-select" onchange="zxChange(this.value)"/>
					</cps:tdContent>
					<cps:tdLabel>注销日期：</cps:tdLabel>
					<cps:tdContent >
						<cps:date dateFmt="yyyy-MM-dd" name="cyryBean.zxrq" id="zxrq" value="${cyryBean.zxrq}"  disabled="true"/>
					</cps:tdContent>
					<cps:tdLabel>注销原因</cps:tdLabel>
					<cps:tdContent>
						<s:select list="#{'离职':'离职','解雇':'解雇','请辞':'请辞'}" disabled="true" id="zxyy" name="cyryBean.zxyy" headerKey="" headerValue="--请选择--" cssClass="cps-select"></s:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>登记人姓名：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield name="cyryBean.djrxm" value="${cyryBean.djrxm!=null?cyryBean.djrxm : loginInfo.realname}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.djsj" value="${cyryBean.djsj!=null ? cyryBean.djsj : currentSystemDate}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.djdwmc" value="${cyryBean.djdwmc ? cyryBean.djdwmc : loginInfo.orgname}"></cps:textfield>
						<input type="hidden" name="cyryBean.djdwdm" value="${cyryBean.djdwdm ? cyryBean.djdwdm : loginInfo.orgcode}" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6">
						<font color="red">
							注意：请认真填写居住地派出所、居住地社区、居住地详址，居住地派出所与居住地社区保存完成后，将不能再进行修改。
						</font>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
	</form>
</creator:view>