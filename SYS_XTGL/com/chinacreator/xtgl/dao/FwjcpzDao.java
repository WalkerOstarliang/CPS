package com.chinacreator.xtgl.dao;

import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.menu.bean.XttxpzBean;
import com.chinacreator.xtgl.bean.FwjcpzBean;
import com.chinacreator.xtgl.query.FwjcpzQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 
 * @company  chinacreator
 * @author zhun.liu
 * @date  Dec 17, 2013  8:55:51 AM
 */
public class FwjcpzDao {
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/xtgl/dao/fwjcpz-sql.xml");
	
	/**
	 * 分页查询房屋检查配置信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<FwjcpzBean> queryFwjcpzBeanPageInfo(FwjcpzQueryBean queryBean,PageInfo pageInfo) throws Exception{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(FwjcpzBean.class, CommonConstant.DBNAME_SQJW, "queryFwjcpzBeanPageInfo", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 根据ID查询房屋检查Bean
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static FwjcpzBean queryFwjcpzBeanById(String id) throws Exception{
		return executor.queryObjectWithDBName(FwjcpzBean.class, CommonConstant.DBNAME_SQJW, "queryFwjcpzBeanById", id);
	}
	
	/**
	 * 插入房屋检查Bean
	 * @param fwjcpzBean
	 * @throws Exception
	 */
	public static void insertFwjcpzBean(FwjcpzBean fwjcpzBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertFwjcpzBean", fwjcpzBean);
	}
	
	/**
	 * 更新房屋检查Bean  将操作标识 修改成2
	 * @param fwjcpzBean
	 * @throws Exception
	 */
	public static void updateFwjcpzBean(FwjcpzBean fwjcpzBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateFwjcpzBean", fwjcpzBean);
	}
	
	/**
	 * 批量删除房屋检查Bean  将操作修改成3 
	 * @param beans
	 * @throws Exception
	 */
	public static void batchDelFwjcpzBean(List<FwjcpzBean> beans) throws Exception{
		executor.updateBeans(CommonConstant.DBNAME_SQJW, "batchDelFwjcpzBean", beans);
	}
	
	
	/**
	 * 插入系统配置参数(黄色)
	 * @param xtpzBean
	 * @throws Exception
	 */
	public static void insertXtpzBeanYellow(XttxpzBean xtpzBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXtpzBeanYellow", xtpzBean);
	}
	/**
	 * 插入系统配置参数(绿色)
	 * @param xtpzBean
	 * @throws Exception
	 */
	public static void insertXtpzBeanGreen(XttxpzBean xtpzBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXtpzBeanGreen", xtpzBean);
	}
	/**
	 * 插入系统配置参数(红色)
	 * @param xtpzBean
	 * @throws Exception
	 */
	public static void insertXtpzBeanRed(XttxpzBean xtpzBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXtpzBeanRed", xtpzBean);
	}

	public static void insertXtpzBeanCzfwjc(XttxpzBean xtpzBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXtpzBeanCzfwjc", xtpzBean);
	}
	
	public static void updateXtpzBeanCzfwjc(XttxpzBean xtpzBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXtpzBeanCzfwjc", xtpzBean);
	}
	
	public static void deletextpzBeanCzfwjc(XttxpzBean xtpzBean) throws Exception{
		executor.deleteBean(CommonConstant.DBNAME_SQJW, "deletextpzBeanCzfwjc", xtpzBean);
	}
	
	
	public static XttxpzBean queryXtpzBeanByPzdm(String pzdm) throws Exception{
		return executor.queryObjectWithDBName(XttxpzBean.class, CommonConstant.DBNAME_SQJW,"queryXtpzBeanByPzdm", pzdm);
	}
}
