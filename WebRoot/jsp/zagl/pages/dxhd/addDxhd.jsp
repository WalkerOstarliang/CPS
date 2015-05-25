<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view>
	<creator:Script src="/jsp/zagl/js/dxhd.js"></creator:Script>
	<creator:tbar id="opBar">
		<c:if test="${dxhdBean.czbs ne 'detail'}">
			<cps:button value="保存" onclick="addDxhd();"></cps:button>
		</c:if>
		<cps:button value="关闭" onclick="window.close();"></cps:button>
	</creator:tbar>
	<div id="head_djdxhd">
		<creator:panel id="dxhd" title="治安大型活动" tbarId="opBar">
			<form id="add_dxhd_form" action="${contextPath}/dxhd/addDxhd.action"
				method="post">
				<c:if test="${dxhdBean.czbs eq '1'}">
					<c:set var="opertype" value="add" />
				</c:if>
				<c:if test="${dxhdBean.czbs eq '2'}">
					<c:set var="opertype" value="update" />
				</c:if>
				
				<input type="hidden" name="modename" value="治安大型活动" />
				<input type="hidden" name="opertype" value="${opertype}" />
				
				<input type="hidden" id="hdbh" name="dxhdBean.hdbh"
					value="${dxhdBean.hdbh }" />
				<input type="hidden" id="czbs" name="dxhdBean.czbs"
					value="${dxhdBean.czbs }" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">
							<font color="red">*</font>活动名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.hdmc}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="hdmc" name="dxhdBean.hdmc" maxlength="50"
										value="${dxhdBean.hdmc }" cssClass="validate[required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="13%">
							<font color="red">*</font>活动性质：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.hdxzmc}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:select id="hdxz" name="dxhdBean.hdxz"
										value="${dxhdBean.hdxz }" cssClass="validate[required]"
										zdlb="HD_HDXZ" headerKey="" headerValue="--选择--"></cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="13%">活动规模：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.hdgm}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="hdgm" name="dxhdBean.hdgm" maxlength="20"
										value="${dxhdBean.hdgm}"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel >场馆名称：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.cgmc}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="cgmc" name="dxhdBean.cgmc" maxlength="50"
										value="${dxhdBean.cgmc }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel >
							<font color="red">*</font>举办起始时间：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.jbqssj}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:date id="jbqssj" name="dxhdBean.jbqssj"
										value="${dxhdBean.jbqssj }" dateFmt="yyyy-MM-dd HH:mm:ss"
										cssClass="validate[required]" 
										maxDate="jbjzsj">
									</cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel >
							<font color="red">*</font>举办截止时间：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.jbjzsj}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:date id="jbjzsj" name="dxhdBean.jbjzsj"
										value="${dxhdBean.jbjzsj }" dateFmt="yyyy-MM-dd HH:mm:ss"
										cssClass="validate[required]"
										minDate="jbqssj">
									</cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>场馆地址：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.cgdz}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="cgdz" name="dxhdBean.cgdz" maxlength="60" cssStyle="width:93%"
										value="${dxhdBean.cgdz }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>活动区域：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.hdqy}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="hdqy" name="dxhdBean.hdqy" maxlength="500" cssStyle="width:93%"
										value="${dxhdBean.hdqy }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>线路：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.xl}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="xl" name="dxhdBean.xl" maxlength="150" cssStyle="width:93%"
										value="${dxhdBean.xl }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel >每场限员：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.mcxy}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="mcxy" name="dxhdBean.mcxy" maxlength="5"
										inputType="integer" value="${dxhdBean.mcxy }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(人)</font>
						</cps:tdContent>
						<cps:tdLabel >门票销售量：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.mpxsl}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="mpxsl" name="dxhdBean.mpxsl" maxlength="10"
										inputType="integer" value="${dxhdBean.mpxsl }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(张)</font>
						</cps:tdContent>
						<cps:tdLabel >安全通道数：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.aqtds}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="aqtds" name="dxhdBean.aqtds" maxlength="3"
										inputType="integer" value="${dxhdBean.aqtds }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(条)</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel >保安：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.bars}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="bars" name="dxhdBean.bars" maxlength="5"
										inputType="integer" value="${dxhdBean.bars }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(人)</font>
						</cps:tdContent>
						<cps:tdLabel >民警：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.mjrs}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="mjrs" name="dxhdBean.mjrs" maxlength="5"
										inputType="integer" value="${dxhdBean.mjrs }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(人)</font>
						</cps:tdContent>
						<cps:tdLabel >防暴车：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.fbcs}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="fbcs" name="dxhdBean.fbcs"  maxlength="3"
										inputType="integer" value="${dxhdBean.fbcs }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(辆)</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel >警犬数：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.jqs}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="jqs" name="dxhdBean.jqs" inputType="integer"  maxlength="3"
										value="${dxhdBean.jqs }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(只)</font>
						</cps:tdContent>
						<cps:tdLabel >消防车：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.xfcs}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="xfcs" name="dxhdBean.xfcs"  maxlength="3"
										inputType="integer" value="${dxhdBean.xfcs }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(辆)</font>
						</cps:tdContent>
						<cps:tdLabel >车辆：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.cls}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="cls" name="dxhdBean.cls" inputType="integer"  maxlength="3"
										value="${dxhdBean.cls }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(辆)</font>
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdLabel >其他器材数：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.qtqcs}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="qtqcs" name="dxhdBean.qtqcs"  maxlength="4"
										inputType="integer" value="${dxhdBean.qtqcs }"
										cssClass="validate[onlyNumberSp]"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(件)</font>
						</cps:tdContent>

						<cps:tdLabel >现场秩序：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.xccxmc}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:select id="xccx" name="dxhdBean.xccx"
										value="${dxhdBean.xccx }" headerKey="" headerValue="--选择--"
										zdlb="HD_XCCX"></cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>

						<cps:tdLabel >安检次数：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.ajcs}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="ajcs" name="dxhdBean.ajcs"  maxlength="3"
										inputType="integer" value="${dxhdBean.ajcs }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(次)</font>
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdLabel >市级领导：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.cjsjld}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="cjsjld" name="dxhdBean.cjsjld"
										maxlength="100" value="${dxhdBean.cjsjld }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>省级领导：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.cjstld}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="cjstld" name="dxhdBean.cjstld" 
										maxlength="100" value="${dxhdBean.cjstld }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>

						<cps:tdLabel >情况是否正常：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.qksfzcmc}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:select id="qksfzc" name="dxhdBean.qksfzc" zdlb="HD_QKSFZC"
										headerKey="" value="${dxhdBean.qksfzc }" headerValue="--选择--"></cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdLabel >治安案件：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.zaajs}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="zaajs" name="dxhdBean.zaajs"
										value="${dxhdBean.zaajs }" inputType="integer"
										cssClass="validate[onlyNumberSp]"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(件)</font>
						</cps:tdContent>

						<cps:tdLabel >刑事案件：</cps:tdLabel>
						<cps:tdContent >
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.xsajs}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="xsajs" name="dxhdBean.xsajs"
										inputType="integer" value="${dxhdBean.xsajs }"></cps:textfield>
								</c:otherwise>
							</c:choose>
							<font color="black">(件)</font>
						</cps:tdContent>

						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>&nbsp;</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdLabel>参与单位：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.cydw}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield type="textarea" id="cydw" name="dxhdBean.cydw" maxlength="1000"
										cssStyle="height:50px" value="${dxhdBean.cydw }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>牵头单位：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.qtdw}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield type="textarea" id="qtdw" name="dxhdBean.qtdw" maxlength="100"
										cssStyle="height:50px" value="${dxhdBean.qtdw }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel >举办结果：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.jbjg}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield type="textarea" id="jbjg" name="dxhdBean.jbjg" maxlength="1500"
										cssStyle="height:50px" value="${dxhdBean.jbjg }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						
						
					</cps:row>
					<cps:row>
						<cps:tdLabel>消防意见：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.xfyj}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield type="textarea" id="xfyj" name="dxhdBean.xfyj" maxlength="500"
										cssStyle="height:50px" value="${dxhdBean.xfyj }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						
						<cps:tdLabel>交管意见：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.jgyj}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield type="textarea" id="jgyj" name="dxhdBean.jgyj" maxlength="500"
										cssStyle="height:50px" value="${dxhdBean.jgyj }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						
						<cps:tdLabel>处理情况：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.clqk}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield type="textarea" id="clqk" name="dxhdBean.clqk" maxlength="1500"
										cssStyle="height:50px" value="${dxhdBean.clqk }"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
 
				</cps:table>
				<fieldset>
					<legend>
						主/承办单位信息
					</legend>
					<cps:table>
						<cps:row>
							<cps:tdLabel width="13%"><font color="red">*</font>主办单位：</cps:tdLabel>
							<cps:tdContent width="20%">
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.zbdw}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="zbdw" name="dxhdBean.zbdw" maxlength="100" required="true"
											value="${dxhdBean.zbdw }"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel width="13%"><font color="red">*</font>主办单位联系人：</cps:tdLabel>
							<cps:tdContent width="20%">
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.zbdwlxr}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="zbdwlxr" name="dxhdBean.zbdwlxr" required="true"
											maxlength="15" value="${dxhdBean.zbdwlxr }"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel width="13%"><font color="red">*</font>主办单位联系电话：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.zbdwlxrdh}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="zbdwlxrdh" name="dxhdBean.zbdwlxrdh" required="true"
											maxlength="20" minlength="7" isPhone="true" value="${dxhdBean.zbdwlxrdh}"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel width="13%">主办单位法人：</cps:tdLabel>
							<cps:tdContent width="20%">
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.zbdwfrdb}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="zbdwfrdb" name="dxhdBean.zbdwfrdb"
											maxlength="15" value="${dxhdBean.zbdwfrdb }"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent>&nbsp;</cps:tdContent>
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent>&nbsp;</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel ><font color="red">*</font>承办单位：</cps:tdLabel>
							<cps:tdContent >
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.cbdw}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="cbdw" name="dxhdBean.cbdw" maxlength="100" required="true"
											value="${dxhdBean.cbdw }"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							
							<cps:tdLabel ><font color="red">*</font>承办单位联系人：</cps:tdLabel>
							<cps:tdContent >
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.cbdwlxr}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="cbdwlxr" name="dxhdBean.cbdwlxr" required="true"
											maxlength="15" value="${dxhdBean.cbdwlxr }"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							
							<cps:tdLabel width="13%"><font color="red">*</font>承办单位联系电话：</cps:tdLabel>
							<cps:tdContent >
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.cbdwlxrdh}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="cbdwlxrdh" name="dxhdBean.cbdwlxrdh" required="true"
											maxlength="20" minlength="7" isPhone="true" value="${dxhdBean.cbdwlxrdh }">
										</cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>

						<cps:row>
							<cps:tdLabel>承办单位法人：</cps:tdLabel>
							<cps:tdContent >
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.cbdwfrdb}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="cbdwfrdb" name="dxhdBean.cbdwfrdb"
											maxlength="15" value="${dxhdBean.cbdwfrdb }"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent>
								&nbsp;
							</cps:tdContent>
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent>
								&nbsp;
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</fieldset>
				
				<fieldset>
					<legend>
						审查信息
					</legend>
					<cps:table>
						<cps:row>
							<cps:tdLabel width="13%">受理人：</cps:tdLabel>
							<cps:tdContent width="20%">
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.slr}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="slr" name="dxhdBean.slr" maxlength="15"
											value="${dxhdBean.slr }"></cps:textfield>
									</c:otherwise>
								</c:choose>

							</cps:tdContent>
							<cps:tdLabel width="13%">审查人：</cps:tdLabel>
							<cps:tdContent width="20%">
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.scr}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="scr" name="dxhdBean.scr" maxlength="15"
											value="${dxhdBean.scr }"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel width="13%">审核日期：</cps:tdLabel>
							<cps:tdContent width="20%">
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.shrq}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:date id="shrq" name="dxhdBean.shrq"
											value="${dxhdBean.shrq}" dateFmt="yyyy-MM-dd">
										</cps:date>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel >审核结果：</cps:tdLabel>
							<cps:tdContent >
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.shjgmc}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:select id="shjg" name="dxhdBean.shjg" zdlb="ZDRY_CLJG"
											headerKey="" headerValue="--选择--" value="${dxhdBean.shjg }"></cps:select>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel >审核意见：</cps:tdLabel>
							<cps:tdContent >
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.shyj}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="shyj" name="dxhdBean.shyj" maxlength="200"
											value="${dxhdBean.shyj }"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel >审核单位：</cps:tdLabel>
							<cps:tdContent >
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.shdwmc}&nbsp;
								</c:when>
									<c:otherwise>
										<input type="hidden" id="shdwdm" name="dxhdBean.shdwdm"
											value="${dxhdBean.shdwdm }" />
										<cps:textfield id="shdwmc" name="dxhdBean.shdwmc"
											value="${dxhdBean.shdwmc }"
											onclick="selectDw('430000000000','shdwdm','shdwmc')" appendPopuBtn="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</fieldset>

				

				<fieldset>
					<legend>
						操作信息
					</legend>
					<cps:table>
						<cps:row>
							<cps:tdLabel width="13%">登记人：</cps:tdLabel>
							<cps:tdContent width="20%">
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.djrxm}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="djrxm" name="dxhdBean.djrxm"
											value="${dxhdBean.djrxm}" readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel width="13%">登记时间：</cps:tdLabel>
							<cps:tdContent width="20%">
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.djrq}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="djrq" name="dxhdBean.djrq"
											value="${dxhdBean.djrq}"
											readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel width="13%">登记单位：</cps:tdLabel>
							<cps:tdContent width="20%">
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.djdwmc}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield id="djdwmc" name="dxhdBean.djdwmc"
											value="${dxhdBean.djdwmc}" readonly="true"></cps:textfield>
										<input id="djdwdm" name="dxhdBean.djdwdm" type="hidden"
											value="${dxhdBean.djdwdm }" />
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>

						<cps:row>
							<cps:tdLabel>操作人：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.czrxm}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield name="dxhdBean.czrxm" value="${dxhdBean.czrxm}"
											readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>

							<cps:tdLabel>操作时间：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.czsj}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield name="dxhdBean.czsj" value="${dxhdBean.czsj}"
											readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>

							<cps:tdLabel>操作单位：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${dxhdBean.czbs == 'detail'}">
									${dxhdBean.czdwmc}&nbsp;
								</c:when>
									<c:otherwise>
										<cps:textfield name="dxhdBean.czdwmc"
											value="${dxhdBean.czdwmc}" readonly="true"></cps:textfield>
										<input type="hidden" name="dxhdBean.czdwdm"
											value="${dxhdBean.czdwdm}" />
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</fieldset>
			</form>
		</creator:panel>
	</div>
</creator:view>