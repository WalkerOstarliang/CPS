package com.chinacreator.afgl.services;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.ZbhcyxxBean;
import com.chinacreator.afgl.dao.ZbhcyxxDao;
import com.chinacreator.afgl.query.ZbhcyxxQuery;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 治保会成员信息
 *
 */
public class ZbhcyxxService {
	
	/**
	 * 治保会成员信息列表
	 */
	public PageResultInfo<ZbhcyxxBean> zbhcyxxList(PageInfo pageInfo, ZbhcyxxQuery zbhcyxxQuery) throws Exception{
		return ZbhcyxxDao.zbhcyxxList(pageInfo, zbhcyxxQuery);
	}
	
	/**
	 * 新增、修改、删除治保会成员信息
	 */
	public void addZbhcyxx(ZbhcyxxBean zbhcyxxBean) throws Exception
	{
		if (ValidateHelper.isNotEmptyString(zbhcyxxBean.getZbhcybh()))
		{
			ZbhcyxxDao.updateZbhcyxxByZbhcybh(zbhcyxxBean);
		}
		else
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String zbhcybh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_af_Zbhcyxx");
			zbhcyxxBean.setZbhcybh(zbhcybh);
			zbhcyxxBean.setTcbs("0");
			
			zbhcyxxBean.setDjrsfzh(loginInfo.getSfzh());
			zbhcyxxBean.setDjdwdm(loginInfo.getOrgcode());
			zbhcyxxBean.setDjdwmc(loginInfo.getOrgname());
			zbhcyxxBean.setDjrxm(loginInfo.getRealname());
			zbhcyxxBean.setDjrjh(loginInfo.getUsername());
			
			ZbhcyxxDao.addZbhcyxx(zbhcyxxBean);
		}
	}
	
	/**
	 * 得到治保会成员信息
	 */
	public ZbhcyxxBean getZbhcyxxByZbhcybh(ZbhcyxxQuery zbhcyxxQuery) throws Exception
	{
		return ZbhcyxxDao.getZbhcyxxByZbhcybh(zbhcyxxQuery);
	}
	
	/**
	 * 得到治保会成员列表信息
	 */
	public List<ZbhcyxxBean> getZbhcyxxListByZbhcybhs(ZbhcyxxQuery zbhcyxxQuery) throws Exception{
		List<ZbhcyxxBean> zbhcyxxList = new ArrayList<ZbhcyxxBean>();
		String zbhcybhs = zbhcyxxQuery.getZbhcybh();
		if(ValidateHelper.isNotEmptyString(zbhcybhs)){
			for (String zbhcybh : zbhcybhs.split(",")) {
				ZbhcyxxQuery zbhcyxxQuerys = new ZbhcyxxQuery();
				zbhcyxxQuerys.setZbhcybh(zbhcybh);
				ZbhcyxxBean zbhcyxxBean = ZbhcyxxDao.getZbhcyxxByZbhcybh(zbhcyxxQuerys);
				zbhcyxxList.add(zbhcyxxBean);
			}
		}
		return zbhcyxxList;
	}
	
	/**
	 * 注销治保会成员信息
	 * @param zbhcybh
	 * @date Mar 27, 2015 3:26:59 PM
	 */
	public void zxZbhcyxxByzbhcybh(String zbhcybh) throws Exception
	{
		 
		ZbhcyxxBean zbhcyxxsBean = new ZbhcyxxBean();
		zbhcyxxsBean.setZbhcybh(zbhcybh);
		zbhcyxxsBean.setTcbs("1");
		zbhcyxxsBean.setTcrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		zbhcyxxsBean.setTcyy("");
		ZbhcyxxDao.deleteZbhcyxxByZbhcybh(zbhcyxxsBean);
	}
	
	/**
	 * 批量注销治保会成员信息
	 */
	public void batchDeleteZbhcyxxByZbhcybhs(List<ZbhcyxxBean> zbhcyxxList, ZbhcyxxBean zbhcyxxBean) throws Exception{
		TransactionManager tm = null;
		try{
			tm = new TransactionManager();
			tm.begin();
			if(ValidateHelper.isNotEmptyCollection(zbhcyxxList))
			{
				for (ZbhcyxxBean zbhcyxxsBean : zbhcyxxList) 
				{
					zbhcyxxsBean.setTcbs("1");
					zbhcyxxsBean.setTcrq(zbhcyxxBean.getTcrq());
					zbhcyxxsBean.setTcyy(zbhcyxxBean.getTcyy());
					
					LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
					zbhcyxxsBean.setDjdwdm(loginInfo.getOrgcode());
					zbhcyxxsBean.setDjdwmc(loginInfo.getOrgname());
					zbhcyxxsBean.setDjrjh(loginInfo.getUsername());
					zbhcyxxsBean.setDjrxm(loginInfo.getRealname());
					zbhcyxxsBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					ZbhcyxxDao.deleteZbhcyxxByZbhcybh(zbhcyxxsBean);
				}
			}
			tm.commit();
		}catch(Exception e){
			e.printStackTrace();
			tm.rollback();
		}
	}
	
	
	/**
	 * 得到治保会成员信息By身份证
	 */
	public  ZbhcyxxBean getZbhcyxxBySfzh(String sfzh) throws Exception{
		return ZbhcyxxDao.getZbhcyxxBySfzh(sfzh);
	}
	
	public boolean  getZbhcyxxBySfzhAndZbhbh(String sfzh,String zbhbh) throws Exception{
		boolean flag=false;
		ZbhcyxxBean   zbhcyxxBean = ZbhcyxxDao.getZbhcyxxBySfzhAndZbhbh(sfzh, zbhbh);
		if(zbhcyxxBean !=null){
			flag=true;
		}else{
			flag=false;
		}
		return flag;
	}
}
