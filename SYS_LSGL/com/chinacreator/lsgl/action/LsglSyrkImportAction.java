package com.chinacreator.lsgl.action;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.exception.CPSException;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ExcelImportHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.SyrkImportBean;
import com.chinacreator.lsgl.services.SyrkImportService;

/**
 * 实有人口导入action
 * 
 * @filename LsglSyrkImportAction.java
 * @author mingchun.xiong
 * @date Jan 5, 2015
 *
 */
public class LsglSyrkImportAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -6220131893802651900L;
	
	private SyrkImportService syrkService;
	private String fwid;
	private File uploads;
	private String uploadsFileName;
	private SyrkImportBean syrkImportBean;
	private List<SyrkImportBean> syrkBeans = new ArrayList<SyrkImportBean>();
	private List<SyrkImportBean> syrkZdryBeans = new ArrayList<SyrkImportBean>();
	private String importErrorInfo;
	
	public LsglSyrkImportAction()
	{
		super();
		syrkService = new SyrkImportService();
	}
	
	public String toSyrkImportPage()
	{
		return "toSyrkImportPage";
	}
	
	public void importSyrkInfo()
	{
		
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try
		{
 			String batchno = UUID.randomUUID().toString().toUpperCase();
			syrkBeans = ExcelImportHelper.readExcelFromClass(SyrkImportBean.class, new FileInputStream(uploads));
			if (ValidateHelper.isNotEmptyCollection(syrkBeans))
			{
				for (SyrkImportBean syrkbean : syrkBeans)
				{
					String uuid = UUID.randomUUID().toString();
					syrkbean.setBh(uuid);
					syrkbean.setFwid(fwid);
					syrkbean.setDjdwdm(loginInfo.getOrgcode());
					syrkbean.setDjdwmc(loginInfo.getOrgname());
					syrkbean.setDjrjh(loginInfo.getUsername());
					syrkbean.setDjrsfzh(loginInfo.getSfzh());
					syrkbean.setDjrxm(loginInfo.getRealname());
					syrkbean.setBatchno(batchno);
					if (ValidateHelper.isNotEmptyString(syrkbean.getErrorInfo()))
					{
						syrkbean.setErrorbs("1");
					}
				}
				syrkService.saveImportSyrkxx(syrkBeans);
			}
			responseWrite(batchno);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			if (e instanceof CPSException)
			{
				importErrorInfo = "error:" + e.getMessage();
			}
			else
			{
				importErrorInfo = "error:系统导入时发生错误.";
			}
			responseWrite(importErrorInfo);
		}
	}
	
	
	/**
	 * 查询重点人员从业人员列表
	 * @date Jan 6, 2015 10:46:18 AM
	 */
	public void queryImportCyryZdryList()
	{
		PageResultInfo<SyrkImportBean> pageResult = null;
		try
		{
			pageResult = syrkService.queryImportSyrkZdryPageResult(syrkImportBean, getPageInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResult = new PageResultInfo<SyrkImportBean>();
		}
		responseWrite(pageResult);
	}
	
	/**
	 * 查询重点人员从业人员列表
	 * @date Jan 6, 2015 10:46:18 AM
	 */
	public void queryImportCyryList()
	{
		PageResultInfo<SyrkImportBean> pageResult = null;
		try
		{
			pageResult = syrkService.queryImportSyrkPageResult(syrkImportBean, getPageInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResult = new PageResultInfo<SyrkImportBean>();
		}
		responseWrite(pageResult);
	}
	
	
	public String exportSyrkZdryList()
	{
		try
		{
			PageResultInfo<SyrkImportBean> pageResult = syrkService.queryImportSyrkZdryPageResult(syrkImportBean, null);
			syrkZdryBeans = pageResult.getDatas();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "exportSyrkZdryList";
	}

	public String toSyrkImportHcPage()
	{
		return "toSyrkImportHcPage";
	}
	
	/**
	 * 导出实有人口核查
	 * 
	 * @date Jan 8, 2015 10:56:36 AM
	 */
	public void querySyrkImportHcPageResult()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		PageResultInfo<SyrkImportBean> pageResultInfo = null;
		try
		{
			syrkImportBean.setDjdwdm(loginInfo.getOrgcode());
			pageResultInfo = syrkService.querySyrkImportHcPageResult(syrkImportBean, getPageInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResultInfo = new PageResultInfo<SyrkImportBean>();
		}
		responseWrite(pageResultInfo);
	}
	
	/**
	 * 导出实有人口
	 * @return
	 * @date Jan 8, 2015 10:56:25 AM
	 */
	public String exportSyrkImportHcPage()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try
		{
			syrkImportBean.setDjdwdm(loginInfo.getOrgcode());
			PageResultInfo<SyrkImportBean> pageResult = syrkService.querySyrkImportHcPageResult(syrkImportBean, null);
			syrkBeans = pageResult.getDatas();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "exportSyrkImportHcPage";
	}
	
	public String getFwid()
	{
		return fwid;
	}

	public void setFwid(String fwid)
	{
		this.fwid = fwid;
	}

	public File getUploads()
	{
		return uploads;
	}

	public void setUploads(File uploads)
	{
		this.uploads = uploads;
	}

	public String getUploadsFileName()
	{
		return uploadsFileName;
	}

	public void setUploadsFileName(String uploadsFileName)
	{
		this.uploadsFileName = uploadsFileName;
	}

	public SyrkImportService getSyrkService()
	{
		return syrkService;
	}

	public void setSyrkService(SyrkImportService syrkService)
	{
		this.syrkService = syrkService;
	}

	public List<SyrkImportBean> getSyrkBeans()
	{
		return syrkBeans;
	}

	public void setSyrkBeans(List<SyrkImportBean> syrkBeans)
	{
		this.syrkBeans = syrkBeans;
	}

	public String getImportErrorInfo()
	{
		return importErrorInfo;
	}

	public void setImportErrorInfo(String importErrorInfo)
	{
		this.importErrorInfo = importErrorInfo;
	}

	public SyrkImportBean getSyrkImportBean()
	{
		return syrkImportBean;
	}

	public void setSyrkImportBean(SyrkImportBean syrkImportBean)
	{
		this.syrkImportBean = syrkImportBean;
	}

	public List<SyrkImportBean> getSyrkZdryBeans()
	{
		return syrkZdryBeans;
	}

	public void setSyrkZdryBeans(List<SyrkImportBean> syrkZdryBeans)
	{
		this.syrkZdryBeans = syrkZdryBeans;
	}
	
}
