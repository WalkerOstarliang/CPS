<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div>
	<cps:tableGrid id="lsjzxxlist1"
					url="/lsgl/rk/queryRkFwglInfoPageByRybh.action?rybh=${queryBean.rybh}"
				    width="99.5%" 
					pageSize="10" 
					autoload="true"
					click="callbackRkJzxxInfo"
		>
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="姓名" field="xm"></cps:column>
		<cps:column title="身份证号" field="sfzh"></cps:column>
		<cps:column title="性别" field="xbms"></cps:column>
		<cps:column title="人员类别" field="rylbms"></cps:column>
		<cps:column title="居住地址" field="dzmc" align="left" maxlength="5"></cps:column>
		<cps:column title="联系方式" field="lxdh"></cps:column>
		<cps:column title="登记单位" field="djdwmc" maxlength="5" align="left"></cps:column>
		<cps:column title="居住时间" field="djsj"></cps:column>
		<cps:column title="注销时间" field="zxsj"></cps:column>
		<cps:column title="注销标识" field="zxbsms"></cps:column>
	</cps:tableGrid>
	<div id="czrkxxPage" style="display:none">
		<%@include file="/jsp/lsgl/pages/rk/czrk/dhrkhkxx.jsp" %>
	</div>
	<div id="ldrkxxPage" style="display:none">
		<%@include file="/jsp/lsgl/pages/rk/zzrk/dqzzxx.jsp" %>
	</div>
	<div id="jzrkxxPage" style="display:none">
		<%@include file="/jsp/lsgl/pages/rk/jzrk/dqjzxx.jsp" %>
	</div>
	<div id="jwrkxxPage" style="display:none">
		<%@include file="/jsp/lsgl/pages/rk/jwrk/dqjzxx.jsp" %>
	</div>
	<div id="wlhrkxxPage" style="display:none">
		<%@include file="/jsp/lsgl/pages/rk/wlczhk/dqwlhxx.jsp" %>
	</div>
</div>

