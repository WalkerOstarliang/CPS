package com.chinacreator.lsgl.action;

import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.RklxfsxxBean;
import com.chinacreator.lsgl.bean.RktmtzxxBean;
import com.chinacreator.lsgl.bean.RkzpxxBean;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.chinacreator.lsgl.services.JwrkManageService;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.services.CyryManageService;

public class JwrkManageAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2312313131312323L;
	private JwrkManageService service;
	private LsglRkService rkService;
	private CyryManageService cyryService;
	private RkQueryBean queryBean;
	private JwrkxxBean jwrkBean;
	private List<RkzpxxBean> zpxxBeans;
	private RktmtzxxBean tmtzBean;
	List<RklxfsxxBean> lxfsBeans;
	
	public JwrkManageAction()
	{
		super();
		service = new JwrkManageService();
		rkService = new LsglRkServiceImpl();
		cyryService = new CyryManageService();
		queryBean = new RkQueryBean();
		jwrkBean = new JwrkxxBean();
	}
	
	public String toJwrkListPage()
	{
		super.initQueryBean(queryBean);
		return "toJwrkListPage";
	}
	
	public String toJwrkfwSelectPage()
	{
		super.initQueryBean(queryBean);
		return "toJwrkfwSelectPage";
	}
	
	public String toJwrkQueryPage()
	{
		super.initQueryBean(queryBean);
		return "toJwrkQueryPage";
	}
	
	public String toJwrkInfoPage()
	{
		JwrkxxBean jwrkBean = service.queryJwrkBeanByQueryBean(queryBean);
		if (jwrkBean != null)
		{
			queryBean.setRybh(jwrkBean.getRybh());
			queryBean.setFwid(jwrkBean.getFwid());
			queryBean.setGj(jwrkBean.getGj());
			queryBean.setZjzl(jwrkBean.getZjzl());
			queryBean.setZjhm(jwrkBean.getZjhm());
			queryBean.setYwx(jwrkBean.getYwx());
			queryBean.setYwm(jwrkBean.getYwm());
			queryBean.setXb(jwrkBean.getXb());
		}
		
		return "toJwrkInfoPage";
	}
	
	public void queryJwrkPageResultInfo()
	{
		PageResultInfo<JwrkxxBean> pageResult = service.queryJwrkPageResultInfo(queryBean, getPageInfo());
		responseWrite(pageResult);
	}
	
	/**
	 * 境外人口历史居住信息
	 * 
	 * @date Aug 16, 2014 2:04:33 PM
	 */
	public void queryJwrkLsjzPageResultInfo()
	{
		PageResultInfo<JwrkxxBean> pageResult = service.queryLsJzJwrkPageResultInfo(queryBean, getPageInfo());
		responseWrite(pageResult);
	}
	
	public String loadJwrkJbxxInfo()
	{
		jwrkBean = service.queryJwrkBeanByQueryBean(queryBean);
		if (jwrkBean == null)
		{
			jwrkBean = new JwrkxxBean();
			jwrkBean.setGj(queryBean.getGj());
			jwrkBean.setZjzl(queryBean.getZjzl());
			jwrkBean.setZjhm(queryBean.getZjhm());
			jwrkBean.setYwm(queryBean.getYwm());
			jwrkBean.setYwx(queryBean.getYwx());
			jwrkBean.setXb(queryBean.getXb());
			jwrkBean.setFwid(queryBean.getFwid());
		}
		if (ValidateHelper.isNotEmptyString(queryBean.getFwid()))
		{
			jwrkBean.setDzmc(CommonSequenceHelper.getDzmcByFwid(queryBean.getFwid()));
			jwrkBean.setFwid(queryBean.getFwid());
		}
		else if (ValidateHelper.isNotEmptyString(jwrkBean.getRkfwglid()))
		{
			jwrkBean.setDzmc(CommonSequenceHelper.getDzmcByRkfwglid(jwrkBean.getRkfwglid()));
		}
		
		return "loadJwrkJbxxInfo";
	}
	
	/**
	 * 保存境外人口信息
	 * 
	 * @date Aug 15, 2014 5:08:36 PM
	 */
	public void saveJwrkInfo()
	{
		boolean temp = service.saveJwrkBean(jwrkBean);
		//如果是从业人员核实，则系统自动反馈从业人员信息
		if (ValidateHelper.isNotEmptyString(queryBean.getCyrybh()))
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			DwcyryBean cyryBean = new DwcyryBean();
			cyryBean.setCyrybh(queryBean.getCyrybh());
			cyryBean.setRybh(jwrkBean.getRybh());
			cyryBean.setRkfwglid(jwrkBean.getRkfwglid());
			cyryBean.setFkrxm(loginInfo.getRealname());
			cyryBean.setFkrjh(loginInfo.getUsername());
			cyryBean.setFkdwdm(loginInfo.getOrgcode());
			cyryBean.setFkdwmc(loginInfo.getOrgname());
			cyryBean.setFknr("完成登记实有人口时，系统自动反馈");
			cyryService.updateCyryDjFkxx(cyryBean);
		}
		if (temp)
		{
			responseWrite(jwrkBean);
		}
		else
		{
			responseWrite(null);
		}
	}
	
	public String toJwrkDetailPage()
	{
		jwrkBean = service.queryJwrkBeanByQueryBean(queryBean);
		if (ValidateHelper.isNotEmptyString(jwrkBean.getRkfwglid()))
		{
			jwrkBean.setDzmc(CommonSequenceHelper.getDzmcByRkfwglid(jwrkBean.getRkfwglid()));
		}
		return "toJwrkDetailPage";
	}
	
	/**
	 * 更新境外人口注销标示状态
	 * 
	 * @date Aug 16, 2014 12:50:45 PM
	 */
	public void updateJwrkZxbs()
	{
		try
		{
			service.updateJwrkZxbs(queryBean);
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
	}
	
	public String toJwrkzpPage()
	{
		try
		{
			jwrkBean = service.queryJwrkBeanByQueryBean(queryBean);
			if (jwrkBean != null)
			{
				zpxxBeans = rkService.queryRkzpxxBeansByRybh(jwrkBean.getRybh());
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toJwrkzpPage";
	}
	
	public String toShgxxxPage()
	{
		jwrkBean = service.queryJwrkBeanByQueryBean(queryBean);
		return "toShgxxxPage";
	}
	
	public String toTmtzxxPage()
	{
		try
		{
			jwrkBean = service.queryJwrkBeanByQueryBean(queryBean);
			if (jwrkBean != null)
			{
				tmtzBean = rkService.queryRktmtzBeanByRybh(jwrkBean.getRybh());
			}
			else
			{
				tmtzBean = new RktmtzxxBean();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toTmtzxxPage";
	}
	
	public String toLxfsxxPage()
	{
		try
		{
			jwrkBean = service.queryJwrkBeanByQueryBean(queryBean);
			if (jwrkBean != null)
			{
				lxfsBeans = rkService.queryRklxfsBeansByRybh(jwrkBean.getRybh());
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toLxfsxxPage";
	}
	
	public String toRkLsjzListPage()
	{
		//jwrkBean = service.queryJwrkBeanByQueryBean(queryBean);
		return "toRkLsjzListPage";
	}
	
	public String toJwrkDyPage()
	{
		jwrkBean = service.queryJwrkBeanByQueryBean(queryBean);
		return "toJwrkDyPage";
	}
	
	public String toJwrkTzryPage()
	{
		return "toJwrkTzryPage";
	}
	
	public String toJwrkCyryPage()
	{
		return "toJwrkCyryPage";
	}
	
	public RkQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(RkQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public JwrkxxBean getJwrkBean()
	{
		return jwrkBean;
	}

	public void setJwrkBean(JwrkxxBean jwrkBean)
	{
		this.jwrkBean = jwrkBean;
	}

	public List<RkzpxxBean> getZpxxBeans()
	{
		return zpxxBeans;
	}

	public void setZpxxBeans(List<RkzpxxBean> zpxxBeans)
	{
		this.zpxxBeans = zpxxBeans;
	}

	public RktmtzxxBean getTmtzBean()
	{
		return tmtzBean;
	}

	public void setTmtzBean(RktmtzxxBean tmtzBean)
	{
		this.tmtzBean = tmtzBean;
	}

	public List<RklxfsxxBean> getLxfsBeans()
	{
		return lxfsBeans;
	}

	public void setLxfsBeans(List<RklxfsxxBean> lxfsBeans)
	{
		this.lxfsBeans = lxfsBeans;
	}
	
	
}
