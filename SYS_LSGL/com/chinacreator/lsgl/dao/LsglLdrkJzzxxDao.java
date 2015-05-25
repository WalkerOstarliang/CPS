package com.chinacreator.lsgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.lsgl.bean.FatjBean;
import com.chinacreator.lsgl.bean.JzzTjBean;
import com.chinacreator.lsgl.bean.LdrkJzzxxBean;
import com.chinacreator.lsgl.bean.LdrkTjBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.RsdfxBean;
import com.chinacreator.lsgl.query.JzzQueryBean;
import com.chinacreator.lsgl.query.TjQueryBean;

/**
 * 流动人口居住证信息DAO
 * @company  chinacreator
 * @author zhun.liu
 * @date  Jan 17, 2014  4:59:21 PM
 */
public interface LsglLdrkJzzxxDao {
	/**
	 * 根据人员编号查询（未注销的）
	 * @param rybh
	 * @return
	 * @throws Exception
	 */
	public  LdrkJzzxxBean queryJzzxxBeanByRybh(String rybh) throws Exception;
	
	public LdrkJzzxxBean queryJzzxxBeanByZzbh(String zzbh) throws Exception;
	
	/**
	 * 插入
	 * @param jzzxxBean
	 * @throws Exception
	 */
	public void  insertJzzxxBean(LdrkJzzxxBean jzzxxBean) throws Exception;
	
	/**
	 * 根据人员编号查询记录 （多条） 注销和未注销
	 */
	public PageResultInfo<LdrkJzzxxBean> queryJzzxxPageByRybh(String rybh,PageInfo pageInfo) throws Exception;
	
	
	/**
	 * 更新
	 */
	public void updateJzzxxBean(LdrkJzzxxBean jzzxxBean) throws Exception;
	
	/**
	 * 分页查询
	 * @param jzzxxBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<LdrkJzzxxBean> queryJzzxxBeanPageInfo(JzzQueryBean queryBean,PageInfo pageInfo) throws Exception;
	
	public List<LdrkJzzxxBean> queryJzzxxList(JzzQueryBean queryBean) throws SQLException;

	/**
	 * 更新打印状态  
	 */
	public void updateJzzxxBeanDyZt(LdrkJzzxxBean jzzxxBean) throws Exception;
	
	
	/**
	 * 
	 */
	public List<LdrkTjBean> queryLdrkTjBean(JzzQueryBean queryBean) throws Exception; 

	public PageResultInfo<LdrkxxBean> queryLdrkZhQueryPageResult(JzzQueryBean queryBean, PageInfo pageInfo) throws Exception;
	
	
	/**
	 * 发案统计
	 */
	public List<FatjBean>  queryFatjBean(TjQueryBean tjqueryBean) throws Exception;
	
	public PageResultInfo<RsdfxBean> queryRsdfxBeansPageResult(
			JzzQueryBean queryBean, PageInfo pageInfo) throws Exception;
	
	/**
	 * 查询居住证统计
	 * @param queryBean
	 * @return
	 * @throws SQLException
	 */
	public List<JzzTjBean> queryJzztjBeanList(JzzQueryBean queryBean) throws SQLException;
	
	public PageResultInfo<LdrkJzzxxBean> queryJzzxxPageByZzbh(String zzbh, PageInfo pageInfo) throws Exception;
	
	public void zxJzzxxBean(String jzzxxbh) throws Exception;
	
	public LdrkJzzxxBean queryJzzxxBeanByJzzbh(String jzzbh) throws Exception;
	
	public RkJbxxBean queryRkJbxxBeanByRybh(String rybh) throws Exception;
	
	public LdrkxxBean getLdrkShorBeanInfo(String zzbh) throws Exception;
	
	public void zxLdrkJzzxx(String rybh) throws Exception;
}
