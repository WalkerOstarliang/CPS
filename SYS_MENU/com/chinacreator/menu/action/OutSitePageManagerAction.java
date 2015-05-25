package com.chinacreator.menu.action;

import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.menu.bean.MhtjQueryBean;
import com.chinacreator.menu.bean.XqfaqktjBean;
import com.chinacreator.menu.bean.XqqktjBean;
import com.chinacreator.menu.business.MenuManagerBusiness;

/**
 * 外部站点链接管理
 * 
 * @filename OutSitePageManagerAction.java
 * @author mingchun.xiong
 * @date 2013-10-23
 *
 */
public class OutSitePageManagerAction extends CPSBaseAction
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 4205237906468100908L;
	
	private MenuManagerBusiness business;
	private MhtjQueryBean queryBean;
	private List<XqqktjBean> xqqktjBeans;
	private XqfaqktjBean xqfaqktjBean;
	private String orgcode;
	
	private int leve;
	
	public OutSitePageManagerAction()
	{
		super();
		business = new MenuManagerBusiness();
		queryBean = new MhtjQueryBean();
	}
	
	public String toXqjbqkPage()
	{
		return "toXqjbqkPage";
	}
	
	public void loadXqtjXml()
	{
		String xml = null;
		if (ValidateHelper.isNotEmptyString(orgcode))
		{
			xml = business.loadXqqktjXml(orgcode,String.valueOf(leve));
		}
		else
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			xml = business.loadXqqktjXml(loginInfo.getOrgcode(), String.valueOf(loginInfo.getLeve()));
		}
		returnValue(xml,"GBK");
	}
	
	//发案统计
	public String toXqzatjPage()
	{
		xqfaqktjBean = business.queryXqfaqktjBean(queryBean);
		return "toXqzatjPage";
	}
	
	public String queryXqFatj(){
		xqfaqktjBean = new XqfaqktjBean();
		xqfaqktjBean.setByfatjList(business.queryXqajtjList(queryBean));
		return "queryXqFatj";
	}
	
	public String toXxcjtjPage()
	{
		if (ValidateHelper.isEmptyString(queryBean.getParent_dm()))
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			//社区警务室
			if (loginInfo.getLeve() == 5)
			{
				queryBean.setParent_dm(loginInfo.getPcsdm());
				queryBean.setLeve(loginInfo.getLeve());
			}
			//派出所
			else if (loginInfo.getLeve() == 4)
			{
				queryBean.setParent_dm(loginInfo.getCountrygajgdm());
				queryBean.setLeve(loginInfo.getLeve());
			}
			else
			{
				queryBean.setParent_dm(loginInfo.getRootOrgCode());
				queryBean.setLeve(loginInfo.getLeve() + 1);
			}
			orgcode = loginInfo.getRootOrgCode();
			leve = loginInfo.getLeve();
		}
		else
		{
			orgcode = queryBean.getParent_dm();
			if (queryBean.getLeve() == 5)
			{
				queryBean.setParent_dm(queryBean.getParent_dm().substring(0, 8)+"0000");
			}
			leve = queryBean.getLeve() -1;
			
		}
		xqqktjBeans = business.queryMhxqtjBeanList(queryBean);
		queryBean.setLeve(queryBean.getLeve() + 1);
		
		return "toXxcjtjPage";
	}

	public MhtjQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(MhtjQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public List<XqqktjBean> getXqqktjBeans()
	{
		return xqqktjBeans;
	}

	public void setXqqktjBeans(List<XqqktjBean> xqqktjBeans)
	{
		this.xqqktjBeans = xqqktjBeans;
	}

	public String getOrgcode()
	{
		return orgcode;
	}

	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}

	public int getLeve()
	{
		return leve;
	}

	public void setLeve(int leve)
	{
		this.leve = leve;
	}

	public XqfaqktjBean getXqfaqktjBean() {
		return xqfaqktjBean;
	}

	public void setXqfaqktjBean(XqfaqktjBean xqfaqktjBean) {
		this.xqfaqktjBean = xqfaqktjBean;
	}

	 
	
}
