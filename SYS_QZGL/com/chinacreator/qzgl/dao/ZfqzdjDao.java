package com.chinacreator.qzgl.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.qzgl.bean.ZfqzdjBean;
import com.chinacreator.qzgl.query.ZfqzdjQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;
/**
 * 
 * @author zhun.liu
 *
 */
public class ZfqzdjDao {
	
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/qzgl/dao/zfqzgl-sql.xml");
	/**
	 * 查询所有的走访群众登记信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<ZfqzdjBean>  queryZfqzdjListInfo(ZfqzdjQueryBean queryBean,PageInfo pageInfo) throws Exception{
		ListInfo info = executor.queryListInfoBeanWithDBName(ZfqzdjBean.class, CommonConstant.DBNAME_SQJW, "queryZfqzdjListInfo",  pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo,info);
	}
	/**
	 * 通过编号 查询走访群众登记信息bean 
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public static ZfqzdjBean queryZfqzdjInfoByBh(String bh) throws Exception{
		return executor.queryObjectWithDBName(ZfqzdjBean.class, CommonConstant.DBNAME_SQJW, "queryZfqzdjInfoByBh", bh);
	}
	
	/**
	 * 增加走访群众登记信息
	 * @param bean
	 * @throws Exception
	 */
	public static void insertZfqzdjInfo(ZfqzdjBean bean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZfqzdjInfo", bean);
	}
	
	/**
	 * 修改走访群众登记信息
	 * @param bean
	 * @throws Exception
	 */
	public static void updateZfqzdjInfo(ZfqzdjBean bean ) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZfqzdjInfo", bean);
	}
	/**
	 * 修改走访群众登记信息-->  修改调查状态  将调查状态修改成已调查  信息是否属实
	 * @param bean
	 * @throws Exception
	 */
	public static void updateZfqzdcInfo(ZfqzdjBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZfqzdcInfo", bean);
	}
	/**
	 * 通过编号删除走访群众登记信息
	 * @param bh
	 * @throws Exception
	 */
	public static void deleteZfqzdjInfo(String bh) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteZfqzdjInfo", bh);
	}
	
	/**
	 * 批量删除单位基本信息
	 * @param bhList  需要删除的走访单位登记编号集合
	 * @return 操作状态
	 */
	public static boolean batchDeleteZfqzdjInfo(List<String> bhList){	
		List<ZfqzdjBean> zfqzdjList = new ArrayList<ZfqzdjBean>();
		for (String bh  : bhList) {
			ZfqzdjBean bean=new ZfqzdjBean();
			bean.setBh(bh);
			zfqzdjList.add(bean);
		}
		boolean flag = false;
		try{
			executor.deleteBeans(CommonConstant.DBNAME_SQJW, "batchDeleteZfqzdjInfo", zfqzdjList);
			flag = true;
		}catch (SQLException e) {
			flag = false;
			System.out.println("批量删除单位失败!");
		}
		return flag;
	}
	
}
