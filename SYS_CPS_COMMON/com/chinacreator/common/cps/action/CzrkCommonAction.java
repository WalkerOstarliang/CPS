package com.chinacreator.common.cps.action;

import com.chinacreator.common.action.BaseAction;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.business.OrgUserbusiness;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.remote.bean.CzrkInfoBean;

/**
 * 公共人口服务查询类
 * 
 * @author mingchun.xiong
 * @date 2013-8-6
 */
public class CzrkCommonAction extends BaseAction 
{
	
	private static final long serialVersionUID = -4958832846807173970L;
	
	private String sfzh;
	private CzrkInfoBean czrkInfoBean;
	private OrgUserbusiness orgUserbusiness;
	
	public CzrkCommonAction()
	{
		orgUserbusiness = new OrgUserbusiness();
	}

	/**
	 * 查询人口基本信息本地查询，数据来源于表t_lsgl_rk_jbxx
	 */
	public void queryRkJbxxBeanBySfzh()
	{
		RkJbxxBean bean = orgUserbusiness.findRkJbxxBySfzh(sfzh);
		responseWrite(bean);
	}
	
	/**
	 * 调用远程接口查询常住人口
	 */
	public void queryRyxxBean()
	{
		CzrkxxBean czrkBean = orgUserbusiness.queryRyxxBean(sfzh);
		responseWrite(czrkBean);
	}
	
	/**
	 * 查询人口信息 返回 CzrkxxBean
	 * 
	 * @date 2013-9-9 下午12:30:35
	 */
	public void queryRkBean()
	{
		RkJbxxBean ryjbxxBean = null;
		try
		{
			ryjbxxBean = orgUserbusiness.findRkJbxxBySfzh(sfzh);
			if (ryjbxxBean == null)
			{
				ryjbxxBean = orgUserbusiness.queryRyxxBean(sfzh);
			}
		}
		catch(Exception e)
		{
		}
		responseWrite(ryjbxxBean);
	}
	
	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public CzrkInfoBean getCzrkInfoBean() {
		return czrkInfoBean;
	}

	public void setCzrkInfoBean(CzrkInfoBean czrkInfoBean) {
		this.czrkInfoBean = czrkInfoBean;
	}

}
