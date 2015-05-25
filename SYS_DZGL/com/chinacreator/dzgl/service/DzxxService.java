package com.chinacreator.dzgl.service;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dzgl.bean.DzxxBean;
import com.chinacreator.dzgl.bean.StxxBean;
import com.chinacreator.dzgl.dao.DzxxDao;
import com.chinacreator.dzgl.query.DzxxQueryBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.frameworkset.orm.transaction.TransactionManager;

public class DzxxService
{
	
	public PageResultInfo<StxxBean> queryStxxBeansPageResult(PageInfo pageInfo, DzxxQueryBean queryBean) throws Exception
	{
		return DzxxDao.queryStxxBeansPageResult(pageInfo, queryBean);
	}
	
	public List<StxxBean> queryStxxBeans(DzxxQueryBean queryBean) throws Exception
	{
		return DzxxDao.queryStxxBeans(queryBean);
	}
	
	public PageResultInfo<DzxxBean> queryDzxxBeansPageResultInfo(PageInfo pageInfo, DzxxQueryBean queryBean) throws Exception
	{
		return DzxxDao.queryDzxxBeansPageResultInfo(pageInfo, queryBean);
	}
	
	public StxxBean queryStxxBeanByStId(String stid) throws Exception
	{
		return DzxxDao.queryStxxBeanByStId(stid);
	}
	
	public DzxxBean queryDzxxBeanByDzid(String dzid) throws Exception
	{
		return DzxxDao.queryDzxxBeanByDzid(dzid);
	}
	
	public StxxBean saveStxxBean(StxxBean stxxBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			if (ValidateHelper.isNotEmptyString(stxxBean.getId()))
			{
				stxxBean.setGxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				stxxBean.setPcsdm(loginInfo.getPcsdm());
				stxxBean.setPcsmc(loginInfo.getPcsmc());
				stxxBean.setCzrjh(loginInfo.getUsername());
				stxxBean.setCzrxm(loginInfo.getRealname());
				stxxBean.setCzrsfzh(loginInfo.getSfzh());
				stxxBean.setCzdwdm(loginInfo.getOrgcode());
				stxxBean.setCzdwmc(loginInfo.getOrgname());
				DzxxDao.updateStxxBean(stxxBean);
			}
			else
			{
				String xzqh = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
				stxxBean.setId(xzqh+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_common_stid"));
				stxxBean.setStbm(CommonSequenceHelper.getStbm(stxxBean.getSqdm(), stxxBean.getJlxdm(), stxxBean.getXqz()));
				stxxBean.setDjdwdm(loginInfo.getOrgcode());
				stxxBean.setDjdwmc(loginInfo.getOrgname());
				stxxBean.setDjrjh(loginInfo.getUsername());
				stxxBean.setDjrxm(loginInfo.getRealname());
				stxxBean.setPcsdm(loginInfo.getPcsdm());
				stxxBean.setPcsmc(loginInfo.getPcsmc());
				stxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				stxxBean.setDjrsfzh(loginInfo.getSfzh());
				DzxxDao.insertStxxBean(stxxBean);
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
			throw new Exception("保存实体信息失败.");
		}
		return stxxBean;
	}
	
	public DzxxBean saveDzxxBean(DzxxBean dzxxBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			if (ValidateHelper.isNotEmptyString(dzxxBean.getDzid()))
			{
				dzxxBean.setGxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				DzxxDao.updateDzxxBean(dzxxBean);
			}
			else
			{
				String dzid = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm")+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_common_dzid", "left", 16, "0");
				dzxxBean.setDzid(dzid);
				dzxxBean.setDzbm(CommonSequenceHelper.getDzbm(dzxxBean.getStid()));
				dzxxBean.setDjrdwdm(loginInfo.getOrgcode());
				dzxxBean.setDjrdwmc(loginInfo.getRealname());
				dzxxBean.setDjrxm(loginInfo.getRealname());
				dzxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				dzxxBean.setGxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				dzxxBean.setDjrsfzh(loginInfo.getSfzh());
				dzxxBean.setDjrjh(loginInfo.getUsername());
				DzxxDao.insertDzxxBean(dzxxBean);
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
			throw new Exception("保存地址信息失败.");
		}
		return dzxxBean;
	}
	
	//注销实体信息
	public  void deleteStxx(StxxBean stxxBean) throws SQLException{
		LoginInfo loginfo = ActionContextHelper.getLoginInfo();
		stxxBean.setCzrjh(loginfo.getUsername());
		stxxBean.setCzrxm(loginfo.getRealname());
		stxxBean.setCzdwmc(loginfo.getOrgname());
		stxxBean.setCzdwdm(loginfo.getOrgcode());
		stxxBean.setZxbs("0");
		DzxxDao.deleteStxx(stxxBean );
	}
	
	public void deleteStxxBeanByStId(String stid) throws Exception
	{
		DzxxDao.deleteStxxBeanByStid(stid);
	}
	
	public boolean  queryStxxIsIncludeFwxx(String id) throws Exception{
		boolean flag = false;
		int i =DzxxDao.queryStxxIsIncludeFwxx(id);
		if(i>0){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}
	
	/**
	 * 恢复实体
	 * @param stxxBean
	 * @throws Exception
	 */
	public void recoveryStxx(StxxBean stxxBean) throws Exception{
		LoginInfo loginfo = ActionContextHelper.getLoginInfo();
		stxxBean.setCzrjh(loginfo.getUsername());
		stxxBean.setCzrxm(loginfo.getRealname());
		stxxBean.setCzdwmc(loginfo.getOrgname());
		stxxBean.setCzdwdm(loginfo.getOrgcode());
		stxxBean.setZxbs("1");
		DzxxDao.recoveryStxx(stxxBean);
	}
	
	/**
	 * 获取实体信息下的所有单位信息
	 * @param stid
	 * @return
	 * @date Apr 20, 2015 2:57:07 PM
	 */
	public List<SystemDictionaryBean> queryStxxDyhxxList(String stid)
	{
		return DzxxDao.queryStxxDyhxxList(stid);
	}
	
	/**
	 * 查询房屋机构集合
	 * @param stid
	 * @return
	 * @date Apr 21, 2015 4:20:29 PM
	 */
	public List<FwJbxxBean> queryFwjgList(String stid,String dyh)
	{
		return DzxxDao.queryFwjgList(stid,dyh);
	}
	
	/**
	 * 查询房屋人口信息
	 * @param fwid
	 * @return
	 * @date Apr 25, 2015 12:04:15 PM
	 */
	public List<RkJbxxBean> queryFwRkxxBeansByFwid(String fwid)
	{
		return DzxxDao.queryFwRkxxBeansByFwid(fwid);
	}
}
