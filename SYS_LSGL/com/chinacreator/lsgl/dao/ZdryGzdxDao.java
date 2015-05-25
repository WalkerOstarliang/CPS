package com.chinacreator.lsgl.dao;

import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.lsgl.bean.ZdryGzryxxBean;
import com.chinacreator.lsgl.bean.ZdryJsbrzsxxBean;
import com.chinacreator.lsgl.bean.ZdryJsbxBean;
import com.chinacreator.lsgl.bean.ZdryJzdxxxBean;
import com.chinacreator.lsgl.bean.ZdrySwryBean;
import com.chinacreator.lsgl.bean.ZdrySwrysfjlBean;
import com.chinacreator.lsgl.bean.ZdryXdchNjxxBean;
import com.chinacreator.lsgl.bean.ZdryXdryxxBean;

/**
 * 重点人员工作对象 数据访问层
 * @author zhun.liu
 *
 */
public interface ZdryGzdxDao {
	
	/**            精神病人               */

	
	/**
	 * 保存精神病人信息
	 * @param jsbrBean
	 * @throws Exception
	 */
	public void insertZdryJsbrBean(ZdryJsbxBean jsbrBean) throws Exception;

	/**
	 * 更新
	 * @param jsbrBean
	 * @throws Exception
	 */
	public void updateZdryJsbrBean(ZdryJsbxBean jsbrBean) throws Exception;
	
	/**
	 * 根据身份证查询精神病人
	 * @param sfzh
	 * @return
	 * @throws Exception
	 */
	public ZdryJsbxBean queryZdryJsbrBySfzh(String sfzh) throws Exception;	
	
	/**
	 * 根据工作对象编号查询精神病人详情
	 * @param gzdxbh
	 * @return
	 * @throws Exception
	 */
	public ZdryJsbxBean queryZdryJsbrByGzdxbh(String gzdxbh) throws Exception;
	
	public void insertZdryJsbrzsxxBean(ZdryJsbrzsxxBean jsbrzsBean) throws Exception;
	
	public void updateZdryJsbrzsxxBean(ZdryJsbrzsxxBean jsbrzsBean) throws Exception;
	
	public ZdryJsbrzsxxBean queryZdryJsbrzsxxBeanByJsbrbh(String jsbrbh) throws Exception;
	
	public PageResultInfo<ZdryJsbrzsxxBean> queryZdryJsbrzsPageResult(String jsbrbh,PageInfo pageInfo) throws Exception;
	
	/**            涉稳人员               */
	public void insertZdrySwryBean(ZdrySwryBean swryBean) throws Exception;
	
	public void updateZdrySwryBean(ZdrySwryBean swryBean) throws Exception;
	
	public ZdrySwryBean queryZdrySwryBeanBySfzh(String sfzh) throws Exception;
	
	public void insertZdrySwrySfjlBean(ZdrySwrysfjlBean swrysfjlBean) throws Exception;
	
	public void updateZdrySwrySfjlBean(ZdrySwrysfjlBean swrysfjlBean) throws Exception;
	
	public PageResultInfo<ZdrySwrysfjlBean> queryZdrySwrysfjlPageResult(String swrybh,PageInfo pageInfo) throws Exception;
	
	/**
	 * 矫正对象
	 */
	public void updateZdryJzdxInfo(ZdryJzdxxxBean jzdxBean) throws SQLException;

	public void insertZdryJzdxInfo(ZdryJzdxxxBean jzdxBean) throws SQLException;

	/**
	 *关注人员 
	 */
	public void insertZdryGzryInfo(ZdryGzryxxBean gzryxxBean) throws SQLException;

	public void updateZdryGzryInfo(ZdryGzryxxBean gzryxxBean) throws SQLException;

	/**
	 *吸毒人员 
	 */
	public void insertZdryXdryInfo(ZdryXdryxxBean xdryxxBean) throws SQLException;

	public void updateZdryXdryInfo(ZdryXdryxxBean xdryxxBean) throws SQLException;

	public PageResultInfo<ZdryXdchNjxxBean> queryZdryXdryhdPageResult(
			String rybh, PageInfo pageInfo) throws SQLException;

	public void insertZdryXdnjxxBean(ZdryXdchNjxxBean xdNjxxBean) throws SQLException;

	public void updateZdryXdnjxxBean(ZdryXdchNjxxBean xdNjxxBean) throws SQLException;
	
	/**
	 * 根据精神人员编号查询精神病人的身份证
	 */
	public ZdryJsbxBean queryZdryJsbrBeanByJsbrbh(String jsbrbh) throws Exception;
	
	public ZdrySwryBean queryZdrySwryBeanBySwrybh(String swrybh) throws Exception;
	
	public ZdryXdryxxBean queryZdryXdryxxBeanByXdrybh(String xdrybh) throws Exception;
}
