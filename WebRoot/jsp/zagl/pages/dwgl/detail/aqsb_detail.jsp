<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<cps:table>
		<cps:row>
			<cps:tdLabel width="15%">宣传牌：</cps:tdLabel>
			<cps:tdContent width="18%">
				<c:choose>
					<c:when test="${dw.aqsb.xcp eq '0'}">
						无
					</c:when>
					<c:when test="${dw.aqsb.xcp eq '1'}">
						有
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			
			<cps:tdLabel width="15%">亮照经营：</cps:tdLabel>
			<cps:tdContent width="18%">
				<c:choose>
					<c:when test="${dw.aqsb.lzjy eq '0'}">
						无
					</c:when>
					<c:when test="${dw.aqsb.lzjy eq '1'}">
						有
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			
			<cps:tdLabel width="15%">疏散电梯：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.aqsb.ssdt eq '0'}">
						无
					</c:when>
					<c:when test="${dw.aqsb.ssdt eq '1'}">
						有
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>简易喷淋：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.aqsb.jyplq eq '0'}">
						无
					</c:when>
					<c:when test="${dw.aqsb.jyplq eq '1'}">
						有
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			
			<cps:tdLabel>消火栓：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.aqsb.xhs eq '0'}">
						无
					</c:when>
					<c:when test="${dw.aqsb.xhs eq '1'}">
						有
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			
			<cps:tdLabel>阁楼：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.aqsb.gl eq '0'}">
						无
					</c:when>
					<c:when test="${dw.aqsb.gl eq '1'}">
						有
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>电线套管：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.aqsb.dxtg eq '0'}">
						无
					</c:when>
					<c:when test="${dw.aqsb.dxtg eq '1'}">
						有
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			
			<cps:tdLabel>逃生出口：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.aqsb.tsck eq '0'}">
						无
					</c:when>
					<c:when test="${dw.aqsb.tsck eq '1'}">
						有
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			
			<cps:tdLabel>火灾报警系统：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.aqsb.xcp eq '0'}">
						无
					</c:when>
					<c:when test="${dw.aqsb.xcp eq '1'}">
						有
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>安全出口指示牌：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.aqsb.aqckzsp eq '0'}">
						无
					</c:when>
					<c:when test="${dw.aqsb.aqckzsp eq '1'}">
						有
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			
			<cps:tdLabel>&nbsp;</cps:tdLabel>
			<cps:tdContent>&nbsp;</cps:tdContent>
			
			<cps:tdLabel>逃生梯：</cps:tdLabel>
			<cps:tdContent>
				${dw.aqsb.tst}
				<font color="black">(具)</font>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>监控系统：</cps:tdLabel>
			<cps:tdContent>
				${dw.aqsb.jkxt}
				<font color="black">(个)</font>
			</cps:tdContent>
			
			<cps:tdLabel>视频摄像头：</cps:tdLabel>
			<cps:tdContent>
				${dw.aqsb.spsxt}
				<font color="black">(个)</font>
			</cps:tdContent>
			
			<cps:tdLabel>灭火器：</cps:tdLabel>
			<cps:tdContent>
				${dw.aqsb.mhq}
				<font color="black">(瓶)</font>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.aqsb.bz}&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>	
</creator:view>
