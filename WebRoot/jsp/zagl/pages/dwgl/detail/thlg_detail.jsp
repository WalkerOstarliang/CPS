<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:panel id="thly" title="特行旅馆信息">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%">旅馆名称：</cps:tdLabel>
				<cps:tdContent width="22%">
					${dw.thlgy.lgmc}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="10%">旅馆类型：</cps:tdLabel>
				<cps:tdContent width="25%">
					${dw.thlgy.lglxmc}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel width="10%">旅馆星级：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.lgxjmc}&nbsp;
				</cps:tdContent>
			</cps:row>
	
			<cps:row>
				<cps:tdLabel>是否军队旅馆：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${dw.thlgy.sfjdlg eq '0'}">否</c:when>
						<c:when test="${dw.thlgy.sfjdlg eq '1'}">是</c:when>
						<c:otherwise>&nbsp;</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>旅馆等级：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.lgdjmc}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>旅馆状态：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.lgztmc}&nbsp;
				</cps:tdContent>
			</cps:row>
	
			<cps:row>
				<cps:tdLabel>旅馆是否联网：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${dw.thlgy.lgsflw eq '0'}">否</c:when>
						<c:when test="${dw.thlgy.lgsflw eq '1'}">是</c:when>
						<c:otherwise>&nbsp;</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>旅馆客房数：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.lgkfs}(间)
				</cps:tdContent>
				<cps:tdLabel>旅馆床位数：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.lgcws}(个)
				</cps:tdContent>
			</cps:row>
	
			<cps:row>
				<cps:tdLabel>旅馆车位数：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.lgtcws}(个)
				</cps:tdContent>
				<cps:tdLabel>旅馆楼层数：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.lglcs}(层)
				</cps:tdContent>
				<cps:tdLabel>经营项目：</cps:tdLabel>
				<cps:tdContent >
					${dw.thlgy.jyxm}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>技防设备：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.lgjfsb}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>装机状态：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.zjzt}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>装机方式：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.zjfs}&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>建筑面积：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.jzmj}(㎡)
				</cps:tdContent>
				<cps:tdLabel>门庭面积：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.mtmj}(㎡)
				</cps:tdContent>
				<cps:tdLabel>会客室面积：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.hksmj}(㎡)
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>寄存室面积：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.jcsmj}(㎡)
				</cps:tdContent>
				<cps:tdLabel>停车场面积：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.tcsmj}(㎡)
				</cps:tdContent>
				<cps:tdLabel>库房面积：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.kfmj}(㎡)
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>娱乐场所面积：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.ylcsmj}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>通道宽度：</cps:tdLabel>
				<cps:tdContent>
					${dw.thlgy.tdkd}(m)
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>	
</creator:view>	