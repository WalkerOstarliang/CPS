<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:table>
	<cps:row>
		<cps:tdLabel width="12%">单位名称：</cps:tdLabel>
		<cps:tdContent width="20%">
			${dwBean.dwjbxx.dwmc}&nbsp;
		</cps:tdContent>
		
		<cps:tdLabel width="12%">组织机构代码：</cps:tdLabel>
		<cps:tdContent width="18%">
			${dwBean.dwjbxx.dwdm}&nbsp;
		</cps:tdContent>
		<cps:tdLabel width="10%">营业执照号：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.yyzzbh}&nbsp;
		</cps:tdContent>
		
	</cps:row>
	<cps:row>
		<cps:tdLabel>法人身份证：</cps:tdLabel>
		<cps:tdContent >
			${dwBean.dwjbxx.frsfzhm}&nbsp;
		</cps:tdContent>

		<cps:tdLabel>法人姓名：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.frdb}&nbsp;
		</cps:tdContent>
		<cps:tdLabel>法人联系电话：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.frlxdh}&nbsp;
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>单位类别：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.dwlbxlmc}&nbsp;
		</cps:tdContent>
		
		<cps:tdLabel>单位电话：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.dwdh}&nbsp;
		</cps:tdContent>
		<cps:tdLabel>单位传真：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.dwcz}&nbsp;
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>税务登记号：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.swdjh}&nbsp;
		</cps:tdContent>
		<cps:tdLabel>开业日期：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.kyrq}&nbsp;
		</cps:tdContent>
			
		<cps:tdLabel>从业人数(人)：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.cyrs}&nbsp;
		</cps:tdContent>
	</cps:row>
		
	<cps:row>
		<cps:tdLabel>注册日期：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.zcrq}&nbsp;
		</cps:tdContent>

		<cps:tdLabel>注册资本(万元)：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.zczb}&nbsp;
		</cps:tdContent>

		<cps:tdLabel>注册地址：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.zcdz}&nbsp;
		</cps:tdContent>
	</cps:row>
	<cps:row>
		
		<cps:tdLabel>外文名称：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.wwm}&nbsp;
		</cps:tdContent>
		<cps:tdLabel>营业执照发照日期：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.fzrq}&nbsp;
		</cps:tdContent>
		<cps:tdLabel>执照有效期：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.yxqx}&nbsp;
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>保密级别：</cps:tdLabel>
		<cps:tdContent >
			${dwBean.dwjbxx.bmjbmc}&nbsp;
		</cps:tdContent>
		<cps:tdLabel>经营范围：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.jyfw}&nbsp;
		</cps:tdContent>
		<cps:tdLabel>备注：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.bz}&nbsp;
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>单位地址：</cps:tdLabel>
		<cps:tdContent colspan="5">
			${dwBean.fwBean.dzmc}&nbsp;
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>单位属性：</cps:tdLabel>
		<cps:tdContent colspan="5">
			${dwBean.dwjbxx.hylbmc}&nbsp;
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>注销标识：</cps:tdLabel>
		<cps:tdContent>
			<c:if test="${dwBean.dwjbxx.zxbs == '0'}">
				正常
			</c:if>
			<c:if test="${dwBean.dwjbxx.zxbs == '1'}">
				注销
			</c:if>
			&nbsp;
		</cps:tdContent>

		<cps:tdLabel>注销日期：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.zxrq}&nbsp;
		</cps:tdContent>
		<cps:tdLabel>注销原因：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.zxyy}&nbsp;
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>登记人：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.djrxm}&nbsp;
		</cps:tdContent>
		<cps:tdLabel>登记时间：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.djsj}&nbsp;
		</cps:tdContent>
		<cps:tdLabel>登记单位：</cps:tdLabel>
		<cps:tdContent>
			${dwBean.dwjbxx.djdwmc}&nbsp;
		</cps:tdContent>
	</cps:row>
</cps:table>
