<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<creator:Script src="/jsp/zagl/pages/nbgl/js/nbtj.js"></creator:Script>
	<cps:table>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center" rowspan="3">序号</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="3">单位名称</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="3">共计发案</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" colspan="5">刑事案件种类</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" colspan="10">各业务线</cps:tdLabel>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center" colspan="3">盗窃</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">抢劫<br/>抢夺</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">其他</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">党政<br/>机关</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" colspan="2">学校</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">医院</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">商场</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">大型<br/>企业</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">金融<br/>机构</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">三电<br/>油气</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">重点<br/>工程</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">其他</cps:tdLabel>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center">扒窃</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">入室盗窃</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">其他盗窃</cps:tdLabel>
			
			<cps:tdLabel cssStyle="text-align:center">高校</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">中小学校</cps:tdLabel>
		</cps:row>
		<c:forEach items="${nbdwfatj}" var="nbdwfa" varStatus="s">
			<cps:row>
				<cps:tdContent cssStyle="text-align:center;">${s.index + 1}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:left;">
					<c:choose>
						<c:when test="${(not empty nbdwfa.orgcode) and (nbdwfa.orgleve < 5)}">
							<span class="cps_span_href" onclick="nbdwfatjDown('${nbdwfa.orgcode}')" style="color:green">${nbdwfa.orgname}</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.orgname}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.fazs >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.fazs}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.fazs}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.pq >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','','','${query.tjsj_start}','${query.tjsj_end}','1','nbdw')" style="color:green">
								${nbdwfa.pq}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.pq}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.rsdq >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','','','${query.tjsj_start}','${query.tjsj_end}','2','nbdw')" style="color:green">
								${nbdwfa.rsdq}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.rsdq}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.qtdq >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','','','${query.tjsj_start}','${query.tjsj_end}','3','nbdw')" style="color:green">
								${nbdwfa.qtdq}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.qtdq}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.qjqd >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','','','${query.tjsj_start}','${query.tjsj_end}','4','nbdw')" style="color:green">
								${nbdwfa.qjqd}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.qjqd}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.qtaj >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','','','${query.tjsj_start}','${query.tjsj_end}','5','nbdw')" style="color:green">
								${nbdwfa.qtaj}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.qtaj}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.dzjg >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','001','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.dzjg}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.dzjg}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.gx >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','002','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.gx}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.gx}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.zxx >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','003','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.zxx}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.zxx}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.yy >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','004','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.yy}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.yy}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.sc >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','005','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.sc}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.sc}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.qy >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','006','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.qy}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.qy}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.yh >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','007','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.yh}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.yh}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.sdyq >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','008','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.sdyq}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.sdyq}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.zdgc >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','009','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.zdgc}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.zdgc}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center;">
					<c:choose>
						<c:when test="${(nbdwfa.qt >0) and (not empty nbdwfa.orgcode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${nbdwfa.orgcode}','','099','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${nbdwfa.qt}
							</span>
						</c:when>
						<c:otherwise>
							${nbdwfa.qt}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</c:forEach>
	</cps:table>
</creator:view>