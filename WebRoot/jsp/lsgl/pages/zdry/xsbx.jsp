<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/lsgl/js/newxsbx.js"></creator:Script>
	<creator:tbar id="tbar">
		<cps:button value="重置" onclick="resetXsbxForm()"></cps:button>
		<cps:button value="保存" onclick="submitFormXsbxInfo();"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow();"></cps:button>
	</creator:tbar>
	<creator:panel id="rkjbxx"  title="人员基本信息${xsbxBean.jlbh}" tbarId="tbar">
		<%@include file="/jsp/lsgl/pages/zdry/newrkjbxx.jsp"%>
	</creator:panel>
	<creator:panel id="xsbxPanel" title="在控信息登记">
		<cps:table id="xsbxxxtable">	
			<input type="hidden" id="xsbs_sfzh" name="xsbxBean.sfzh" value="${queryBean.sfzh}"/>
		    <input type="hidden" id="xsbs_jlbh" name="xsbxBean.jlbh" value="${xsbxBean.jlbh}"/>	
		    <input type="hidden" id="xsbs_rybh" name="xsbxBean.rybh" value="${queryBean.rybh }"/>
		    <input type="hidden" id="xsbs_zdrybh" name="xsbxBean.zdrybh" value="${zdryBean.zdrybh}"/>
			<cps:row id="clear_row1">
				<cps:tdLabel width="13%"><font color="red">*</font>在控状态：</cps:tdLabel>
				<cps:tdContent width="20%"> 
					<cps:select id="zkzt" name="xsbxBean.zkzt" zdlb="ZDRY_ZKZT" value="${xsbxBean.zkzt}" headerKey="" headerValue=" " required="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="13%"><font color='red'>*</font>联系方式：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield id="zdrylxfs" name="xsbxBean.zdrylxfs" value="${xsbxBean.zdrylxfs}" maxlength="30" isPhone="true" minlength="7" required="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="13%">联系方式备注：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="lxfsbz" name="xsbxBean.lxfsbz" value="${xsbxBean.lxfsbz}" maxlength="50"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>在原籍市内：</cps:tdLabel>
			  	<cps:tdContent>
					<cps:select id="zyjsnzt" name="xsbxBean.zyjsnzt" zdlb="GB_ZT" value="${xsbxBean.zyjsnzt}" headerKey="" headerValue=" " required="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>办案单位：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="badw" name="xsbxBean.badw" value="${xsbxBean.badw}" maxlength="60"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="13%"><font color="red">*</font>是否在押人员：</cps:tdLabel>
				<cps:tdContent  width="22%">
					<cps:select id="sfzyry" name="xsbxBean.sfzyry" zdlb="GB_ZT" value="${xsbxBean.sfzyry}" headerKey="" headerValue=" " required="true" onchange="changeGyry(this.value)"></cps:select>
				</cps:tdContent>
			</cps:row>	
			<cps:row id="row_gyry_1">
				<cps:tdLabel width="13%">关押起始时间：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:date dateFmt="yyyy-MM-dd" id="gzqssj" name="xsbxBean.gzqssj" maxDate="sysdate" value="${xsbxBean.gzqssj}"></cps:date>
				</cps:tdContent>
				<cps:tdLabel  width="13%">关押单位电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="badwdh" name="xsbxBean.badwdh" value="${xsbxBean.badwdh}" isPhone="true" minlength="7" maxlength="20" ></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel>关押地点：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="gydd" name="xsbxBean.gydd" value="${xsbxBean.gydd}" maxlength="60"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="row_gyry_2">
				<cps:tdLabel>关押原因：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="gyyy" name="xsbxBean.gyyy"  value="${xsbxBean.gyyy}" maxlength="190" cssStyle="width:96.5%;" ></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row3">
				<cps:tdLabel><font color="red">*</font>是否购置房产：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty xsbxBean.sfgzfc}">
							<cps:select id="sfgzfc" name="xsbxBean.sfgzfc" 
								zdlb="GB_ZT" value="0" 
								onchange="changeSfgzfc(this.value)"
								headerKey="" headerValue=" " required="true"></cps:select>
						</c:when>
						<c:otherwise>
							<cps:select id="sfgzfc" name="xsbxBean.sfgzfc" 
								zdlb="GB_ZT" value="${xsbxBean.sfgzfc}" 
								onchange="changeSfgzfc(this.value)"
								headerKey="" headerValue=" " required="true"></cps:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="12%" >离开本市时间：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:date dateFmt="yyyy-MM-dd" id="lkbssj" name="xsbxBean.lkbssj" maxDate="sysdate" value="${xsbxBean.lkbssj}"></cps:date>
				</cps:tdContent>
				<cps:tdLabel width="12%">去往省市：</cps:tdLabel>
				<cps:tdContent width="22%">
					<input type="hidden" id="qwbsqh" name="xsbxBean.qwbsqh" value="${xsbxBean.qwbsqh }">
					<cps:textfield appendPopuBtn="true" id="qwbsqhmc" name="xsbxBean.qwbsqhmc" value="${xsbxBean.qwbsqhmc }" readonly="true" onclick="openSelectXzqh('0',callbackHjdqhs)"></cps:textfield>
				</cps:tdContent>
			</cps:row>
				
			<cps:row id="clear_row4">
				<cps:tdLabel>长期有家不归：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty xsbxBean.sfcqyjbg}">
							<cps:select id="sfcqyjbg" name="xsbxBean.sfcqyjbg" zdlb="GB_ZT"  value="0"   headerKey="" headerValue=" " ></cps:select>
						</c:when>
						<c:otherwise>
							<cps:select id="sfcqyjbg" name="xsbxBean.sfcqyjbg" zdlb="GB_ZT"  value="${xsbxBean.sfcqyjbg }"   headerKey="" headerValue=" " ></cps:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				
				<cps:tdLabel>居住起始时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date dateFmt="yyyy-MM-dd" id="jzqssj" name="xsbxBean.jzqssj" maxDate="sysdate" value="${xsbxBean.jzqssj}"></cps:date>
					
				</cps:tdContent>
				<cps:tdLabel>住址详址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zzxz" name="xsbxBean.zzxz" value="${xsbxBean.zzxz}" maxlength="60"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row id="clear_row7">
				<cps:tdLabel><font color="red">*</font>混迹复杂场所：</cps:tdLabel>
				<cps:tdContent title="是否长期混迹于复制场所">
					<c:choose>
						<c:when test="${empty xsbxBean.sfcqhjyfzcs}">
							<cps:select id="sfcqhjyfzcs" 
								name="xsbxBean.sfcqhjyfzcs" 
								zdlb="GB_ZT" 
								value="0"
								headerKey="" headerValue=" " 
								onchange="changeHjylcs(this.value)"
								required="true">
							</cps:select>
						</c:when>
						<c:otherwise>
							<cps:select id="sfcqhjyfzcs" 
								name="xsbxBean.sfcqhjyfzcs" 
								zdlb="GB_ZT" 
								value="${xsbxBean.sfcqhjyfzcs}" 
								headerKey="" headerValue=" " 
								onchange="changeHjylcs(this.value)"
								required="true">
							</cps:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>是否有固定职业：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty xsbxBean.sfygdzy}">
							<cps:select id="sfygdzy" 
								name="xsbxBean.sfygdzy" 
								zdlb="GB_ZT" 
								onchange="changeSfygdzy(this.value)"
								value="0" 
								headerKey=""
								headerValue=" "
								required="true">
							</cps:select>
						</c:when>
						<c:otherwise>
							<cps:select id="sfygdzy" 
								name="xsbxBean.sfygdzy" 
								zdlb="GB_ZT" 
								onchange="changeSfygdzy(this.value)"
								value="${xsbxBean.sfygdzy}" 
								headerKey=""
								headerValue=" "
								required="true">
							</cps:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>是否购置私家车：</cps:tdLabel>
				<cps:tdContent >
					<c:choose>
						<c:when test="${empty xsbxBean.sfgzsjc}">
							<cps:select id="sfgzsjc" name="xsbxBean.sfgzsjc" 
									zdlb="GB_ZT" value="0"
									onchange="changeSfgzsjc(this.value)"
									headerKey="" headerValue=" "
									required="true">
				  		    </cps:select>
						</c:when>
						<c:otherwise>
							<cps:select id="sfgzsjc" name="xsbxBean.sfgzsjc" 
									zdlb="GB_ZT" value="${xsbxBean.sfgzsjc}"
									onchange="changeSfgzsjc(this.value)"
									headerKey="" headerValue=" "
									required="true">
				   			 </cps:select>
						</c:otherwise>
					</c:choose>	
				</cps:tdContent>
			</cps:row>
			
			<cps:row id="hjylcs_row_1">
				<cps:tdLabel>场所名称：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="csmc" name="xsbxBean.csmc" value="${xsbxBean.csmc}" maxlength="60"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>场所代码：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield  id="csdm" name="xsbxBean.csdm" value="${xsbxBean.csdm}" maxlength="10" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>场所详址：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="csxz" name="xsbxBean.csxz" value="${xsbxBean.csxz}" maxlength="60"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<%--
			<cps:row id="">
				
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			--%>
			<cps:row id="ywgdzy_row_1">
				<cps:tdLabel>月收入(元)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="ysr" name="xsbxBean.ysr" value="${xsbxBean.ysr}" inputType="number" maxlength="9"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>单位名称：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="gzdwmc" name="xsbxBean.gzdwmc" value="${xsbxBean.gzdwmc}" maxlength="60"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>单位详址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="gzdwxz" name="xsbxBean.gzdwxz" value="${xsbxBean.gzdwxz}" maxlength="60" ></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<%--
			<cps:row>
				
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			--%>
			<cps:row id="sfgzsjc_row_1">
				<cps:tdLabel>车价值(万元)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="cjcjz" name="xsbxBean.cjcjz" value="${xsbxBean.cjcjz}" maxlength="6" inputType="number"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>车牌号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="cphm" name="xsbxBean.cphm" value="${xsbxBean.cphm}" maxlength="10"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>购车时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date dateFmt="yyyy-MM-dd" id="gcsj" name="xsbxBean.gcsj" maxDate="sysdate" value="${xsbxBean.gcsj}"></cps:date>
				</cps:tdContent>
			</cps:row>
			
			<cps:row id="sfgzfc_row_1">
				<cps:tdLabel>房产价值(万元)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fcjz" name="xsbxBean.fcjz" value="${xsbxBean.fcjz}" maxlength='8' inputType="number" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>购房时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date dateFmt="yyyy-MM-dd" id="gfsj" name="xsbxBean.gfsj" maxDate="sysdate" value="${xsbxBean.gfsj}"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>房屋地址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fwdz" name="xsbxBean.fwdz" value="${xsbxBean.fwdz}" maxlength="60"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>是否经济拮据：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty xsbxBean.sfjjjj}">
							<cps:select id="sfjjjj" 
								name="xsbxBean.sfjjjj" 
								zdlb="GB_ZT" 
								value="0" 
								headerKey="" headerValue=" " 
								required="true">
							</cps:select>
						</c:when>
						<c:otherwise>
							<cps:select id="sfjjjj" 
									name="xsbxBean.sfjjjj" 
									zdlb="GB_ZT" 
									value="${xsbxBean.sfjjjj}" 
									headerKey="" headerValue=" " 
									required="true">
							</cps:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>经济拮据依据：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield  id="jjjjpdyj" name="xsbxBean.jjjjpdyj" value="${xsbxBean.jjjjpdyj}"  maxlength="60"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color='red'>*</font>侵财性犯罪次数：</cps:tdLabel>
				<cps:tdContent title="重复侵财性犯罪次数">
					<cps:textfield id="qcxfzcs" name="xsbxBean.qcxfzcs" required="true"  value="${xsbxBean.qcxfzcs}" maxlength="3" inputType="integer" ></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>消费大于收入：</cps:tdLabel>
				<cps:tdContent title="日常消费是否明细大于收入">
					<c:choose>
						<c:when test="${empty xsbxBean.rcxfsfmxdysr}">
							<cps:select id="rcxfsfmxdysr" 
									name="xsbxBean.rcxfsfmxdysr" 
									zdlb="GB_ZT" 
									value="0" 
									headerKey="" headerValue=" " 
									required="true">
							</cps:select>
						</c:when>
						<c:otherwise>
							<cps:select id="rcxfsfmxdysr" 
									name="xsbxBean.rcxfsfmxdysr" 
									zdlb="GB_ZT" 
									value="${xsbxBean.rcxfsfmxdysr}" 
									headerKey="" headerValue=" "
									required="true" >
							</cps:select>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
				<cps:tdLabel>判断依据：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield  id="xfdrsrpdyj" name="xsbxBean.xfdrsrpdyj" maxlength="60" cssStyle="width:95%"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row9">
				<cps:tdLabel><font color="red">*</font>是否无固定收入：</cps:tdLabel>
				<cps:tdContent title="是否多家庭无固定收入">
					<c:choose>
						<c:when test="${empty xsbxBean.sfdjtwgdsy}">
							<cps:select id="sfdjtwgdsy" 
									name="xsbxBean.sfdjtwgdsy" 
									zdlb="GB_ZT" 
									value="0" 
									headerKey="" headerValue=" " 
									required="true">
							</cps:select>
						</c:when>
						<c:otherwise>
							<cps:select id="sfdjtwgdsy" 
									name="xsbxBean.sfdjtwgdsy" 
									zdlb="GB_ZT" 
									value="${xsbxBean.sfdjtwgdsy}" 
									headerKey="" headerValue=" " 
									required="true">
						 </cps:select>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
				<cps:tdLabel>判断依据：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield  id="wgdsrpdyy" name="xsbxBean.wgdsrpdyy" maxlength="60" cssStyle="width:95%"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			
			<cps:row id="clear_row13">
				<cps:tdLabel><font color="red">*</font>成为嫌疑人可能：</cps:tdLabel>
				<cps:tdContent title="近期是否有成功违法犯罪嫌疑人的可能">
					<c:choose>
						<c:when test="${empty xsbxBean.jqsfycwwffzxyrdkn}">
							<cps:select id="jqsfycwwffzxyrdkn" 
								name="xsbxBean.jqsfycwwffzxyrdkn" 
								zdlb="GB_ZT" value="0" 
								headerKey="" headerValue=" "
								required="true" >
							</cps:select>
						</c:when>
						<c:otherwise>
							<cps:select id="jqsfycwwffzxyrdkn" 
									name="xsbxBean.jqsfycwwffzxyrdkn" 
									zdlb="GB_ZT" value="${xsbxBean.jqsfycwwffzxyrdkn}" 
									headerKey="" headerValue=" " 
									required="true">
							</cps:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>判断依据：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield id="cwwfzxyrpdyj" name="xsbxBean.cwwfzxyrpdyj" value="${xsbxBean.cwwfzxyrpdyj}" maxlength="140" cssStyle="width:95%"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row16">
				<cps:tdLabel><font color="red">*</font>现实情况描述：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield  id="xsqkms" name="xsbxBean.xsqkms" maxlength="290" cssStyle="width:97%" required="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>核实民警：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="hsmjxm" name="xsbxBean.hsmjxm" value="${xsbxBean.hsmjxm}" readonly="true" ></cps:textfield>	
				</cps:tdContent>
				
				<cps:tdLabel>民警身份证号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="hsmjsfzh" name="xsbxBean.hsmjsfzh" value="${xsbxBean.hsmjsfzh}" readonly="true"></cps:textfield>	
				</cps:tdContent>
				
				<cps:tdLabel>核实单位：</cps:tdLabel>
				<cps:tdContent>
					<input id="hszrdwdm" name="xsbxBean.hszrdwdm" value="${xsbxBean.hszrdwdm }" type="hidden"/>
					<cps:textfield id="hszedwmc" name="xsbxBean.hszedwmc" value="${xsbxBean.hszedwmc}" readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row14">
				
				<cps:tdLabel>核实时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date dateFmt="yyyy-MM-dd" maxDate="sysdate" id="hssj" name="xsbxBean.hssj" value="${xsbxBean.hssj}" ></cps:date>
				</cps:tdContent>
				
				<cps:tdLabel>核实区划：</cps:tdLabel>
				<cps:tdContent>
					<input id="hsddqh" name="xsbxBean.hsddqh" value="${xsbxBean.hsddqh }" type="hidden"/>
					<cps:textfield id="hsddqhmc" name="xsbxBean.hsddqhmc" value="${xsbxBean.hsddqhmc}" readonly="true" appendPopuBtn="true" onclick="openSelectXzqh('0',callbackHsdzqh)"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel>核实地址详址:</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="hsddxz" name="xsbxBean.hsddxz" value="${xsbxBean.hsddxz}" maxlength="60"></cps:textfield>	
				</cps:tdContent>
				
			</cps:row>
			 
			<cps:row id="clear_row17">
				<c:if test="${operType == 'add'}">
					<cps:tdLabel>登记人姓名:</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djrxm" name="xsbxBean.djrxm" value="${loginInfo.realname}"></cps:textfield>	
					</cps:tdContent>
					<cps:tdLabel>登记单位名称:</cps:tdLabel>
					<cps:tdContent>
						<input id="djdwdm" name="xsbxBean.djdwdm" value="${loginInfo.orgcode}" type="hidden"/>
						<cps:textfield id="djdwmc" name="xsbxBean.djdwmc" value="${loginInfo.orgname}"></cps:textfield>	
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date  id="djsj" name="xsbxBean.djsj" maxDate="sysdate"  defaultSystemDate="true"></cps:date>
					</cps:tdContent>
				</c:if>
				<c:if test="${operType !='add'}">
					<cps:tdLabel>登记人姓名:</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djrxm" name="xsbxBean.djrxm" value="${xsbxBean.djrxm}"></cps:textfield>	
					</cps:tdContent>
					<cps:tdLabel>登记单位名称:</cps:tdLabel>
					<cps:tdContent>
						<input id="djdwdm" name="xsbxBean.djdwdm" value="${xsbxBean.djdwdm}" type="hidden"/>
						<cps:textfield id="djdwmc" name="xsbxBean.djdwmc" value="${xsbxBean.djdwmc}"></cps:textfield>	
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date  id="djsj" name="xsbxBean.djsj" maxDate="sysdate"  value="${xsbxBean.djsj}"></cps:date>
					</cps:tdContent>
				</c:if>
			</cps:row>
		</cps:table>
	</creator:panel>
	
	<creator:tbar id="download">
		<cps:button value="导出在控登记信息" onclick="downloadZkxx()"></cps:button>
	</creator:tbar>
	
	<c:if test="${operType eq 'detail'}" >
		<cps:tableGrid id="lsxsbslist" tbarId="download"
				url="/lsgl/zdry/queryXsbxPageResultInfo.action?zdryBean.sfzh=${zdryBean.sfzh}"
				width="99.6%"
				autoload="true"
				isAsynch="true"
				pageSize="5"
				title="历史在控信息"
				mutilSelect="false"
				click="fullXsbxForm" 
				usepager="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true" expand="false"></cps:column>
				<cps:column title="在控状态" field="zkztmc"></cps:column>
				<cps:column title="是否在押人员" field="sfzyrymc"></cps:column>
				<cps:column title="联系方式" field="zdrylxfs"></cps:column>
				<cps:column title="重复侵财性犯罪次数" field="qcxfzcs"></cps:column>
				<cps:column title="现实情况描述" field="xsqkms"></cps:column>
				<cps:column title="登记人姓名" field="djrxm"></cps:column>
				<cps:column title="登记时间" field="djsj"></cps:column>
		</cps:tableGrid>
	</c:if>
	
	<c:if test="${!(operType eq 'detail')}">
		<cps:tableGrid id="lsxsbslist" tbarId="download"
				url="/lsgl/zdry/queryXsbxPageResultInfo.action?zdryBean.sfzh=${zdryBean.sfzh}"
				width="99.6%"
				autoload="true"
				isAsynch="true"
				pageSize="5"
				title="历史在控信息"
				mutilSelect="false"
				usepager="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true" expand="false"></cps:column>
				<cps:column title="在控状态" field="zkztmc"></cps:column>
				<cps:column title="是否在押人员" field="sfzyrymc"></cps:column>
				<cps:column title="联系方式" field="zdrylxfs"></cps:column>
				<cps:column title="重复侵财性犯罪次数" field="qcxfzcs"></cps:column>
				<cps:column title="现实情况描述" field="xsqkms"></cps:column>
				<cps:column title="登记人姓名" field="djrxm"></cps:column>
				<cps:column title="登记时间" field="djsj"></cps:column>
		</cps:tableGrid>
	</c:if>
	
	<form id="download" target="exportiframe"></form>
	<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>


