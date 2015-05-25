<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<cps:table>
		<cps:row>
			<cps:tdLabel><font color="red">*</font>场所类别：</cps:tdLabel>
			<cps:tdContent colspan="3">
				${dw.ggcs.cslbmc}&nbsp;${dw.ggcs.csxlmc}
			</cps:tdContent>
			
			<cps:tdLabel>场所等级：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.csdjmc}&nbsp;
			</cps:tdContent>
		</cps:row>

		<cps:row>
			<cps:tdLabel width="10%">场所编号：</cps:tdLabel>
			<cps:tdContent width="23%">
				${dw.ggcs.ggcsbh}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="10%">备案登记号：</cps:tdLabel>
			<cps:tdContent width="23%">
				${dw.ggcs.badjhm}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="10%">领照时间：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.lqzzsj}&nbsp;
			</cps:tdContent>		
		</cps:row>

		<cps:row>
			<cps:tdLabel>核定人数：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.hdrs}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>负责人：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.csfzr}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>负责人电话：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.cslxfs}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>通道口：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.cstdk}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>内部结构：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.csnbjg}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="12%">建筑物结构：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.jzwjg}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>有无小件寄存：</cps:tdLabel>
			<cps:tdContent>
				<c:if test="${dw.ggcs.ywxjjcc eq '1'}">
					有
				</c:if>	
				<c:if test="${dw.ggcs.ywxjjcc eq '0'}">
					无
				</c:if>	
				&nbsp;			
			</cps:tdContent>
			<cps:tdLabel>KTV包间数：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.ktvbjs}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="10%">周围环境：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.zwhj}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>总面积：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.cszmj}(m²)
			</cps:tdContent>
		
			<cps:tdLabel>营业面积：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.yymj}(m²)
			</cps:tdContent>
			
			<cps:tdLabel>公共场所面积：</cps:tdLabel>
			<cps:tdContent>
				${dw.ggcs.yymj}(m²)
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>其他情况：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.ggcs.csqtqk}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.ggcs.bz}&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:view>