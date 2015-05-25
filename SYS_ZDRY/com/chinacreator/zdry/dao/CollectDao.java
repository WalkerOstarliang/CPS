package com.chinacreator.zdry.dao;

import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zdry.bean.Keypersonnel;
import com.chinacreator.zdry.bean.Lcsqxx;
import com.chinacreator.zdry.bean.Lksqlzxx;
import com.chinacreator.zdry.bean.Spdwzdpz;
import com.chinacreator.zdry.constant.ZdryConstant;
import com.chinacreator.zdry.query.KeypersonnelQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;


/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(采集列管数据层访问类)
 * @date Mar 4, 2013 11:38:24 AM
 */
public class CollectDao implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 40540633429695714L;
	
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/zdry/dao/collect-sql.xml");
	
	/**
	 * 查询重点人员信息
	 * @param personnel
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<Keypersonnel> queryKeyPersonnelList(KeypersonnelQueryBean personnel, PageInfo pageInfo) throws Exception{
		
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(Keypersonnel.class, 
																 CommonConstant.DBNAME_SQJW , 
																 "queryZdryObj" , 
																 pageInfo.getOffset(), 
																 pageInfo.getPageSize(), 
																 personnel);
		
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo.getTotalSize(), listInfo.getDatas());
		
	}
	
	/**
	 * 查询重点人员信息
	 * @param personnel
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static Keypersonnel queryBySfzhPersonnel(String sfzh) throws Exception{
		
		Keypersonnel keypersonnel = executor.queryObjectWithDBName(Keypersonnel.class, 
																   CommonConstant.DBNAME_SQJW, 
																   "queryBySfzhPersonnelSQL", 
																   sfzh,
																   ZdryConstant.ZDRY_ISGK_YLG);
		return keypersonnel;
		
	}
	
	/**
	 * 查询申请列管信息
	 * @param personnel
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<Lcsqxx> queryLcsqxxList(Lcsqxx lcsqxx, PageInfo pageInfo) throws Exception{
		
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(Lcsqxx.class, 
																 CommonConstant.DBNAME_SQJW , 
																 "queryLcsqxxListSQL" , 
																 pageInfo.getOffset(), 
																 pageInfo.getPageSize(), 
																 lcsqxx);
		
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo.getTotalSize(), listInfo.getDatas());
		
	}
	
	/**
	 * 根据申请信息编号查询申请列管信息
	 * @param personnel
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static Lcsqxx queryLcsqxx(String sqxxbh) throws Exception{
		
		Lcsqxx lcsqxx = executor.queryObjectWithDBName(Lcsqxx.class, 
																 CommonConstant.DBNAME_SQJW , 
																 "queryLcsqxxSQL" , 
																 sqxxbh);
		
		return lcsqxx;
		
	}
	
	/**
	 * 查看列撤管流程信息
	 * @param sqxxbh 申请信息编号
	 * @return
	 * @throws Exception
	 */
	public static List<Lksqlzxx> queryLksqlzxx(Lksqlzxx lksqlzxx) throws Exception{
		List<Lksqlzxx> list = executor.queryListBeanWithDBName(Lksqlzxx.class,
														 CommonConstant.DBNAME_SQJW , 
														 "queryLksqlzxxSQL" , 
														 lksqlzxx);
		return list;
	}
	
	/**
	 * 插入申请列管流程数据
	 * @param lksqlzxx
	 * @throws Exception
	 */
	public static void  insertLksqlzxx(Lksqlzxx lksqlzxx) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertLksqlzxxSql", lksqlzxx);
	}
	
	/**
	 * 修改列管申请数据
	 * @param lcsqxx
	 * @throws Exception
	 */
	public static void updateLcsqxx(Lcsqxx lcsqxx) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateLcsqxxSQL", lcsqxx);
	}
	
	/**
	 * 插入列管申请数据
	 * @param lcsqxx
	 * @throws Exception
	 */
	public static void insertLcsqxx(Lcsqxx lcsqxx) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertLcsqxxSql", lcsqxx);
	}
	
	/**
	 * 查询人员列管数据
	 * @throws Exception
	 */
	public static List<Lcsqxx> querySfzhLgInfo(String sfzh) throws Exception{
		
		return  executor.queryListWithDBName(Lcsqxx.class, 
											 CommonConstant.DBNAME_SQJW, 
											 "querySfzhLgInfoSQL", 
											 sfzh,
											 ZdryConstant.ZDRY_SQZT_JS);

	}
	
	/**
	 * 插入重点人员基本基本
	 * @param keypersonnel
	 * @throws Exception
	 */
	public static void insertZdryjbxx(Keypersonnel keypersonnel) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryjbxxSql", keypersonnel);
	}
	
	public static Spdwzdpz queryByCodeSpdwzdpc(String code) throws Exception{
		Spdwzdpz spdwzdpz = executor.queryObjectWithDBName(Spdwzdpz.class, CommonConstant.DBNAME_SQJW, "queryByCodeSpdwzdpcSQL", code);
		return spdwzdpz;
	}
}
