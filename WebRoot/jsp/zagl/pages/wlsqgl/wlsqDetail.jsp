<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="网络社区">
	<creator:tbar id="op">
		<c:if test="${!(wlsq.opertype eq 'detail')}">
			<cps:button value="保存" onclick="saveWlsq()"></cps:button>
		</c:if>
		<cps:button value="关闭" onclick="window.close()"></cps:button>
	</creator:tbar>
	<creator:panel id="head_djwlsq" title="网络社区" tbarId="op">
		<div id="wlsq_div">
			<form id="wlsqForm" action="${contextPath}/zagl/wlsq/saveWlsq.action"
				method="post">
				<input type="hidden" name="modename" value="网络社区" />
				<input type="hidden" name="opertype" value="${wlsq.opertype}"
					id="opertype" />

				<input type="hidden" name="wlsq.wlsqbh" value="${wlsq.wlsqbh}" id="wlsqbh" />
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%"><font color="red">*</font>社区名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input type="hidden" id="sssqbh" name="wlsq.sssqbh"
								value="${wlsq.sssqbh}" />
							<cps:textfield id="sssqmc" name="wlsq.sssqmc" readonly="true"
								value="${wlsq.sssqmc }" cssClass="validate[required]"
								maxlength="100" cssStyle="width:50%"
								ondblclick="openSqxxSelectWin('1')" />
							<cps:button value="选择" onclick="openSqxxSelectWin('1')"></cps:button>
						</cps:tdContent>

						<cps:tdLabel cssStyle="width:12%">所属行政区划：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input type="hidden" id="ssxzqh" name="wlsq.ssxzqh"
								value="${wlsq.ssxzqh }" />
							<cps:textfield id="ssxzqhmc" name="wlsq.ssxzqhmc" readonly="true"
								value="${wlsq.ssxzqhmc }" cssStyle="width:80%" />
						</cps:tdContent>

						<cps:tdLabel cssStyle="width:12%">所属街道：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input type="hidden" id="ssjdxz" name="wlsq.ssjdxz"
								value="${wlsq.ssjdxz }" />
							<cps:textfield id="ssjdxzmc" name="wlsq.ssjdxzmc" readonly="true"
								value="${wlsq.ssjdxzmc }" cssStyle="width:80%" />
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdContent colspan="6">
							<table class="cps-tablegrid" style="width: 100%" id="table_sqwz">
								<tr>
									<th align="center" width="18%">
										社区网站名称
									</th>
									<th align="center" width="18%">
										<font color="red">*</font>网站地址
									</th>
									<th align="center" width="18%">
										网站建设单位
									</th>
									<th align="center" width="18%">
										网站管理人
									</th>
									<th align="center" width="18%">
										管理人电话
									</th>
									<c:if test="${!(wlsq.opertype eq 'detail')}">
										<th align="center">
											<cps:button value="新增"
												onclick="addWlsqItem(this,'table_sqwz','wlsq.sqwzList','sqwz')"
												id="sqwz_0"></cps:button>
										</th>
									</c:if>
								</tr>

								<tr id="sqwz" style="display: none">
									<td align="center">
										<input type="hidden" name="id" disabled="disabled" />
										<input type="hidden" name="wlsqbh" disabled="disabled" />
										<cps:textfield name="wzmc" maxlength="75" disabled="true" />
									</td>
									<td align="center">
										<cps:textfield name="wz" required="true" maxlength="100"
											inputType="onlychar" disabled="true" />
									</td>
									<td align="center">
										<cps:textfield name="wzjsdw" maxlength="60" disabled="true" />
									</td>
									<td align="center">
										<cps:textfield name="wzglrxm" maxlength="15" disabled="true" />
									</td>
									<td align="center">
										<cps:textfield name="glrlxdh" isPhone="true" maxlength="20"
											inputType="onlychar" disabled="true" />
									</td>
									<td id="td_wzopt00" align="center">
										<cps:button value="删除" onclick="deleteWlsqItem(this)"></cps:button>
									</td>
								</tr>

								<c:if test="${!(wlsq.opertype eq 'add')}">
									<c:forEach items="${wlsq.sqwzList}" var="sqwz" varStatus="s">
										<tr>
											<td align="center">
												<input type="hidden" name="wlsq.sqwzList[${s.index}].id"
													value="${sqwz.id}" id="sqwz_id_${s.index}" />
												<input type="hidden" name="wlsq.sqwzList[${s.index}].wlsqbh"
													value="${sqwz.wlsqbh}" id="sqwz_wlsqbh_${s.index}"/>
												<cps:textfield name="wlsq.sqwzList[${s.index}].wzmc"
													maxlength="75" value="${sqwz.wzmc}" id="sqwz_wzmc_${s.index}" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqwzList[${s.index}].wz"
													required="true" maxlength="100" inputType="onlychar"
													value="${sqwz.wz}" id="sqwz_wz_${s.index}" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqwzList[${s.index}].wzjsdw"
													maxlength="60" value="${sqwz.wzjsdw}" id="sqwz_wzjsdw_${s.index}" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqwzList[${s.index}].wzglrxm"
													maxlength="15" value="${sqwz.wzglrxm}" id="sqwz_wzglrxm_${s.index}" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqwzList[${s.index}].glrlxdh"
													isPhone="true" maxlength="20" inputType="onlychar"
													value="${sqwz.glrlxdh}" id="sqwz_glrlxdh_${s.index}" />
											</td>
											<c:if test="${!(wlsq.opertype eq 'detail')}">
												<td id="td_wzopt00" align="center">
													<cps:button value="删除" onclick="deleteWlsqItem(this)"></cps:button>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdContent colspan="6">
							<table class="cps-tablegrid" style="width: 100%" id="table_sqlt">
								<tr>
									<th align="center" width="18%">
										社区论坛名称
									</th>
									<th align="center" width="18%">
										论坛网址
									</th>
									<th align="center" width="18%">
										<font color="red">*</font>论坛版主ID
									</th>
									<th align="center" width="18%">
										版主姓名
									</th>
									<th align="center" width="18%">
										版主电话
									</th>
									<c:if test="${!(wlsq.opertype eq 'detail')}">
										<th align="center">
											<cps:button value="新增" id="sqlt_0"
												onclick="addWlsqItem(this,'table_sqlt','wlsq.sqLtList','sqlt')"></cps:button>
										</th>
									</c:if>
								</tr>
								<tr id="sqlt" style="display: none">
									<td align="center">
										<input type="hidden" name="id" disabled="disabled" />
										<input type="hidden" name="wlsqbh" disabled="disabled" />

										<cps:textfield name="ltmc" disabled="true" maxlength="75" />
									</td>
									<td align="center">
										<cps:textfield name="ltwz" disabled="true" maxlength="75" />
									</td>
									<td align="center">
										<cps:textfield name="ltbzid" disabled="true" required="true"
											maxlength="50" />
									</td>
									<td align="center">
										<cps:textfield name="ltbzxm" disabled="true" maxlength="15" />
									</td>
									<td align="center">
										<cps:textfield name="bzlxdh" disabled="true" isPhone="true"
											maxlength="20" inputType="onlychar" />
									</td>
									<td align="center">
										<cps:button value="删除" onclick="deleteWlsqItem(this)">
										</cps:button>
									</td>
								</tr>

								<c:if test="${!(wlsq.opertype eq 'add')}">
									<c:forEach items="${wlsq.sqLtList}" var="sqlt" varStatus="s">
										<tr>
											<td align="center">
												<input type="hidden" name="wlsq.sqLtList[${s.index}].id"
													value="${sqlt.id}" id="sqlt_id_${s.index}" />
												<input type="hidden" name="wlsq.sqLtList[${s.index}].wlsqbh"
													value="${sqlt.wlsqbh}" id="sqlt_wlsqbh_${s.index}" />

												<cps:textfield name="wlsq.sqLtList[${s.index}].ltmc"
													value="${sqlt.ltmc}" id="sqlt_ltmc_${s.index}" maxlength="75" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqLtList[${s.index}].ltwz"
													value="${sqlt.ltwz}" id="sqlt_ltwz_${s.index}" maxlength="75" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqLtList[${s.index}].ltbzid"
													value="${sqlt.ltbzid}" id="sqlt_ltbzid_${s.index}" required="true" maxlength="50" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqLtList[${s.index}].ltbzxm"
													value="${sqlt.ltbzxm}" id="sqlt_ltbzxm_${s.index}" maxlength="15" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqLtList[${s.index}].bzlxdh"
													value="${sqlt.bzlxdh}" id="sqlt_bzlxdh_${s.index}" isPhone="true" maxlength="20"
													inputType="onlychar" />
											</td>
											<c:if test="${!(wlsq.opertype eq 'detail')}">
												<td align="center">
													<cps:button value="删除" onclick="deleteWlsqItem(this)">
													</cps:button>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdContent colspan="6">
							<table class="cps-tablegrid" style="width: 100%" id="table_sqqqq">
								<tr>
									<th align="center" width="18%">
										社区QQ群名称
									</th>
									<th align="center" width="18%">
										<font color="red">*</font>QQ群号
									</th>
									<th align="center" width="18%">
										群主QQ
									</th>
									<th align="center">
										群描述
									</th>
									<c:if test="${!(wlsq.opertype eq 'detail')}">
										<th align="center" width="10%">
											<cps:button value="新增" id="sqQQq_0"
												onclick="addWlsqItem(this,'table_sqqqq','wlsq.sqQQqList','sqQQq')"></cps:button>
										</th>
									</c:if>
								</tr>

								<tr id="sqQQq" style="display: none">
									<td align="center">
										<input type="hidden" name="id" disabled="disabled" />
										<input type="hidden" name="wlsqbh" disabled="disabled" />

										<cps:textfield name="qqqmc" disabled="true" maxlength="75" />
									</td>
									<td align="center">
										<cps:textfield name="qqqh" disabled="true" required="true"
											maxlength="20" inputType="onlychar" />
									</td>
									<td align="center">
										<cps:textfield name="qzhm" disabled="true" maxlength="20"
											inputType="onlychar" />
									</td>
									<td align="center">
										<cps:textfield name="qqqms" disabled="true" maxlength="150" />
									</td>
									<td align="center">
										<cps:button value="删除" onclick="deleteWlsqItem(this)"></cps:button>
									</td>
								</tr>

								<c:if test="${!(wlsq.opertype eq 'add')}">
									<c:forEach items="${wlsq.sqQQqList}" var="sqQQq" varStatus="s">
										<tr>
											<td align="center">
												<input type="hidden" name="wlsq.sqQQqList[${s.index}].id"
													value="${sqQQq.id}" id="sqQQq_id_${s.index}" />
												<input type="hidden"
													name="wlsq.sqQQqList[${s.index}].wlsqbh"
													value="${sqQQq.wlsqbh}" id="sqQQq_wlsqbh_${s.index}" />

												<cps:textfield name="wlsq.sqQQqList[${s.index}].qqqmc"
													value="${sqQQq.qqqmc}" id="sqQQq_qqqmc_${s.index}" maxlength="75" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqQQqList[${s.index}].qqqh"
													value="${sqQQq.qqqh}" id="sqQQq_qqqh_${s.index}" required="true" maxlength="20"
													inputType="onlychar" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqQQqList[${s.index}].qzhm"
													value="${sqQQq.qzhm}" id="sqQQq_qzhm_${s.index}" maxlength="20" inputType="onlychar" />
											</td>
											<td align="center">
												<cps:textfield name="wlsq.sqQQqList[${s.index}].qqqms"
													value="${sqQQq.qqqms}" id="sqQQq_qqqms_${s.index}" maxlength="150" />
											</td>
											<c:if test="${!(wlsq.opertype eq 'detail')}">
												<td align="center">
													<cps:button value="删除" onclick="deleteWlsqItem(this)"></cps:button>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input id="djrjh" name="wlsq.djrjh" value="${wlsq.djrjh }"
								type="hidden" />
							<cps:textfield id="djrxm" name="wlsq.djrxm" value="${wlsq.djrxm}"
								readonly="true" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djsj" name="wlsq.djsj" value="${wlsq.djsj}"
								readonly="true" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djdwmc" name="wlsq.djdwmc"
								value="${wlsq.djdwmc }" readonly="true" />
							<input id="djdwdm" name="wlsq.djdwdm" type="hidden"
								value="${wlsq.djdwdm }" />
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdLabel cssStyle="width:13%">操作人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input type="hidden" name="wlsq.czbs" value="${wlsq.czbs}" />
							<cps:textfield id="czrxm" name="wlsq.czrxm" value="${wlsq.czrxm}"
								readonly="true" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">操作时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="czsj" name="wlsq.czsj" value="${wlsq.czsj}"
								readonly="true" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">操作单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="czdwmc" name="wlsq.czdwmc"
								value="${wlsq.czdwmc}" readonly="true" />
							<input id="czdwdm" name="wlsq.czdwdm" type="hidden"
								value="${wlsq.czdwdm }" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</div>
	</creator:panel>
	<script type="text/javascript" src="${contextPath}/jsp/zagl/js/wlsq.js">
</script>
</creator:view>