<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
<creator:Script src="/jsp/lsgl/js/zdryzkdjtj.js"></creator:Script>
    <form id="queryForm">    
    	<input id="citygajgjgdm" type="hidden" name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm}"  />
    	<input id="countrygajgjgdm" type="hidden" name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm}"  />
    	<input id="pcsdm" type="hidden" name="queryBean.pcsdm" value="${queryBean.pcsdm}"  />
    	<input id="jwsqdm" type="hidden" name="queryBean.jwsqdm" value="${queryBean.jwsqdm}"  />
    	<input id="sqdm" type="hidden" name="queryBean.sqdm" value="${queryBean.sqdm}"  />
    	<input id="dxlb" type="hidden" name="queryBean.dxlb" value="${queryBean.dxlb}"  />
    	<input id="djdateStart" type="hidden" name="queryBean.djdateStart" value="${queryBean.djdateStart}"  />
    	<input id="djdateEnd" type="hidden" name="queryBean.djdateEnd" value="${queryBean.djdateEnd}"  />
    	<input id="zdryxm" type="hidden" name="queryBean.zdryxm" value="${queryBean.zdryxm}"  />
    	<input id="zdrysfzh" type="hidden" name="queryBean.zdrysfzh" value="${queryBean.zdrysfzh}"  />
        <input id="tjjb" type="hidden" name="queryBean.tjjb" value="${queryBean.tjjb}"  />
        <input id="orgcode" type="hidden" name="queryBean.orgcode" value="${queryBean.orgcode}"  />
    </form>
	<cps:tableGrid  url="/lsgl/zdryzkdjtj/querZdryZkdjsxxxx.action" title="重点人员在控登记列表"
			id="zdryzkdjtjList"  pageSize="15" width="99.8%" 
			searchform="queryForm" autothead="false" mutilSelect="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true" expand="false"></cps:column>
			<cps:column field="zkdjtjcz" title="操作" align="left"></cps:column>
			<cps:column field="xm" title="重点人员姓名" align="left" ></cps:column>
			<cps:column field="sfzh"   title="重点人员身份证号" maxlength="18" align="left"></cps:column>
			<cps:column field="hjdxz" title="户籍地详址" maxlength="15"></cps:column>
			<cps:column field="xzzxz" title="现住址详址" maxlength="15" align="left"></cps:column>
			<cps:column field="sszrdwmc" title="所属责任单位名称" maxlength="10" align="left"></cps:column>
			<cps:column field="zdrybh" title="重点人员编号" maxlength="10" align="left"></cps:column>
		</cps:tableGrid> 
</creator:view>