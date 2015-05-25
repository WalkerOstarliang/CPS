package com.chinacreator.lsgl.services;

import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.lsgl.bean.FatjBean;
import com.chinacreator.lsgl.bean.JzzTjBean;
import com.chinacreator.lsgl.bean.LdrkJzzxxBean;
import com.chinacreator.lsgl.bean.LdrkTjBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.RkzpxxBean;
import com.chinacreator.lsgl.bean.RsdfxBean;
import com.chinacreator.lsgl.query.JzzQueryBean;
import com.chinacreator.lsgl.query.TjQueryBean;

public interface LsglLdrkJzzxxService {
	
	/**
	 * 根据人员编号查询
	 * @param rybh
	 * @return
	 * @throws Exception
	 */
	public  LdrkJzzxxBean queryJzzxxBeanByRybh(String rybh) throws Exception;
	
	/**
	 * 通过居住证信息
	 * @param zzbh
	 * @return
	 * @throws Exception
	 * @date Sep 1, 2014 10:23:02 AM
	 */
	public LdrkJzzxxBean queryJzzxxBeanByZzbh(String zzbh);
	
	/**
	 * 查询居住证
	 * @param jzzbh
	 * @return
	 * @throws Exception
	 * @date Sep 2, 2014 7:53:47 AM
	 */
	public LdrkJzzxxBean queryJzzxxBeanByJzzbh(String jzzbh);
	
	
	public LdrkJzzxxBean saveJzzxxBean(LdrkJzzxxBean jzzxxBean);
	
	/**
	 * 插入
	 * @param jzzxxBean
	 * @throws Exception
	 */
	public LdrkJzzxxBean  insertJzzxxBean(LdrkJzzxxBean jzzxxBean) throws Exception;
	/**
	 * 根据人员编号查询记录 （多条） 注销和未注销
	 */
	public PageResultInfo<LdrkJzzxxBean> queryJzzxxPageByRybh(String rybh,PageInfo pageInfo) throws Exception;
	
	/**
	 * 通过站在编号查询居住证信息
	 * @param zzbh
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 * @date Sep 1, 2014 5:24:23 PM
	 */
	public PageResultInfo<LdrkJzzxxBean> queryJzzxxPageByZzbh(String zzbh,PageInfo pageInfo);
	
	/**
	 * 更新
	 */
	public LdrkJzzxxBean updateJzzxxBean(LdrkJzzxxBean jzzxxBean) throws Exception;
	
	/**
	 * 保存人口照片信息
	 *
	 */
	public  void saveRkZpxx(RkzpxxBean zpxxBean) throws Exception;
	
	/**
	 * 分页查询
	 * @param jzzxxBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<LdrkJzzxxBean> queryJzzxxBeanPageInfo(JzzQueryBean queryBean,PageInfo pageInfo) throws Exception;
	
	public List<LdrkJzzxxBean> queryJzzxxList(JzzQueryBean queryBean);

	/**
	 * 更新打印状态  
	 */
	public void updateJzzxxBeanDyZt(LdrkJzzxxBean jzzxxBean);

	/**
	 * 
	 */
	public List<LdrkTjBean> queryLdrkTjBean(JzzQueryBean queryBean) throws Exception; 
	
	public PageResultInfo<LdrkxxBean> queryLdrkZhQueryPageResult(JzzQueryBean queryBean, PageInfo pageInfo) throws Exception;

	
	/**
	 * 发案统计
	 */
	public List<FatjBean>  queryFatjBean(TjQueryBean tjqueryBean) throws Exception;
	
	public PageResultInfo<RsdfxBean> queryRsdfxBeansPageResult(JzzQueryBean queryBean, PageInfo pageInfo) throws Exception;
	
	/**
	 * 居住证统计
	 * @param queryBean
	 * @return
	 */
	public List<JzzTjBean> queryJzztjBeanList(JzzQueryBean queryBean);
	
	public void zxJzzxxBean(String jzzxxbh);
	
	
	/**
	 * 错证重打遗失补打居住证信息插入
	 * @param jzzxxBean
	 * @date Sep 2, 2014 10:10:32 AM
	 */
	public void czcdysbdInsertJzzxxBean(LdrkJzzxxBean jzzxxBean);
	
	public RkJbxxBean queryRkJbxxBeanByRybh(String rybh);
	
	public LdrkxxBean getLdrkShorBeanInfo(String zzbh);
	
}
