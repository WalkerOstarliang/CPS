package com.chinacreator.dwdj.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.dwdj.bean.DwBaseBean;
import com.chinacreator.dwdj.bean.DwOpLogBean;
import com.chinacreator.dwdj.bean.SssqdmBean;
import com.chinacreator.zagl.bean.DwfwglBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class DwOpDao implements Serializable {

	private static final long serialVersionUID = 5561606186926248593L;

	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/dwdj/dao/dwop-sql.xml");
	
	/**
	 * 分页查询单位列表
	 * @param query 查询条件
	 * @param pageinfo 分页信息
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwBaseBean> queryDwOpList(QueryBean query,PageInfo pageinfo) throws SQLException{
		ListInfo listinfo = executor.queryListInfoBeanWithDBName(DwBaseBean.class, CommonConstant.DBNAME_SQJW, 
				"queryDwOpList", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, listinfo);
	}
	
	/**
	 * 根据主键和类型查询单位信息
	 * @param id 主键ID
	 * @param lx 类型
	 * @return
	 * @throws SQLException
	 */
	public DwBaseBean queryDwxxByIdAndLx(String id,String lx) throws SQLException{
		return executor.queryObjectWithDBName(DwBaseBean.class, CommonConstant.DBNAME_SQJW, 
				"queryDwxxByIdAndLx", id,lx);
	}
	
	/**
	 * 根据ID更新单位责任单位
	 * @param dwdm 更新后的责任单位代码
	 * @param id 需要更新的单位ID
	 * @param lx 单位类型
	 * @throws SQLException
	 */
	public void updateDwPfhDwdmByIdAndLx(String dwdm,String id,String lx )throws SQLException{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateDwPfhDwdmByIdAndLx", dwdm,id,lx);
	}
	
	/**
	 * 根据ID更新单位签收状态
	 * @param zt 修改后的状态
	 * @param id 需要修改的单位ID
	 * @param lx 单位类型
	 * @throws SQLException
	 */
	public void updateDwQsztByIdAndLx (String zt,String id,String lx) throws SQLException{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateDwQsztByIdAndLx", zt,id,lx);
	}
	
	/**
	 * 把同步的数据插入单位表
	 * @param bean 单位信息
	 * @throws SQLException
	 */
	public void insertDwToJg(DwBaseBean bean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwToJg", bean);
	}
	
	/**
	 * 新增单位操作记录
	 * @param bean 单位操作信息
	 * @throws SQLException
	 */
	public void isnertDwOpLog(DwOpLogBean bean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "isnertDwOpLog", bean);
	}
	
	/**
	 * 根据单位ID查询最新的单位操作信息
	 * @param id 单位ID
	 * @param lx 单位lx
	 * @return
	 * @throws SQLException
	 */
	public DwOpLogBean queryNewDwOp(QueryBean query) throws SQLException{
		return executor.queryObjectBeanWithDBName(DwOpLogBean.class, CommonConstant.DBNAME_SQJW, "queryNewDwOp", query);
	}
	
	/**
	 * 更新已有的单位信息
	 * @param bean 单位信息
	 * @throws SQLException
	 */
	public void updateJgById(DwBaseBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJgById", bean);
	}
	
	/**
	 * 新增单位关联关系
	 * @param bean 单位房屋关联关系信息
	 * @throws SQLException
	 */
	public void inserDwFwGl(DwfwglBean bean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "inserDwFwGl", bean);
	}
	
	/**
	 * 新增娱乐场所
	 * @param jgbh 机构编号
	 * @param id 娱乐场所主键ID
	 * @throws SQLException
	 */
	public void insertYlcs(String id,String ggcsbh,String jgbh) throws SQLException{
		executor.insertWithDBName(CommonConstant.DBNAME_SQJW, "insertYlcs", id,ggcsbh,jgbh);
	}
	
	/**
	 * 新增网吧
	 * @param id 网吧主键ID
	 * @param jgbh 机构编号
	 * @throws SQLException
	 */
	public void insertWb(String id,String jgbh) throws SQLException{
		executor.insertWithDBName(CommonConstant.DBNAME_SQJW, "insertWb", id,jgbh);
	}
	
	/**
	 * 特种行业
	 * @param id
	 * @param jgbh
	 * @throws SQLException
	 */
	public void insertTzhy(String id,String jgbh) throws SQLException{
		executor.insertWithDBName(CommonConstant.DBNAME_SQJW, "insertTzhy", id,jgbh);
	}
	
	/**
	 * 新增旅馆
	 * @param id 旅馆主键ID
	 * @param jgbh 机构编号
	 * @throws SQLException
	 */
	public void insertLg(String id,String thbh,String jgbh) throws SQLException{
		executor.insertWithDBName(CommonConstant.DBNAME_SQJW, "insertLg", id,thbh,jgbh);
	}
	
	/**
	 * 更新单位信息
	 * @param bean
	 * @throws SQLException
	 */
	public void updateDwxx(DwBaseBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwxx", bean);
	}
	
	/**
	 * 更新单位(机构表)管理状态
	 * @param bean
	 * @throws SQLException
	 */
	public void updateDwGlZt(DwBaseBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwGlZt", bean);
	}
	
	/**
	 * 更新单位（单位同步表）管理状态
	 * @param glzt 管理状态
	 * @param dwid 单位ID
	 * @param dwlx 单位类型
	 * @throws SQLException
	 */
	public void updateDwtbGlZt(String glzt,String dwid,String dwlx) throws SQLException{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateDwtbGlZt", glzt,dwid,dwlx);
	}
	
/**
	 * 查询所属社区，根据派出所
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public List<SssqdmBean> querySssqdmByPcsdm(QueryBean query)throws Exception{
		return executor.queryListBeanWithDBName(SssqdmBean.class, CommonConstant.DBNAME_SQJW, "querySssqdmByPcsdmSQL", query);
	}
	/**
	 * 新增危爆单位
	 * @param <T>
	 * @param bean
	 * @param sqlName
	 * @throws Exception
	 */
	public <T> void insertBean(T bean,String sqlName) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, sqlName, bean);
	}
	/**
	 * 更新危爆单位
	 * @param <T>
	 * @param bean
	 * @param sqlName
	 * @throws Exception
	 */
	public <T> void updateBean(T bean,String sqlName) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, sqlName, bean);
	}	
	
	/**
	 * 更新危爆单位的机构编号
	 * @param jgbh
	 * @param ywxtzj
	 * @throws SQLException
	 */
	public void updateJgbhWithWbdwByYwxtZj(String jgbh , String ywxtzj) throws SQLException{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateJgbhWithWbdwByYwxtZj", jgbh,ywxtzj);
	}
}
