package com.chinacreator.zdry.dao;

import java.util.List;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zdry.bean.Gxr;
import com.chinacreator.zdry.bean.Gzxx;
import com.chinacreator.zdry.bean.Jjqk;
import com.chinacreator.zdry.bean.Keypersonnel;
import com.chinacreator.zdry.bean.Lxfs;
import com.chinacreator.zdry.bean.Wffzjl;
import com.chinacreator.zdry.bean.Xsbx;
import com.chinacreator.zdry.bean.Zpxx;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.util.ListInfo;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(人员考察数据访问层类)
 * @date Mar 11, 2013 4:33:41 PM
 */
public class StaffsurveyDao implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5275236376332921251L;
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor(
			"com/chinacreator/zdry/dao/staffsurvey-sql.xml");

	/******************************人员考察数据插入开始**********************************/

	/**
	 * 插入照片信息
	 */
	public static void insertZpxx(List<Zpxx> zpxxList) throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("insert into t_zdry_zpxx (id, sfzh, pzrq, zpms, zp) values (seq_zdry_zpxx.nextval, ?, ?, ?, ?)");
		if(zpxxList != null && zpxxList.size() > 0){
			for(int i = 0; i<zpxxList.size(); i++){
				Zpxx zpxx = zpxxList.get(i);
				PreparedDBUtil dbutil = new PreparedDBUtil();
				dbutil.preparedInsert(CommonConstant.DBNAME_SQJW, sql.toString());
				dbutil.setString(1, zpxx.getSfzh());
				dbutil.setDate(2, zpxx.getPzrq());
				dbutil.setString(3, zpxx.getZpms());
				dbutil.setBlob(4, zpxx.getUpload());
				dbutil.executePrepared();
			}
		}
	}
	
	/**
	 * 删除照片信息
	 * @param sfzh
	 * @throws Exception
	 */
	public static void delZpxx(String sfzh) throws Exception{
		executor.deleteByKeysWithDBName(CommonConstant.DBNAME_SQJW, "delZpxxSQL", sfzh);
	}

	/**
	 * 插入工作信息
	 */
	public static void insertGzxx(Gzxx gzxx) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertGzxxSQL",gzxx);
	}
	
	/**
	 * 删除工作信息
	 */
	public static void delGzxx(String sfzh) throws Exception {
		executor.deleteByKeysWithDBName(CommonConstant.DBNAME_SQJW, "delGzxxSQL",sfzh);
	}
	
	/**
	 * 查询工作信息
	 */
	public static Gzxx queryBySfzhGzxx(String sfzh) throws Exception {
		return executor.queryObjectWithDBName(Gzxx.class, CommonConstant.DBNAME_SQJW, "queryBySfzhGzxxSQL", sfzh);
	}
	/**
	 * 插入违法经历
	 */
	public static void insertWfjl(Wffzjl wffzjl) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWfjlSQL", wffzjl);
	}
	
	/**
	 * 插入现实表现
	 */
	public static void insertXsbx(Xsbx xsbx) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXsbxSQL", xsbx);
	}

	/**
	 * 批量插入社会关系
	 */
	public static void insertShgxs(List<Gxr> gxrList) throws Exception {
		executor.insertBeans(CommonConstant.DBNAME_SQJW, "insertShgxSQL",
				gxrList);
	}
	
	public static void delShgxs(String sfzh) throws Exception {
		executor.deleteByKeysWithDBName(CommonConstant.DBNAME_SQJW, "delShgxsSQL",sfzh);
	}
	

	/**
	 * 插入经济情况
	 */
	public static void insertJjqk(Jjqk jjqk) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJjqkSQL", jjqk);
	}
	
	public static void delJjqk(String sfzh) throws Exception{
		executor.deleteByKeysWithDBName(CommonConstant.DBNAME_SQJW, "delJjqkSQL", sfzh);
	}
	
	/**
	 * 插入联络方式
	 */
	public static void insertLlfs(Lxfs lxfs) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertLlfsSQL", lxfs);
	}

	/******************************人员考察数据插入结束**********************************/
	/******************************人员考察数据修改开始**********************************/

	/**
	 * 修改基本信息
	 */
	public static void updateJbxx(Keypersonnel personnel) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJbxxSQL", personnel);
	}

	/**
	 * 修改照片信息
	 */
	public static void updateZpxx() throws Exception {

	}

	/**
	 * 修改工作信息
	 */
	public static void updateGzxx() throws Exception {

	}

	/**
	 * 修改违法经历
	 */
	public static void updateWfjl(Wffzjl wffzjl) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWfjlSQL", wffzjl);
	}
	
	public static void delWffzjl(String id) throws Exception{
		executor.deleteByKeysWithDBName(CommonConstant.DBNAME_SQJW, "delWffzjlSQL", id);
	}
	
	/**
	 * 修改现实表现
	 */
	public static void updateXsbx(Xsbx xsbx) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXsbxSQL", xsbx);
	}

	/**
	 * 修改体貌特征
	 */
	public static void updateTmtz(Keypersonnel personnel) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateTmtzSQL", personnel);
	}

	/**
	 * 修改社会关系
	 */
	public static void updateShgxs(List<Gxr> list) throws Exception {
		executor.updateBeans(CommonConstant.DBNAME_SQJW, "updateShgxsSQL", list);
	}

	/**
	 * 修改经济情况
	 */
	public static void updateJjqk() throws Exception {

	}

	/**
	 * 修改联络方式
	 */
	public static void updateLlfs(Lxfs lxfs) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateLlfsSQL", lxfs);
	}

	/******************************人员考察数据修改结束**********************************/

	/******************************人员考察数据查询开始**********************************/
	/**
	 * 查询基本信息
	 */
	public static void queryJbxx() throws Exception {
		//executor.insertBean(CommonConstant.DBNAME_SQJW, "insertLksqlzxxSql", lksqlzxx);
	}

	/**
	 * 根据身份证号码查询照片信息
	 */
	public static List<Zpxx> queryBySfzhZpList(Zpxx zpxx) throws Exception {
		return executor.queryListWithDBName(Zpxx.class, CommonConstant.DBNAME_SQJW, "queryBySfzhZpListSQL", zpxx.getSfzh());
	}
	
	/**
	 * 根据ID查询照片
	 */
	public static Zpxx queryByIdZpList(String id) throws Exception {
		return executor.queryObjectWithDBName(Zpxx.class, CommonConstant.DBNAME_SQJW, "queryByIdZpListSQL", id);
	}

	/**
	 * 查询违法经历
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<Wffzjl> queryWfjlList(Wffzjl wffzjl,
			PageInfo pageInfo) throws Exception {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(Wffzjl.class,
				CommonConstant.DBNAME_SQJW, "queryWfjlListSQL", pageInfo
						.getOffset(), pageInfo.getPageSize(), wffzjl);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo
				.getTotalSize(), listInfo.getDatas());
	}

	/**
	 * 查询现实表现
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<Xsbx> queryBySfzhXsbxList(String sfzh,PageInfo pageInfo) throws Exception {
		ListInfo listInfo = executor.queryListInfoWithDBName(Xsbx.class, 
														   CommonConstant.DBNAME_SQJW, 
														   "queryBySfzhXsbxListSQL",
														   pageInfo.getOffset(), 
														   pageInfo.getPageSize(), 
														   sfzh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo.getTotalSize(), listInfo.getDatas());
	}

	/**
	 * 查询社会关系
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<Gxr> queryShgxList(Gxr gxr, PageInfo pageInfo) throws Exception {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(Gxr.class,
				CommonConstant.DBNAME_SQJW, "queryShgxListSQL", pageInfo
						.getOffset(), pageInfo.getPageSize(), gxr);

		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo
				.getTotalSize(), listInfo.getDatas());
	}
	
	/**
	 * 查询社会关系
	 */
	public static List<Gxr> queryBySfzhShgxList(Gxr gxr) throws Exception {
		List<Gxr> gxrList = executor.queryListBeanWithDBName(Gxr.class, CommonConstant.DBNAME_SQJW, "queryShgxListSQL", gxr);
		return gxrList;
	}
	
	
	
	/**
	 * 查询经济情况
	 */
	public static Jjqk queryBySfzhJjqk(String sfzh) throws Exception {
		
		return executor.queryObjectWithDBName(Jjqk.class, CommonConstant.DBNAME_SQJW, "queryBySfzhJjqkSQL", sfzh);
	}

	/**
	 * 查询联络方式
	 */
	public static Lxfs queryLlfs(String sfzh) throws Exception {
		
		return executor.queryObjectWithDBName(Lxfs.class, CommonConstant.DBNAME_SQJW, "queryLlfsSQL",sfzh);
	}
	/******************************人员考察数据查询结束**********************************/
	
	/**
	 * 根据ID删除现实表现数据
	 */
	public static void delByIdXsbx(String id) throws Exception{
		executor.deleteByKeysWithDBName(CommonConstant.DBNAME_SQJW, "delByIdXsbxSQL", id);
	}
	
	public static void delByIdZpxx(String id) throws Exception{
		executor.deleteByKeysWithDBName(CommonConstant.DBNAME_SQJW, "delByIdZpxxSQL", id);
	}
}
