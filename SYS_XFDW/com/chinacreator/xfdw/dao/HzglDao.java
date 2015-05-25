package com.chinacreator.xfdw.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Map;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.xfdw.bean.HzldBean;
import com.chinacreator.xfdw.bean.HzpfBean;
import com.chinacreator.xfdw.query.HzldQuery;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * @ClassName: HzglDao
 * @author 禹文超
 * @mail wenchao.yu@163.com
 * @date Mar 19, 20153:47:48 PM
 * @Description: TODO 火灾管理数据访问类
 *
 *
 */

public class HzglDao implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7530687098181732143L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/xfdw/dao/hzgl-sql.xml");
	
	/**
	 * 查询火灾落地信息集合
	 * @param query 查询条件实体类
	 * @param pageinfo 分页对象
	 * @return 
	 * @throws SQLException
	 */
	public PageResultInfo<HzldBean> queryHzldList(HzldQuery query,PageInfo pageinfo) throws SQLException{
		String sqlName = "queryHzldList";
		
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(loginInfo != null && loginInfo.getLeve() == 2){
			sqlName = "queryAllHzldList";
		}
		ListInfo listinfo = executor.queryListInfoBeanWithDBName(HzldBean.class, CommonConstant.DBNAME_SQJW, 
				sqlName, pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, listinfo);
	}
	
	/**
	 * 查询火灾落地信息集合
	 * @param query 查询条件实体类
	 * @param pageinfo 分页对象
	 * @return 
	 * @throws SQLException
	 */
	public PageResultInfo<HzpfBean> queryByHzpfInfo(HzldQuery query,PageInfo pageinfo) throws SQLException{
		
		ListInfo listinfo = executor.queryListInfoBeanWithDBName(HzpfBean.class, CommonConstant.DBNAME_SQJW, 
				"queryByHzpfInfo", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, listinfo);
	}
	
	
	
	public HzldBean queryByHzxhInfo(HzldQuery query) throws SQLException{
		return executor.queryObjectBeanWithDBName(HzldBean.class, CommonConstant.DBNAME_SQJW, "queryByHzxhInfo", query);
	}
	
	/***
	 * 根据火灾序号，所属单位查询退回单位
	 * @param hzpfBean
	 * @return
	 * @throws SQLException
	 */
	public HzpfBean queryHzpfInfo(HzldBean hzldBean) throws SQLException{
		return executor.queryObjectBeanWithDBName(HzpfBean.class, CommonConstant.DBNAME_SQJW, "queryHzpfInfo", hzldBean);
	}
	
	/**
	 * 新增火灾流转信息
	 * @param bean
	 * @throws Exception
	 */
	public void insertHzpfInfo(HzpfBean bean)throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertHzpfInfo", bean);
	}
	
	/**
	 * 火灾落地信息修改
	 * @param bean
	 * @throws Exception
	 */
	public void updateHzldInfo(HzldBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateHzldInfo", bean);
	}
	
	/**
	 * 火灾落地待办提醒插入
	 */
	public void insertHzldDb(Map<String, Object> map) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_XXGL, "insertHzpfDb", map);
	}
	/**
	 * 火灾落地待办提醒标记修改
	 */
	public void updateHzldDb(String hzxh) throws Exception{
		executor.updateWithDBName(CommonConstant.DBNAME_XXGL, "updateHzldDb", hzxh);
	}
}
