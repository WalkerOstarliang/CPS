package com.chinacreator.xtgl.action;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.xtgl.bean.JwtBean;
import com.chinacreator.xtgl.query.JwtQueryBean;
import com.chinacreator.xtgl.service.KhkpService;
import com.chinacreator.xtgl.service.impl.KhkpServiceImpl;

public class PcsglAction extends CPSBaseAction
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 1577968123171963765L;
	
	private KhkpService service;
	private JwtBean jwtBean;
	private JwtQueryBean queryBean;
	
	
	public PcsglAction()
	{
		super();
		service = new KhkpServiceImpl();
		queryBean = new JwtQueryBean();
	}
	
	public String toPcsglPage()
	{
		return "toPcsglPage";
	}
	
	/**
	 * 警务通管理
	 * @return
	 * @date Apr 17, 2014 9:27:58 AM
	 */
	public String toJwtglPage()
	{
		super.initQueryBean(queryBean);
		return "toJwtglPage";
	}
	
	public String toJwtglInfoPage()
	{
		try
		{
			if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
			{
				jwtBean = service.queryJwtBeanById(queryBean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toJwtglInfoPage";
	}
	
	/**
	 * 注销警务通管理配置
	 * 
	 * @date Jun 26, 2014 5:09:29 PM
	 */
	public void zxJwtglPzBean()
	{
		try
		{
			service.zxhfJwtBean(queryBean);
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
	}
	
	public void queryJwtBeansPageResult()
	{
		PageResultInfo<JwtBean> pageResult = null;
		try
		{
			pageResult = service.queryJwtBeansPageResult(queryBean, getPageInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResult = new PageResultInfo<JwtBean>();
		}
		responseWrite(pageResult);
	}
	
	public void saveJwtBean()
	{
		try
		{
			queryBean.setJh(jwtBean.getJh());
			queryBean.setKc_jwqdm(jwtBean.getKc_jwqdm());
			String orgcode = service.getExistJwtPz(queryBean);
			//不存在配置或者存在的配置单位代码跟现在的一样，则做修改
			if (CommonConstant.OPERTYPE_ADD.equals(operType))
			{
				if (ValidateHelper.isNotEmptyString(orgcode))
				{
					String orgname = DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode);
					responseWrite("isExistJwtPz," + orgname);
				}
				else
				{
					service.saveJwtBean(jwtBean);
					responseWrite(jwtBean);
				}
			}
			else if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
			{
				if (!jwtBean.getKc_jwqdm().equals(orgcode))
				{
					String orgname = DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode);
					responseWrite("isExistJwtPz," + orgname);
				}
				else
				{
					service.saveJwtBean(jwtBean);
					responseWrite(jwtBean);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	public void zxhfJwtBean()
	{
		try
		{
			service.zxhfJwtBean(queryBean);
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
	}
	

	public JwtQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(JwtQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public JwtBean getJwtBean()
	{
		return jwtBean;
	}

	public void setJwtBean(JwtBean jwtBean)
	{
		this.jwtBean = jwtBean;
	}
	
	
}
