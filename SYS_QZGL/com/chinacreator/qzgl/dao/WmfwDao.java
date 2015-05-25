package com.chinacreator.qzgl.dao;

import java.io.File;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.util.ListInfo;
/**
 * 为民服务（提供证明、迷途人员、弃婴信息、流浪乞讨人员 、其他服务）
 * @author Administrator
 *
 */
public class WmfwDao {
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/qzgl/dao/wmfw-sql.xml");

	/**
	 * 分页查询为民服务（提供证明、迷途人员、弃婴信息、流浪乞讨人员 、其他服务）
	 * @param <T>
	 * @param cls
	 * @param queryBean
	 * @param sqlName
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static <T> PageResultInfo<T> queryWmfwList(Class<T> cls,QueryBean queryBean,String sqlName, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(cls , CommonConstant.DBNAME_SQJW, sqlName, pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 无分页list
	 * @param <T>
	 * @param cls
	 * @param queryBean
	 * @param sqlName
	 * @return
	 * @throws Exception
	 */
	public static <T> ArrayList<T> queryList(Class<T> cls,QueryBean queryBean,String sqlName) throws Exception{
		List<T> list ;
		list = new ArrayList<T>();
		list = executor.queryListBeanWithDBName(cls, CommonConstant.DBNAME_SQJW, sqlName, queryBean);
		return (ArrayList<T>) list;
	}
	
	/**
	 * 根据ID查询为民服务Bean（提供证明、迷途人员、弃婴信息、流浪乞讨人员 、其他服务）
	 * @param <T>
	 * @param cls
	 * @param id
	 * @param sqlName
	 * @return
	 * @throws Exception
	 */
	public static <T> T queryBeanById(Class<T> cls,String id,String sqlName) throws Exception{
		return  executor.queryObjectWithDBName(cls, CommonConstant.DBNAME_SQJW, sqlName, id);
	}
	/**
	 * 新增为民服务Bean（提供证明、迷途人员、弃婴信息、流浪乞讨人员 、其他服务）
	 * @param <T>
	 * @param cls
	 * @param bean
	 * @param sqlName
	 * @throws Exception
	 */
	public static <T> void insertBean(T bean,String sqlName) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, sqlName, bean);
	}
	/**
	 * 更新(或注销)为民服务Bean（提供证明、迷途人员、弃婴信息、流浪乞讨人员 、其他服务）
	 * @param <T>
	 * @param cls
	 * @param bean
	 * @param sqlName
	 * @throws Exception
	 */
	public static <T> void updateBean(T bean,String sqlName) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, sqlName, bean);
	}
	/**
	 * 保存照片信息
	 * @param id
	 * @param filezp
	 * @throws Exception
	 */
	public static void updateZpxxByid(String id,File filezp,String sql) throws Exception{
		PreparedDBUtil util = new PreparedDBUtil();
		
		String str= "";
		/**
		 * 这个地方用于判断是执行迷途人员、弃婴信息、流浪乞讨人员照片保存
		 */
		if ("updateMtryzpSQL".equals(sql)){
			str = "update t_gzgl_mtry set mtryzmzp=? where id=?";
		};
		if("updateQyryzpSQL".equals(sql)){
			str = "update t_gzgl_qyry set qyryzmzp=? where id=?";
		};
		if("updateQtryzpSQL".equals(sql)){
			str = "update t_gzgl_qtry set qtryzp=? where id=?";
		}
		if (!"".equals(str)){
			util.preparedUpdate(CommonConstant.DBNAME_SQJW, str);
			util.setBlob(1, filezp);
			util.setString(2, id);
			util.executePrepared();
		}
	}
	/**
	 * 删除照片
	 * @param id
	 * @param sqlname
	 * @throws SQLException
	 */
	public static void deleteZpxxByid(String id,String sqlname) throws SQLException{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, sqlname, id);
	}
	/**
	 * 取照片，根据ID
	 * @param id
	 * @param tabname 表名(小写)
	 * @param column 返回照片字段（小写）
	 * @return
	 */
	public static Blob getZpxxByid(String id,String tabname,String column){
		String	 sql=" select "+ column + " from " + tabname + " where id='" +id+ "'" ;
		DBUtil util = new DBUtil();
		try {
			util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Blob blob = null;
		if (util.size() > 0)
		{
			try {
				blob = util.getBlob(0, column);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return blob;
	}
}
