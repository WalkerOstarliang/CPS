package com.chinacreator.qzgl.dao;
/**
 * 走访单位登记信息dao层
 * @author zhun.liu
 * 
 */
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.qzgl.bean.ZfdwdjBean;
import com.chinacreator.qzgl.query.ZfdwdjQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class ZfdjDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/qzgl/dao/zfdwgl-sql.xml");
	/**
	 * 查询走访单位登记信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<ZfdwdjBean> queryZfdwdjxxList(ZfdwdjQueryBean queryBean,PageInfo pageInfo) throws Exception{
		ListInfo info = executor.queryListInfoBeanWithDBName(ZfdwdjBean.class, CommonConstant.DBNAME_SQJW, "queryzfdwdjlist",  pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, info);
	}
	/**
	 * 通过编号 查询走访登记
	 * @param bh
	 * @return
	 */
	public static ZfdwdjBean getZfdwdjInfoByBh(String bh) throws Exception {
		return executor.queryObjectWithDBName(ZfdwdjBean.class, CommonConstant.DBNAME_SQJW, "queryObjectWithDBName", bh);
	}
	/**
	 * 保存走访单位登记信息
	 * @param bean
	 * @throws Exception
	 */
	public static void insertZfdwdjInfo(ZfdwdjBean bean) throws Exception{
		 executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZfdwdjInfo",bean);
	}
	/**
	 * 修改走访单位登记信息
	 * @param bean
	 * @throws Exception
	 */
	public static void updateZfdwdjInfo(ZfdwdjBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZfdwdjInfo", bean);
	}
	/**
	 * 修改走访单位调查信息     主要修改调查状态
	 * @param bean
	 * @throws Exception
	 */
	public static void updateZfdwdcInfo(ZfdwdjBean bean ) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZfdwdcInfo", bean);
	}
	/**
	 * 删除走访单位登记信息
	 * @param bh
	 * @throws Exception
	 */
	public static void deleteZfdwdjInfo(String bh) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteZfdwdjInfo", bh);
	}
	
	
	/**
	 * 批量删除单位基本信息
	 * @param bhList  需要删除的走访单位登记编号集合
	 * @return 操作状态
	 */
	public static boolean batchDeleteZfdwdjInfo(List<String> bhList){	
		List<ZfdwdjBean> zfdwdjList = new ArrayList<ZfdwdjBean>();
		for (String bh  : bhList) {
			ZfdwdjBean bean=new ZfdwdjBean();
			bean.setBh(bh);
			zfdwdjList.add(bean);
		}
		boolean flag = false;
		try{
			executor.deleteBeans(CommonConstant.DBNAME_SQJW, "batchDeleteZfdwdjInfo", zfdwdjList);
			flag = true;
		}catch (SQLException e) {
			flag = false;
			System.out.println("批量删除单位失败!");
		}
		return flag;
	}
}
