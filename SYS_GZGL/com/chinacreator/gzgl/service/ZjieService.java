package com.chinacreator.gzgl.service;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.ZjieBean;
import com.chinacreator.gzgl.dao.ZjieDao;
import com.chinacreator.gzgl.query.ZjieQuery;
import com.chinacreator.gzgl.util.GZGLCommonStatuts;

/**
 * 工作总结bean
 * @author royee
 *
 */
public class ZjieService extends GzglBaseService
{
	/**
	 * 操作单个工作总结的业务bean数据
	 * @param zjieBean	业务数据
	 * @param op	操作类型
	 */
	public boolean submitZjieBean(ZjieBean zjieBean, String op)
	{
		boolean flag = false;
		try
		{
			if (OP_ADD.equals(op))//新增
			{
				//生成ID
				String shortBH = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, SEQ_GZZJ_NAME);
				String zjbh = zjieBean.getZjmjdwdm() + DateTimeHelper.getNowDateStr("yyyyMMdd").substring(2) + shortBH;
				zjieBean.setZjbh(zjbh);
				LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
				zjieBean.setDjrsfzh(loginInfo.getSfzh());
				ZjieDao.insertZjieBean(zjieBean);
				flag = true;
			}
			else if (OP_UPDATE.equals(op))//更新
			{
				if (null == zjieBean || ValidateHelper.isEmptyString(zjieBean.getZjbh()))
				{
					throw new Exception("data is null");
				}
				ZjieDao.updateZjieBean(zjieBean);
				flag = true;
			}
			else if (OP_DEL.equals(op))//删除
			{
				if (null == zjieBean || ValidateHelper.isEmptyString(zjieBean.getZjbh()))
				{
					throw new Exception("data is null");
				}
				ZjieBean zjie = ZjieDao.queryZjieBeanByZjbh(zjieBean.getZjbh());
				zjie.setCzbz(GZGLCommonStatuts.CZBZ_DEL);
				ZjieDao.delZjieBean(zjie);
				flag = true;
			}
		}
		catch (Exception e)
		{
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 按分页方式查询指定条件的工作总结数据
	 * @param condQuery	查询条件
	 * @param page	分页条件
	 * @return	分页结果集
	 */
	public PageResultInfo<ZjieBean> getZjieListPage(ZjieQuery condQuery, PageInfo page)
	{
		PageResultInfo<ZjieBean> zjieList = null;
		try
		{
			zjieList = ZjieDao.getZjiePageResultInfo(condQuery, page);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return zjieList;
	}
	
	/**
	 * 获取指定条件的总结集合
	 * @param condQuery	查询条件
	 * @return	结果集
	 */
	public List<ZjieBean> getZjieList(ZjieQuery condQuery)
	{
		try
		{
			return ZjieDao.getZjieList(condQuery);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 批量删除工作总结数据
	 * @param zjieBeans	待操作的总结数据
	 */
	public void submitBatchZjieBeans(List<ZjieBean> zjieBeans, String op)
	{
		try
		{
			if (OP_DEL.equals(op))
			{
				ZjieDao.batchDelZjieBeans(zjieBeans);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	public ZjieBean getzjieBeanByZjbh(String zjbh) throws SQLException {
		return ZjieDao.queryZjieBeanByZjbh(zjbh);
		
	}
}
