package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;

/**
 * 从业人员派发列表使用的Bean
 */
public class CyryPfListBean extends DwcyryBean {

	private static final long serialVersionUID = 4547447457767110867L;
	
	private String cz;

	public String getCz() {
		LoginInfo login = ActionContextHelper.getLoginInfo();
		if(login.getLeve() == 4)
		{
			if(login.getPcsdm().equals(super.getJzdpcsdm()) && ("".equals(super.getJzdsqdm()) || super.getJzdsqdm() == null) && super.getPfsj() == null)
			{
				cz = "<span class=\"cps_span_href\" onclick=\"openCyryPfWin('" + super.getCyrybh() + "')\">派发</span>&nbsp;";
			}
		}
		else
		{
			cz = "<font color=\"red\">需所领导派发</font>";
		}
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
}
