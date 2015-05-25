package com.chinacreator.sydw.services;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.constants.CommonFinalParams;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.StringArrayListHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dwdj.bean.WbdwShBean;
import com.chinacreator.dwdj.service.WbdwManagerService;
import com.chinacreator.dwdj.service.WbdwManagerServiceImpl;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.sydw.bean.DwGlbmHsBean;
import com.chinacreator.sydw.dao.DwManageDao;
import com.chinacreator.sydw.query.DwglQueryBean;
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
import com.chinacreator.zagl.dao.DwDao;
import com.chinacreator.zagl.dao.impl.DwDaoImpl;
import com.chinacreator.zagl.query.DwQueryBean;
import com.frameworkset.orm.transaction.TransactionManager;

public class DwManageService
{
	
	private DwManageDao dao;
	private DwDao dwDao;
	public DwManageService()
	{
		dao = new DwManageDao();
		dwDao = new DwDaoImpl();
	}
	
	/**
	 * 查询单位信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @date Jun 27, 2014 3:32:06 PM
	 */
	public PageResultInfo<DwjbxxBean> queryDwBeansPageResult(DwglQueryBean queryBean, PageInfo pageInfo)
	{
		PageResultInfo<DwjbxxBean> pageResultInfo = null;
		try
		{
			pageResultInfo = dao.queryDwDjCheckBeansPageResult(queryBean, pageInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResultInfo = new PageResultInfo<DwjbxxBean>();
		}
		return pageResultInfo;
	}
	
	/**
	 * 查询单位基本信息
	 * @param jgbh
	 * @return
	 * @date Jul 3, 2014 6:49:54 PM
	 */
	public DwjbxxBean queryDwJbxxBeanByJgbh(String jgbh)
	{
		DwjbxxBean jbxxBean = null;
		try
		{
			jbxxBean = dwDao.queryDwjbxxByJgbh(jgbh);
			return jbxxBean;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jbxxBean;
	}
	
	/**
	 * 单位房屋管理对象
	 * @param jgbh
	 * @return
	 * @date Jul 5, 2014 3:46:21 PM
	 */
	public DwfwglBean queryDwfwglBeanByJgbh(String jgbh)
	{
		DwfwglBean dwfwglBean = null;
		try
		{
			dwfwglBean = dwDao.queryDwfwglBean(jgbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return dwfwglBean;
	}
	
	/**
	 * 查询特种行业
	 * @param thbh
	 * @return
	 * @date Jul 2, 2014 6:13:14 PM
	 */
	public TzhyBean queryTzhyBeanByJgbh(String jgbh)
	{
		try
		{
			return dwDao.queryTzhyByJgbh(jgbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 通过机构编号查公共场所
	 * @param jgbh
	 * @return
	 * @date Jul 3, 2014 3:09:15 PM
	 */
	public GgcsBean queryGgcsBeanByJgbh(String jgbh)
	{
		try
		{
			return dwDao.queryGgcsByJgbh(jgbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询上网服务场所
	 * @param jgbh
	 * @return
	 * @date Jul 3, 2014 3:10:16 PM
	 */
	public SwfwcsBean querySwfwcsBeanByJgbh(String jgbh)
	{
		try
		{
			return dwDao.querySwfwcsByJgbh(jgbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询内保单位通过机构编号
	 * @param jgbh
	 * @return
	 * @date Jul 3, 2014 3:11:04 PM
	 */
	public NbdwBean queryNbdwBeanByJgbh(String jgbh)
	{
		try
		{
			return dwDao.queryNbdwByJgbh(jgbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询危险物品单位
	 * @param jgbh
	 * @return
	 * @date Jul 3, 2014 3:12:20 PM
	 */
	public WxwpdwBean queryWxwpdwBeanByJgbh(String jgbh)
	{
		WxwpdwBean wxwpdwBean = null;
		try
		{
			wxwpdwBean = dwDao.queryWxwpdwBean(jgbh);
			if (wxwpdwBean!= null)
			{
				wxwpdwBean.setDwfls(StringArrayListHelper.converStringToStringArray(wxwpdwBean.getDwfl(), ","));
			}
			return wxwpdwBean;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询涉外单位对象
	 * @param jgbh
	 * @return
	 * @date Jul 3, 2014 3:13:05 PM
	 */
	public SwdwBean querySwdwBeanByJgbh(String jgbh)
	{
		try
		{
			return dwDao.querySwdwBeanByJgbh(jgbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询特行旅馆业
	 * @param jgbh
	 * @return
	 * @date Jul 2, 2014 6:14:07 PM
	 */
	public ThlgyBean queryThlgyBean(String jgbh)
	{
		try
		{
			return dwDao.queryThlgyByJgbh(jgbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询特行开锁业
	 * @param jgbh
	 * @return
	 * @date Jul 3, 2014 9:12:58 AM
	 */
	public ThksyBean queryThksyBean(String jgbh)
	{
		ThksyBean bean = null;
		try
		{
			bean = dwDao.queryThksyBean(jgbh);
			if (bean != null)
			{
				bean.setKslxs(StringArrayListHelper.converStringToStringArray(bean.getKslx(), ","));
			}
			return bean;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 通过房屋ID查询房屋信息
	 * @param fwid
	 * @return
	 * @date Jun 30, 2014 3:17:01 PM
	 */
	public FwJbxxBean queryFwBeanById(String fwid)
	{
		FwJbxxBean jbxxBean = null;
		try
		{
			jbxxBean = dao.queryFwJbxxBeanByFwid(fwid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jbxxBean;
	}

	/**
	 * 保存特行旅馆信息
	 * @param dwBean
	 * @return
	 * @date Jul 2, 2014 5:30:34 PM
	 */
	public boolean saveTzhyLgxxBean(DwBean dwBean)
	{
		boolean result = false;
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TzhyBean tzhyBean = dwBean.getTzhy();
		ThlgyBean thlgBean = dwBean.getThlgy();
		TransactionManager tm = new TransactionManager();
		boolean isupdatefield = dwBean.getIsupdatefield();
		try
		{
			tm.begin();
			//插入特种行业表
			if (ValidateHelper.isNotEmptyString(tzhyBean.getThbh()))
			{
				if (!isupdatefield)
				{
					dao.updateTzhyBean(tzhyBean);
					dwDao.updateDwjbxxCzsj(tzhyBean.getJgbh());
				}
			}
			else
			{
				String thbh = CommonSequenceHelper.getJGBH(loginInfo.getOrgcode(), "TH");
				tzhyBean.setThbh(thbh);
				tzhyBean.setJgbh(dwBean.getDwjbxx().getJgbh());
				dao.insertTzhyBean(tzhyBean);
			}
			
			//插入旅馆业信息
			if (ValidateHelper.isNotEmptyString(thlgBean.getLgbh()))
			{
				if (!isupdatefield)
				{
					thlgBean.setJgbh(dwBean.getDwjbxx().getJgbh());
					thlgBean.setThbh(tzhyBean.getThbh());
					dao.updateTzhylgxxBean(thlgBean);
					dwDao.updateDwjbxxCzsj(tzhyBean.getJgbh());
				}
			}
			else
			{
				String lgbh = CommonSequenceHelper.getTZHYJGBH();
				thlgBean.setLgbh(lgbh);
				thlgBean.setLgmc(dwBean.getDwjbxx().getDwmc());
				thlgBean.setJgbh(dwBean.getDwjbxx().getJgbh());
				thlgBean.setThbh(tzhyBean.getThbh());
				dao.insertTzhyTgxxBean(thlgBean);
			}
			tm.commit();
			result = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
		}
		return result;
	}
	
	/**
	 * 保存特行开锁业
	 * @param dwBean
	 * @return
	 * @date Jul 3, 2014 9:21:32 AM
	 */
	public boolean saveThksyBean(DwBean dwBean)
	{
		boolean result = false;
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TzhyBean tzhyBean = dwBean.getTzhy();
		ThksyBean thksyBean = dwBean.getThksyBean();
		TransactionManager tm = new TransactionManager();
		boolean isupdatefield = dwBean.getIsupdatefield();
		try
		{
			tm.begin();
			//插入特种行业表
			if (ValidateHelper.isNotEmptyString(tzhyBean.getThbh()))
			{
				if (!isupdatefield)
				{
					tzhyBean.setJgbh(dwBean.getDwjbxx().getJgbh());
					dao.updateTzhyBean(tzhyBean);
					dwDao.updateDwjbxxCzsj(tzhyBean.getJgbh());
				}
			}
			else
			{
				String thbh = CommonSequenceHelper.getJGBH(loginInfo.getOrgcode(), "TH");
				tzhyBean.setThbh(thbh);
				tzhyBean.setJgbh(dwBean.getDwjbxx().getJgbh());
				dao.insertTzhyBean(tzhyBean);
			}
			
			//插入特行开锁业
			if (ValidateHelper.isNotEmptyString(thksyBean.getKsbh()))
			{
				if (!isupdatefield)
				{
					thksyBean.setJgbh(dwBean.getDwjbxx().getJgbh());
					thksyBean.setThbh(tzhyBean.getThbh());
					thksyBean.setJgmc(tzhyBean.getThmc());
					thksyBean.setKslx(StringArrayListHelper.converStringArrayToStr(thksyBean.getKslxs(), ","));
					dao.updateThksyBean(thksyBean);
					dwDao.updateDwjbxxCzsj(tzhyBean.getJgbh());
				}
			}
			else
			{
				String lgbh = CommonSequenceHelper.getTZHYJGBH();
				thksyBean.setKsbh(lgbh);
				thksyBean.setJgbh(dwBean.getDwjbxx().getJgbh());
				thksyBean.setThbh(tzhyBean.getThbh());
				thksyBean.setJgmc(tzhyBean.getThmc());
				thksyBean.setKslx(StringArrayListHelper.converStringArrayToStr(thksyBean.getKslxs(), ","));
				dao.insertThksyBean(thksyBean);
			}
			tm.commit();
			result = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
		}
		return result;
		
	}
	
	public boolean saveDwJbxxBean(DwBean dwBean, String operType)
	{
		boolean temp = false;
		DwjbxxBean dwjbxxBean = dwBean.getDwjbxx();
		FwJbxxBean fwBean = dwBean.getFwBean();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tm = new TransactionManager();
		try
		{
			tm.begin();
			
			//保存单位基本信息
			if (ValidateHelper.isNotEmptyString(dwjbxxBean.getJgbh()) && CommonConstant.OPERTYPE_UPDATE.equals(operType))
			{
				dwjbxxBean.setCzbs("2");
				dwjbxxBean.setCzdwdm(loginInfo.getOrgcode());
				dwjbxxBean.setCzdwmc(loginInfo.getOrgname());
				dwjbxxBean.setCzrjh(loginInfo.getUsername());
				dwjbxxBean.setCzrsfzh(loginInfo.getSfzh());
				dwjbxxBean.setCzrxm(loginInfo.getRealname());
				dwjbxxBean.setFwbh(fwBean.getFwid());
				dwjbxxBean.setDzid(fwBean.getDzid());
				
				if (ValidateHelper.isEmptyString(dwjbxxBean.getZrdwpcsdm()))
				{
					dwjbxxBean.setZrdwpcsdm(loginInfo.getOrgcode());
					dwjbxxBean.setZrdwpcsmc(loginInfo.getOrgname());
					dwjbxxBean.setZrmjjh(loginInfo.getUsername());
					dwjbxxBean.setZrmjxm(loginInfo.getRealname());
					dwjbxxBean.setZrmjdh(loginInfo.getMoblie());
				}
				
				//社区民警在修改危爆单位时修改注销标识未注销需要提交审核
				if(loginInfo.getLeve() == 5  
						&& dwjbxxBean.getHylb() != null 
						&& dwjbxxBean.getHylb().contains("04") 
						&& CommonConstant.ZX_DIC_ZX.equals(dwjbxxBean.getZxbs())
						&& "1".equals(dwjbxxBean.getSfzagl())){
					WbdwManagerService wbdwService = new WbdwManagerServiceImpl();
					
					WbdwShBean wbdwsh = new WbdwShBean();
					wbdwsh.initTjr();
					wbdwsh.setJgbh(dwjbxxBean.getJgbh());
					wbdwsh.setCzlx(CommonConstant.CZBZ_ZX);
					wbdwsh.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					wbdwService.insertWbdwsh(wbdwsh);
					
					dwjbxxBean.setZxbs("");
					dwjbxxBean.setZxrq("");
					dwjbxxBean.setZxyy("");
				}
				
				dao.updateDwJbxxBean(dwjbxxBean);
			}
			else
			{
				
				String jgbh = CommonSequenceHelper.getJGBH(loginInfo.getOrgcode(), "JG");
				
				dwjbxxBean.setJgbh(jgbh);
				dwjbxxBean.setCzbs("1");
				dwjbxxBean.setCzdwdm(loginInfo.getOrgcode());
				dwjbxxBean.setCzdwmc(loginInfo.getOrgname());
				dwjbxxBean.setCzrjh(loginInfo.getUsername());
				dwjbxxBean.setCzrsfzh(loginInfo.getSfzh());
				dwjbxxBean.setCzrxm(loginInfo.getRealname());
				dwjbxxBean.setDjdwdm(loginInfo.getOrgcode());
				dwjbxxBean.setDjdwmc(loginInfo.getOrgname());
				dwjbxxBean.setDjrjh(loginInfo.getUsername());
				dwjbxxBean.setDjrsfzh(loginInfo.getSfzh());
				dwjbxxBean.setDjrxm(loginInfo.getRealname());
				dwjbxxBean.setZrdwpcsdm(loginInfo.getOrgcode());
				dwjbxxBean.setZrdwpcsmc(loginInfo.getOrgname());
				dwjbxxBean.setZrmjjh(loginInfo.getUsername());
				dwjbxxBean.setZrmjdh(loginInfo.getMoblie());
				dwjbxxBean.setZrmjxm(loginInfo.getRealname());
				dwjbxxBean.setDzid(fwBean.getDzid());
				dwjbxxBean.setFwbh(fwBean.getFwid());
				//插入单位基本信息
				dao.insertDwJbxxBean(dwBean.getDwjbxx());
			}
			
			//插入单位房屋关联对象
			saveDwfwglBean(dwBean);
			
			//删除单位中原来旧的单位属性
			deleteDwBeanChildgl(dwBean);
			
			if (!CommonConstant.OPERTYPE_UPDATE.equals(operType))
			{
				//保存单位类别字段信息
				saveDwBeanChild(dwBean);
			}
			temp = true;
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch(RollbackException e1)
			{}
		}
		return temp;
	}
	
	/**
	 * 保存单位基本信息
	 * @param dwBean
	 * @date Jun 30, 2014 4:06:42 PM
	 */
	public boolean saveDwJbxxBean(DwBean dwBean)
	{
		boolean temp = false;
		DwjbxxBean dwjbxxBean = dwBean.getDwjbxx();
		FwJbxxBean fwBean = dwBean.getFwBean();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tm = new TransactionManager();
		try
		{
			tm.begin();
			
			//保存单位基本信息
			if (ValidateHelper.isNotEmptyString(dwjbxxBean.getJgbh()))
			{
				dwjbxxBean.setCzbs("2");
				dwjbxxBean.setCzdwdm(loginInfo.getOrgcode());
				dwjbxxBean.setCzdwmc(loginInfo.getOrgname());
				dwjbxxBean.setCzrjh(loginInfo.getUsername());
				dwjbxxBean.setCzrsfzh(loginInfo.getSfzh());
				dwjbxxBean.setCzrxm(loginInfo.getRealname());
				dwjbxxBean.setFwbh(fwBean.getFwid());
				dwjbxxBean.setDzid(fwBean.getDzid());
				
				dao.updateDwJbxxBean(dwjbxxBean);
			}
			else
			{
				
				String jgbh = CommonSequenceHelper.getJGBH(loginInfo.getOrgcode(), "JG");
				
				dwjbxxBean.setJgbh(jgbh);
				dwjbxxBean.setCzbs("1");
				dwjbxxBean.setCzdwdm(loginInfo.getOrgcode());
				dwjbxxBean.setCzdwmc(loginInfo.getOrgname());
				dwjbxxBean.setCzrjh(loginInfo.getUsername());
				dwjbxxBean.setCzrsfzh(loginInfo.getSfzh());
				dwjbxxBean.setCzrxm(loginInfo.getRealname());
				dwjbxxBean.setDjdwdm(loginInfo.getOrgcode());
				dwjbxxBean.setDjdwmc(loginInfo.getOrgname());
				dwjbxxBean.setDjrjh(loginInfo.getUsername());
				dwjbxxBean.setDjrsfzh(loginInfo.getSfzh());
				dwjbxxBean.setDjrxm(loginInfo.getRealname());
				dwjbxxBean.setZrdwpcsdm(loginInfo.getOrgcode());
				dwjbxxBean.setZrdwpcsmc(loginInfo.getOrgname());
				dwjbxxBean.setZrmjjh(loginInfo.getUsername());
				dwjbxxBean.setZrmjdh(loginInfo.getMoblie());
				dwjbxxBean.setZrmjxm(loginInfo.getRealname());
				dwjbxxBean.setDzid(fwBean.getDzid());
				dwjbxxBean.setFwbh(fwBean.getFwid());
				//插入单位基本信息
				dao.insertDwJbxxBean(dwBean.getDwjbxx());
			}
			
			
			//删除单位中原来旧的单位属性
			deleteDwBeanChildgl(dwBean);
			
			//插入单位房屋关联对象
			saveDwfwglBean(dwBean);
			
			
			//保存单位类别字段信息
			//saveDwBeanChild(dwBean);
			temp = true;
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return temp;
	}
	
	/**
	 * 保存单位房屋关联
	 * @param dwBean
	 * @throws Exception
	 * @date Jul 2, 2014 9:29:32 AM
	 */
	public void saveDwfwglBean(DwBean dwBean) throws Exception
	{
		DwfwglBean dwfwglBean = dwBean.getDwfwglBean();
		FwJbxxBean fwBean = dwBean.getFwBean();
		DwjbxxBean dwjbxxBean = dwBean.getDwjbxx();
		//前后房屋地址发生变化，则注销前面的一条，在新增一条
		if (!fwBean.getFwid().equals(dwfwglBean.getFwid()))
		{
			//员单位房屋关联不为空
			if (ValidateHelper.isNotEmptyString(dwfwglBean.getFwid()))
			{
				dao.zxDwfwglBean(dwjbxxBean.getJgbh());
			}
			String dwfwglid = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm") + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
			dwfwglBean.setDwfwglid(dwfwglid);
			dwfwglBean.setJgbh(dwjbxxBean.getJgbh());
			dwfwglBean.setDzid(fwBean.getDzid());
			dwfwglBean.setFwid(fwBean.getFwid());
			//插入新的房屋关联对象
			dao.insertDwfwglBean(dwfwglBean);
		}
		
	}
	
	/**
	 * 删除原来及后续调整的新单位属性
	 * @param dwBean
	 * @throws Exception
	 * @date Jul 1, 2014 11:46:29 AM
	 */
	public void deleteDwBeanChildgl(DwBean dwBean) throws Exception
	{
		String old_dwsxstr = dwBean.getDwjbxx().getOldhylb();
		String new_dwsxstr = dwBean.getDwjbxx().getHylb();
		if (ValidateHelper.isNotEmptyString(new_dwsxstr))
		{
			if (ValidateHelper.isNotEmptyString(old_dwsxstr))
			{
				String[] old_dwsxs = old_dwsxstr.split(",");
				for (String dwsx : old_dwsxs)
				{
					if (!inNewHylbs(dwsx, new_dwsxstr.split(",")))
					{
						executeDeleteDwChild(dwBean,dwsx);
					}
				}
			}
		}
		//不存在单位属性，则必须开了删除原来的单位属性
		else
		{
			if (ValidateHelper.isNotEmptyString(old_dwsxstr))
			{
				String[] old_dwsxs = old_dwsxstr.split(",");
				for (String dwsx : old_dwsxs)
				{
					executeDeleteDwChild(dwBean,dwsx);
				}
			}
			
		}
	}
	
	private boolean inNewHylbs(String dwsx, String[] new_dwsxs)
	{
		boolean temp = false;
		if (ValidateHelper.isNotEmptyArray(new_dwsxs))
		{
			for (String newdwsx : new_dwsxs)
			{
				if (dwsx.equals(newdwsx))
				{
					temp = true;
					break;
				}
			}
		}
		return temp;
	}
	
	private void executeDeleteDwChild(DwBean dwBean, String dwsx) throws Exception
	{
		DwjbxxBean dwjbxxBean = dwBean.getDwjbxx();
		// 特种行业
		if (CommonFinalParams.HYLB_TZHY.equals(dwsx))
		{
			 dao.deleteTzhyBeanByJgbh(dwjbxxBean.getJgbh());
			 dwBean.getTzhy().setThbh("");
		}
		//公共场所
		else if (CommonFinalParams.HYLB_GGCS.equals(dwsx))
		{
			dao.deleteGgcsBeanByJgbh(dwjbxxBean.getJgbh());
			dwBean.getGgcs().setJlbh("");
		}
		//内部单位
		else if (CommonFinalParams.HYLB_NBDW.equals(dwsx))
		{
			dao.deleteNbdwBeanByJgbh(dwjbxxBean.getJgbh());
			dwBean.getNbdw().setNbdwbh("");
		}
		//危险品单位
		else if (CommonFinalParams.HYLB_WXPDW.equals(dwsx))
		{
			dao.deleteWxpdwBeanByJgbh(dwjbxxBean.getJgbh());
			dwBean.getWxwpdwBean().setJgbh("");
		}
		//上网服务场所
		else if (CommonFinalParams.HYLB_SWFWCS.equals(dwsx))
		{
			dao.deleteSwfwcsBeanByJgbh(dwjbxxBean.getJgbh());
			dwBean.getSwfwcs().setJlbh("");
		}
		//涉外单位
		else if (CommonFinalParams.HYLB_SWDW.equals(dwsx))
		{
			dao.deleteSwdwBeanByJgbh(dwjbxxBean.getJgbh());
			dwBean.getSwdwBean().setJlbh("");
		}
		//特行旅馆业
		else if (CommonFinalParams.HYLB_LGY.equals(dwsx))
		{
			dao.deleteTzhyTgxxBeanByJgbh(dwjbxxBean.getJgbh());
			dwBean.getThlgy().setLgbh("");
		}
		//特行开锁业
		else if (CommonFinalParams.HYLB_KSY.equals(dwsx))
		{
			dao.deleteThksyBeanByJgbh(dwjbxxBean.getJgbh());
			dwBean.getThksyBean().setKsbh("");
		}
	}
	
	/**
	 *  保存单位特殊信息
	 * @param dwBean
	 * @throws Exception
	 * @date Jul 1, 2014 10:41:34 AM
	 */
	public void saveDwBeanChild(DwBean dwBean) throws Exception
	{
		DwjbxxBean jbxxBean = dwBean.getDwjbxx();
		String[] dwsxs =  jbxxBean.getHylbs();
		if (ValidateHelper.isNotEmptyArray(dwsxs))
		{
			List<String> newdwsxList = StringArrayListHelper.converStringArrayToList(dwsxs);
			if (newdwsxList.contains("07") || newdwsxList.contains("08"))
			{
				//删除特种行业
				newdwsxList.remove("01");
			}
			for (String dwsx : newdwsxList)
			{
				// 特种行业
				if (CommonFinalParams.HYLB_TZHY.equals(dwsx.trim()))
				{
					saveTzhyBean(dwBean);
				}
				//公共场所
				else if (CommonFinalParams.HYLB_GGCS.equals(dwsx.trim()))
				{
					saveGgcsBean(dwBean);
				}
				//内部单位
				else if (CommonFinalParams.HYLB_NBDW.equals(dwsx.trim()))
				{
					saveNbdwBean(dwBean);
				}
				//危险品单位
				else if (CommonFinalParams.HYLB_WXPDW.equals(dwsx.trim()))
				{
					saveWxpdwBean(dwBean);
				}
				//上网服务场所
				else if (CommonFinalParams.HYLB_SWFWCS.equals(dwsx.trim()))
				{
					saveSwfwcsBean(dwBean);
				}
				//涉外单位
				else if (CommonFinalParams.HYLB_SWDW.equals(dwsx.trim()))
				{
					saveSwdwBean(dwBean);
				}
				//旅馆业
				else if (CommonFinalParams.HYLB_LGY.equals(dwsx.trim()))
				{
					saveTzhyLgxxBean(dwBean);
				}
				//开锁业
				else if (CommonFinalParams.HYLB_KSY.equals(dwsx.trim()))
				{
					saveThksyBean(dwBean);
				}
			}
		}
	}
	
	/**
	 * 保存特种行业
	 * @param dwBean
	 * @return
	 * @date Jul 1, 2014 9:55:39 AM
	 */
	public void saveTzhyBean(DwBean dwBean) throws Exception
	{
		 
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		DwjbxxBean dwJbxxBean = dwBean.getDwjbxx();
		TzhyBean tzhyBean = dwBean.getTzhy();
		boolean isupdatefield = dwBean.getIsupdatefield();
		if (ValidateHelper.isEmptyString(tzhyBean.getThbh()))
		{
			String thbh = CommonSequenceHelper.getJGBH(loginInfo.getOrgcode(), "TH");
			tzhyBean.setThbh(thbh);
			tzhyBean.setJgbh(dwJbxxBean.getJgbh());
			tzhyBean.setThmc(dwJbxxBean.getDwmc());
			dao.insertTzhyBean(tzhyBean);
		}
		else
		{
			tzhyBean.setJgbh(dwJbxxBean.getJgbh());
			tzhyBean.setThmc(dwJbxxBean.getDwmc());
			if (!isupdatefield)
			{
				dao.updateTzhyBean(tzhyBean);
				dwDao.updateDwjbxxCzsj(dwJbxxBean.getJgbh());
			}
		}
	}
	
	/**
	 * 保存公共场所信息
	 * @param dwBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:25:00 PM
	 */
	public void saveGgcsBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		DwjbxxBean dwJbxxBean = dwBean.getDwjbxx();
		GgcsBean ggcsBean = dwBean.getGgcs();
		boolean isupdatefield = dwBean.getIsupdatefield();
		if (ValidateHelper.isEmptyString(ggcsBean.getJlbh()))
		{
			String jlbh = CommonSequenceHelper.getJGBH(loginInfo.getOrgcode(), "GG");
			ggcsBean.setJlbh(jlbh);
			ggcsBean.setJgbh(dwJbxxBean.getJgbh());
			ggcsBean.setCsmc(dwJbxxBean.getDwmc());
			dao.insertGgcsBean(ggcsBean);
		}
		else
		{
			ggcsBean.setJgbh(dwJbxxBean.getJgbh());
			ggcsBean.setCsmc(dwJbxxBean.getDwmc());
			if (!isupdatefield)
			{
				dao.updateGgcsBean(ggcsBean);
				dwDao.updateDwjbxxCzsj(dwJbxxBean.getJgbh());
			}
		}
	}
	
	/**
	 * 保存内保单位
	 * @param dwBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:30:40 PM
	 */
	public void saveNbdwBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		DwjbxxBean dwJbxxBean = dwBean.getDwjbxx();
		NbdwBean nbdwBean = dwBean.getNbdw();
		boolean isupdatefield = dwBean.getIsupdatefield();
		if (ValidateHelper.isEmptyString(nbdwBean.getNbdwbh()))
		{
			String nbdwbh = CommonSequenceHelper.getJGBH(loginInfo.getOrgcode(),"NB");
			nbdwBean.setNbdwbh(nbdwbh);
			nbdwBean.setJgbh(dwJbxxBean.getJgbh());
			dao.insertNbdwBean(nbdwBean);
		}
		else
		{
			nbdwBean.setJgbh(dwJbxxBean.getJgbh());
			if (!isupdatefield)
			{
				dao.updateNbdwBean(nbdwBean);
				dwDao.updateDwjbxxCzsj(dwJbxxBean.getJgbh());
			}
		}
	}
	
	/**
	 * 保存危险物品单位
	 * @param dwBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:34:09 PM
	 */
	public void saveWxpdwBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		DwjbxxBean dwJbxxBean = dwBean.getDwjbxx();
		WxwpdwBean wxpdwBean = dwBean.getWxwpdwBean();
		boolean isupdatefield = dwBean.getIsupdatefield();
		if (ValidateHelper.isEmptyString(wxpdwBean.getJlbh()))
		{
			String jlbh = CommonSequenceHelper.getJGBH(loginInfo.getOrgcode(),"WP");
			wxpdwBean.setJlbh(jlbh);
			wxpdwBean.setJgbh(dwJbxxBean.getJgbh());
			wxpdwBean.setDwfl(StringArrayListHelper.converStringArrayToStr(wxpdwBean.getDwfls(), ","));
			dao.insertWxwpdwBean(wxpdwBean);
			
			//社区民警新增危爆单位是需添加审核
			if(loginInfo.getLeve() == 5){
				WbdwManagerService wbdwService = new WbdwManagerServiceImpl();
				WbdwShBean wbdwsh = new WbdwShBean();
				wbdwsh.initTjr();
				wbdwsh.setJgbh(dwJbxxBean.getJgbh());
				wbdwsh.setCzlx(CommonConstant.CZBZ_ADD);
				wbdwService.insertWbdwsh(wbdwsh);
			}
		}
		else
		{
			wxpdwBean.setJgbh(dwJbxxBean.getJgbh());
			wxpdwBean.setDwfl(StringArrayListHelper.converStringArrayToStr(wxpdwBean.getDwfls(), ","));
			if (!isupdatefield)
			{
				dao.updateWxwpdwBean(wxpdwBean);
				dwDao.updateDwjbxxCzsj(dwJbxxBean.getJgbh());
			}
		}
	}
	
	/**
	 * 保存上网服务场所
	 * @param dwBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:37:59 PM
	 */
	public void saveSwfwcsBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		DwjbxxBean dwJbxxBean = dwBean.getDwjbxx();
		SwfwcsBean swfwcsBean = dwBean.getSwfwcs();
		boolean isupdatefield = dwBean.getIsupdatefield();
		if (ValidateHelper.isEmptyString(swfwcsBean.getJlbh()))
		{
			String jlbh = CommonSequenceHelper.getJGBH(loginInfo.getOrgcode(), "WB");
			swfwcsBean.setJlbh(jlbh);
			swfwcsBean.setJgbh(dwJbxxBean.getJgbh());
			dao.insertSwfwcsBean(swfwcsBean);
		}
		else
		{
			swfwcsBean.setJgbh(dwJbxxBean.getJgbh());
			if (!isupdatefield)
			{
				dao.updateSwfwcsBean(swfwcsBean);
				dwDao.updateDwjbxxCzsj(dwJbxxBean.getJgbh());
			}
		}
	}
	
	/**
	 * 保存涉外单位对象
	 * @param dwBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:42:04 PM
	 */
	public void saveSwdwBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		DwjbxxBean dwJbxxBean = dwBean.getDwjbxx();
		SwdwBean swdwBean = dwBean.getSwdwBean();
		if (ValidateHelper.isEmptyString(swdwBean.getJlbh()))
		{
			String jlbh = CommonSequenceHelper.getJGBH(loginInfo.getOrgcode(), "SW");
			swdwBean.setJlbh(jlbh);
			swdwBean.setJgbh(dwJbxxBean.getJgbh());
			dao.insertSwdwBean(swdwBean);
		}
		else
		{
			swdwBean.setJgbh(dwJbxxBean.getJgbh());
			dao.updateSwdwBean(swdwBean);
			dwDao.updateDwjbxxCzsj(dwJbxxBean.getJgbh());
		}
	}
	
	/**
	 * 单位管理部门核实
	 * @param bean
	 * @return
	 */
	public DwBean dwGlbmHs(DwBean bean){
		TransactionManager tr = new TransactionManager();
		try {
			tr.begin();
			DwGlbmHsBean dwglbmhs = bean.getDwhs();
			
			LoginInfo loginUser = ActionContextHelper.getLoginInfo();
			dwglbmhs.setHcdwdm(loginUser.getOrgcode());
			dwglbmhs.setHcdwmc(loginUser.getOrgname());
			dwglbmhs.setHcrjh(loginUser.getUsername());
			dwglbmhs.setHcrxm(loginUser.getRealname());
			dwglbmhs.setHcrsfzh(loginUser.getSfzh());

			//更新单位基本信息中管理部门标识
			DwjbxxBean dwjbxx = new DwjbxxBean();
			dwjbxx.setJgbh(dwglbmhs.getJgbh());
			//1	治安
			if("1".equals(dwglbmhs.getGlbm())){
				if("1".equals(dwglbmhs.getSfgl())){
					dwjbxx.setSfzagl("1");
					dwglbmhs.setZahc("1");
				}else{
					dwjbxx.setSfzagl("0");
					dwglbmhs.setZahc("0");
				}
			}
			
			//2	内保
			if("2".equals(dwglbmhs.getGlbm())){
				if("1".equals(dwglbmhs.getSfgl())){
					dwjbxx.setSfnbgl("1");
					dwglbmhs.setNbhc("1");
				}else{
					dwjbxx.setSfnbgl("0");
					dwglbmhs.setNbhc("0");
				}
			}
			
			
			//4	网监
			if("4".equals(dwglbmhs.getGlbm())){
				if("1".equals(dwglbmhs.getSfgl())){
					dwjbxx.setSfwjgl("1");
					dwglbmhs.setWjhc("1");
				}else{
					dwjbxx.setSfwjgl("0");
					dwglbmhs.setWjhc("0");
				}
			}
			
			//5	消防
			if("5".equals(dwglbmhs.getGlbm())){
				if("1".equals(dwglbmhs.getSfgl())){
					dwjbxx.setSfxfgl("1");
					dwglbmhs.setXfhc("1");
				}else{
					dwjbxx.setSfxfgl("0");
					dwglbmhs.setXfhc("0");
				}
			}
			
			if(ValidateHelper.isEmptyString(dwglbmhs.getId())){
				//新增核实记录
				String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZA_DWHC_ID");
				dwglbmhs.setId(id);
				dao.insertDwglbmHs(dwglbmhs);
				
				// 核签成内保单位且在单位属性中不存在内保单位则新增内保单位属性  并新增内保单位信息
				if("1".equals(dwjbxx.getSfnbgl())){
					String hylb = dao.queryDwHylbByJgbh(dwglbmhs.getJgbh());
					if(!(hylb.isEmpty() && hylb.contains("03"))){
						hylb += ",03";
						//更新单位属性
						dao.updateDwHylbByJgbh(hylb, dwglbmhs.getJgbh());
						//新增内保单位
						NbdwBean nbdwBean = new NbdwBean();
						String nbdwbh = CommonSequenceHelper.getJGBH(loginUser.getOrgcode(),"NB");
						nbdwBean.setNbdwbh(nbdwbh);
						nbdwBean.setJgbh(dwglbmhs.getJgbh());
						dao.insertNbdwBean(nbdwBean);
					}
				}
			}else{
				dao.updateDwglbmHs(dwglbmhs);
			}
			dao.updateDwjbxxGlbmBz(dwjbxx);
			tr.commit();
			
			bean.setDwhs(dwglbmhs);
			bean.setDwjbxx(dwjbxx);
			
		} catch (Exception e) {
			bean = null;
			
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return bean;
	}
	
	/**
	 * 验证单位是否存在 通过单位名称
	 * @param queryBean
	 * @return
	 * @date Jul 7, 2014 11:39:52 AM
	 */
	public DwjbxxExistsBean queryDwBeanBeanByXqDwmc(String dwmc)
	{
		return dao.queryDwBeanBeanByXqDwmc(dwmc);
	}
	
	/**
	 * 根据机构编号和行业类别查询单位核签信息
	 * @param query glbm:1	治安	2	内保 3	外管 4	网监 5	消防	9	其他				
	 * @return
	 */
	public DwGlbmHsBean queryDwhcByJgbhAndHylb(DwQueryBean query){
		DwGlbmHsBean dwhs = null;
		try {
			dwhs = dao.queryDwhcByJgbhAndHylb(query);
			if(dwhs != null){
				if(ValidateHelper.isNotEmptyString(dwhs.getZahc())){
					dwhs.setGlbm("1");
				}else if(ValidateHelper.isNotEmptyString(dwhs.getNbhc())){
					dwhs.setGlbm("2");
				}else if(ValidateHelper.isNotEmptyString(dwhs.getXfhc())){
					dwhs.setGlbm("5");
				}else if(ValidateHelper.isNotEmptyString(dwhs.getWjhc())){
					dwhs.setGlbm("4");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dwhs;
	}
	
}
