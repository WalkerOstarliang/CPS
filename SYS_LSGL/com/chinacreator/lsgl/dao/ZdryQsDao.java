package com.chinacreator.lsgl.dao;

import java.io.Serializable;
import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryJbxxBean;
import com.chinacreator.lsgl.bean.ZdryJsjzBean;
import com.chinacreator.lsgl.bean.ZdryQbhsBean;
import com.chinacreator.lsgl.bean.ZdryQsBean;
import com.chinacreator.lsgl.bean.ZdrySqjdBean;
import com.chinacreator.lsgl.bean.ZdrySqkfBean;

public interface ZdryQsDao extends Serializable {
	
	/**
	 * 新增重点人员
	 * @param bean
	 * @throws SQLException
	 */
	public void insertZdry(ZdryGzdxBean bean) throws SQLException;
	
	/**
	 * 修改重点人员
	 * @param bean
	 * @throws SQLException
	 */
	public void updateZdry(ZdryGzdxBean bean) throws SQLException;
	
	
	/**
	 * 新增执法办案反馈信息
	 * @param ZdryQsBean
	 * @throws SQLException
	 */
	public void insertZfbaFk(ZdryQsBean zdryqs) throws SQLException;
	
	/**
	 * 查询重点人员签收列表
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<ZdryJbxxBean> queryZdryQsList(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	/**
	 * 根据人员编号查询重点人员基本信息
	 * @param rybh
	 * @return
	 * @throws SQLException
	 */
	public ZdryJbxxBean queryZdryJbxx(String rybh) throws SQLException;
	
	/**
	 * 根据人员编号查询重点人员取保候审信息
	 * @param rybh
	 * @return
	 * @throws SQLException
	 */
	public ZdryQbhsBean queryZdryQbhs(String rybh) throws SQLException;
	
	/**
	 * 根据人员编号查询重点人员监视居住信息
	 * @param rybh
	 * @return
	 * @throws SQLException
	 */
	public ZdryJsjzBean queryZdryJsjz(String rybh) throws SQLException;
	
	/**
	 * 根据人员编号查询社区戒毒信息
	 * @param rybh
	 * @return
	 * @throws SQLException
	 */
	public ZdrySqjdBean queryZdrySqjd(String rybh) throws SQLException;
	
	/**
	 * 根据人员编号查询重点人员社区康复信息
	 * @param rybh
	 * @return
	 * @throws SQLException
	 */
	public ZdrySqkfBean queryZdrySqkf(String rybh) throws SQLException;
	
}
