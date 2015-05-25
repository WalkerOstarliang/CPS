<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<c:if test="${not empty sqjbqkList}">
	<c:forEach items="${sqjbqkList}" var="sqjbqkBean">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%" cssClass="changetablebgcolor">常住人口：</cps:tdLabel>
				<cps:tdContent width="15%"><span id="czrks">${sqjbqkBean.czrks}</span></cps:tdContent>
				<cps:tdLabel width="10%" cssClass="changetablebgcolor">流动人口：</cps:tdLabel>
				<cps:tdContent width="15%"><span id="zzrks">${sqjbqkBean.zzrks}</span></cps:tdContent>
				<cps:tdLabel width="10%" cssClass="changetablebgcolor">寄住人口：</cps:tdLabel>
				<cps:tdContent width="15%"><span id="czrkhs">${sqjbqkBean.czrkhs}</span></cps:tdContent>
				<cps:tdLabel width="10%" cssClass="changetablebgcolor">境外人口：</cps:tdLabel>
				<cps:tdContent width="15%"><span id="rhfls">${sqjbqkBean.rhfls}</span></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssClass="changetablebgcolor">重点人口：</cps:tdLabel>
				<cps:tdContent><span id="zdrks">${sqjbqkBean.zdrks}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">在逃人数：</cps:tdLabel>
				<cps:tdContent><span id="ztrys">${sqjbqkBean.ztrys}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">吸毒人口：</cps:tdLabel>
				<cps:tdContent><span id="xdrks">${sqjbqkBean.xdrks}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">精神病人：</cps:tdLabel>
				<cps:tdContent><span id="gzdxs">${sqjbqkBean.gzdxs}</span></cps:tdContent>
			</cps:row>
		 	<cps:row>
				<cps:tdLabel cssClass="changetablebgcolor">特种行业：</cps:tdLabel>
				<cps:tdContent><span id="tzhys">${sqjbqkBean.tzhys}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">公共场所：</cps:tdLabel>
				<cps:tdContent><span id="ggcss">${sqjbqkBean.ggcss}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">娱乐场所：</cps:tdLabel>
				<cps:tdContent><span id="ylcss">${sqjbqkBean.ylcss}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">内保单位：</cps:tdLabel>
				<cps:tdContent><span id="nbdws">${sqjbqkBean.nbdws}</span></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssClass="changetablebgcolor">危险品单位：</cps:tdLabel>
				<cps:tdContent><span id="wbdws">${sqjbqkBean.wbdws}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">重点单位数：</cps:tdLabel>
				<cps:tdContent><span id="zddws">${sqjbqkBean.zddws}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">学校：</cps:tdLabel>
				<cps:tdContent><span id="xxs">${sqjbqkBean.xxs}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">幼儿园：</cps:tdLabel>
				<cps:tdContent><span id="yrys">${sqjbqkBean.yrys}</span></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssClass="changetablebgcolor">旅馆数：</cps:tdLabel>
				<cps:tdContent><span id="lds">${sqjbqkBean.lds}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">网吧数：</cps:tdLabel>
				<cps:tdContent><span id="wbs">${sqjbqkBean.wbs}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">出租房屋数：</cps:tdLabel>
				<cps:tdContent><span id="czfws">${sqjbqkBean.czfws}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">巡逻队数：</cps:tdLabel>
				<cps:tdContent><span id="ywxdls">${sqjbqkBean.ywxdls}</span></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel cssClass="changetablebgcolor">治保会：</cps:tdLabel>
				<cps:tdContent><span id="zbhs">${sqjbqkBean.zbhs}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">社区干部：</cps:tdLabel>
				<cps:tdContent><span id="sqgbs">${sqjbqkBean.sqgbs}</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">&nbsp;</cps:tdLabel>
				<cps:tdContent><span>&nbsp;</span></cps:tdContent>
				<cps:tdLabel cssClass="changetablebgcolor">&nbsp;</cps:tdLabel>
				<cps:tdContent><span>&nbsp;</span></cps:tdContent>
			</cps:row>
		</cps:table>
	</c:forEach>
</c:if>
<c:if test="${empty sqjbqkList}">
	<font color="red">没有找到相关社区</font>
</c:if>