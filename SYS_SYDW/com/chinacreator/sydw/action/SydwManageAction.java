package com.chinacreator.sydw.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.sydw.bean.DwGlbmHsBean;
import com.chinacreator.sydw.query.DwglQueryBean;
import com.chinacreator.sydw.services.DwManageService;
import com.chinacreator.zagl.bean.BadysBean;
import com.chinacreator.zagl.bean.DwAqsbBean;
import com.chinacreator.zagl.bean.DwBean;
import com.chinacreator.zagl.bean.DwfwglBean;
import com.chinacreator.zagl.bean.DwjbxxBean;
import com.chinacreator.zagl.bean.DwjbxxExistsBean;
import com.chinacreator.zagl.bean.GgcsBean;
import com.chinacreator.zagl.bean.NbdwBean;
import com.chinacreator.zagl.bean.SwdwBean;
import com.chinacreator.zagl.bean.SwfwcsBean;
import com.chinacreator.zagl.bean.ThksyBean;
import com.chinacreator.zagl.bean.ThlgyBean;
import com.chinacreator.zagl.bean.TzhyBean;
import com.chinacreator.zagl.bean.WxwpdwBean;
import com.chinacreator.zagl.query.DwQueryBean;
import com.chinacreator.zagl.services.DwService;
import com.chinacreator.zagl.services.impl.DwServiceImpl;

/**
 * 实有单位管理
 * 
 * @filename SydwManageAction.java
 * @author mingchun.xiong
 * @date Jun 27, 2014
 *
 */
public class SydwManageAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 112312313131231L;
	private DwManageService service;
	private DwService dwService;
	private DwglQueryBean queryBean;
	private DwQueryBean dwcx;
	private DwBean dwBean;
	private DwBean dw;
	private List<SystemDictionaryBean> hylbList;
	private List<SystemDictionaryBean> wxpdwflList;
	private List<SystemDictionaryBean> kslxList;
	private String page;
	private String savesuccess;
	private String jgbh;
	
	
	public SydwManageAction()
	{
		super();
		service = new DwManageService();
		dwBean = new DwBean();
		dwService = new DwServiceImpl();
		dwcx = new DwQueryBean();
		queryBean = new DwglQueryBean();
	}
	
	public String toSydwdjDwQueryPage()
	{
		return "toSydwdjDwQueryPage";
	}
	
	public String toDwdjFwSelectPage()
	{
		initQueryBean(queryBean);
		return "toDwdjFwSelectPage";
	}
	
	/**
	 * 页面跳转
	 * @return
	 * @date Jul 2, 2014 3:42:34 PM
	 */
	public String toOpenPage()
	{
		jgbh = dwBean.getDwjbxx().getJgbh();
		try
		{
			//特行旅馆业
			if ("thlgxxinfo".equals(page))
			{
				//查询特种行业
				TzhyBean tzhyBean = service.queryTzhyBeanByJgbh(dwBean.getDwjbxx().getJgbh());
				if (tzhyBean != null)
				{
					//tzhyBean.setThxl(dwBean.getTzhy().getThxl());
					//tzhyBean.setJylb(dwBean.getTzhy().getJylb());
					dwBean.setTzhy(tzhyBean);
				}
				
				//查询旅馆业
				ThlgyBean thlgyBean = service.queryThlgyBean(dwBean.getDwjbxx().getJgbh());
				if (thlgyBean != null)
				{
					thlgyBean.setLgmc(tzhyBean.getThmc());
					dwBean.setThlgy(thlgyBean);
				}
			}
			else if ("thksy".equals(page))
			{
				//查询特种行业
				TzhyBean tzhyBean = service.queryTzhyBeanByJgbh(dwBean.getDwjbxx().getJgbh());
				if (tzhyBean != null)
				{
					//tzhyBean.setThxl(dwBean.getTzhy().getThxl());
					//tzhyBean.setJylb(dwBean.getTzhy().getJylb());
					dwBean.setTzhy(tzhyBean);
				}
				//查询特行开锁业
				ThksyBean thksyBean = service.queryThksyBean(dwBean.getDwjbxx().getJgbh());
				if (thksyBean != null)
				{
					dwBean.setThksyBean(thksyBean);
				}
				
			}
			//特种行业
			else if ("tzhy".equals(page))
			{
				//查询特种行业
				TzhyBean tzhyBean = service.queryTzhyBeanByJgbh(dwBean.getDwjbxx().getJgbh());
				if (tzhyBean != null)
				{
					//tzhyBean.setThxl(dwBean.getTzhy().getThxl());
					//tzhyBean.setJylb(dwBean.getTzhy().getJylb());
					dwBean.setTzhy(tzhyBean);
				}
			}
			//公共场所
			else if ("ggcsinfo".equals(page))
			{
				GgcsBean ggcsBean = service.queryGgcsBeanByJgbh(dwBean.getDwjbxx().getJgbh());
				if (ggcsBean != null)
				{
					//ggcsBean.setGgcsbh(dwBean.getGgcs().getGgcsbh());
					//ggcsBean.setCsxl(dwBean.getGgcs().getCsxl());
					dwBean.setGgcs(ggcsBean);
				}
			}
			//上网服务场所
			else if ("swfwcsinfo".equals(page))
			{
				SwfwcsBean swfwcsBean = service.querySwfwcsBeanByJgbh(dwBean.getDwjbxx().getJgbh());
				if (swfwcsBean != null)
				{
					//swfwcsBean.setJlbh(dwBean.getSwfwcs().getJlbh());
					//swfwcsBean.setWbbh(dwBean.getSwfwcs().getWbbh());
					//swfwcsBean.setXsyip(dwBean.getSwfwcs().getXsyip());
					dwBean.setSwfwcs(swfwcsBean);
				}
			}
			//内部单位
			else if ("nbdwinfo".equals(page))
			{
				NbdwBean nbdwBean = service.queryNbdwBeanByJgbh(dwBean.getDwjbxx().getJgbh());
				if (nbdwBean != null)
				{
					//nbdwBean.setNbdwbh(dwBean.getNbdw().getNbdwbh());
					//nbdwBean.setDwxl(dwBean.getNbdw().getDwxl());
					//nbdwBean.setDwxz(dwBean.getNbdw().getDwxz());
					dwBean.setNbdw(nbdwBean);
				}
			}
			//危险物品单位
			else if ("wxwpdwinfo".equals(page))
			{
				WxwpdwBean wxwpdwBean = service.queryWxwpdwBeanByJgbh(dwBean.getDwjbxx().getJgbh());
				if (wxwpdwBean != null)
				{
					dwBean.setWxwpdwBean(wxwpdwBean);
				}
			}
			//涉外单位
			else if ("swdwinfo".equals(page))
			{
				SwdwBean swdwBean = service.querySwdwBeanByJgbh(dwBean.getDwjbxx().getJgbh());
				if(swdwBean != null)
				{
					dwBean.setSwdwBean(swdwBean);
				}
			}
			//照片信息
			else if ("dwzpinfo".equals(page))
			{
				dwBean.setDwzpList(dwService.queryDwzpByJgbh(dwBean.getDwjbxx().getJgbh()));
			}
			//安全设备
			else if ("aqsbinfo".equals(page))
			{
				DwAqsbBean aqsb = dwService.queryDwAqsbByJgbh(jgbh);
				if (aqsb != null)
				{
					dw = new DwBean();
					dw.setAqsb(aqsb);
				}
			}
			//安保设施
			else if ("afxtinfo".equals(page))
			{
				dw = new DwBean();
				dw.setAbssList(dwService.queryAbssListByjgbh(jgbh));
			}
			//灾难事故
			else if ("znsginfo".equals(page))
			{
				dwBean.setZhsgList(dwService.queryZhsgByJgbh(jgbh));
			}
			//保卫机构
			else if ("bwjginfo".equals(page))
			{
				dwBean.setBwjgList(dwService.queryBwjgByJgbh(jgbh));
				dwBean.setBwzdList(dwService.queryBwzdByJgbh(jgbh));
				dwBean.setBwjysList(dwService.queryBwjysByJgbh(jgbh));
			}
			//不安定因素
			else if ("badysinfo".equals(page))
			{
				dw = new DwBean();
				BadysBean badys = new BadysBean();
				if(ValidateHelper.isNotEmptyString(dw.getBadys().getBh()))
				{
					badys = dwService.queryBadysByBh(dw.getBadys().getBh());
				}
				dw.setBadys(badys);
				dw.setBadysList(dwService.queryBadysByJgbh(jgbh));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return page;
	}
	
	
	public String toDwInfoPage()
	{
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			dwBean.getDwjbxx().setDwmc(queryBean.getDwmc());
			dwBean.getDwjbxx().setFwbh(queryBean.getFwid());
			FwJbxxBean fwjbxxBean = service.queryFwBeanById(queryBean.getFwid());
			if (fwjbxxBean != null)
			{
				dwBean.setFwBean(fwjbxxBean);
			}
		}
		else
		{
			//单位基本信息
			DwjbxxBean dwjbxx = service.queryDwJbxxBeanByJgbh(queryBean.getJgbh());
			if (dwjbxx != null)
			{
				dwBean.setDwjbxx(dwjbxx);
			}
			//单位房屋管理对象
			DwfwglBean dwfwglBean = service.queryDwfwglBeanByJgbh(queryBean.getJgbh());
			if (dwfwglBean != null)
			{
				dwBean.setDwfwglBean(dwfwglBean);
				
				//查询单位房屋对象
				if (ValidateHelper.isNotEmptyString(dwfwglBean.getFwid()))
				{
					FwJbxxBean fwBean = service.queryFwBeanById(dwfwglBean.getFwid());
					if (fwBean != null)
					{
						dwBean.setFwBean(fwBean);
					}
				}
			}
		}
		return "toDwInfoPage";
	}
	
	/**
	 * 保存单位基本信息
	 * 
	 * @date Jul 2, 2014 5:43:02 PM
	 */
	public void saveDwJbxxBean()
	{
		boolean temp = service.saveDwJbxxBean(dwBean);
		if (temp)
		{
			responseWrite(dwBean);
		}
		else
		{
			responseWrite(null);
		}	
	}
	
	/**
	 * 提交表单保存单位基本信息
	 * @return
	 * @date Jul 4, 2014 9:09:10 AM
	 */
	public String submitDwBeanForm()
	{
		boolean temp = service.saveDwJbxxBean(dwBean,operType);
		if (!temp)
		{
			savesuccess = "false";
		}
		else
		{
			FwJbxxBean fwjbxxBean = service.queryFwBeanById(dwBean.getFwBean().getFwid());
			if (fwjbxxBean != null)
			{
				dwBean.setFwBean(fwjbxxBean);
			}
			operType = "update";
			savesuccess = "true";
		}
		return "submitDwBeanForm";
	}
	
	/**
	 * 保存特行旅馆业
	 * 
	 * @date Jul 2, 2014 5:42:12 PM
	 */
	public void saveTzhyLgxxBean()
	{
		boolean temp = service.saveTzhyLgxxBean(dwBean);
		if (temp)
		{
			responseWrite(dwBean);
		}
		else
		{
			responseWrite(null);
		}
	}
	
	/**
	 * 保存特行开锁业
	 * 
	 * @date Jul 3, 2014 9:17:21 AM
	 */
	public void saveThksyBean()
	{
		boolean temp = service.saveThksyBean(dwBean);
		if (temp)
		{
			responseWrite(dwBean);
		}
		else
		{
			responseWrite(null);
		}
	}
	
	/**
	 * 保存特种行业
	 * 
	 * @date Jul 3, 2014 2:51:13 PM
	 */
	public void saveTzhyBean()
	{
		try
		{
			service.saveTzhyBean(dwBean);
			responseWrite(dwBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 保存公共场所
	 * 
	 * @date Jul 3, 2014 4:03:56 PM
	 */
	public void saveGgcsBean()
	{
		try
		{
			service.saveGgcsBean(dwBean);
			responseWrite(dwBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
		
	}
	
	/**
	 * 保存上网服务场所
	 * 
	 * @date Jul 3, 2014 4:04:21 PM
	 */
	public void saveSwfwcsBean()
	{
		try
		{
			service.saveSwfwcsBean(dwBean);
			responseWrite(dwBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 保存内保单位
	 * 
	 * @date Jul 3, 2014 4:28:45 PM
	 */
	public void saveNbdwBean()
	{
		try
		{
			service.saveNbdwBean(dwBean);
			responseWrite(dwBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 保存危险物品单位对象
	 * 
	 * @date Jul 3, 2014 4:28:55 PM
	 */
	public void saveWxwpdwBean()
	{
		try
		{
			service.saveWxpdwBean(dwBean);
			responseWrite(dwBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 保存涉外单位
	 * 
	 * @date Jul 3, 2014 4:29:35 PM
	 */
	public void saveSwdwBean()
	{
		try
		{
			service.saveSwdwBean(dwBean);
			responseWrite(dwBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	public void queryDwdjCheckList()
	{
		responseWrite(service.queryDwBeansPageResult(queryBean, getPageInfo()));
	}
	
	/**
	 * 单位管理部门核实
	 */
	public void dwGlbmHs(){
		responseWrite(service.dwGlbmHs(dwBean));
	}
	
	/**
	 * 跳转到单位管理部门核查页面
	 * @return
	 * @throws Exception 
	 */
	public String toDwGlbmhcPage() throws Exception{
		DwGlbmHsBean dwhs = dwBean.getDwhs();
		if(ValidateHelper.isEmptyString(jgbh)){
			jgbh = dwBean.getDwhs().getJgbh();
		}
		if(ValidateHelper.isEmptyString(jgbh)){
			jgbh = dwcx.getJgbh();
		}
		dwBean = dwService.queryDwJbxxByJgbh(jgbh);
		dwBean.setDwhs(dwhs);
		if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
			dwBean.setDwhs(service.queryDwhcByJgbhAndHylb(dwcx));
		}
		
		return "toDwGlbmhcPage";
	}
	
	/**
	 * 跳转到单位管理部门核查列表页
	 * @return
	 */
	public String toDwglbmhcListPage(){
		initQueryBean(dwcx);
		return "toDwglbmhcListPage";
	}
	
	/**
	 * 验证单位是否存在
	 * 
	 * @date Jul 7, 2014 12:47:02 PM
	 */
	public void queryDwBeanBeanByXqDwmc()
	{
		if (queryBean != null)
		{
			DwjbxxExistsBean dwjbxx = service.queryDwBeanBeanByXqDwmc(queryBean.getDwmc());
			if (dwjbxx != null)
			{
				String dwdz = dwjbxx.getDwdz();
				responseWrite(dwdz);
			}
		}
		responseWrite(null);
	}

	public DwglQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(DwglQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public DwManageService getService()
	{
		return service;
	}

	public void setService(DwManageService service)
	{
		this.service = service;
	}

	public List<SystemDictionaryBean> getHylbList() throws SQLException {
		hylbList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_HYLB");
		return hylbList;
	}

	public void setHylbList(List<SystemDictionaryBean> hylbList) {
		this.hylbList = hylbList;
	}

	public DwBean getDwBean()
	{
		return dwBean;
	}

	public void setDwBean(DwBean dwBean)
	{
		this.dwBean = dwBean;
	}
	
	public List<SystemDictionaryBean> getWxpdwflList() 
	{
		wxpdwflList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_WXPDWFL");
		return wxpdwflList;
	}

	public void setWxpdwflList(List<SystemDictionaryBean> wxpdwflList) 
	{
		this.wxpdwflList = wxpdwflList;
	}
	public DwQueryBean getDwcx() {
		return dwcx;
	}

	public void setDwcx(DwQueryBean dwcx) {
		this.dwcx = dwcx;
	}

	public String getPage()
	{
		return page;
	}

	public void setPage(String page)
	{
		this.page = page;
	}
	
	public List<SystemDictionaryBean> getKslxList() {
		kslxList = DictionaryCacheHellper
				.getSystemDictionaryListByZdlb("ZDY_KSLX");
		if (ValidateHelper.isEmptyCollection(kslxList)) {
			kslxList = new ArrayList<SystemDictionaryBean>();
		}
		return kslxList;
	}

	public void setKslxList(List<SystemDictionaryBean> kslxList) {
		this.kslxList = kslxList;
	}

	public String getSavesuccess()
	{
		return savesuccess;
	}

	public void setSavesuccess(String savesuccess)
	{
		this.savesuccess = savesuccess;
	}

	public String getJgbh()
	{
		return jgbh;
	}

	public void setJgbh(String jgbh)
	{
		this.jgbh = jgbh;
	}

	public DwBean getDw()
	{
		return dw;
	}

	public void setDw(DwBean dw)
	{
		this.dw = dw;
	}
	
}
