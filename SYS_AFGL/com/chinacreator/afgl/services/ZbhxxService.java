package com.chinacreator.afgl.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.ZbhcyxxBean;
import com.chinacreator.afgl.bean.ZbhxxBean;
import com.chinacreator.afgl.dao.ZbhxxDao;
import com.chinacreator.afgl.query.ZbhxxQuery;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 治保会信息
 *
 */
public class ZbhxxService {
	
	/**
	 * 治保会信息列表
	 */
	public PageResultInfo<ZbhxxBean> zbhxxList(PageInfo pageInfo, ZbhxxQuery zbhxxQuery) throws Exception{
		return ZbhxxDao.zbhxxList(pageInfo, zbhxxQuery);
	}
	
	/**
	 * 新增、修改、删除治保会信息
	 */
	public String addZbhxx(ZbhxxBean zbhxxBean) throws Exception
	{
		//新增
		if("1".equals(zbhxxBean.getCzbs()))
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			if(ValidateHelper.isNotEmptyString(zbhxxBean.getZbhbh()))
			{
				ZbhxxDao.updateZbhxxByZbhbh(zbhxxBean);
			}
			else
			{
				String zbhbh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_af_zbhxx");
				zbhxxBean.setZbhbh(zbhbh);
				zbhxxBean.setZxbs("0");
				zbhxxBean.setDjrsfzh(loginInfo.getSfzh());
				ZbhxxDao.addZbhxx(zbhxxBean);
			}
		}
		//修改
		else if("2".equals(zbhxxBean.getCzbs()))
		{
			zbhxxBean.setZxbs("0"); 
			ZbhxxDao.updateZbhxxByZbhbh(zbhxxBean);
		}
		//删除
		else if("3".equals(zbhxxBean.getCzbs()))
		{
			zbhxxBean.setZxbs("1");
			ZbhxxDao.deleteZbhxxByZbhbh(zbhxxBean);
		}
		return zbhxxBean.getZbhbh();
	}
	
	/**
	 * 得到治保会信息
	 */
	public ZbhxxBean getZbhxxByZbhbh(ZbhxxQuery zbhxxQuery) throws Exception{
		ZbhxxBean zbhxxBean = ZbhxxDao.getZbhxxByZbhbh(zbhxxQuery);
		zbhxxBean.setCzbs(zbhxxQuery.getCzbs());
		return zbhxxBean;
	}
	
	/**
	 * 得到治保会列表信息
	 */
	public List<ZbhxxBean> getzbhxxListByZbhbhs(ZbhxxQuery zbhxxQuery) throws Exception{
		List<ZbhxxBean> zbhxxList = new ArrayList<ZbhxxBean>();
		String zbhbhs = zbhxxQuery.getZbhbh();
		if(ValidateHelper.isNotEmptyString(zbhbhs)){
			for (String zbhbh : zbhbhs.split(",")) {
				ZbhxxQuery zbhxxQuerys = new ZbhxxQuery();
				zbhxxQuerys.setZbhbh(zbhbh);
				ZbhxxBean zbhxxBean = ZbhxxDao.getZbhxxByZbhbh(zbhxxQuerys);
				zbhxxList.add(zbhxxBean);
			}
		}
		return zbhxxList;
	}
	
	/**
	 * 批量注销治保会信息
	 */
	public void batchDeleteZbhxxByZbhbhs(List<ZbhxxBean> zbhxxList, ZbhxxBean zbhxxBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			if(ValidateHelper.isNotEmptyCollection(zbhxxList))
			{
				for (ZbhxxBean zbhxxsBean : zbhxxList) 
				{
					zbhxxsBean.setZxbs("1");
					zbhxxsBean.setZxsj(zbhxxBean.getZxsj());
					zbhxxsBean.setZxyy(zbhxxBean.getZxyy());
					
					LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
					zbhxxsBean.setDjdwdm(loginInfo.getOrgcode());
					zbhxxsBean.setDjdwmc(loginInfo.getOrgname());
					zbhxxsBean.setDjrjh(loginInfo.getUsername());
					zbhxxsBean.setDjrxm(loginInfo.getRealname());
					zbhxxsBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					ZbhxxDao.deleteZbhxxByZbhbh(zbhxxsBean);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
		}
	}

	public ZbhcyxxBean queryZbhxxBeanByZbhbh(String zbhbh) throws SQLException 
	{
		return ZbhxxDao.queryZbhxxBeanByZbhbh(zbhbh);
	}

	public PageResultInfo<ZbhcyxxBean> zbhcyxxList(PageInfo pageInfo,
			QueryBean query) throws SQLException {
		return ZbhxxDao.zbhcyxxList(pageInfo,query);
	}
	
	public  boolean queryZhbByNameAndOrg(String zbhmc,String orgcode) throws SQLException{
		boolean flag=false;
		ZbhxxBean zbhxxBean=ZbhxxDao.queryZhbByNameAndOrg(zbhmc, orgcode);
		if(zbhxxBean!=null){
			flag=true;
		}else{
			flag=false;
		}
		return flag; 
	}
}
