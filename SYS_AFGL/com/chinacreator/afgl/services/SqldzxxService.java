package com.chinacreator.afgl.services;

import com.chinacreator.afgl.bean.SqLdzxxBean;
import com.chinacreator.afgl.bean.StxxBean;
import com.chinacreator.afgl.bean.WyxqxxBean;
import com.chinacreator.afgl.bean.YwhCyxxBean;
import com.chinacreator.afgl.bean.YwhxxBean;
import com.chinacreator.afgl.dao.SqLdzxxDao;
import com.chinacreator.afgl.query.SqldzxxQueryBean;
import com.chinacreator.afgl.query.SqwyhQueryBean;
import com.chinacreator.afgl.query.StxxQueryBean;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class SqldzxxService {

	public PageResultInfo<SqLdzxxBean> querySqldzxxPageResultInfoByQueryBean(SqldzxxQueryBean queryBeanldz, PageInfo pageInfo) throws Exception
	{
		return SqLdzxxDao.querySqldzxxPageResultInfoByQueryBean(queryBeanldz, pageInfo);
	} 
	
	public  SqLdzxxBean querySqldzxxBeanById(String id) throws Exception{
		return SqLdzxxDao.querySqldzxxBeanById(id);
	}
	public PageResultInfo<StxxBean> queryStxxPageResultInfoByQueryBean(StxxQueryBean queryBeanSt, PageInfo pageInfo) throws Exception
	{
		return SqLdzxxDao.queryStxxPageResultInfoByQueryBean(queryBeanSt, pageInfo);
	}
	
	public int querySqLdzCountByStidAndSfzh(String stid, String sfzh) throws Exception{
		return SqLdzxxDao.querySqLdzCountByStidAndSfzh(stid, sfzh);
	}
	
	public SqLdzxxBean saveSqLdzxxBean(SqLdzxxBean bean, String operType) throws Exception
	{
		if (ValidateHelper.isEmptyString(bean.getId()))
		{
			// 获得主键id
			StringBuffer sbf = new StringBuffer();
			sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
			sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
			sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_AFGL_SQLDZID"));
			bean.setId(sbf.toString());
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			bean.setDjrsfzh(loginInfo.getSfzh());
			insertSqLdzxxBean(bean);
		}
		else
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			bean.setXgrjh(loginInfo.getUsername());
			bean.setXgrxm(loginInfo.getRealname());
			updateSqLdzxxBean(bean);
		}
		return bean;
	}
	
	public void insertSqLdzxxBean(SqLdzxxBean bean) throws Exception
	{
		SqLdzxxDao.insertSqLdzxxBean(bean);
	}
	
	
	public void updateSqLdzxxBean(SqLdzxxBean bean) throws Exception
	{
		SqLdzxxDao.updateSqLdzxxBean(bean);
	}
	public void deleteSqLdzxxBeanById(String id) throws Exception{
		SqLdzxxDao.deleteSqLdzxxBeanById(id);
	}
	
	
	public PageResultInfo<YwhxxBean> querySqYwhPageResultInfoByQueryBean(SqwyhQueryBean queryBeanwyh, PageInfo pageInfo) throws Exception
	{
		return SqLdzxxDao.querySqYwhPageResultInfoByQueryBean(queryBeanwyh, pageInfo);
	} 
	
	public  YwhxxBean querySqywhxxBeanById(String id) throws Exception{
		return SqLdzxxDao.querySqywhxxBeanById(id);
	}
	public int querySqYzwyhCountByStidAndYzwyhmc(String stid, String yzwyhmc) throws Exception{
		return SqLdzxxDao.querySqYzwyhCountByStidAndYzwyhmc(stid, yzwyhmc);
	}
	
	public YwhxxBean saveSqYzwyhxxBean(YwhxxBean bean, String operType) throws Exception
	{
		if (ValidateHelper.isEmptyString(bean.getId()))
		{
			// 获得主键id
			StringBuffer sbf = new StringBuffer();
			sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
			sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
			sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_AFGL_YZWYHID"));
			bean.setId(sbf.toString());
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			bean.setDjrsfzh(loginInfo.getSfzh());
			insertSqYzwyhxxBean(bean);
		}
		else
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			bean.setXgrjh(loginInfo.getUsername());
			bean.setXgrxm(loginInfo.getRealname());
			updateSqYzwyhxxBean(bean);
		}
		return bean;
	}
	
	public void insertSqYzwyhxxBean(YwhxxBean bean) throws Exception
	{
		SqLdzxxDao.insertSqYzwyhxxBean(bean);
	}
	
	public void updateSqYzwyhxxBean(YwhxxBean bean) throws Exception
	{
		SqLdzxxDao.updateSqYzwyhxxBean(bean);
	}
	
	public PageResultInfo<YwhCyxxBean> querySqYwhcyPageResultInfoByQueryBean(YwhxxBean ywhxxbean, PageInfo pageInfo) throws Exception
	{
		return SqLdzxxDao.querySqYwhcyPageResultInfoByQueryBean(ywhxxbean, pageInfo);
	} 
	
	public  YwhCyxxBean querySqYwhcyxxBeanById(String id) throws Exception{
		return SqLdzxxDao.querySqYwhcyxxBeanById(id);
	}
	
	public PageResultInfo<WyxqxxBean> queryWyxqxxPageResultInfoByQueryBean(StxxQueryBean queryBeanSt, PageInfo pageInfo) throws Exception
	{
		return SqLdzxxDao.queryWyxqxxPageResultInfoByQueryBean(queryBeanSt, pageInfo);
	}
	
	public int querySqYzwyhcyCountByYwhidAndSfzh(String yzwyhid, String sfzh) throws Exception{
		return SqLdzxxDao.querySqYzwyhcyCountByYwhidAndSfzh(yzwyhid, sfzh);
	}
	
	
	public YwhCyxxBean saveSqYzwyhcyxxBean(YwhCyxxBean bean, String operType) throws Exception
	{
		if (ValidateHelper.isEmptyString(bean.getId()))
		{
			// 获得主键id
			StringBuffer sbf = new StringBuffer();
			sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
			sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
			sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_AFGL_YZWYHCYID"));
			bean.setId(sbf.toString());
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			bean.setDjrsfzh(loginInfo.getSfzh());
			insertSqYzwyhcyxxBean(bean);
		}
		else
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			bean.setXgrjh(loginInfo.getUsername());
			bean.setXgrxm(loginInfo.getRealname());
			updateSqYzwyhcyxxBean(bean);
		}
		return bean;
	}
	
	
	public void insertSqYzwyhcyxxBean(YwhCyxxBean bean) throws Exception
	{
		SqLdzxxDao.insertSqYzwyhcyxxBean(bean);
	}
	
	public void updateSqYzwyhcyxxBean(YwhCyxxBean bean) throws Exception
	{
		SqLdzxxDao.updateSqYzwyhcyxxBean(bean);
	}
	
	public void deleteSqYwhBeanById(String id) throws Exception{
		SqLdzxxDao.deleteSqYwhBeanById(id);
	}
	
	
	public void deleteSqYzwyhcyBeanById(String id) throws Exception{
		SqLdzxxDao.deleteSqYzwyhcyBeanById(id);
	}
	
	
}
