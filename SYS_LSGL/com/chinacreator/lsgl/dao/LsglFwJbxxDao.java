package com.chinacreator.lsgl.dao;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.dzgl.bean.DzxxBean;
import com.chinacreator.lsgl.bean.CzwxcdjxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.FwdzQyBean;
import com.chinacreator.lsgl.bean.FwzpxxBean;
import com.chinacreator.lsgl.bean.queryBean.LsfwQueryBean;
import com.chinacreator.lsgl.query.FwQueryBean;
import com.chinacreator.zagl.bean.DwjbxxBean;

/**
 * 两室房屋基本信息管理dao
 * 
 * @author mingchun.xiong
 * @date 2013-8-6
 */
public interface LsglFwJbxxDao
{
	
	/**
	 * 查询房屋分页列表
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfo(PageInfo pageInfo,FwQueryBean queryBean) throws Exception;
	
	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByStid(PageInfo pageInfo,String stid) throws Exception;
	
	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByStidWithPicNum(PageInfo pageInfo,String stid, LsfwQueryBean query) throws Exception;
	
	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByFwQueryBean(PageInfo pageInfo,FwQueryBean queryBean) throws Exception;

	/**
	 * 查询出租房巡查登记信息  分页
	 */
	public PageResultInfo<CzwxcdjxxBean> queryCzwxcdjxxPageResultInfo(PageInfo pageInfo,String  fwid) throws Exception;
	
	/**
	 * 查询房屋基本信息通过房屋编号
	 * @param fwid
	 * @return
	 */
	public FwJbxxBean queryFwJbxxBeanByFwid(String fwid, String jsppage) throws Exception;
	
	/**
	 * 新增房屋基本信息对象
	 * @param fwBean
	 */
	public void insertFwJbxxBean(FwJbxxBean fwBean) throws Exception;
	
	/**
	 * 更新房屋基本信息
	 * @param fwBean
	 */
	public void updateFwJbxxBean(FwJbxxBean fwBean) throws Exception;
	
	/**
	 * 插入房屋照片信息
	 * @param fwzpxxList 房屋照片信息
	 * @throws Exception
	 * @date 2013-8-14 下午05:47:38
	 */
	public void insertFwzpxxList(List<FwzpxxBean> fwzpxxList) throws Exception;
	
	/**
	 * 通过照片ID删除照片记录
	 * @param id
	 * @throws Exception
	 * @date 2013-8-14 下午05:57:29
	 */
	public void deleteFwzpxxById(String id) throws Exception;
	
	/**
	 * 通过房屋id(fwid) 查询出房屋照片信息
	 * @param fwid
	 * @return
	 * @throws Exception
	 * @date 2013-8-14 下午06:57:46
	 */
	public List<FwzpxxBean> queryFwzpxxListByFwid(String fwid) throws Exception;
	
	/**
	 * 返回照片流
	 * @param zpid 照片ID
	 * @return 返回照片流
	 * @throws Exception
	 * @date 2013-8-15 上午09:52:10
	 */
	public Blob getFwzpStream(String zpid) throws Exception;
	
	/**
	 * 查询出租屋巡查登记信息
	 * @param fwid
	 * @return
	 * @date 2013-9-10 上午11:28:21
	 */
	public List<CzwxcdjxxBean> queryCzwxcdjxxBeans(String fwid) throws Exception;
	
	/**
	 * 插入出租屋巡查登记信息
	 * @param czwxcdjxxBean
	 * @throws Exception
	 * @date 2013-9-10 上午11:29:21
	 */
	public void insertCzwxcdjxxBean(CzwxcdjxxBean czwxcdjxxBean) throws Exception;
	
	/**
	 * 更新出租屋巡查登记信息
	 * @param czwxcdjxxBean
	 * @throws Exception
	 * @date 2013-9-10 上午11:29:52
	 */
	public void updateCzwxcdjxxBean(CzwxcdjxxBean czwxcdjxxBean) throws Exception;
	

	public FwJbxxBean queryFwJbxxBeanByDzid(String dzid) throws Exception;
	
	public DzxxBean queryFwJbxxBeanByStidAndDyLcFj(DzxxBean bean) throws Exception;

	public FwJbxxBean queryFwJbxxBeanByStidAndDyLcFj(FwJbxxBean bean) throws Exception;
	
	public List<RkJbxxBean>  queryRklistInFwxx(String fwid) throws Exception;
	
	/**
	 * 注销房屋id
	 * @param fwid
	 * @throws Exception
	 */
	public void deleteFwJbxxBean(FwJbxxBean fwBean) throws Exception;
	
	/**
	 * 房屋关联单位信息查找
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @date Feb 24, 2014 2:19:22 PM
	 */
	public PageResultInfo<DwjbxxBean> queryGlDwxxPageResultInfo(PageInfo pageInfo, FwQueryBean queryBean) throws Exception;

	public void deleteCzFwJbxxBean(FwJbxxBean fwBean) throws Exception;
	
	public void logoutCzfwJbxxBean(String fwbh) throws Exception;
	
	/**
	 * 根据房主身份证号查询房屋基本信息
	 */
	public PageResultInfo<FwJbxxBean> queryFwInfoByHzsfzh(String hzsfzh,PageInfo pageInfo) throws Exception;
	
	public FwJbxxBean queryFwJbxxBeanByFwid(String fwid) throws Exception;
	
	
	/**
	 * 根据房屋fwid 查询fwlist 不分页
	 */
	public List<FwJbxxBean> queryFwListByFwids(String fwids) throws Exception;
	
	/**
	 * 根据fwqueryBean 查询fwlist 不分页
	 */
	public List<FwJbxxBean> queryFwlistByFwqueryBean(FwQueryBean queryBean)  throws Exception;

	public void updateFwtoCzfw(String fwbh) throws Exception;
	
	public void updateFwJbxxFromCzfw(FwJbxxBean fwJbxx) throws Exception;
	
	public PageResultInfo<FwJbxxBean> queryCzfwPageInfoByQueryBean(FwQueryBean queryBean,PageInfo pageInfo) throws Exception;

	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByQueryBean(PageInfo pageInfo, FwQueryBean queryBean) throws Exception;

	public void dzfwqyupdate(FwdzQyBean fwdzqyBean) throws SQLException;
	public void dzfwqydwfwglupdate(FwdzQyBean fwdzqyBean) throws SQLException ;
	public void dzfwqyryxzzxzupdate(FwdzQyBean fwdzqyBean) throws SQLException ;

	public void updateCzfwJbxxZhxcsjForCurrentDate(String fwid) throws Exception;

}
