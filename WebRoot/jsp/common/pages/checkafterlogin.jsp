<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/common/js/checkafterlogin.js"></creator:Script>
	<form id="checkbeforeloginForm" method="post" >
	<input type="hidden" id="id"  name="lxfsBean.id" value="${lxfsBean.id}"/>
	<input type="hidden" id="jwsId" name="jwsBean.id" value="${jwsBean.id }"/>
	<c:if test="${level <'4'}">
	 <fieldset>
			<legend>联系方式</legend>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="25%">警号：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<input type="hidden" id="userid" name="lxfsBean.userid" value="${loginInfo.userid }"/>
						<input type="hidden" id="username" name="lxfsBean.username" value="${loginInfo.username}"/>
					    <input type="hidden" id="sfzh"  name="lxfsBean.sfzh" value="${loginInfo.sfzh }"  />
						${loginInfo.username}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="25%">单位：</cps:tdLabel>
					<cps:tdContent  width="70%">
					 <input type="hidden" id="orgdwdm"  name="lxfsBean.orgdwdm" value="${loginInfo.orgcode }"  />
				     <input type="hidden" id="orgdwmc"  name="lxfsBean.orgdwmc" value="${loginInfo.orgname}"  />
						${loginInfo.orgname }
					</cps:tdContent>
				</cps:row>
				<%--
				<cps:row>
					<cps:tdLabel width="25%">身份证号：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<cps:textfield id="sfzh"  name="lxfsBean.sfzh" value="${lxfsBean.sfzh }"  readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				--%>
				<cps:row>
					<cps:tdLabel width="25%">姓名：</cps:tdLabel>
					<cps:tdContent  width="70%">
					    <input type="hidden" id="xm"  name="lxfsBean.xm" value="${loginInfo.realname }"  />
						${loginInfo.realname}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="25%">手机号码：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<cps:textfield id="mobile" name="lxfsBean.mobile" value="${lxfsBean.mobile}" maxlength="11" cssClass="validate[[custom[mobile]]" onblur="removetelephoneRed();"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="25%">座机号码：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<cps:textfield id="telephone" name="lxfsBean.telephone"  value="${lxfsBean.telephone}" maxlength="20" isPhone="true" onblur="removemobileRed();"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		 </fieldset>
	</c:if>
	 <c:if test="${level =='5'}">
		 <fieldset>
			<legend>联系方式</legend>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="25%">警号：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<input type="hidden" id="userid" name="lxfsBean.userid" value="${loginInfo.userid }"/>
						<input type="hidden" id="username" name="lxfsBean.username" value="${loginInfo.username}"/>
					    <input type="hidden" id="sfzh"  name="lxfsBean.sfzh" value="${loginInfo.sfzh }"  />
						${loginInfo.username}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="25%">单位：</cps:tdLabel>
					<cps:tdContent  width="70%">
					 <input type="hidden" id="orgdwdm"  name="lxfsBean.orgdwdm" value="${loginInfo.orgcode }"  />
				     <input type="hidden" id="orgdwmc"  name="lxfsBean.orgdwmc" value="${loginInfo.orgname}"  />
						${loginInfo.orgname }
					</cps:tdContent>
				</cps:row>
				<%--
				<cps:row>
					<cps:tdLabel width="25%">身份证号：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<cps:textfield id="sfzh"  name="lxfsBean.sfzh" value="${lxfsBean.sfzh }"  readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				--%>
				<cps:row>
					<cps:tdLabel width="25%">姓名：</cps:tdLabel>
					<cps:tdContent  width="70%">
					    <input type="hidden" id="xm"  name="lxfsBean.xm" value="${loginInfo.realname }"  />
						${loginInfo.realname}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="25%">手机号码：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<cps:textfield id="mobile" name="lxfsBean.mobile" value="${lxfsBean.mobile}" maxlength="11" cssClass="validate[[custom[mobile]]" onblur="removetelephoneRed();"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="25%">座机号码：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<cps:textfield id="telephone" name="lxfsBean.telephone"  value="${lxfsBean.telephone}" maxlength="20" isPhone="true" onblur="removemobileRed();"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		 </fieldset>
		 <fieldset>
		 	<legend>社区警务室维护</legend>
		 	<cps:table>
		 		<cps:row>
		 			<cps:tdLabel width="25%">名称：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<input type="hidden" id="id" name="pcsBean.id" value="${pcsBean.id }"/>
						<input type="hidden" name="pcsBean.orgcode" value="${pcsBean.orgcode}">
						<c:if test="${level=='4'}">
							<input type="hidden" name="pcsBean.ispcs" value="1">
						</c:if>
						<c:if test="${level=='5'}">
							<input type="hidden" name="pcsBean.ispcs" value="0">
						</c:if>
						<cps:textfield id="orgname" name="pcsBean.orgname" ></cps:textfield>
					</cps:tdContent>
		 		</cps:row>
		 		<cps:row>
		 			<cps:tdLabel width="25%"><font color="red">*</font>办公地点类型：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<cps:select id="bgddlx" name="pcsBean.bgddlx" zdlb="ZDY_BGDDLX" value="${pcsBean.bgddlx}" headerKey="" headerValue="---请选择---" required="true"></cps:select>
					</cps:tdContent>
		 		</cps:row>
		 		<cps:row>
		 			<cps:tdLabel width="25%"><font color="red">*</font>网络接入方式：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<cps:select id="wljrfs" name="pcsBean.wljrfs" zdlb="ZDY_WLJRFS" value="${pcsBean.wljrfs}" headerKey="" headerValue="---请选择---" required="true" ></cps:select>
					</cps:tdContent>
		 		</cps:row>
		 	</cps:table>
		 </fieldset>
	 </c:if>
	 
	 <c:if test="${level =='4'}">
	 	<fieldset>
		 <legend>联系方式</legend>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%">警号：</cps:tdLabel>
					<cps:tdContent  width="22%">
						<input type="hidden" id="userid" name="lxfsBean.userid" value="${loginInfo.userid }"/>
						<input type="hidden" id="username" name="lxfsBean.username" value="${loginInfo.username}"/>
					    <input type="hidden" id="sfzh"  name="lxfsBean.sfzh" value="${loginInfo.sfzh }"  />
						${loginInfo.username}
					</cps:tdContent>
				
					<cps:tdLabel width="12%">单位：</cps:tdLabel>
					<cps:tdContent  width="22%">
					 <input type="hidden" id="orgdwdm"  name="lxfsBean.orgdwdm" value="${loginInfo.orgcode }"  />
				     <input type="hidden" id="orgdwmc"  name="lxfsBean.orgdwmc" value="${loginInfo.orgname}"  />
						${loginInfo.orgname }
					</cps:tdContent>
				
				<%--
				<cps:row>
					<cps:tdLabel width="25%">身份证号：</cps:tdLabel>
					<cps:tdContent  width="70%">
						<cps:textfield id="sfzh"  name="lxfsBean.sfzh" value="${lxfsBean.sfzh }"  readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				--%>
				
					<cps:tdLabel width="12%">姓名：</cps:tdLabel>
					<cps:tdContent  width="70%">
					    <input type="hidden" id="xm"  name="lxfsBean.xm" value="${loginInfo.realname }"  />
						${loginInfo.realname}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel >手机号码：</cps:tdLabel>
					<cps:tdContent  >
						<cps:textfield id="mobile" name="lxfsBean.mobile" value="${lxfsBean.mobile}" maxlength="11" cssClass="validate[[custom[mobile]]" onblur="removetelephoneRed();"></cps:textfield>
					</cps:tdContent>
				
					<cps:tdLabel >座机号码：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield id="telephone" name="lxfsBean.telephone"  value="${lxfsBean.telephone}" maxlength="20" isPhone="true" onblur="removemobileRed();"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >&nbsp;</cps:tdLabel>
					<cps:tdContent >
							&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
		 </fieldset>
	 
		 <fieldset>
		 	<legend>派出所信息维护</legend>
				<input type="hidden" id="id" name="pcsBean.id" value="${pcsBean.id }"/>
				<input type="hidden" id="orgcode" name="pcsBean.orgcode" value="${pcsBean.orgcode }"/>
				<input type="hidden" id="ispcs" name="pcsBean.ispcs" value="${pcsBean.ispcs }"/>
			<cps:table>
				<cps:row id="clear_row2">
					<cps:tdLabel width="12%"><font color="red">*</font>派出所名称：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield id="hhh" name="pcsBean.orgname" value="${pcsBean.orgname}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">级别：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select id="jb" name="pcsBean.jb" value="${pcsBean.jb}" zdlb="ZDY_PCSJB" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%">等级：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select id="dj" name="pcsBean.dj" value="${pcsBean.dj}" zdlb="ZDY_PCSDJ" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				
				<cps:row id="clear_row3">
					<cps:tdLabel>类别：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="lb" name="pcsBean.lb" value="${pcsBean.lb}" zdlb="ZDY_PCSLB" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel>编制数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="bzs" name="pcsBean.bzs" value="${pcsBean.bzs}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>警力数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="jls" name="pcsBean.jls" value="${pcsBean.jls}" inputType="number"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row5">
					<cps:tdLabel>辅警数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="fjs" name="pcsBean.fjs" value="${pcsBean.fjs}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>其中社区（驻村）民警配备辅警数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sqmjpbfjs" name="pcsBean.sqmjpbfjs" value="${pcsBean.sqmjpbfjs}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="djsj" name="pcsBean.djsj" value="${pcsBean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
				</cps:row>
			 	<cps:row>
					<cps:tdLabel >警务模式：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield cssStyle="width:30%" id="jwmsd" name="pcsBean.jwmsd" value="${pcsBean.jwmsd}" maxlength="5"></cps:textfield>队
						<cps:textfield cssStyle="width:30%" id="jwmss" name="pcsBean.jwmss" value="${pcsBean.jwmss}" maxlength="5"></cps:textfield>室
					</cps:tdContent>
					<cps:tdLabel >队室名称(一队)：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield  id="dsmc1" name="pcsBean.dsmc1" value="${pcsBean.dsmc1}" maxlength="50" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >队室名称(二队)：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield  id="dsmc2" name="pcsBean.dsmc2" value="${pcsBean.dsmc2}" maxlength="50"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row7">
					<cps:tdLabel >队室名称(三队)：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield  id="dsmc3" name="pcsBean.dsmc3" value="${pcsBean.dsmc3}" maxlength="50"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >队室名称(室)：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield  id="dsmc4" name="pcsBean.dsmc4" value="${pcsBean.dsmc4}" maxlength="50"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>值班模式：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield cssStyle="width:30%" id="zbmsb" name="pcsBean.zbmsb" value="${pcsBean.zbmsb}" maxlength="5"></cps:textfield>班
						<cps:textfield cssStyle="width:30%" id="zbmsl" name="pcsBean.zbmsl" value="${pcsBean.zbmsl}" maxlength="5"></cps:textfield>轮
					</cps:tdContent>
				</cps:row>
				 
				<cps:row>
					<cps:tdLabel>值班警车(台)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zbjc" name="pcsBean.zbjc" value="${pcsBean.zbjc}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>值班人数(警力)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zbrsjl" name="pcsBean.zbrsjl" value="${pcsBean.zbrsjl}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>值班人数(领导数)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zbrslds" name="pcsBean.zbrslds" value="${pcsBean.zbrslds}" inputType="number"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>值班人数(辅警数)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zbrsfjs" name="pcsBean.zbrsfjs" value="${pcsBean.zbrsfjs}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>乡镇(街道)：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="xzjd" name="pcsBean.xzjd" value="${pcsBean.xzjd}" maxlength="100" cssStyle="width:89%"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>所长是否进乡镇（街道）班子：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="szsfjrxzbz" name="pcsBean.szsfjrxzbz" value="${pcsBean.szsfjrxzbz}" zdlb="ZDY_ZDSF" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel>社区数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sqs" name="pcsBean.sqs" value="${pcsBean.sqs}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>行政村数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xzcs" name="pcsBean.xzcs" value="${pcsBean.xzcs}" inputType="number"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>社区警务室数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sqjwss" name="pcsBean.sqjwss" value="${pcsBean.sqjwss}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>社区民警数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sqmjs" name="pcsBean.sqmjs" value="${pcsBean.sqmjs}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>专职社区民警：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zzsqmjs" name="pcsBean.zzsqmjs" value="${pcsBean.zzsqmjs}" inputType="number"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>社区民警占警力比：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sqmjzjlb" name="pcsBean.sqmjzjlb" value="${pcsBean.sqmjzjlb}" inputType="number"></cps:textfield>
						<font color="red">%</font>
					</cps:tdContent>
					<cps:tdLabel>社区民警人均配备辅警数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sqmjrjpbfjs" name="pcsBean.sqmjrjpbfjs" value="${pcsBean.sqmjrjpbfjs}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>辖区面积：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xqmj" name="pcsBean.xqmj" value="${pcsBean.xqmj}" inputType="number"></cps:textfield>
					<font color="red">㎡</font>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>户籍人口数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="hjrks" name="pcsBean.hjrks" value="${pcsBean.hjrks}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>暂住人口数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zzrks" name="pcsBean.zzrks" value="${pcsBean.zzrks}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>重点对象数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zddxs" name="pcsBean.zddxs" value="${pcsBean.zddxs}" inputType="number"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					
					<cps:tdLabel>重点单位数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zddws" name="pcsBean.zddws" value="${pcsBean.zddws}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>重点场所数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zdcss" name="pcsBean.zdcss" value="${pcsBean.zdcss}" inputType="number"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdLabel>操作人姓名：</cps:tdLabel>	
					<cps:tdContent> 
						<c:choose>
							<c:when test="${empty pcsBean.czrxm}">
									<cps:textfield id="czrxm" name="pcsBean.czrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
									<cps:textfield id="czrxm" name="pcsBean.czrxm" value="${pcsBean.czrxm}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>操作人单位：</cps:tdLabel>	
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty pcsBean.czrdwdm}">
								<input type="hidden" name="pcsBean.czrdwdm" value="${loginInfo.orgcode }"/>
								<cps:textfield id="czrdwmc" name="pcsBean.czrdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="pcsBean.czrdwdm" value="${pcsBean.czrdwdm }"/>
								<cps:textfield id="czrdwmc" name="pcsBean.czrdwmc" value="${pcsBean.czrdwmc}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose> 
					</cps:tdContent>
					<cps:tdLabel>操作时间：</cps:tdLabel>	
					<cps:tdContent> 
						<c:choose>
							<c:when test="${empty pcsBean.czsj}">
								<cps:date id="czsj" name="pcsBean.czsj" defaultSystemDate="true" readOnly="true"></cps:date>
							</c:when>
							<c:otherwise>
								<cps:date id="czsj" name="pcsBean.czsj" value="${pcsBean.czsj}" readOnly="true"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		 </fieldset>
	 </c:if>
	 
	 <cps:table>
	 	<cps:row>
	 		<cps:tdContent align="center">
	 			<cps:button   value="确定" onclick="saveform();"></cps:button>	
	 		</cps:tdContent>
	 	</cps:row>
	 </cps:table>
	</form>	
</creator:view>

