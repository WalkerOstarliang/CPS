package com.chinacreator.yjcj.action;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.List;
import java.util.UUID;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.yjcj.bean.CommonWtfjBean;
import com.chinacreator.yjcj.bean.CommonWthdxxBean;
import com.chinacreator.yjcj.bean.CommonWtxxBean;
import com.chinacreator.yjcj.bean.CommonXxfbBean;
import com.chinacreator.yjcj.bean.CommonXxfbfjBean;
import com.chinacreator.yjcj.business.CommonYjcjBusiness;
import com.chinacreator.yjcj.query.CommonWtxxQueryBean;

/**
 * 公共意见采集action
 * 
 * @filename CommonYjcjAction.java
 * @author mingchun.xiong
 * @date Oct 8, 2014
 *
 */
public class CommonYjcjAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 1213134334374567L;
	
	private CommonYjcjBusiness business;
	
	private CommonWtxxQueryBean queryBean;
	
	private CommonWtxxBean wtBean;
	
	private CommonWthdxxBean wthfBean;
	
	private List<CommonWthdxxBean> wthfBeans;
	
	private List<CommonWtfjBean> wtfjBeans;
	
	private CommonWtfjBean fjBean;
	
	private File upload;
	
	private String uploadFileName;
	
	private CommonXxfbBean xxfbBean;
	
	private String fjid;
	
	public CommonYjcjAction()
	{
		super();
		business = new CommonYjcjBusiness();
		wtBean = new CommonWtxxBean();
		wthfBean = new CommonWthdxxBean();
	}
	
	public String toSmPage()
	{
		try
		{
			xxfbBean = business.queryXxfbBeanOfLastTimeToSm();
			if(xxfbBean != null)
			{
				List<CommonXxfbfjBean> list = business.queryXxfbfjBeansPageResult(xxfbBean.getXxid());
				xxfbBean.setFjBeans(list);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toSmPage";
	}
	
	public String toYjcjIndexPage()
	{
		return "toYjcjIndexPage";
	}
	
	public String toYjcjList()
	{
		return "toYjcjList";
	}
	
	public String toXxfbPage()
	{
		return "toXxfbPage";
	}
	
	public String toXxfbList()
	{
		return "toXxfbList";
	}
	
	public String toXxfbInfo()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			xxfbBean = new CommonXxfbBean();
			xxfbBean.setDjdwdm(loginInfo.getOrgcode());
			xxfbBean.setDjdwmc(loginInfo.getOrgname());
			xxfbBean.setDjrsfzh(loginInfo.getSfzh());
			xxfbBean.setDjrxm(loginInfo.getRealname());
		}
		else
		{
			xxfbBean = business.queryCommonXxfbBeanByXxid(xxfbBean.getXxid());
		}
		return "toXxfbInfo";
	}
	
	/**
	 * 保存发布信息
	 * 
	 * @date Mar 6, 2015 9:15:49 AM
	 */
	public void saveXxfbBean()
	{
		try
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			if (xxfbBean != null)
			{
				xxfbBean.setDjdwdm(loginInfo.getOrgcode());
				xxfbBean.setDjdwmc(loginInfo.getOrgname());
				xxfbBean.setDjrsfzh(loginInfo.getSfzh());
				xxfbBean.setDjrxm(loginInfo.getRealname());
				business.saveXxfbBean(xxfbBean);
				responseWrite(xxfbBean.getXxid());
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 保存信息发布附件
	 * 
	 * @date Mar 6, 2015 9:17:15 AM
	 */
	public void saveXxfbfjxx()
	{
		try
		{
			CommonXxfbfjBean xxfbfjBean = new CommonXxfbfjBean();
			String fjid = UUID.randomUUID().toString();
			xxfbfjBean.setFjid(fjid);
			xxfbfjBean.setXxid(xxfbBean.getXxid());
			xxfbfjBean.setUpload(upload);
			xxfbfjBean.setUploadfilename(uploadFileName);
			business.saveXxfbfjBean(xxfbfjBean);
			responseWrite(xxfbfjBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	public void deleteXxfbfjBean()
	{
		try
		{
			business.deleteXxfbfjBean(fjid);
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
	}
	
	public void queryXxfbfjBeansPageResult()
	{
		try
		{
			if (ValidateHelper.isNotEmptyString(xxfbBean.getXxid()))
			{
				List<CommonXxfbfjBean> list = business.queryXxfbfjBeansPageResult(xxfbBean.getXxid());
				responseWrite(PaginationHelper.wrapPageResultInfo(null, (long)list.size(), list));
			}
			else
			{
				responseWrite(new PageResultInfo<CommonXxfbfjBean>());
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	
	public void queryXxfbBeansPageResult()
	{
		responseWrite(business.queryXxfbBeansPageResult(getPageInfo()));
	}
	
	public String toWtyjDetailPage()
	{
		if (ValidateHelper.isNotEmptyString(queryBean.getWtid()))
		{
			wtBean = business.queryWtxxBeanByWtid(queryBean.getWtid());
			wtfjBeans = business.queryWtfjBeansBywtid(queryBean.getWtid());
			wtBean.setWtfjBeans(wtfjBeans);
			
			wthfBeans = business.queryWthdxxBeansByWtid(queryBean.getWtid());
			if (ValidateHelper.isNotEmptyCollection(wthfBeans))
			{
				for (CommonWthdxxBean bean : wthfBeans)
				{
					List<CommonWtfjBean> list = business.queryWtfjBeansByWthdid(bean.getWthdid());
					bean.setWtfjBeans(list);
				}
			}
		}
		String wthfid = UUID.randomUUID().toString();
		wthfBean.setWthdid(wthfid);
		wthfBean.setWtid(queryBean.getWtid());
		return "toWtyjDetailPage";
	}
	
	public void queryYjcjPageResult()
	{
		PageResultInfo<CommonWtxxBean> pageResult = business.queryWtxxBeansPageResult(queryBean, getPageInfo());
		responseWrite(pageResult);
	}
	
	public String toAddWtyjPage()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (ValidateHelper.isNotEmptyString(queryBean.getWtid()))
		{
			wtBean = business.queryWtxxBeanByWtid(queryBean.getWtid());
			wtfjBeans = business.queryWtfjBeansBywtid(queryBean.getWtid());
		}
		else
		{
			wtBean.setDjdwdm(loginInfo.getOrgcode());
			wtBean.setDjdwmc(loginInfo.getOrgname());
			wtBean.setDjrxm(loginInfo.getRealname());
			wtBean.setDjrsfzh(loginInfo.getSfzh());
			wtBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		return "toAddWtyjPage";
	}
	
	public void saveWtxxBean()
	{
		try
		{
			business.saveWtxxBean(wtBean);
			responseWrite(wtBean.getWtid());
		}
		catch(Exception e)
		{
			responseWrite(null);
		}
	}
	
	public void saveWtfjxx()
	{
		try
		{
			if (fjBean == null)
			{
				fjBean = new CommonWtfjBean();
			}
			String fjid = UUID.randomUUID().toString();
			fjBean.setFjid(fjid);
			fjBean.setType(ValidateHelper.isNotEmptyString(fjBean.getType())? fjBean.getType() : "1" );
			fjBean.setUpload(upload);
			fjBean.setWtid(queryBean.getWtid());
			business.savewtfjBean(fjBean);
			responseWrite(fjBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}

	public void saveWthdxx()
	{
		try
		{
			business.saveWthdBean(wthfBean);
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
	}
	
	
	public void showWtfjPoto()
	{
		OutputStream out = null;
		InputStream in = null;
		try
		{
			out = response.getOutputStream();
			Blob blob = business.getWtfjBlob(queryBean.getFjid());
			if (blob != null)
			{
				in = blob.getBinaryStream();
				if (in == null) return ;
				byte[] b = new byte[1024];
				while(in.read(b) > 0)
				{
					out.write(b);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				in.close();
				out.close();
			}
			catch(Exception e)
			{
			}
		}
	}
	
	public CommonYjcjBusiness getBusiness()
	{
		return business;
	}

	public void setBusiness(CommonYjcjBusiness business)
	{
		this.business = business;
	}

	public CommonWtxxQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(CommonWtxxQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public CommonWtxxBean getWtBean()
	{
		return wtBean;
	}

	public void setWtBean(CommonWtxxBean wtBean)
	{
		this.wtBean = wtBean;
	}

	public File getUpload()
	{
		return upload;
	}

	public void setUpload(File upload)
	{
		this.upload = upload;
	}

	public String getUploadFileName()
	{
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName)
	{
		this.uploadFileName = uploadFileName;
	}

	public List<CommonWtfjBean> getWtfjBeans()
	{
		return wtfjBeans;
	}

	public void setWtfjBeans(List<CommonWtfjBean> wtfjBeans)
	{
		this.wtfjBeans = wtfjBeans;
	}

	public CommonWthdxxBean getWthfBean()
	{
		return wthfBean;
	}

	public void setWthfBean(CommonWthdxxBean wthfBean)
	{
		this.wthfBean = wthfBean;
	}

	public List<CommonWthdxxBean> getWthfBeans()
	{
		return wthfBeans;
	}

	public void setWthfBeans(List<CommonWthdxxBean> wthfBeans)
	{
		this.wthfBeans = wthfBeans;
	}

	public CommonWtfjBean getFjBean()
	{
		return fjBean;
	}

	public void setFjBean(CommonWtfjBean fjBean)
	{
		this.fjBean = fjBean;
	}

	public CommonXxfbBean getXxfbBean()
	{
		return xxfbBean;
	}

	public void setXxfbBean(CommonXxfbBean xxfbBean)
	{
		this.xxfbBean = xxfbBean;
	}

	public String getFjid()
	{
		return fjid;
	}

	public void setFjid(String fjid)
	{
		this.fjid = fjid;
	}
	
}
