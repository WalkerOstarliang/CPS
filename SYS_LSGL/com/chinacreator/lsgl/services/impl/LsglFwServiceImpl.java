package com.chinacreator.lsgl.services.impl;

import java.io.File;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.constants.CommonFinalParams;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dzgl.bean.DzxxBean;
import com.chinacreator.dzgl.service.DzxxService;
import com.chinacreator.lsgl.bean.CzfwJbxxBean;
import com.chinacreator.lsgl.bean.CzwxcdjxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.FwdzQyBean;
import com.chinacreator.lsgl.bean.FwzpxxBean;
import com.chinacreator.lsgl.bean.queryBean.LsfwQueryBean;
import com.chinacreator.lsgl.dao.LsglCzfwJbxxDao;
import com.chinacreator.lsgl.dao.LsglFwJbxxDao;
import com.chinacreator.lsgl.dao.impl.LsglCzfwJbxxDaoImpl;
import com.chinacreator.lsgl.dao.impl.LsglFwJbxxDaoImpl;
import com.chinacreator.lsgl.query.FwQueryBean;
import com.chinacreator.lsgl.services.LsglFwService;
import com.chinacreator.zagl.bean.DwjbxxBean;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 两室管理房屋基本信息service
 * 
 * @filename LsglFwJbxxServiceImpl.java
 * @author mingchun.xiong
 * @date 2013-8-7
 *
 */
public class LsglFwServiceImpl implements LsglFwService
{
	private DzxxService dzxxService;
	private LsglFwJbxxDao fwJbxxDao;
	private LsglCzfwJbxxDao  czfwDao;
	
	public LsglFwServiceImpl()
	{
		fwJbxxDao = new LsglFwJbxxDaoImpl();
		czfwDao=new LsglCzfwJbxxDaoImpl();
		dzxxService = new DzxxService();
	}
	
	/**
	 * 房屋基本列表查询
	 */
	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfo(
			PageInfo pageInfo, FwQueryBean queryBean) throws Exception
	{
		return fwJbxxDao.queryFwBeanPageResultInfo(pageInfo, queryBean);
	}
	
	/**
	 * 通过房屋编号查询房屋基本信息
	 */
	public FwJbxxBean queryFwJbxxBeanByFwid(String fwid, String jsppage) throws Exception
	{
		return fwJbxxDao.queryFwJbxxBeanByFwid(fwid,jsppage);
	}

	/**
	 * 保存房屋基本信息 包括新增和修改
	 * @param fwBean 房屋对象
	 * @param msgtype  
	 * @throws Exception
	 * @date 2013-8-7
	 */
	public FwJbxxBean saveFwJbxxBean(FwJbxxBean fwBean, String msgtype) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			//房屋基本信息
			if (CommonFinalParams.MSGTYPE_FW_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_FW_FWJBXX.equals(msgtype))
			{
				fwBean.setSssq(fwBean.getStxxBean().getSqdm());
				saveFwJbxx(fwBean);
			}
			//承租房巡查登记信息
			else if (CommonFinalParams.MSGTYPE_FW_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_FW_CZFXCDJ.equals(msgtype))
			{
				saveXcdjxxBean(fwBean);
			}
			tm.commit();
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
			throw new Exception("保存房屋信息失败.");
		}
		return fwBean;
	}
	
	
	/**
	 * 保存巡查登记信息
	 * @param fwJbxxBean
	 * @return
	 * @date 2013-9-10 下午02:40:50
	 */
	public FwJbxxBean saveXcdjxxBean(FwJbxxBean fwBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			CzwxcdjxxBean xcdjBean = fwBean.getXcdjBean();
			xcdjBean.setFwid(fwBean.getFwid());
			xcdjBean.setDjdwdm(loginInfo.getOrgcode());
			xcdjBean.setDjdwmc(loginInfo.getOrgname());
			xcdjBean.setDjrxm(loginInfo.getRealname());
			xcdjBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			if (ValidateHelper.isNotEmptyString(fwBean.getXcdjBean().getXcdjbh()))
			{
				fwJbxxDao.updateCzwxcdjxxBean(fwBean.getXcdjBean());
			}
			else
			{
				String xcdjbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_XCDJBH");
				xcdjBean.setXcdjbh(xcdjbh);
	 			fwJbxxDao.insertCzwxcdjxxBean(fwBean.getXcdjBean());
			}
			fwJbxxDao.updateCzfwJbxxZhxcsjForCurrentDate(fwBean.getFwid());
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
		}
		return fwBean;
	}
	
	/**
	 * 保存房屋基本信息 包括新增和修改 ，执行文件保存操作
	 * @param fwBean 房屋对象
	 * @param msgtype 1 ：房屋基本信息 2:房屋照片信息 3：房屋人员信息 4：出租登记信息 5：出租房巡查登记信息
	 * @param zpUploads 上传文件
	 * @param zpUploadsFileName 上传文件名称
	 * @throws Exception
	 * @date 2013-8-14 下午05:43:19
	 */
	public FwJbxxBean saveFwJbxxBean(FwJbxxBean fwBean, String msgtype,
			File[] zpUploads, String[] zpUploadsFileName) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			
			//房屋信息
			if (CommonFinalParams.MSGTYPE_FW_ALL.equals(msgtype) || !CommonFinalParams.MSGTYPE_FW_FWZPXX.equals(msgtype))
			{
				saveFwJbxxBean(fwBean, msgtype);
			}
			//房屋照片信息
			if (CommonFinalParams.MSGTYPE_FW_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_FW_FWZPXX.equals(msgtype))
			{
				saveFwzpxx(fwBean, zpUploads, zpUploadsFileName);
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
			throw new Exception("房屋信息保存失败.");
		}
		return fwBean;
	}

	/**
	 * 保存房屋信息
	 * @param fwBean
	 * @throws Exception
	 * @date 2013-9-6 下午05:45:16
	 */
	private void saveFwJbxx(FwJbxxBean fwBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			fwBean.setCzdwdm(loginInfo.getOrgcode());
			fwBean.setCzdwmc(loginInfo.getOrgname());
			fwBean.setCzrxm(loginInfo.getRealname());
			fwBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			String sspcsdm = loginInfo.getOrgcode().substring(0, 8)+"0000";
			fwBean.setSspcsdm(sspcsdm);
			fwBean.setSspcsmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(sspcsdm));
			fwBean.setSsgajgjgdm(loginInfo.getOrgcode().substring(0, 6)+"000000");
			fwBean.setSsgajgjgmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(loginInfo.getOrgcode().substring(0, 6)+"000000"));
			
			//共有
			if ("1".equals(fwBean.getCqlx()))
			{
				fwBean.setCqrlxdh(fwBean.getFrdblxdh());
				fwBean.setCqrsfzh(fwBean.getFrdbsfzh());
				fwBean.setCqrxm(fwBean.getFrdbxm());
				fwBean.setFdsyrlxdh(fwBean.getFrdblxdh());
				fwBean.setFdsyrsfzh(fwBean.getFrdbsfzh());
				fwBean.setFdsyrxm(fwBean.getFrdbxm());
				fwBean.setHzlxdh(fwBean.getFrdblxdh());
				fwBean.setHzsfzh(fwBean.getFrdbsfzh());
				fwBean.setHzxm(fwBean.getFrdbxm());
			}
			//私有
			else
			{
				fwBean.setCqrlxdh(fwBean.getHzlxdh());
				fwBean.setCqrsfzh(fwBean.getHzsfzh());
				fwBean.setCqrxm(fwBean.getHzxm());
				fwBean.setFdsyrlxdh(fwBean.getHzlxdh());
				fwBean.setFdsyrsfzh(fwBean.getHzsfzh());
				fwBean.setFdsyrxm(fwBean.getHzxm());
				fwBean.setFrdblxdh(fwBean.getHzlxdh());
				fwBean.setFrdbsfzh(fwBean.getHzsfzh());
				fwBean.setFrdbxm(fwBean.getHzxm());
			}

			// 如果是新增操作
			if (ValidateHelper.isEmptyString(fwBean.getFwid()))
			{
				String xzqh = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
				fwBean.setFwid(xzqh+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwid"));
				fwBean.setFwbm(CommonSequenceHelper.getFWBM(fwBean.getSssq()));
				fwBean.setCzbs("1");
				fwBean.setDjdwdm(loginInfo.getOrgcode());
				fwBean.setDjdwmc(loginInfo.getOrgname());
				fwBean.setDjrxm(loginInfo.getRealname());
				fwBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				fwBean.setDjrsfzh(loginInfo.getSfzh());
				
				//保存地址信息
				fwBean.getDzxxBean().setStid(fwBean.getStxxBean().getId());
				fwBean.getDzxxBean().setSqdm(fwBean.getStxxBean().getSqdm());
				dzxxService.saveDzxxBean(fwBean.getDzxxBean());
				
				//保存房屋信息
				fwBean.setDzid(fwBean.getDzxxBean().getDzid());
				fwJbxxDao.insertFwJbxxBean(fwBean);
				
				//保存出租屋信息
				saveCzfwBean(fwBean);
				
			}
			//如果是更新操作
			else
			{
				fwBean.getDzxxBean().setSqdm(fwBean.getStxxBean().getSqdm());
				//保存地址信息
				dzxxService.saveDzxxBean(fwBean.getDzxxBean());
				
				//保存房屋信息
				fwBean.setCzbs("2");
				fwJbxxDao.updateFwJbxxBean(fwBean);
				
				//更新出租屋信息
				saveCzfwBean(fwBean);
			}
			tm.commit();
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
			throw new Exception("保存房屋信息失败.");
		}
	}
	
	public FwJbxxBean saveCzfwBean(FwJbxxBean fwBean)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if("1".equals(fwBean.getSfczw()))
		{
			TransactionManager tm = null;
			try 
			{
				tm = new TransactionManager();
				tm.begin();
				fwBean.getCzfwBean().setFwzt("0");
				if(ValidateHelper.isNotEmptyString(fwBean.getCzfwBean().getId()))
				{
					if(ValidateHelper.isNotEmptyString(fwBean.getCzfwBean().getFzsfzh()))
					{
						fwBean.setFwid(fwBean.getCzfwBean().getFwbh());
						fwBean.setHzsfzh(fwBean.getCzfwBean().getFzsfzh());
						fwBean.setHzxm(fwBean.getCzfwBean().getFzxm());
						fwBean.setHzlxdh(fwBean.getCzfwBean().getLxdh());
						fwBean.setFrdbsfzh(fwBean.getCzfwBean().getFzsfzh());
						fwBean.setFrdbxm(fwBean.getCzfwBean().getFzxm());
						fwBean.setFrdblxdh(fwBean.getCzfwBean().getLxdh());
						fwJbxxDao.updateFwJbxxFromCzfw(fwBean);
					}
					else
					{
						fwBean.getCzfwBean().setFzsfzh(fwBean.getHzsfzh());
						fwBean.getCzfwBean().setFzxm(fwBean.getHzxm());
						fwBean.getCzfwBean().setLxdh(fwBean.getHzlxdh());
					}
					fwBean.getCzfwBean().setZzbh(fwBean.getDzxxBean().getDzid());
					czfwDao.updateCzfwJbxxBean(fwBean.getCzfwBean());
					//是出租房登记,表示把最初始为出租屋后来又变为非出租屋，最后又变为出租屋的过程
					if ("1".equals(fwBean.getIsczfdj()))
					{
						fwJbxxDao.updateCzfwJbxxZhxcsjForCurrentDate(fwBean.getFwid());
					}
				}
				else
				{
					String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
					String id=xzdm+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_CZFW_ID");
					fwBean.getCzfwBean().setId(id);
					if(ValidateHelper.isEmptyString(fwBean.getCzfwBean().getFwbh()))
					{
						fwBean.getCzfwBean().setFwbh(fwBean.getFwid());						
					}
					fwBean.getCzfwBean().setDjdwdm(loginInfo.getOrgcode());
					fwBean.getCzfwBean().setDjdwmc(loginInfo.getOrgname());
					fwBean.getCzfwBean().setDjrxm(loginInfo.getRealname());
					fwBean.getCzfwBean().setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					fwBean.getCzfwBean().setDjrsfzh(loginInfo.getSfzh());
					fwBean.getCzfwBean().setZzbh(fwBean.getDzxxBean().getDzid());
					if(ValidateHelper.isNotEmptyString(fwBean.getCzfwBean().getFzsfzh()))
					{
						fwBean.setFwid(fwBean.getCzfwBean().getFwbh());
						fwBean.setHzsfzh(fwBean.getCzfwBean().getFzsfzh());
						fwBean.setHzxm(fwBean.getCzfwBean().getFzxm());
						fwBean.setHzlxdh(fwBean.getCzfwBean().getLxdh());
						
						fwBean.setFrdbsfzh(fwBean.getCzfwBean().getFzsfzh());
						fwBean.setFrdbxm(fwBean.getCzfwBean().getFzxm());
						fwBean.setFrdblxdh(fwBean.getCzfwBean().getLxdh());
						
						fwJbxxDao.updateFwJbxxFromCzfw(fwBean);
					}else{
						fwBean.getCzfwBean().setFzsfzh(fwBean.getHzsfzh());
						fwBean.getCzfwBean().setFzxm(fwBean.getHzxm());
						fwBean.getCzfwBean().setLxdh(fwBean.getHzlxdh());
					}
					czfwDao.insertCzfwJbxxBean(fwBean.getCzfwBean());					
				}
				tm.commit();
			} 
			catch (Exception e) 
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
		}
		return fwBean;
	}
	
	/**
	 * 保存房屋照片信息
	 * @param fwBean
	 * @param zpUploads
	 * @param zpUploadsFileName
	 * @date 2013-9-6 下午05:46:14
	 */
	public void saveFwzpxx(FwJbxxBean fwBean,File[] zpUploads, String[] zpUploadsFileName) throws Exception
	{
		//包上传文件封装成list
		List<FwzpxxBean> fwzpxxList = wrapFwzpxxBean(zpUploads, zpUploadsFileName, fwBean.getFwid());
		fwBean.setFwzpxxList(fwzpxxList);
		fwJbxxDao.insertFwzpxxList(fwzpxxList);
	}
	
	/**
	 * 构建房屋照片信息对象
	 * @param zpUploads
	 * @param zpUploadsFileName
	 * @return
	 * @date 2013-8-14 下午05:07:14
	 */
	public List<FwzpxxBean> wrapFwzpxxBean(File[] zpUploads, String[] zpUploadsFileName, String fwid)
	{
		List<FwzpxxBean> list = null;
		if (zpUploads != null && zpUploads.length > 0)
		{
			list = new ArrayList<FwzpxxBean>();
			FwzpxxBean fwzpBean = null;
			for (int i=0; i<zpUploads.length;i++)
			{
				fwzpBean = new FwzpxxBean();
				fwzpBean.setId(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsg_zpid"));
				fwzpBean.setFwid(fwid);
				fwzpBean.setMs(zpUploadsFileName[i]);
				fwzpBean.setZp(zpUploads[i]);
				list.add(fwzpBean);
			}
		}
		return list;
	}

	/**
	 * 通过照片ID删除照片信息
	 * @param zpid
	 * @throws Exception
	 * @date 2013-8-15 上午09:23:11
	 */
	public void deleteFwzpxxBeanByZpid(String zpid) throws Exception
	{
		fwJbxxDao.deleteFwzpxxById(zpid);
	}

	/**
	 * 获取照片信息流
	 * @param zpid 照片ID
	 * @return
	 * @throws Exception
	 * @date 2013-8-15 上午09:57:52
	 */
	public Blob getFwzpxxInputStream(String zpid) throws Exception
	{
		return fwJbxxDao.getFwzpStream(zpid);
	}

	public PageResultInfo<CzwxcdjxxBean> queryCzwxcdjxxPageResultInfo(
			PageInfo pageInfo, String fwid) throws Exception {
		return fwJbxxDao.queryCzwxcdjxxPageResultInfo(pageInfo, fwid);
	}

	public PageResultInfo<CzfwJbxxBean> queryCzfwPageInfo(
			FwQueryBean queryBean, PageInfo pageInfo) throws Exception {
		return czfwDao.queryCzfwBeanPageInfo(queryBean, pageInfo);
	}
	
	public FwJbxxBean queryFwxxBeanByDzid(String dzid) throws Exception
	{
		return fwJbxxDao.queryFwJbxxBeanByDzid(dzid);
	}

	public PageResultInfo<CzfwJbxxBean> queryCzfwListPageByFwid(String fwid,
			PageInfo pageInfo) throws Exception {
		return czfwDao.queryCzfwListPageByFwid(fwid, pageInfo);
	}

	public CzfwJbxxBean queryCzfwBeanByCzfwbh(String czfwbh) throws Exception {
		return czfwDao.queryCzfwBeanByCzfwbh(czfwbh);
	}
	
	public CzfwJbxxBean queryCzfwBeanByfwid(String fwid) throws Exception{
		return czfwDao.queryCzfwBeanByfwid(fwid);
	}

	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByStid(
			PageInfo pageInfo, String stid) throws Exception 
	{
		return fwJbxxDao.queryFwBeanPageResultInfoByStid(pageInfo, stid);
	}

	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByQueryBean(PageInfo pageInfo, FwQueryBean queryBean) throws Exception
	{
		return fwJbxxDao.queryFwBeanPageResultInfoByQueryBean(pageInfo, queryBean);
	}
	
	@Override
	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByStidWithPicNum(
			PageInfo pageInfo, String stid, LsfwQueryBean query) throws Exception {
		return fwJbxxDao.queryFwBeanPageResultInfoByStidWithPicNum(pageInfo, stid, query);
	}
	
	public boolean queryFwJbxxBeanByStidAndDyLcFj(DzxxBean bean) throws Exception 
	{
		boolean flag=false;
		bean = fwJbxxDao.queryFwJbxxBeanByStidAndDyLcFj(bean);
		if(bean !=null){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}

	public boolean queryFwJbxxBeanByStidAndDyLcFj(FwJbxxBean bean)
			throws Exception {
		boolean flag=false;
		bean = fwJbxxDao.queryFwJbxxBeanByStidAndDyLcFj(bean);
		if(bean !=null){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}
	
	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByFwQueryBean(PageInfo pageInfo,FwQueryBean queryBean) throws Exception
	{
		return fwJbxxDao.queryFwBeanPageResultInfoByFwQueryBean(pageInfo, queryBean);
	}

	/**
	 * 房屋注销前做判断是否存在人员 
	 */
	@Override
	public boolean queryRklistInFwxx(String fwid) throws Exception {
		boolean flag = false;
		List<RkJbxxBean>  list =fwJbxxDao.queryRklistInFwxx(fwid);
		if(list.size()>0){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}

	@Override
	public void deleteFwJbxxBean(FwJbxxBean fwBean) throws Exception {
		fwJbxxDao.deleteFwJbxxBean(fwBean);
	}

	@Override
	public PageResultInfo<DwjbxxBean> queryGlDwxxPageResultInfo(
			PageInfo pageInfo, FwQueryBean queryBean) throws Exception
	{
		return fwJbxxDao.queryGlDwxxPageResultInfo(pageInfo, queryBean);
	}

	@Override
	public void deleteCzFwJbxxBean(FwJbxxBean fwBean) throws Exception  {
		TransactionManager tm = null;
		try 
		{
			tm = new TransactionManager();
			tm.begin();
			fwJbxxDao.deleteCzFwJbxxBean(fwBean);
			fwJbxxDao.logoutCzfwJbxxBean(fwBean.getFwid());
			tm.commit(); 
		} 
		catch (SQLException e) 
		{
			try
			{
				tm.rollback();
			}
			catch(RollbackException e1)
			{
			}
			e.printStackTrace();
			throw new Exception("删除出租房屋基本信息失败.");
		}
	}

	@Override
	public PageResultInfo<FwJbxxBean> queryFwInfoByHzsfzh(String hzsfzh,PageInfo pageInfo) throws Exception {
		return fwJbxxDao.queryFwInfoByHzsfzh(hzsfzh,pageInfo);
	}

	@Override
	public List<FwzpxxBean> queryFwzpxxListByFwid(String fwid) throws Exception
	{
		return fwJbxxDao.queryFwzpxxListByFwid(fwid);
	}

	@Override
	public FwJbxxBean queryFwJbxxBeanByFwid(String fwid) throws Exception
	{
		return fwJbxxDao.queryFwJbxxBeanByFwid(fwid);
	}

	@Override
	public List<FwJbxxBean> queryFwListByFwids(String fwids) throws Exception {
		return fwJbxxDao.queryFwListByFwids(fwids);
	}

	@Override
	public List<FwJbxxBean> queryFwlistByFwqueryBean(FwQueryBean queryBean)
			throws Exception {
		return fwJbxxDao.queryFwlistByFwqueryBean(queryBean);
	}

	@Override
	public PageResultInfo<FwJbxxBean> queryCzfwPageInfoByQueryBean(FwQueryBean queryBean, PageInfo pageInfo) throws Exception 
	{
		return fwJbxxDao.queryCzfwPageInfoByQueryBean(queryBean, pageInfo);
	}

	@Override
	/**
	 * 地址房屋信息合并迁移
	 */
	public void dzfwqyupdate(FwdzQyBean fwdzqyBean){
		TransactionManager tm = null;
		try 
		{
			tm = new TransactionManager();
			tm.begin();
			fwJbxxDao.dzfwqyryxzzxzupdate(fwdzqyBean);
			fwJbxxDao.dzfwqydwfwglupdate(fwdzqyBean);
			fwJbxxDao.dzfwqyupdate(fwdzqyBean);
			tm.commit(); 
			
		} 
		catch (Exception e) 
		{
			try
			{
				tm.rollback();
			}
			catch(RollbackException e1)
			{
			}
			e.printStackTrace();
			try {
				throw new Exception("地址房屋迁移失败.");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}	
}
