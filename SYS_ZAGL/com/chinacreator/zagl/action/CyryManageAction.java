package com.chinacreator.zagl.action;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.exception.CPSException;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ExcelImportHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.QGQLZdryInfoBean;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.chinacreator.lsgl.services.JwrkManageService;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;
import com.chinacreator.sydw.bean.CyryImportBean;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.query.CyryQueryBean;
import com.chinacreator.zagl.services.CyryManageService;

public class CyryManageAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 15657574567456L;
	private CyryQueryBean cyrycx;
	private LsglRkService rkService;
	private JwrkManageService jwrkService;
	private CyryManageService cyryService;
	private RkJbxxBean jbxxBean;
	private JwrkxxBean jwrkBean;
	private DwcyryBean cyryBean;
	private String jgbh;
	private File uploads;
	private String uploadsFileName;
	private CyryImportBean cyryImportBean;
	private List<CyryImportBean> cyryBeans = new ArrayList<CyryImportBean>();
	private List<CyryImportBean> zdryCyryBeans = new ArrayList<CyryImportBean>();
	private String importErrorInfo;
	
	public CyryManageAction()
	{
		super();
		cyrycx = new CyryQueryBean();
		rkService = new LsglRkServiceImpl();
		jwrkService = new JwrkManageService();
		cyryService = new CyryManageService();
		jbxxBean = new RkJbxxBean();
		jwrkBean = new JwrkxxBean();
		cyryBean = new DwcyryBean();
	}
	
	public String toCyryDjPage()
	{
		return "toCyryDjPage";
	}
	
	public String toCyryHsPage()
	{
		try
		{
			String jgbh = cyrycx.getJgbh();
			cyryBean = cyryService.queryDwCyryBeanByQueryBean(cyrycx);
			if (cyryBean == null)
			{
				cyryBean = new DwcyryBean();
				cyryBean.setJgbh(jgbh);
			}
			else
			{
				cyryBean.setJgbh(jgbh);
			}
			if (ValidateHelper.isNotEmptyString(cyryBean.getSfzh()))
			{
				jbxxBean = rkService.queryRkJbxxBeanBySfzh(cyryBean.getSfzh());
				if (jbxxBean == null)
				{
					jbxxBean = rkService.queryCzrkInfoStBeanBySfzh(cyrycx.getSfzh());
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toCyryHsPage";
	}

	public String toJnCyryDjPage()
	{
		QGQLZdryInfoBean qlzdty = cyryService.queryQgqlzdryBysfzh(cyrycx.getSfzh());
		try
		{
			String jgbh = cyrycx.getJgbh();
			cyryBean = cyryService.queryDwCyryBeanByQueryBean(cyrycx);
			if (cyryBean == null)
			{
				cyryBean = new DwcyryBean();
				cyryBean.setJgbh(jgbh);
			}
			else
			{
				cyryBean.setJgbh(jgbh);
				if(CommonConstant.OPERTYPE_ADD.equals(operType)){
					cyryBean.setCyrybh(null);
					cyryBean.setLzsj(null);
					cyryBean.setZxbs(null);
					cyryBean.setZxrq(null);
					cyryBean.setZxyy(null);
				}
			}
			jbxxBean = rkService.queryRkJbxxBeanBySfzh(cyrycx.getSfzh());
			if (jbxxBean == null)
			{
				jbxxBean = rkService.queryCzrkInfoStBeanBySfzh(cyrycx.getSfzh());
			}
			if (jbxxBean != null)
			{
				jbxxBean.setFwcs(cyryBean.getDwmc());
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		if(qlzdty != null){
			if("030000000000".equals(qlzdty.getZdryxl())){
				cyryBean.setSfZdry(true);
			}
			cyryBean.setZdrylbmc(CommonSequenceHelper.getZdrylbmc(qlzdty.getZdrylbbj()));
		}
		
		return "toJnCyryDjPage";
	}
	
	public String toJwCyryDjPage()
	{
		RkQueryBean queryBean = new RkQueryBean();
		queryBean.setGj(cyrycx.getGj());
		queryBean.setZjzl(cyrycx.getZjzl());
		queryBean.setZjhm(cyrycx.getZjhm());
		queryBean.setYwm(cyrycx.getYwm());
		queryBean.setYwx(cyrycx.getYwx());
		
		String jgbh = cyrycx.getJgbh();
		cyryBean = cyryService.queryDwCyryBeanByQueryBean(cyrycx);
		if (cyryBean == null)
		{
			cyryBean = new DwcyryBean();
			cyryBean.setJgbh(jgbh);
		}
		else
		{
			cyryBean.setJgbh(jgbh);
		}
		jwrkBean = jwrkService.queryJwrkBeanByQueryBean(queryBean);
		if (jwrkBean == null)
		{
			jwrkBean = new JwrkxxBean();
			jwrkBean.setGj(cyrycx.getGj());
			jwrkBean.setZjzl(cyrycx.getZjzl());
			jwrkBean.setZjhm(cyrycx.getZjhm());
			jwrkBean.setYwm(cyrycx.getYwm());
			jwrkBean.setYwx(cyrycx.getYwx());
			jwrkBean.setXb(cyryBean.getXb());
			jwrkBean.setZwm(cyryBean.getXm());
			jwrkBean.setCsrq(cyryBean.getCsrq());
			jwrkBean.setLxdh(cyryBean.getSjhm());
		}
		else
		{
			jwrkBean.setXb(cyryBean.getXb());
			jwrkBean.setZwm(cyryBean.getXm());
			jwrkBean.setCsrq(cyryBean.getCsrq());
			jwrkBean.setLxdh(cyryBean.getSjhm());
		}
		return "toJwCyryDjPage";
	}
	
	/**
	 * 保存境内从业人员信息
	 * 
	 * @date Aug 19, 2014 10:03:04 AM
	 */
	public void saveJnrkCyryInfo()
	{
		cyryBean.setSfzh(jbxxBean.getSfzh());
		cyryBean.setRybh(jbxxBean.getRybh());
		cyryBean.setCsrq(jbxxBean.getCsrq());
		cyryBean.setXb(jbxxBean.getXb());
		cyryBean.setXm(jbxxBean.getXm());
		cyryBean.setMz(jbxxBean.getMz());
		cyryBean.setBmch(jbxxBean.getBmch());
		cyryBean.setSfjwry("0");//非境外人员
		cyryBean.setGj("CHN");//中国
		cyryBean.setZjzl("111");//身份证号
		cyryBean.setZjhm(jbxxBean.getSfzh());
		cyryBean.setByzk(jbxxBean.getByzk());
		cyryBean.setYwm(jbxxBean.getYwm());
		cyryBean.setWhcd(jbxxBean.getWhcd());
		cyryBean.setZzmm(jbxxBean.getZzmm());
		cyryBean.setHyzk(jbxxBean.getHyzk());
		cyryBean.setSg(jbxxBean.getSg());
		cyryBean.setXx(jbxxBean.getXx());
		cyryBean.setZzxy(jbxxBean.getZzxy());
		cyryBean.setLxdh(jbxxBean.getLxdh() != null ? jbxxBean.getLxdh():cyryBean.getSjhm());
		cyryBean.setFwcs(jbxxBean.getFwcs());
		cyryBean.setZydm(jbxxBean.getZydm());
		cyryBean.setSf(jbxxBean.getSf());
		cyryBean.setJg(jbxxBean.getCsd());
		cyryBean.setRysx(CommonSequenceHelper.getRysx(jbxxBean.getSfzh(), "18", "I"));
		cyryBean.setHjdqh(jbxxBean.getHjdqh());
		cyryBean.setHjdxz(jbxxBean.getHjdxz());
		cyryBean.setCsd(jbxxBean.getCsd());
		cyryBean.setXzzqh(jbxxBean.getXzzqh());
		cyryBean.setXzzxz(jbxxBean.getXzzxz());
		cyryBean.setXzzqhmc(jbxxBean.getXzzqhmc());
		cyryBean.setXzzzrq(jbxxBean.getXzzzrq());
		cyryBean.setLxdhbz(jbxxBean.getLxdhbz());
		cyryBean.setSsgajgjgdm(jbxxBean.getSsgajgjgdm());
		cyryBean.setSsgajgjgmc(jbxxBean.getSsgajgjgmc());
		cyryBean.setSspcsdm(jbxxBean.getSspcsdm());
		cyryBean.setSspcsmc(jbxxBean.getSspcsmc());
		boolean temp = cyryService.saveCyryInfoBean(cyryBean);
		if (temp)
		{
			responseWrite(cyryBean);
		}
		else
		{
			responseWrite(null);
		}
	}
	
	/**
	 * 保存境外从业人员信息
	 * 
	 * @date Aug 20, 2014 8:23:01 AM
	 */
	public void saveJwrkCyryInfo()
	{
		cyryBean.setRybh(jwrkBean.getRybh());
		cyryBean.setCsrq(jwrkBean.getCsrq());
		cyryBean.setXb(jwrkBean.getXb());
		cyryBean.setXm(jwrkBean.getYwm() + " " + jwrkBean.getYwx());
		cyryBean.setSfjwry("1"); //境外人员
		
		cyryBean.setGj(jwrkBean.getGj());
		cyryBean.setZjzl(jwrkBean.getZjzl());
		cyryBean.setZjhm(jwrkBean.getZjhm());
		cyryBean.setYwm(jwrkBean.getYwm());
		cyryBean.setYwx(jwrkBean.getYwx());
		
		boolean temp = cyryService.saveCyryInfoBean(cyryBean);
		if (temp)
		{
			responseWrite(cyryBean);
		}
		else
		{
			responseWrite(null);
		}
	}
	
	public String toCyryImportPage()
	{
		return "toCyryImportPage";
	}
	
	public void importCyryInfo()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try
		{
			String batchno = UUID.randomUUID().toString().toUpperCase();
			cyryBeans = ExcelImportHelper.readExcelFromClass(CyryImportBean.class, new FileInputStream(uploads));
			if (ValidateHelper.isNotEmptyCollection(cyryBeans))
			{
				
				for (CyryImportBean cyryImportBean : cyryBeans)
				{
					String uuid = UUID.randomUUID().toString();
					cyryImportBean.setBh(uuid);
					cyryImportBean.setJgbh(jgbh);
					cyryImportBean.setDjdwdm(loginInfo.getOrgcode());
					cyryImportBean.setDjdwmc(loginInfo.getOrgname());
					cyryImportBean.setDjrjh(loginInfo.getUsername());
					cyryImportBean.setDjrsfzh(loginInfo.getSfzh());
					cyryImportBean.setDjrxm(loginInfo.getRealname());
					cyryImportBean.setBatchno(batchno);
					if (ValidateHelper.isNotEmptyString(cyryImportBean.getErrorInfo()))
					{
						cyryImportBean.setErrorbs("1");
					}
				}
				cyryService.saveImportCyryxx(cyryBeans);
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
		PageResultInfo<CyryImportBean> pageResult = null;
		try
		{
			pageResult = cyryService.queryImportCyryZdryPageResult(cyryImportBean, getPageInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResult = new PageResultInfo<CyryImportBean>();
		}
		responseWrite(pageResult);
	}
	
	public void queryImportCyryPageResult()
	{
		PageResultInfo<CyryImportBean> pageResult = null;
		try
		{
			pageResult = cyryService.queryImportCyryPageResult(cyryImportBean, getPageInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResult = new PageResultInfo<CyryImportBean>();
		}
		responseWrite(pageResult);
	}
	
	public String exportCyryZdryList()
	{
		try
		{
			PageResultInfo<CyryImportBean> pageResult = cyryService.queryImportCyryZdryPageResult(cyryImportBean, null);
			zdryCyryBeans = pageResult.getDatas();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "exportCyryZdryList";
	}
	
	public String toImportCyryHcPage()
	{
		return "toImportCyryHcPage";
	}
	
	/**
	 * 查询导入从业人员列表
	 * 
	 * @date Jan 7, 2015 11:08:22 AM
	 */
	public void queryHcImportCyryList()
	{
		PageResultInfo<CyryImportBean> pageResult = null;
		try
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			cyryImportBean.setDjdwdm(loginInfo.getOrgcode());
			pageResult = cyryService.queryHcImportCyryPageResult(cyryImportBean, getPageInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		responseWrite(pageResult);
	}
	
	/**
	 * 导出导入从业人人员信息
	 * @return
	 * @date Jan 7, 2015 11:09:25 AM
	 */
	public String exportHcCyryListPage()
	{
		try
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			cyryImportBean.setDjdwdm(loginInfo.getOrgcode());
			PageResultInfo<CyryImportBean> pageResult = cyryService.queryHcImportCyryPageResult(cyryImportBean, null);
			cyryBeans = pageResult.getDatas();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "exportHcCyryListPage";
	}
	
	public CyryQueryBean getCyrycx()
	{
		return cyrycx;
	}

	public void setCyrycx(CyryQueryBean cyrycx)
	{
		this.cyrycx = cyrycx;
	}

	public RkJbxxBean getJbxxBean()
	{
		return jbxxBean;
	}

	public void setJbxxBean(RkJbxxBean jbxxBean)
	{
		this.jbxxBean = jbxxBean;
	}

	public JwrkxxBean getJwrkBean()
	{
		return jwrkBean;
	}

	public void setJwrkBean(JwrkxxBean jwrkBean)
	{
		this.jwrkBean = jwrkBean;
	}

	public DwcyryBean getCyryBean()
	{
		return cyryBean;
	}

	public void setCyryBean(DwcyryBean cyryBean)
	{
		this.cyryBean = cyryBean;
	}

	public String getJgbh()
	{
		return jgbh;
	}

	public void setJgbh(String jgbh)
	{
		this.jgbh = jgbh;
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

	public List<CyryImportBean> getCyryBeans()
	{
		return cyryBeans;
	}

	public void setCyryBeans(List<CyryImportBean> cyryBeans)
	{
		this.cyryBeans = cyryBeans;
	}

	public String getImportErrorInfo()
	{
		return importErrorInfo;
	}

	public void setImportErrorInfo(String importErrorInfo)
	{
		this.importErrorInfo = importErrorInfo;
	}

	public List<CyryImportBean> getZdryCyryBeans()
	{
		return zdryCyryBeans;
	}

	public void setZdryCyryBeans(List<CyryImportBean> zdryCyryBeans)
	{
		this.zdryCyryBeans = zdryCyryBeans;
	}

	public CyryImportBean getCyryImportBean()
	{
		return cyryImportBean;
	}

	public void setCyryImportBean(CyryImportBean cyryImportBean)
	{
		this.cyryImportBean = cyryImportBean;
	}
	
}
