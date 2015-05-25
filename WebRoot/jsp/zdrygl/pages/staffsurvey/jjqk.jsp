<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view>
	<creator:Script src="/jsp/zdrygl/js/staffsurvey.js"></creator:Script>
	<creator:panel id="jjqk" title="动态信息 > 经济情况">
		<form id="jjqkForm" method="post" action="${contextPath }/zdry/staffsurvey_saveStaffsurvey.action?modth=jjqk">
			<input type="hidden" name="jjqk.sfzh" value="${sfzh }" />
			<cps:table>
				<cps:row>
					<cps:tdLabel>是否有固定工作</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="jjqk.isgdgz" id="isgdgz" zdlb="GB_ZT" headerKey="" headerValue="--请选择--" value="${jjqk.isgdgz}"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>是否经济拮据</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="jjqk.isjjjj" id="isjjjj" zdlb="GB_ZT" headerKey="" headerValue="--请选择--" value="${jjqk.isjjjj}"></cps:select>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>消费与收入情况</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="jjqk.xfysrqk" id="xfysrqk" zdlb="ZDRY_XFSRZT" headerKey="" headerValue="--请选择--" value="${jjqk.xfysrqk}"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>是否有购置车</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="jjqk.isygzc" id="isygzc" zdlb="GB_ZT" headerKey="" headerValue="--请选择--" value="${jjqk.isygzc}"></cps:select>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>车牌号码</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="jjqk.hphm" value="${jjqk.hphm}" id="hphm"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>车辆价值</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="jjqk.cljz" value="${jjqk.cljz}" id="cljz"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>是否有购置房</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="jjqk.isygzf" id="isygzf" zdlb="GB_ZT" headerKey="" headerValue="--请选择--" value="${jjqk.isygzf}"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>房屋价值</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="jjqk.fwjz" value="${jjqk.fwjz}" id="fwjz"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>购房地址</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="jjqk.gfdz" value="${jjqk.gfdz}" id="gfdz"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>购房时间</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="jjqk.gfsj" value="${jjqk.gfsj}" id="gfsj"></cps:date>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>年收入</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="jjqk.nsr" value="${jjqk.nsr}" id="nsr"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>购车时间</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="jjqk.gcsj" value="${jjqk.gcsj}" id="gcsj"></cps:date>
					</cps:tdContent>
				</cps:row>
			</cps:table>
			<cps:button onclick="ajaUploadFile('jjqkForm');" value="保存"></cps:button>
		</form>
	</creator:panel>
</creator:view>
