<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view title="列管/撤管申请">
	<link type="text/css"
		href="<c:url value='/jsp/zdrygl/images/css.css'/>" rel="stylesheet" />
	<creator:Script src="/jsp/zdrygl/js/zdry_comm.js"></creator:Script>
	<creator:Script src="/jsp/zdrygl/js/application.js"></creator:Script>
	<div class="sqjw_wk">
		<div>
			<div class="sqjw_title1">
				重点人口（工作对象）列管申请审批表
			</div>
			<div class="sqjw_title">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="4%" align="center">
							<img src="${contextPath}/jsp/zdrygl/images/sqjw_tb.gif"
								width="16" height="16" />
						</td>
						<td>
							人员基本信息
						</td>
					</tr>
				</table>

			</div>
			<!-- 列管申请 -->
			<c:if test="${empty resultInfo}">
				<form id="applicationForm">
					<input type="hidden" value="1" name="gxrCount" id="gxrCount" />
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="sqjw_list">
						<tr>
							<th align="right">
								身份证号：
							</th>
							<td class="padd3">
								<input type="text" name="lcsqxx.sfzh" id="sfzh" class="input160" />
							</td>
							<th align="right">
								姓名：
							</th>
							<td class="padd3">
								<input type="text" name="lcsqxx.xm" id="xm"
									value="${lcsqxx.xm }" class="input160" />
							</td>
							<td rowspan="4" align="center" valign="top">
								<img src="${contextPath}/jsp/zdrygl/images/sqjw_04.gif"
									width="101" height="141" />			
								<!-- 
									<img
									src="<c:url value='/cps/common/showPoto.action?sfzh=433101199310186521'/> "
									width="101" height="141" />
											
								 -->
							</td>
						</tr>
						<tr>
							<th align="right">
								联系电话：
							</th>
							<td class="padd3">
								<input type="text" name="lcsqxx.lxdh" id="lxdh" value="1111111111" class="input160" />
							</td>
							<th align="right">
								性别：
							</th>
							<td class="padd3">
								<cps:select id="xb" name="lcsqxx.xb" zdlb="GB_XB"
									cssClass="select160" value="${lcsqxx.xb}" headerKey=""
									headerValue="--请选择--"></cps:select>
							</td>
						</tr>
						<tr>
							<th align="right">
								家庭住址：
							</th>
							<td class="padd3">
								<input type="text" name="lcsqxx.jtzz" id="jtzz" class="input_" />
							</td>
							<th align="right">
								重点人员类型：
							</th>
							<td class="padd3">
								<cps:select id="zdrklx" name="lcsqxx.zdrklx" zdlb="ZDRY_RYLX"
									cssClass="select160" value="${lcsqxx.zdrklx}"></cps:select>
							</td>
						</tr>
						<tr>
							<th align="right">
								案件描述：
							</th>
							<td class="padd3" colspan="3">
								<textarea name="lcsqxx.ajms" id="ajms" cols="35" rows="2"
									class="textarea2">测试测试测试 案件描述</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="6" align="center"
								style="font-size: 14px; font-weight: bold;">
								主要交往人员情况
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="sqjw_list">
									<tr>
										<th align="center">
											关系
										</th>
										<th align="center">
											姓名
										</th>
										<th align="center">
											性别
										</th>
										<th align="center">
											身份证号
										</th>
										<th align="center">
											电话号码
										</th>
										<th align="center">
											操作
										</th>
									</tr>
									<tbody>
										<tr>
											<td align="center">
												<cps:select name="jtgx" zdlb="ZDRY_JTGX"
													cssClass="select160" value="" headerKey=""
													headerValue="--请选择--"></cps:select>
											</td>
											<td align="center">
												<input type="text" name="xm" value="曾飞" class="input100" />
											</td>
											<td align="center">
												<cps:select name="xb" zdlb="GB_XB" cssClass="select100"
													value="" headerKey="" headerValue="--请选择--"></cps:select>
											</td>
											<td align="center">
												<input type="text" name="sfzh" value="430124198510187630"
													class="input160" />
											</td>
											<td align="center">
												<input type="text" name="dhhm" value="22222222222"
													class="input100" />
											</td>
											<td align="center">
												<input type="button" onclick="addTabJwry(this);" value="新增"
													class="sqjw_an" />
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
					<div class="sqjw_title mar5">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="4%" align="center">
									<img src="${contextPath}/jsp/zdrygl/images/sqjw_tb1.gif"
										width="15" height="15" />
								</td>
								<td>
									列管申请信息
								</td>
							</tr>
						</table>
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="sqjw_list1">
						<tr>
							<th width="18%">
								个人简历：
							</th>
							<td>
								<textarea name="lcsqxx.grjj" id="grjj" cols="45" rows="5"
									class="textarea">测试测试测试 个人简历</textarea>
							</td>
						</tr>
						<tr>
							<th>
								主要问题及依据：
							</th>
							<td>
								<textarea name="lcsqxx.zywtjyj" id="zywtjyj" cols="45" rows="5"
									class="textarea">测试测试测试 主要问题及依据</textarea>
							</td>
						</tr>
						<tr>
							<th>
								现实表现及列管理由：
							</th>
							<td>
								<textarea name="lcsqxx.lcgly" id="lcgly" cols="45" rows="5"
									class="textarea">测试测试测试 现实表现及列管理由</textarea>
							</td>
						</tr>
						<tr>
							<th height="35">
								拟列管日期：
							</th>
							<td align="right">
								<select name="lgyear" id="lgyear" class="select50">
								</select>
								年
								<select name="lgmonth" id="lgmonth" class="select50">
								</select>
								月
								<select name="lgday" id="lgday" class="select50">
								</select>
								日
							</td>
						</tr>
						<tr>
							<th>
								承办意见：
							</th>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="10%" style="border: none; padding: 0;">
											意见建议：
										</td>
										<td colspan="3" style="border: none; padding: 0;">
											<textarea name="lksqllzxx.cljgyj" id="cljgyj" cols="45"
												rows="5" class="textarea">测试测试测试 同意</textarea>
										</td>
									</tr>
									<tr>
										<td height="35" style="border: none; padding: 0;">
											处理结果：
										</td>
										<td width="33%" style="border: none; padding: 0;">
											<cps:select id="cljg" name="lksqllzxx.cljg" zdlb="ZDRY_CLJG"
												cssClass="select160" value="${lksqllzxx.cljg}"></cps:select>
										</td>
										<td style="border: none; padding: 0;">
											签章
										</td>
										<td align="right" style="border: none; padding: 0;">
											<input type="hidden" id="" name="" value="" />
											<select name="clyear" id="clyear" class="select50">
											</select>
											年
											<select name="clmonth" id="clmonth" class="select50">
											</select>
											月
											<select name="clday" id="clday" class="select50">
											</select>
											日
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<!-- 
							<tr>
							<th>
								交办单位：
							</th>
							<td>
								<table width="100%" border="1" cellspacing="1" cellpadding="0">
									<tr>
										<td width="10%" height="35" style="border: none; padding: 0;">
											交办单位：
										</td>
										<td width="43%" align="left" style="border: none; padding: 0;">
											<input type="text" name="lcsqxx.jbshdwmc" id="jbshdwmc"
												class="input160" value="" />
											<input type="hidden" name="lcsqxx.jbshdwdm" id="jbshdwdm"
												class="input160" value="" />
											<input type="button"
												onclick="opendwselecttree('${loginInfo.rootOrgCode}');"
												value="选择单位" />
										</td>
										<td width="10%" style="border: none; padding: 0;">
											交办时间：
										</td>
										<td align="left" style="border: none; padding: 0;">
											<cps:date id="jbsj" name="jbsj" dateFmt="yyyy-MM-dd"
												cssClass="cps-input" cssStyle="width:120px;"></cps:date>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						 -->
					</table>
					<div class="sqjw_bot">
						<input type="button" onclick="applicationSubmit();" name="button3"
							id="button3" value="提交" class="sqjw_an1" />
						&nbsp;
						<input type="button" onclick="closeWind();" value="取消"
							class="sqjw_an1" />
						&nbsp;
						<input type="button" name="button5" id="button5" value="打印"
							class="sqjw_an1" />
					</div>
		</div>
	</div>
	</form>
	</c:if>
	<!-- 列管审批 -->
	<c:if test="${not empty resultInfo}">
		<form id="approvalForm">
			<input type="hidden" value='${resultInfo.sqxxbh }' name='sqxxbh'
				id='sqxxbh' />
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="sqjw_list">
				<tr>
					<th align="right">
						身份证号：
					</th>
					<td class="padd3">
						${resultInfo.sfzh }
					</td>
					<th align="right">
						姓名：
					</th>
					<td class="padd3">
						${resultInfo.xm }
					</td>
					<td rowspan="4" align="center" valign="top">
						<img src="${contextPath}/jsp/zdrygl/images/sqjw_04.gif"
							width="101" height="141" />
					</td>
				</tr>
				<tr>
					<th align="right">
						联系电话：
					</th>
					<td class="padd3">
						${resultInfo.lxdh }
					</td>
					<th align="right">
						性别：
					</th>
					<td class="padd3">
						${resultInfo.xbmc }
					</td>
				</tr>
				<tr>
					<th align="right">
						家庭住址：
					</th>
					<td class="padd3">
						${resultInfo.jtzz }
					</td>
					<th align="right">
						重点人员类型：
					</th>
					<td class="padd3">
						${resultInfo.zdrklxmc }
					</td>
				</tr>
				<tr>
					<th align="right">
						案件描述：
					</th>
					<td class="padd3" colspan="3">
						${resultInfo.ajms }
					</td>
				</tr>
				<c:if test="${not empty resultInfo.gxrList}">
					<tr>
						<td colspan="6" align="center"
							style="font-size: 14px; font-weight: bold;">
							主要交往人员情况
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="sqjw_list">
								<tr>
									<th align="center">
										关系
									</th>
									<th align="center">
										姓名
									</th>
									<th align="center">
										性别
									</th>
									<th align="center">
										身份证号
									</th>
									<th align="center">
										电话号码
									</th>
								</tr>
								<tbody>
									<c:forEach items="${resultInfo.gxrList}" var="gxr">
										<tr>
											<td align="center">
												${gxr.ydsrgxmc }
											</td>
											<td align="center">
												${gxr.gxrxm }
											</td>
											<td align="center">
												${gxr.xbmc }
											</td>
											<td align="center">
												${gxr.gxrsfzh }
											</td>
											<td align="center">
												${gxr.gxrlxdh }
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</td>
					</tr>
				</c:if>
			</table>
			<div class="sqjw_title mar5">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="4%" align="center">
							<img src="${contextPath}/jsp/zdrygl/images/sqjw_tb1.gif"
								width="15" height="15" />
						</td>
						<td>
							列管申请信息
						</td>
					</tr>
				</table>
			</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="sqjw_list1">
				<tr>
					<th width="18%">
						个人简历：
					</th>
					<td>
						${resultInfo.grjj }
					</td>
				</tr>
				<tr>
					<th>
						主要问题及依据：
					</th>
					<td>
						${resultInfo.zywtjyj }
					</td>
				</tr>
				<tr>
					<th>
						现实表现及列管理由：
					</th>
					<td>
						${resultInfo.lcgly }
					</td>
				</tr>
				<tr>
					<th height="35">
						拟列管日期：
					</th>
					<td align="right">
						${resultInfo.toChar_lcgrq }
					</td>
				</tr>
				<c:forEach items="${resultInfo.lksqlzxxList}" var="lksqlzxxList"
					varStatus="index">
					<c:if test="${lksqlzxxList.cldwlx eq '1'}">
						<c:set value="承办意见" var="shdw"></c:set>
						<c:set value="派出所审核意见" var="spdw"></c:set>
					</c:if>
					<c:if test="${lksqlzxxList.cldwlx eq '2'}">
						<c:set value="派出所审核意见" var="shdw"></c:set>
						<c:set value="区县分局审核意见" var="spdw"></c:set>
						<c:set value="1" var="isJb"></c:set>
					</c:if>
					<c:if test="${lksqlzxxList.cldwlx eq '3'}">
						<c:set value="区县分局审核意见" var="shdw"></c:set>
						<c:set value="" var="spdw"></c:set>

					</c:if>
					<tr>
						<th>
							${shdw }：
						</th>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="10%" style="border: none; padding: 0;">
										意见建议：
									</td>
									<td colspan="3" style="border: none; padding: 0;">
										${lksqlzxxList.cljgyj}
									</td>
								</tr>
								<tr>
									<td height="35" style="border: none; padding: 0;">
										处理结果：
									</td>
									<td width="33%" style="border: none; padding: 0;">
										${lksqlzxxList.cljgmc}
									</td>
									<td style="border: none; padding: 0;">
										签章
									</td>
									<td align="right" style="border: none; padding: 0;">
										${lksqlzxxList.toChar_clsj}
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</c:forEach>
				<!-- 撤控操作 -->
				<c:if test="${resultInfo.lgsqlx eq '2' && isck eq '1'}">
					<tr>
						<th>
							承办意见：
						</th>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="10%" style="border: none; padding: 0;">
										意见建议：
									</td>
									<td colspan="3" style="border: none; padding: 0;">
										<textarea name="lksqllzxx.cljgyj" id="cljgyj" cols="45"
											rows="5" style="width: 99%;">测试测试测试 同意</textarea>
									</td>
								</tr>
								<tr>
									<td height="35" style="border: none; padding: 0;">
										处理结果：
									</td>
									<td width="33%" style="border: none; padding: 0;">
										<cps:select id="cljg" name="lksqllzxx.cljg" zdlb="ZDRY_CLJG"
											cssClass="select160" value="${lksqllzxx.cljg}"></cps:select>
									</td>
									<td style="border: none; padding: 0;">
										签章
									</td>
									<td align="right" style="border: none; padding: 0;">
										<select name="pcsshyear" id="pcsshyear" class="select50">
										</select>
										年
										<select name="pcsshmonth" id="pcsshmonth" class="select50">
										</select>
										月
										<select name="pcsshday" id="pcsshday" class="select50">
										</select>
										日
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<!-- 
						<tr>
						<th>
							交办单位：
						</th>
						<td>
							<table width="100%" border="1" cellspacing="1" cellpadding="0">
								<tr>
									<td width="10%" height="35" style="border: none; padding: 0;">
										交办单位：
									</td>
									<td width="43%" align="left" style="border: none; padding: 0;">
										<input type="text" name="lcsqxx.jbshdwmc" id="jbshdwmc"
											class="input160" value="" />
										<input type="hidden" name="lcsqxx.jbshdwdm" id="jbshdwdm"
											class="input160" value="" />
										<input type="button"
											onclick="opendwselecttree('${loginInfo.rootOrgCode}');"
											value="选择单位" />
									</td>
									<td width="10%" style="border: none; padding: 0;">
										交办时间：
									</td>
									<td align="left" style="border: none; padding: 0;">
										<cps:date id="jbsj" name="jbsj" dateFmt="yyyy-MM-dd"
											cssClass="cps-input" cssStyle="width:120px;"></cps:date>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					 -->
				</c:if>
				<c:if test="${not empty spdw}">
					<tr>
						<th>
							${spdw }：
						</th>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="10%" style="border: none; padding: 0;">
										意见建议：
									</td>
									<td colspan="3" style="border: none; padding: 0;">
										<textarea name="lksqllzxx.cljgyj" id="cljgyj" cols="45"
											rows="5" style="width: 99%;">测试测试测试 同意</textarea>
									</td>
								</tr>
								<tr>
									<td height="35" style="border: none; padding: 0;">
										处理结果：
									</td>
									<td width="33%" style="border: none; padding: 0;">
										<cps:select id="cljg" name="lksqllzxx.cljg" zdlb="ZDRY_CLJG"
											cssClass="select160" value="${lksqllzxx.cljg}"></cps:select>
									</td>
									<td style="border: none; padding: 0;">
										签章
									</td>
									<td align="right" style="border: none; padding: 0;">
										<select name="pcsshyear" id="pcsshyear" class="select50">
										</select>
										年
										<select name="pcsshmonth" id="pcsshmonth" class="select50">
										</select>
										月
										<select name="pcsshday" id="pcsshday" class="select50">
										</select>
										日
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</c:if>
			</table>
			<div class="sqjw_bot">
				<c:if test="${resultInfo.lgsqlx eq '2' && isck eq '1' }">
					<input type="button" onclick="takeControlFormSubmit();" value="提交" class="sqjw_an1" />
				</c:if>
				<c:if test="${resultInfo.lgsqlx != '2'}">
					<input type="button" onclick="approvalFormSubmit();" value="提交" class="sqjw_an1" />
				</c:if>
				<c:if test="${resultInfo.lgsqlx eq '2' && isck != '1' }">
					<input type="button" onclick="ckApprovalFormSubmit();" value="提交" class="sqjw_an1" />
				</c:if>
				&nbsp;
				<input type="button" onclick="closeWind();" value="取消"
					class="sqjw_an1" />
				&nbsp;
				<input type="button" name="button5" id="button5" value="打印"
					class="sqjw_an1" />
			</div>

			<input type="hidden" value='${resultInfo.lgsqlx }' name='lcgsqlx' id='lcgsqlx' />
			<input type="hidden" value='${isJb }' name='isJb' id='isJb' />
		</form>
	</c:if>
	</div>
	</div>
</creator:view>
