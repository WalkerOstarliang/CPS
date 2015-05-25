package com.chinacreator.lsgl.services;

import java.io.File;
import java.sql.Blob;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.dzgl.bean.DzxxBean;
import com.chinacreator.lsgl.bean.CzfwJbxxBean;
import com.chinacreator.lsgl.bean.CzwxcdjxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.FwdzQyBean;
import com.chinacreator.lsgl.bean.FwzpxxBean;
import com.chinacreator.lsgl.bean.queryBean.LsfwQueryBean;
import com.chinacreator.lsgl.query.FwQueryBean;
import com.chinacreator.zagl.bean.DwjbxxBean;

/**
 * 房屋基本信息操作服务
 * 
 * @filename LsglFwJbxxService.java
 * @author mingchun.xiong
 * @date 2013-8-7
 *
 */
public interface LsglFwService
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
	 * @param fwid 房屋ID
	 * @return
	 */
	public FwJbxxBean queryFwJbxxBeanByFwid(String fwid, String jsppage) throws Exception;
	
	/**
	 * 保存房屋基本信息 包括新增和修改 不做上传文件保存操作
	 * @param fwBean 房屋对象
	 * @param msgtype  1 ：房屋基本信息 2:房屋照片信息 3：房屋人员信息 4：出租登记信息 5：出租房巡查登记信息
	 * @throws Exception
	 * @date 2013-8-7
	 */
	public FwJbxxBean saveFwJbxxBean(FwJbxxBean fwBean, String msgtype) throws Exception;
	
	/**
	 * 保存房屋基本信息 包括新增和修改 ，执行文件保存操作
	 * @param fwBean 房屋对象
	 * @param msgtype 1 ：房屋基本信息 2:房屋照片信息 3：房屋人员信息 4：出租登记信息 5：出租房巡查登记信息
	 * @param zpUploads 上传文件
	 * @param zpUploadsFileName 上传文件名称
	 * @throws Exception
	 * @date 2013-8-14 下午05:43:19
	 */
	public FwJbxxBean saveFwJbxxBean(FwJbxxBean fwBean, String msgtype, File[] zpUploads, String[] zpUploadsFileName) throws Exception;
	
	/**
	 * 构建房屋照片信息对象
	 * @param zpUploads
	 * @param zpUploadsFileName
	 * @return
	 * @date 2013-8-14 下午05:07:14
	 */
	public List<FwzpxxBean> wrapFwzpxxBean(File[] zpUploads, String[] zpUploadsFileName, String fwid);
	
	/**
	 * 通过照片ID删除照片信息
	 * @param zpid
	 * @throws Exception
	 * @date 2013-8-15 上午09:23:11
	 */
	public void deleteFwzpxxBeanByZpid(String zpid) throws Exception;
	
	/**
	 * 获取照片信息流
	 * @param zpid 照片ID
	 * @return
	 * @throws Exception
	 * @date 2013-8-15 上午09:57:52
	 */
	public Blob getFwzpxxInputStream(String zpid) throws Exception;
	
	public PageResultInfo<CzfwJbxxBean> queryCzfwPageInfo(FwQueryBean queryBean,PageInfo pageInfo) throws Exception;
	
	public FwJbxxBean queryFwxxBeanByDzid(String dzid) throws Exception;
	
	public PageResultInfo<CzfwJbxxBean> queryCzfwListPageByFwid(String fwid,PageInfo pageInfo) throws Exception;

	public FwJbxxBean saveCzfwBean(FwJbxxBean fwBean) throws Exception;
	
	public CzfwJbxxBean queryCzfwBeanByCzfwbh(String czfwbh) throws Exception;
	public CzfwJbxxBean queryCzfwBeanByfwid(String fwid) throws Exception;
		
	
	public boolean queryFwJbxxBeanByStidAndDyLcFj(DzxxBean bean) throws Exception;
	
	public boolean queryFwJbxxBeanByStidAndDyLcFj(FwJbxxBean bean) throws Exception;
	
	public boolean queryRklistInFwxx(String fwid) throws Exception;
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
	
	/**
	 * 根据房主身份证号查询房屋基本信息
	 */
	public PageResultInfo<FwJbxxBean> queryFwInfoByHzsfzh(String hzsfzh,PageInfo pageInfo) throws Exception;
	
	/**
	 * 保存房屋照片信息
	 * @param fwBean
	 * @param zpUploads
	 * @param zpUploadsFileName
	 * @throws Exception
	 * @date Mar 19, 2014 3:08:19 PM
	 */
	public void saveFwzpxx(FwJbxxBean fwBean,File[] zpUploads, String[] zpUploadsFileName) throws Exception;
	
	/**
	 * 通过房屋ID查询照片信息
	 * @param fwid
	 * @throws Exception
	 * @date Mar 24, 2014 4:45:53 PM
	 */
	public List<FwzpxxBean> queryFwzpxxListByFwid(String fwid)  throws Exception;
	
	/**
	 * 房屋基本信息查询
	 * @param fwid
	 * @return
	 * @throws Exception
	 * @date Mar 29, 2014 1:32:55 PM
	 */
	public FwJbxxBean queryFwJbxxBeanByFwid(String fwid) throws Exception;
	
	/**
	 * 根据房屋fwid 查询fwlist 不分页
	 */
	public List<FwJbxxBean> queryFwListByFwids(String fwids) throws Exception;
	
	/**
	 * 根据fwqueryBean 查询fwlist 不分页
	 */
	public List<FwJbxxBean> queryFwlistByFwqueryBean(FwQueryBean queryBean)  throws Exception;
	
	public PageResultInfo<FwJbxxBean> queryCzfwPageInfoByQueryBean(FwQueryBean queryBean,PageInfo pageInfo) throws Exception;

	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByQueryBean(PageInfo pageInfo, FwQueryBean queryBean) throws Exception;

	public void dzfwqyupdate(FwdzQyBean fwdzqyBean) ;
	//public void dzfwqydwfwglupdate(FwdzQyBean fwdzqyBean) ;
	//public void dzfwqyryxzzxzupdate(FwdzQyBean fwdzqyBean) ;
}
