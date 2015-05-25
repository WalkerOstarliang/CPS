package com.chinacreator.menu.action;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.action.BaseAction;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.menu.bean.MenuBean;
import com.chinacreator.menu.bean.OutSiteMenuBean;
import com.chinacreator.menu.business.MenuManagerBusiness;

public class MenuManagerAction extends BaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2883383827035920924L;
	private MenuManagerBusiness business;
	private List<MenuBean> leftMenuList = new ArrayList<MenuBean>();
	
	private Map<MenuBean, List<MenuBean>> childMenuMap = new LinkedHashMap<MenuBean, List<MenuBean>>();
	private MenuBean menuBean;
	private OutSiteMenuBean outsiteMenuBean;
	private List<OutSiteMenuBean> outSiteMenuBeans;
	private boolean showSelectChk = true;
	private String defaultShowMenuId = null;
	
	public MenuManagerAction()
	{
		super();
		business = new MenuManagerBusiness();
	}
	
	public String toAddMenuPage()
	{
		return "toAddMenuPage";
	}
	
	public String toAddSitePage()
	{
		outSiteMenuBeans = business.queryOutSiteMenuBeans();
		return "toAddSitePage";
	}
	
	public String toOutSiteListPage()
	{
		outSiteMenuBeans = business.queryOutSiteMenuBeans();
		if (outSiteMenuBeans.size() > 10)
		{
			outSiteMenuBeans = outSiteMenuBeans.subList(0, 10);
		}
		return "toOutSiteListPage";
	}
	
	/**
	 * 更新点击次数
	 * 
	 * @date 2013-10-11 下午02:01:41
	 */
	public void updateOutSiteClickNumber()
	{
		business.updateOutSiteMenuBean(outsiteMenuBean.getId());
	}
	
	public String toLeftMenuPage()
	{
		leftMenuList = business.queryOneLevelMenuBeans();
		return "toLeftMenuPage";
	}
	
	public String loadChildMenuMap()
	{
		childMenuMap = business.queryChildMenuMapByOneLevelMenuId(menuBean.getMenuid());
		return "loadChildMenuMap";
	}

	public String showChildMenu()
	{
		childMenuMap = business.queryChildMenuMapByOneLevelMenuId(menuBean.getMenuid());
		return "showChildMenu";
	}
	
	public String updateMenuPage()
	{
		menuBean = business.queryMenuBeanByMenuid(menuBean.getMenuid());
		return toAddThreeMenuPage();
	}
	
	public void saveOutSiteMenuBean()
	{
		boolean temp = business.saveOutSiteMenuBean(outsiteMenuBean);
		responseWrite(temp);
	}
	
	
	public void deleteMenu()
	{
		boolean result = business.deleteMenuBean(menuBean.getMenuid());
		responseWrite(result);
	}
	
	public void deleteOutSiteMenuBean()
	{
		boolean result = business.deleteOutSiteMenuBean(outsiteMenuBean.getId());
		responseWrite(result);
	}
	
	
	public String toAddTwoMenuPage()
	{
		return "toAddTwoMenuPage";
	}
	
	public String toAddThreeMenuPage()
	{
		return "toAddThreeMenuPage";
	}
	
	public void saveMenuBean()
	{
		boolean result = false;
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			result = business.saveMenuBean(menuBean);
		}
		else if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			result = business.updateMenuBean(menuBean);
		}
		responseWrite(result);
	}
	
	public String toSystemShotCutMenu()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		leftMenuList = business.queryShortCutMenuBeans(loginInfo.getSfzh());
		if (leftMenuList.size() > 8)
		{
			leftMenuList = leftMenuList.subList(0, 8);
		}
		return "toSystemShotCutMenu";
	}
	
	public String toShotCutMenuSelectWin()
	{
		leftMenuList = business.queryOneLevelMenuBeans();
		return "toShotCutMenuSelectWin";
	}
	
	public String loadBtnChildMenuMap()
	{
		childMenuMap = business.queryChildMenuMapByOneLevelMenuId(menuBean.getMenuid());
		return "loadBtnChildMenuMap";
	}
	
	public void insertShortCut()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		business.insertMenuShortCut(loginInfo.getSfzh(), menuBean.getMenuid());
	}
	
	public void deleteShortCut()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		business.deleteMenuShortCut(loginInfo.getSfzh(), menuBean.getMenuid());
	}
	
	public void showImageIcon()
	{
		InputStream is = null;
		OutputStream os = null;
		try
		{
			os = response.getOutputStream();
			Blob bl = business.queryImageIcon(menuBean.getMenuid());
			if (bl != null)
			{
				is = bl.getBinaryStream();
				if (is == null) return ;
				byte[] b = new byte[1024];
				while(is.read(b) > 0)
				{
					os.write(b);
					os.flush();
				}
			}
			else
			{
				// 不存在照片显示默认照片
				InputStream in = MenuManagerAction.class.getResourceAsStream("/default.png");
				byte[] b = new byte[1024];
				while(in.read(b)>0)
				{
					os.write(b);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<MenuBean> getLeftMenuList()
	{
		return leftMenuList;
	}

	public void setLeftMenuList(List<MenuBean> leftMenuList)
	{
		this.leftMenuList = leftMenuList;
	}

	public Map<MenuBean, List<MenuBean>> getChildMenuMap()
	{
		return childMenuMap;
	}

	public void setChildMenuMap(Map<MenuBean, List<MenuBean>> childMenuMap)
	{
		this.childMenuMap = childMenuMap;
	}

	public MenuBean getMenuBean()
	{
		return menuBean;
	}

	public void setMenuBean(MenuBean menuBean)
	{
		this.menuBean = menuBean;
	}

	public List<OutSiteMenuBean> getOutSiteMenuBeans()
	{
		return outSiteMenuBeans;
	}

	public void setOutSiteMenuBeans(List<OutSiteMenuBean> outSiteMenuBeans)
	{
		this.outSiteMenuBeans = outSiteMenuBeans;
	}

	public OutSiteMenuBean getOutsiteMenuBean()
	{
		return outsiteMenuBean;
	}

	public void setOutsiteMenuBean(OutSiteMenuBean outsiteMenuBean)
	{
		this.outsiteMenuBean = outsiteMenuBean;
	}

	public boolean getShowSelectChk()
	{
		return showSelectChk;
	}

	public void setShowSelectChk(boolean showSelectChk)
	{
		this.showSelectChk = showSelectChk;
	}

	public String getDefaultShowMenuId()
	{
		return defaultShowMenuId;
	}

	public void setDefaultShowMenuId(String defaultShowMenuId)
	{
		this.defaultShowMenuId = defaultShowMenuId;
	}
	
	
}
